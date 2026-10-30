package org.rabochaya.projects;
import android.content.*;import android.graphics.*;import android.util.LruCache;import android.view.*;import java.io.*;import java.util.*;import java.util.concurrent.*;
/** Independent raster map + KML geometry, sharing one Web Mercator viewport. */
public final class LocalMapView extends View {
 public interface Listener {void center(double lat,double lon,double zoom);void picked(KmlProject.Feature feature);void error(String message);void settled(double x,double y,double zoom);void draftChanged(int count);void longPressed(double lat,double lon);}
 private final List<KmlProject.Feature> features;private final Listener listener;private final Paint paint=new Paint(3);private final ExecutorService worker=Executors.newSingleThreadExecutor();
 private final LruCache<String,Bitmap> cache=new LruCache<String,Bitmap>(16*1024*1024){protected int sizeOf(String k,Bitmap b){return b.getByteCount();}};
 private final Set<String> pending=new HashSet<String>(),missing=new HashSet<String>();private OfflineTiles tiles;private BundledTiles bundled;private volatile OnlineTiles[] online;private final TileSource onlineSource;private final boolean useNetwork;private volatile boolean paused;private volatile boolean disposed;
 private volatile boolean mapReady;private int minZoom,maxZoom;private double cx=.5,cy=.5,zoom=2;private boolean fitted,restored,moved;private float downX,downY,lastX,lastY;private final ScaleGestureDetector scale;private final GestureDetector contextGesture;private boolean longConsumed;
 public LocalMapView(Context context,List<KmlProject.Feature> features,File map,Listener listener){this(context,features,map,listener,null,false);}
 public LocalMapView(Context context,List<KmlProject.Feature> features,File map,Listener listener,TileSource source,boolean network){
  super(context);onlineSource=source;useNetwork=network;this.features=features;this.listener=listener;setContentDescription("Карта и объекты KML. Перемещение одним пальцем, масштаб двумя.");
  contextGesture=new GestureDetector(context,new GestureDetector.SimpleOnGestureListener(){public boolean onDown(MotionEvent e){return true;}public void onLongPress(MotionEvent e){if(!disposed&&!paused&&!moved&&draft==null&&e.getPointerCount()==1){longConsumed=true;listener.longPressed(MapMath.lat(cy+(e.getY()-getHeight()/2.0)/world()),MapMath.lon(cx+(e.getX()-getWidth()/2.0)/world()));}}});
  scale=new ScaleGestureDetector(context,new ScaleGestureDetector.SimpleOnScaleGestureListener(){public boolean onScale(ScaleGestureDetector s){zoomAt(Math.log(s.getScaleFactor())/Math.log(2),s.getFocusX(),s.getFocusY());moved=true;return true;}public void onScaleEnd(ScaleGestureDetector d){settle();}});
  if(source!=null)worker.execute(()->{try{TileSource[] leaves=source.leafs();OnlineTiles[] readers=new OnlineTiles[leaves.length];try{for(int i=0;i<leaves.length;i++)readers[i]=new OnlineTiles(context,leaves[i]);}catch(Exception e){for(OnlineTiles reader:readers)if(reader!=null)reader.close();throw e;}online=readers;minZoom=source.minZoom;maxZoom=source.maxZoom;mapReady=true;post(()->{if(!disposed)invalidate();});}catch(final Exception e){post(()->{if(!disposed)listener.error(e.getMessage());});}});
  else if(map!=null&&map.isFile())worker.execute(new Runnable(){public void run(){try{tiles=new OfflineTiles(map);minZoom=tiles.minZoom;maxZoom=tiles.maxZoom;mapReady=true;post(new Runnable(){public void run(){if(!disposed)invalidate();}});}catch(final Exception e){post(new Runnable(){public void run(){if(!disposed)listener.error(e.getMessage());}});}}});
  else {bundled=new BundledTiles(context.getAssets());minZoom=1;maxZoom=3;mapReady=true;}
 }
 private ArrayList<double[]> draft;private String draftType;
 private double world(){return 256*Math.pow(2,zoom);}
 public void restore(double x,double y,double z){if(Double.isNaN(x)||Double.isInfinite(x)||Double.isNaN(y)||Double.isInfinite(y)||Double.isNaN(z)||Double.isInfinite(z))return;cx=MapMath.wrap(x);cy=MapMath.clamp(y,0,1);zoom=MapMath.clamp(z,0,23);restored=true;fitted=true;changed();settle();}
 public double[] viewport(){return new double[]{cx,cy,zoom};}
 public void fit(){if(getWidth()<1||getHeight()<1){fitted=false;restored=false;return;}ArrayList<double[]> points=new ArrayList<double[]>();for(KmlProject.Feature f:features)for(KmlProject.Geometry g:f.shapes)for(List<double[]> ring:g.rings)points.addAll(ring);double[] v=MapMath.fit(points.toArray(new double[points.size()][]),getWidth(),getHeight());cx=v[0];cy=v[1];zoom=v[2];fitted=true;changed();settle();}
 public void focus(KmlProject.Feature feature){ArrayList<double[]> points=new ArrayList<>();for(KmlProject.Geometry geometry:feature.shapes)for(List<double[]> ring:geometry.rings)points.addAll(ring);double[] v=MapMath.fit(points.toArray(new double[points.size()][]),Math.max(1,getWidth()),Math.max(1,getHeight()));restore(v[0],v[1],v[2]);}
 protected void onSizeChanged(int w,int h,int oldw,int oldh){super.onSizeChanged(w,h,oldw,oldh);if(!fitted&&!restored)fit();else changed();}
 public void step(double amount){zoomAt(amount,getWidth()/2f,getHeight()/2f);settle();}
 private void zoomAt(double amount,float px,float py){double before=world(),next=MapMath.clamp(zoom+amount,0,23);double wx=cx+(px-getWidth()/2.0)/before,wy=cy+(py-getHeight()/2.0)/before;zoom=next;double after=world();cx=MapMath.wrap(wx-(px-getWidth()/2.0)/after);cy=MapMath.clamp(wy-(py-getHeight()/2.0)/after,0,1);changed();}
 private void settle(){listener.settled(cx,cy,zoom);}
 private void changed(){listener.center(MapMath.lat(cy),MapMath.lon(cx),zoom);invalidate();}
 private float[] point(double[] c){return new float[]{(float)(getWidth()/2.0+MapMath.delta(MapMath.x(c[0]),cx)*world()),(float)(getHeight()/2.0+(MapMath.y(c[1])-cy)*world())};}
 public String drawingType(){return draftType;}
 public List<double[]> drawingPoints(){ArrayList<double[]> result=new ArrayList<>();if(draft!=null)for(double[] p:draft)result.add(p.clone());return result;}
 public void beginDrawing(String type){if(!"LineString".equals(type)&&!"Polygon".equals(type))throw new IllegalArgumentException("drawing type");draftType=type;draft=new ArrayList<>();listener.draftChanged(0);invalidate();}
 public void addDrawingPoint(double lon,double lat){if(draft==null)return;if(draft.size()>=2000){listener.error("Предел рисунка — 2000 вершин");return;}if(Double.isNaN(lon)||Double.isNaN(lat)||Double.isInfinite(lon)||Double.isInfinite(lat)||Math.abs(lat)>90)return;draft.add(new double[]{MapMath.lon(MapMath.x(lon)),lat,0});listener.draftChanged(draft.size());invalidate();}
 public void addDrawingCenter(){addDrawingPoint(MapMath.lon(cx),MapMath.lat(cy));}
 public void undoDrawing(){if(draft!=null&&!draft.isEmpty()){draft.remove(draft.size()-1);listener.draftChanged(draft.size());invalidate();}}
 public void cancelDrawing(){draft=null;draftType=null;listener.draftChanged(-1);invalidate();}
 private void drawDraft(Canvas canvas){if(draft==null)return;Path path=new Path();boolean first=true;double previous=0;for(double[] c:draft){double wx=MapMath.x(c[0]),dx=first?MapMath.delta(wx,cx):previous+MapMath.delta(wx,MapMath.wrap(cx+previous));previous=dx;float x=(float)(getWidth()/2.0+dx*world()),y=(float)(getHeight()/2.0+(MapMath.y(c[1])-cy)*world());if(first){path.moveTo(x,y);first=false;}else path.lineTo(x,y);}
  paint.setColor(0xff67def7);paint.setStrokeWidth(3*getResources().getDisplayMetrics().density);paint.setStyle(Paint.Style.STROKE);if("Polygon".equals(draftType)&&draft.size()>=3){path.close();paint.setStyle(Paint.Style.FILL);paint.setColor(0x3367def7);canvas.drawPath(path,paint);paint.setStyle(Paint.Style.STROKE);paint.setColor(0xff67def7);}canvas.drawPath(path,paint);paint.setStyle(Paint.Style.FILL);for(double[] c:draft){float[] p=point(c);canvas.drawCircle(p[0],p[1],4*getResources().getDisplayMetrics().density,paint);}
 }
 private void request(final String key,final int z,final int x,final int y,final int layer){
  if(disposed||paused||pending.size()>=32||pending.contains(key)||missing.contains(key))return;pending.add(key);
  worker.execute(new Runnable(){public void run(){Bitmap b=null;String error=null;try{if(!disposed&&!paused){if(online!=null)b=online[layer].tile(z,x,y,useNetwork);else if(tiles!=null)b=tiles.tile(z,x,y);else if(bundled!=null)b=bundled.tile(z,x,y);}}catch(Exception e){error="Ошибка чтения тайла: "+e.getMessage();}final Bitmap result=b;final String message=error;post(new Runnable(){public void run(){pending.remove(key);if(disposed){if(result!=null)result.recycle();return;}if(result!=null)cache.put(key,result);else if(!paused){if(missing.size()>512)missing.clear();missing.add(key);}if(message!=null)listener.error(message);invalidate();}});}});
 }
 protected void onDraw(Canvas canvas){
  super.onDraw(canvas);canvas.drawColor(0xff253020);paint.setColor(0xff3e4c35);paint.setStrokeWidth(1);
  for(int x=0;x<getWidth();x+=64)canvas.drawLine(x,0,x,getHeight(),paint);for(int y=0;y<getHeight();y+=64)canvas.drawLine(0,y,getWidth(),y,paint);
  if(mapReady){if(online!=null){for(int layer=0;layer<online.length;layer++)drawTiles(canvas,layer,online[layer].source);}else drawTiles(canvas,0,null);}
  int labels=0;
  for(KmlProject.Feature f:features){float[] label=null;for(KmlProject.Geometry g:f.shapes){paint.setColor(f.color);paint.setStrokeWidth(3*getResources().getDisplayMetrics().density);paint.setStyle(Paint.Style.STROKE);
   if("Point".equals(g.type)){float[] p=point(g.rings.get(0).get(0));paint.setStyle(Paint.Style.FILL);canvas.drawCircle(p[0],p[1],7*getResources().getDisplayMetrics().density,paint);paint.setStyle(Paint.Style.STROKE);paint.setColor(0xff000000);canvas.drawCircle(p[0],p[1],8*getResources().getDisplayMetrics().density,paint);label=p;}
   else {Path path=new Path();path.setFillType(Path.FillType.EVEN_ODD);for(List<double[]> ring:g.rings){boolean first=true;double previous=0;for(double[] c:ring){double worldX=MapMath.x(c[0]);double px;if(first)px=MapMath.delta(worldX,cx);else px=previous+MapMath.delta(worldX,MapMath.wrap(cx+previous));previous=px;float x=(float)(getWidth()/2.0+px*world()),y=(float)(getHeight()/2.0+(MapMath.y(c[1])-cy)*world());if(label==null)label=new float[]{x,y};if(first){path.moveTo(x,y);first=false;}else path.lineTo(x,y);}if("Polygon".equals(g.type))path.close();}
    if("Polygon".equals(g.type)){paint.setStyle(Paint.Style.FILL);paint.setColor((f.color&0xffffff)|0x45000000);canvas.drawPath(path,paint);paint.setStyle(Paint.Style.STROKE);paint.setColor(f.color);}canvas.drawPath(path,paint);
   }}
   if(label!=null&&labels++<200){paint.setColor(0xffffffff);paint.setStyle(Paint.Style.FILL);paint.setTextSize(14*getResources().getDisplayMetrics().scaledDensity);paint.setShadowLayer(3,1,1,0xff000000);canvas.drawText(f.name,label[0]+14,label[1]-14,paint);paint.clearShadowLayer();}
  }
  drawDraft(canvas);paint.setStyle(Paint.Style.FILL);paint.setColor(0xfff0cf52);float x=getWidth()/2f,y=getHeight()/2f;canvas.drawCircle(x,y,3*getResources().getDisplayMetrics().density,paint);
 }
 private void drawTiles(Canvas canvas,int layer,TileSource source){
  int z=source==null?(tiles!=null?tiles.zoomFor((int)Math.floor(zoom)):bundled.zoomFor((int)Math.floor(zoom))):source.zoomFor((int)Math.floor(zoom)),n=1<<z;double tileSize=world()/n;boolean elliptical=source!=null&&source.ellipsoid;
  double screenTop=MapMath.clamp(cy-getHeight()/2.0/world(),0,1),screenBottom=MapMath.clamp(cy+getHeight()/2.0/world(),0,1);
  int left=(int)Math.floor(cx*n-getWidth()/2.0/tileSize),right=(int)Math.floor(cx*n+getWidth()/2.0/tileSize),top=(int)Math.floor(TileProjection.y(MapMath.lat(screenTop),elliptical)*n),bottom=(int)Math.floor(TileProjection.y(MapMath.lat(screenBottom),elliptical)*n);
  if((long)(right-left+1)*Math.max(0,Math.min(n-1,bottom)-Math.max(0,top)+1)>32){paint.setColor(-1);paint.setTextSize(14*getResources().getDisplayMetrics().scaledDensity);canvas.drawText("Увеличьте масштаб для этой карты",16,28,paint);return;}
  for(int y=Math.max(0,top);y<=Math.min(n-1,bottom);y++)for(int x=left;x<=right;x++){
   int tx=((x%n)+n)%n;String key=layer+"/"+z+"/"+tx+"/"+y;Bitmap b=cache.get(key);float px=(float)(getWidth()/2.0+(x-cx*n)*tileSize);
   if(b==null){request(key,z,tx,y,layer);continue;}paint.setColor(-1);paint.setAlpha(255);paint.setStyle(Paint.Style.FILL);
   if(!elliptical){float py=(float)(getHeight()/2.0+(y-cy*n)*tileSize);canvas.drawBitmap(b,null,new RectF(px,py,(float)(px+tileSize+.5),(float)(py+tileSize+.5)),paint);}
   else { // Warp horizontal strips from EPSG:3395 to the shared WGS84/Web Mercator scene.
    int strip=Math.max(1,b.getHeight()/16);for(int row=0;row<b.getHeight();row+=strip){int end=Math.min(b.getHeight(),row+strip);double y0=MapMath.y(TileProjection.latitude((y+row/(double)b.getHeight())/n,true)),y1=MapMath.y(TileProjection.latitude((y+end/(double)b.getHeight())/n,true));float py=(float)(getHeight()/2.0+(y0-cy)*world()),bottomY=(float)(getHeight()/2.0+(y1-cy)*world());canvas.drawBitmap(b,new Rect(0,row,b.getWidth(),end),new RectF(px,py,(float)(px+tileSize+.5),bottomY+.5f),paint);}
   }
  }
 }
 public boolean onTouchEvent(MotionEvent event){
  if(event.getActionMasked()==MotionEvent.ACTION_DOWN)longConsumed=false;contextGesture.onTouchEvent(event);scale.onTouchEvent(event);float x=event.getX(),y=event.getY();
  switch(event.getActionMasked()){
   case MotionEvent.ACTION_DOWN:downX=lastX=x;downY=lastY=y;moved=false;return true;
   case MotionEvent.ACTION_POINTER_DOWN:moved=true;return true;
   case MotionEvent.ACTION_POINTER_UP:int remain=event.getActionIndex()==0?1:0;lastX=event.getX(remain);lastY=event.getY(remain);return true;
   case MotionEvent.ACTION_MOVE:if(longConsumed)return true;if(event.getPointerCount()==1&&!scale.isInProgress()){cx=MapMath.wrap(cx-(x-lastX)/world());cy=MapMath.clamp(cy-(y-lastY)/world(),0,1);if(Math.abs(x-downX)+Math.abs(y-downY)>8)moved=true;changed();}lastX=x;lastY=y;return true;
   case MotionEvent.ACTION_UP:if(longConsumed){settle();return true;}if(moved){cx=MapMath.wrap(cx-(x-lastX)/world());cy=MapMath.clamp(cy-(y-lastY)/world(),0,1);changed();}if(!moved){performClick();if(draft!=null){addDrawingPoint(MapMath.lon(cx+(x-getWidth()/2.0)/world()),MapMath.lat(cy+(y-getHeight()/2.0)/world()));}else{double radius=32*getResources().getDisplayMetrics().density,best=radius;int bestPriority=-1;KmlProject.Feature picked=null;for(KmlProject.Feature f:features)for(KmlProject.Geometry g:f.shapes){double d=MapHitTest.distance(g.type,g.rings,cx,cy,world(),getWidth(),getHeight(),x,y);int priority="Point".equals(g.type)?2:("LineString".equals(g.type)?1:0);if(d<=radius&&(priority>bestPriority||(priority==bestPriority&&d<=best))){best=d;bestPriority=priority;picked=f;}}if(picked!=null)listener.picked(picked);}}settle();return true;
   case MotionEvent.ACTION_CANCEL:settle();return true;
  }return true;
 }
 public boolean performClick(){super.performClick();return true;}
 public double[] bounds(){double halfX=getWidth()/2.0/world(),halfY=getHeight()/2.0/world();return new double[]{halfX>=.5?-180:MapMath.lon(cx-halfX),MapMath.lat(Math.min(1,cy+halfY)),halfX>=.5?180:MapMath.lon(cx+halfX),MapMath.lat(Math.max(0,cy-halfY))};}
 public void suspend(boolean value){paused=value;if(value){OnlineTiles[] sources=online;if(sources!=null)for(OnlineTiles source:sources)source.interrupt();}else{missing.clear();invalidate();}}
 public void close(){if(disposed)return;disposed=true;OnlineTiles[] sources=online;if(sources!=null)for(OnlineTiles source:sources)source.cancel();worker.execute(new Runnable(){public void run(){if(tiles!=null)tiles.close();if(online!=null)for(OnlineTiles source:online)source.close();}});worker.shutdown();cache.evictAll();}
}
