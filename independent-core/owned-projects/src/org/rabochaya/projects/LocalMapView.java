package org.rabochaya.projects;
import android.content.*;import android.graphics.*;import android.os.Handler;import android.os.Looper;import android.util.LruCache;import android.view.*;import java.io.*;import java.util.*;import java.util.concurrent.*;
/** Independent raster map + KML geometry, sharing one Web Mercator viewport. */
public final class LocalMapView extends View {
 public interface Listener {void center(double lat,double lon,double zoom);void picked(KmlProject.Feature feature);void error(String message);default void tileError(String message){error(message);}void settled(double x,double y,double zoom);void draftChanged(int count);void longPressed(double lat,double lon);}
 private final IdentityHashMap<org.w3c.dom.Element,KmlComponentStyle> componentStyles=new IdentityHashMap<>();
 private final Handler mainHandler = new Handler(Looper.getMainLooper());
 private final IdentityHashMap<org.w3c.dom.Element,SymbolImage> symbolImages=new IdentityHashMap<>();
 private final Map<String,Bitmap> symbolBitmaps = new HashMap<>();
 private static final class SymbolImage {final Bitmap bitmap;final float scale,heading,anchorX,anchorY;final Integer color;SymbolImage(Bitmap bitmap,Map<String,String> values,Integer color){this.bitmap=bitmap;this.color=color;scale=symbolNumber(values.get("scale"),1,0,16);heading=symbolNumber(values.get("heading"),0,-360,360);anchorX=anchor(values,"x",bitmap.getWidth());anchorY=bitmap.getHeight()-anchor(values,"y",bitmap.getHeight());if(bitmap.getWidth()*scale>256||bitmap.getHeight()*scale>256)throw new IllegalArgumentException("SVG: масштаб больше256px");}private static float anchor(Map<String,String> values,String axis,int extent){String value=values.get("hotSpot."+axis);float n=symbolNumber(value,.5f,-4096,4096);String unit=values.get("hotSpot."+axis+"units");if(unit==null||unit.equals("fraction"))return n*extent;if(unit.equals("pixels"))return n;if(unit.equals("insetPixels"))return extent-n;throw new IllegalArgumentException("SVG: неподдержанная единица hotSpot");}}
 private static float symbolNumber(String text,float fallback,float min,float max){if(text==null)return fallback;if(text.length()>64||!text.matches("[+-]?(?:[0-9]+(?:\\.[0-9]*)?|\\.[0-9]+)(?:[eE][+-]?[0-9]+)?"))throw new IllegalArgumentException("SVG: некорректный scale/heading/hotSpot");try{float n=Float.parseFloat(text);if(Float.isNaN(n)||Float.isInfinite(n)||n<min||n>max)throw new NumberFormatException();return n;}catch(NumberFormatException e){throw new IllegalArgumentException("SVG: небезопасный scale/heading/hotSpot");}}
 private boolean inputLocked, geographicGridVisible, secondaryGridVisible, radiusRulerVisible, nightRaster;
 private int primaryGridFormat=Coordinates.DD, secondaryGridFormat=Coordinates.UTM;
 private final MapGrid grid=new MapGrid();
 private boolean labelsVisible = true;

 void setInputLocked(boolean locked) {
  if (inputLocked == locked) return;
  inputLocked = locked;
  if (!locked) return;
  touchInProgress=false;
  applyBearing();
  long now = android.os.SystemClock.uptimeMillis();
  MotionEvent cancel = MotionEvent.obtain(now, now, MotionEvent.ACTION_CANCEL, 0, 0, 0);
  try {
   contextGesture.onTouchEvent(cancel);
   scale.onTouchEvent(cancel);
  } finally {
   cancel.recycle();
  }
 }

 void setGeographicGridVisible(boolean visible) {
  geographicGridVisible = visible;
  invalidate();
 }

 void setLabelsVisible(boolean visible) {
  if (labelsVisible == visible) return;
  labelsVisible = visible;
  invalidate();
 }

 public void setSymbols(final KmlSymbolAssets assets) {
  if (disposed) return;
  worker.execute(() -> {
   IdentityHashMap<org.w3c.dom.Element,SymbolImage> decoded = new IdentityHashMap<>();
   Map<String,Bitmap> bitmaps = new HashMap<>();
   String error = null;
   for (KmlProject.Feature feature : features) {
    if (disposed) break;
    KmlComponentStyle style = componentStyles.get(feature.element);
    String href = style == null ? null : style.symbol.get("href");
    if (href == null || href.isEmpty()) continue;
    try {
     String key = assets.key(feature.element, href);
     Bitmap bitmap = bitmaps.get(key);
     if (bitmap == null) {
      if (bitmaps.size() >= 32) throw new IllegalArgumentException("SVG: предел 32 разных значков на карте");
      bitmap = SvgRaster.render(assets.read(feature.element, href));
      bitmaps.put(key, bitmap);
     }
     decoded.put(feature.element, new SymbolImage(bitmap, style.symbol, style.icon));
    } catch (IllegalArgumentException invalid) {
     error = invalid.getMessage();
    }
   }
   String warning = error;
   // Publish and release bitmaps on the UI thread even when the view has no window yet.
   mainHandler.post(() -> {
    if (disposed) {
     for (Bitmap bitmap : bitmaps.values()) bitmap.recycle();
     return;
    }
    for (Bitmap bitmap : symbolBitmaps.values()) bitmap.recycle();
    symbolBitmaps.clear();
    symbolBitmaps.putAll(bitmaps);
    symbolImages.clear();
    symbolImages.putAll(decoded);
    invalidate();
    if (warning != null) listener.error("Не показаны некоторые значки: " + warning);
   });
  });
 }
 private boolean symbol(Canvas canvas,org.w3c.dom.Element feature,float x,float y){SymbolImage icon=symbolImages.get(feature);if(icon==null)return false;int saved=canvas.save();try{canvas.translate(x,y);canvas.rotate(icon.heading);canvas.scale(icon.scale,icon.scale);paint.setStyle(Paint.Style.FILL);paint.setColor(-1);paint.setAlpha(icon.color==null?255:icon.color>>>24);paint.setColorFilter(icon.color==null?null:new LightingColorFilter(icon.color&0xffffff,0));canvas.drawBitmap(icon.bitmap,-icon.anchorX,-icon.anchorY,paint);return true;}finally{paint.setColorFilter(null);paint.setAlpha(255);canvas.restoreToCount(saved);}}
 private final List<KmlProject.Feature> features;private final Listener listener;private final Paint paint=new Paint(3);private final ExecutorService worker=Executors.newSingleThreadExecutor();
 private final LruCache<String,Bitmap> cache=new LruCache<String,Bitmap>(16*1024*1024){protected int sizeOf(String k,Bitmap b){return b.getByteCount();}};
 private final Set<String> pending=new HashSet<String>(),missing=new HashSet<String>();private OfflineTiles tiles;private BundledTiles bundled;private volatile OnlineTiles[] online;private final TileSource onlineSource;private final boolean useNetwork;private volatile boolean paused;private volatile boolean disposed;
 private volatile RasterLayer[] compositionLayers;
 private static final class RasterLayer {final MapComposition.Layer model;OnlineTiles[] online;OfflineTiles offline;BundledTiles bundled;RasterLayer(MapComposition.Layer model){this.model=model;}void interrupt(){if(online!=null)for(OnlineTiles t:online)t.interrupt();}void cancel(){if(online!=null)for(OnlineTiles t:online)t.cancel();}void close(){if(offline!=null)offline.close();if(online!=null)for(OnlineTiles t:online)if(t!=null)t.close();}Bitmap tile(int z,int x,int y,int child,boolean network)throws IOException{return online!=null?online[child].tile(z,x,y,network):offline!=null?offline.tile(z,x,y):bundled.tile(z,x,y);}}
 private volatile boolean mapReady;private int minZoom,maxZoom;private double cx=.5,cy=.5,zoom=2;private boolean fitted,restored,moved;private float downX,downY,lastX,lastY;private final ScaleGestureDetector scale;private final GestureDetector contextGesture;private boolean longConsumed;
 public LocalMapView(Context context,List<KmlProject.Feature> features,File map,Listener listener){this(context,features,map,listener,null,false);}
 public LocalMapView(Context context,List<KmlProject.Feature> features,File map,Listener listener,TileSource source,boolean network){this(context,features,map,listener,source,network,null);}
 public LocalMapView(Context context,List<KmlProject.Feature> features,File map,Listener listener,TileSource source,boolean network,MapComposition composition){
  super(context);paint.setTypeface(WorkspaceUi.font(context));onlineSource=source;useNetwork=network;this.features=features;this.listener=listener;
  IdentityHashMap<org.w3c.dom.Document,KmlComponentStyle.Resolver> resolvers=new IdentityHashMap<>();
  for(KmlProject.Feature feature:features)if(feature.element!=null){org.w3c.dom.Document document=feature.element.getOwnerDocument();KmlComponentStyle.Resolver resolver=resolvers.get(document);if(resolver==null){resolver=new KmlComponentStyle.Resolver(document);resolvers.put(document,resolver);}componentStyles.put(feature.element,resolver.resolve(feature.element));}setContentDescription("Карта и объекты KML. Перемещение одним пальцем, масштаб двумя.");
  contextGesture=new GestureDetector(context,new GestureDetector.SimpleOnGestureListener(){public boolean onDown(MotionEvent e){return true;}public void onLongPress(MotionEvent e){if(!disposed&&!paused&&!moved&&draft==null&&e.getPointerCount()==1){longConsumed=true;listener.longPressed(MapMath.lat(cy+(e.getY()-getHeight()/2.0)/world()),MapMath.lon(cx+(e.getX()-getWidth()/2.0)/world()));}}});
  scale=new ScaleGestureDetector(context,new ScaleGestureDetector.SimpleOnScaleGestureListener(){public boolean onScale(ScaleGestureDetector s){zoomAt(Math.log(s.getScaleFactor())/Math.log(2),s.getFocusX(),s.getFocusY());moved=true;return true;}public void onScaleEnd(ScaleGestureDetector d){settle();}});
  if(composition!=null)openComposition(context,map,composition);
  else if(source!=null)worker.execute(()->{try{TileSource[] leaves=source.leafs();OnlineTiles[] readers=new OnlineTiles[leaves.length];try{for(int i=0;i<leaves.length;i++)readers[i]=new OnlineTiles(context,leaves[i]);}catch(Exception e){for(OnlineTiles reader:readers)if(reader!=null)reader.close();throw e;}online=readers;minZoom=source.minZoom;maxZoom=source.maxZoom;mapReady=true;post(()->{if(!disposed)invalidate();});}catch(final Exception e){post(()->{if(!disposed)listener.error(e.getMessage());});}});
  else if(map!=null&&map.isFile())worker.execute(new Runnable(){public void run(){try{tiles=new OfflineTiles(map);minZoom=tiles.minZoom;maxZoom=tiles.maxZoom;mapReady=true;post(new Runnable(){public void run(){if(!disposed)invalidate();}});}catch(final Exception e){post(new Runnable(){public void run(){if(!disposed)listener.error(e.getMessage());}});}}});
  else {bundled=new BundledTiles(context.getAssets());minZoom=1;maxZoom=3;mapReady=true;}
 }
 private void openComposition(final Context context,final File map,final MapComposition composition){worker.execute(()->{ArrayList<RasterLayer> ready=new ArrayList<>();ArrayList<String> errors=new ArrayList<>();for(MapComposition.Layer item:composition.layers){if(disposed)break;if(!item.visible||item.opacity==0)continue;RasterLayer layer=new RasterLayer(item);try{if("local".equals(item.kind)){if(map==null||!map.isFile())throw new IOException("MBTiles проекта не найден");layer.offline=new OfflineTiles(map);}else if("bundled".equals(item.kind))layer.bundled=new BundledTiles(context.getAssets());else{TileSource source=item.source();if(source==null)throw new IOException("Источник отсутствует в каталоге");TileSource[] children=source.leafs();layer.online=new OnlineTiles[children.length];for(int i=0;i<children.length;i++)layer.online[i]=new OnlineTiles(context,children[i]);}ready.add(layer);}catch(Exception e){layer.close();errors.add(item.name+": "+e.getMessage());}}
  if(disposed){for(RasterLayer layer:ready)layer.close();return;}compositionLayers=ready.toArray(new RasterLayer[ready.size()]);mapReady=true;post(()->{if(disposed)return;if(!errors.isEmpty())listener.error(errors.get(0));invalidate();});});}
 private ArrayList<double[]> draft;private String draftType;
 private double world(){return 256*Math.pow(2,zoom);}
 public void restore(double x,double y,double z){if(Double.isNaN(x)||Double.isInfinite(x)||Double.isNaN(y)||Double.isInfinite(y)||Double.isNaN(z)||Double.isInfinite(z))return;cx=MapMath.wrap(x);cy=MapMath.clamp(y,0,1);zoom=MapMath.clamp(z,0,23);restored=true;fitted=true;changed();settle();}
 public double[] viewport(){return new double[]{cx,cy,zoom};}
 public void fit(){if(getWidth()<1||getHeight()<1){fitted=false;restored=false;return;}ArrayList<double[]> points=new ArrayList<double[]>();for(KmlProject.Feature f:features)for(KmlProject.Geometry g:f.shapes)for(List<double[]> ring:g.rings)points.addAll(ring);double[] v=MapMath.fit(points.toArray(new double[points.size()][]),getWidth(),getHeight());cx=v[0];cy=v[1];zoom=points.isEmpty()&&bundled!=null?MapMath.overviewZoom(getHeight()):v[2];fitted=true;changed();settle();}
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
 private void request(final String key,final int z,final int x,final int y,final int layer,final RasterLayer group){
  if(disposed||paused||pending.size()>=32||pending.contains(key)||missing.contains(key))return;pending.add(key);
  worker.execute(new Runnable(){public void run(){Bitmap b=null;String error=null;try{if(!disposed&&!paused){if(group!=null)b=group.tile(z,x,y,layer,useNetwork);else if(online!=null)b=online[layer].tile(z,x,y,useNetwork);else if(tiles!=null)b=tiles.tile(z,x,y);else if(bundled!=null)b=bundled.tile(z,x,y);}}catch(java.net.UnknownHostException e){error="Не удалось найти сервер карты. Проверьте сеть или попробуйте позже.";}catch(java.io.InterruptedIOException e){error="Сервер карты не ответил вовремя.";}catch(Exception e){error="Ошибка чтения тайла: "+e.getMessage();}final Bitmap result=b;final String message=error;post(new Runnable(){public void run(){pending.remove(key);if(disposed){if(result!=null)result.recycle();return;}if(result!=null)cache.put(key,result);else if(!paused){if(missing.size()>512)missing.clear();missing.add(key);}if(message!=null&&!paused)listener.tileError(message);invalidate();}});}});
 }
 protected void onDraw(Canvas canvas){
  super.onDraw(canvas);canvas.drawColor(0xff253020);
  // A bundled world ends at the Mercator bounds. Empty space beyond it is not a map grid.
  if(bundled==null){
   paint.setColor(0xff3e4c35);paint.setStrokeWidth(1);
   for(int x=0;x<getWidth();x+=64)canvas.drawLine(x,0,x,getHeight(),paint);
   for(int y=0;y<getHeight();y+=64)canvas.drawLine(0,y,getWidth(),y,paint);
  }
  int transformed=canvas.save();
  canvas.rotate(-bearing,getWidth()/2f,getHeight()/2f);
  int visibleWidth=visibleWidth(),visibleHeight=visibleHeight();
  float left=(getWidth()-visibleWidth)/2f,top=(getHeight()-visibleHeight)/2f;
  if(mapReady){if(compositionLayers!=null){for(RasterLayer layer:compositionLayers){int saved=layer.model.opacity<100?canvas.saveLayerAlpha(left,top,left+visibleWidth,top+visibleHeight,Math.round(layer.model.opacity*255f/100f),Canvas.ALL_SAVE_FLAG):-1;if(layer.online!=null){for(int i=0;i<layer.online.length;i++)drawTiles(canvas,i,layer.online[i].source,layer);}else drawTiles(canvas,0,null,layer);if(saved!=-1)canvas.restoreToCount(saved);}}else if(online!=null){for(int layer=0;layer<online.length;layer++)drawTiles(canvas,layer,online[layer].source);}else drawTiles(canvas,0,null);}
  if(nightRaster)canvas.drawColor(0x99091826);
  if(geographicGridVisible||secondaryGridVisible||radiusRulerVisible) {
   int gridCanvas=canvas.save();
   canvas.translate(left,top);
   grid.draw(canvas,cx,cy,world(),visibleWidth,visibleHeight,getResources().getDisplayMetrics().density, WorkspaceUi.font(getContext()),
     geographicGridVisible?primaryGridFormat:-1,secondaryGridVisible?secondaryGridFormat:-1,radiusRulerVisible,DisplayUnits.distanceMode(getContext()));
   canvas.restoreToCount(gridCanvas);
  }
  int labels=0;
  for(KmlProject.Feature f:features){KmlComponentStyle style=componentStyles.get(f.element);if(style==null)style=KmlComponentStyle.EMPTY;int line=style.line==null?KmlComponentStyle.DEFAULT_COLOR:style.line;float[] label=null;for(KmlProject.Geometry g:f.shapes){paint.setColor(line);paint.setStrokeWidth(style.width==null?3*getResources().getDisplayMetrics().density:style.width);paint.setStyle(Paint.Style.STROKE);
   if("Point".equals(g.type)){paint.setStrokeWidth(3*getResources().getDisplayMetrics().density);float[] p=point(g.rings.get(0).get(0));if(!symbol(canvas,f.element,p[0],p[1])){paint.setColor(style.icon==null?KmlComponentStyle.DEFAULT_COLOR:style.icon);paint.setStyle(Paint.Style.FILL);canvas.drawCircle(p[0],p[1],7*getResources().getDisplayMetrics().density,paint);paint.setStyle(Paint.Style.STROKE);paint.setColor(style.icon==null?0xff000000:(style.icon&0xff000000));canvas.drawCircle(p[0],p[1],8*getResources().getDisplayMetrics().density,paint);}label=p;}
   else {Path path=new Path();path.setFillType(Path.FillType.EVEN_ODD);for(List<double[]> ring:g.rings){boolean first=true;double previous=0;for(double[] c:ring){double worldX=MapMath.x(c[0]);double px;if(first)px=MapMath.delta(worldX,cx);else px=previous+MapMath.delta(worldX,MapMath.wrap(cx+previous));previous=px;float x=(float)(getWidth()/2.0+px*world()),y=(float)(getHeight()/2.0+(MapMath.y(c[1])-cy)*world());if(label==null)label=new float[]{x,y};if(first){path.moveTo(x,y);first=false;}else path.lineTo(x,y);}if("Polygon".equals(g.type))path.close();}
    if("Polygon".equals(g.type)){if(!Boolean.FALSE.equals(style.fill)){paint.setStyle(Paint.Style.FILL);paint.setColor(style.polygon==null?(KmlComponentStyle.DEFAULT_COLOR&0xffffff)|0x45000000:style.polygon);canvas.drawPath(path,paint);}paint.setStyle(Paint.Style.STROKE);paint.setColor(line);if(!Boolean.FALSE.equals(style.outline)&&(style.width==null||style.width>0))canvas.drawPath(path,paint);}else if(style.width==null||style.width>0)canvas.drawPath(path,paint);
   }}
   if(labelsVisible&&label!=null&&labels++<200&&(style.label==null||(style.label>>>24)!=0)&&(style.labelScale==null||style.labelScale>0)){
    int upright=canvas.save();
    canvas.rotate(bearing,label[0],label[1]);
    float textX=label[0]+14,textY=label[1]-14;
    paint.setTextSize(14*getResources().getDisplayMetrics().scaledDensity*(style.labelScale==null?1:style.labelScale));
    if(style.label==null){
     paint.setColor(0xeaffffff);
     paint.setStyle(Paint.Style.STROKE);
     paint.setStrokeWidth(2*getResources().getDisplayMetrics().density);
     canvas.drawText(f.name,textX,textY,paint);
     paint.setColor(0xff151515);
     paint.setStyle(Paint.Style.FILL);
     canvas.drawText(f.name,textX,textY,paint);
    }else{
     paint.setColor(style.label);
     paint.setStyle(Paint.Style.FILL);
     paint.setShadowLayer(3,1,1,0xff000000);
     canvas.drawText(f.name,textX,textY,paint);
     paint.clearShadowLayer();
    }
    canvas.restoreToCount(upright);
   }
  }
  drawDraft(canvas);
  canvas.restoreToCount(transformed);
  float x=getWidth()/2f,y=getHeight()/2f,density=getResources().getDisplayMetrics().density;
  paint.setStyle(Paint.Style.STROKE);
  paint.setStrokeWidth(3*density);
  paint.setColor(MapHud.INK);
  canvas.drawCircle(x,y,6f*density,paint);
  paint.setStrokeWidth(1.5f*density);
  paint.setColor(WorkspaceUi.TEXT);
  canvas.drawCircle(x,y,6f*density,paint);
  paint.setStyle(Paint.Style.FILL);
 }
 private void drawTiles(Canvas canvas,int layer,TileSource source){drawTiles(canvas,layer,source,null);}
 private void drawTiles(Canvas canvas,int layer,TileSource source,RasterLayer group){
  OfflineTiles local=group==null?tiles:group.offline;BundledTiles fallback=group==null?bundled:group.bundled;
  int z=source==null?(local!=null?local.zoomFor((int)Math.floor(zoom)):fallback.zoomFor((int)Math.floor(zoom))):source.zoomFor((int)Math.floor(zoom));
   if(fallback!=null)z=MapMath.overviewTileZoom(z,world(),visibleWidth(),visibleHeight(),32);
   int n=1<<z;double tileSize=world()/n;boolean elliptical=source!=null&&source.ellipsoid;
  double screenTop=MapMath.clamp(cy-visibleHeight()/2.0/world(),0,1),screenBottom=MapMath.clamp(cy+visibleHeight()/2.0/world(),0,1);
  int left=(int)Math.floor(cx*n-visibleWidth()/2.0/tileSize),right=(int)Math.floor(cx*n+visibleWidth()/2.0/tileSize),top=(int)Math.floor(TileProjection.y(MapMath.lat(screenTop),elliptical)*n),bottom=(int)Math.floor(TileProjection.y(MapMath.lat(screenBottom),elliptical)*n);
  if((long)(right-left+1)*Math.max(0,Math.min(n-1,bottom)-Math.max(0,top)+1)>32){paint.setColor(-1);paint.setTextSize(14*getResources().getDisplayMetrics().scaledDensity);canvas.drawText("Увеличьте масштаб для этой карты",16,28,paint);return;}
  for(int y=Math.max(0,top);y<=Math.min(n-1,bottom);y++)for(int x=left;x<=right;x++){
   int tx=((x%n)+n)%n;String key=(group==null?"":group.model.id+"/")+layer+"/"+z+"/"+tx+"/"+y;Bitmap b=cache.get(key);float px=(float)(getWidth()/2.0+(x-cx*n)*tileSize);
   if(b==null){request(key,z,tx,y,layer,group);continue;}paint.setColor(-1);paint.setAlpha(255);paint.setStyle(Paint.Style.FILL);
   if(!elliptical){float py=(float)(getHeight()/2.0+(y-cy*n)*tileSize);canvas.drawBitmap(b,null,new RectF(px,py,(float)(px+tileSize+.5),(float)(py+tileSize+.5)),paint);}
   else { // Warp horizontal strips from EPSG:3395 to the shared WGS84/Web Mercator scene.
    int strip=Math.max(1,b.getHeight()/16);for(int row=0;row<b.getHeight();row+=strip){int end=Math.min(b.getHeight(),row+strip);double y0=MapMath.y(TileProjection.latitude((y+row/(double)b.getHeight())/n,true)),y1=MapMath.y(TileProjection.latitude((y+end/(double)b.getHeight())/n,true));float py=(float)(getHeight()/2.0+(y0-cy)*world()),bottomY=(float)(getHeight()/2.0+(y1-cy)*world());canvas.drawBitmap(b,new Rect(0,row,b.getWidth(),end),new RectF(px,py,(float)(px+tileSize+.5),bottomY+.5f),paint);}
   }
  }
 }
 void setGridAppearance(int density,int pattern,boolean minorLabels) {
  grid.setAppearance(density,pattern,minorLabels);
  invalidate();
 }
 void setGridFormats(int primary,int secondary) {
  primaryGridFormat=primary;
  secondaryGridFormat=secondary;
  invalidate();
 }
 void setSecondaryGridVisible(boolean visible) {
  secondaryGridVisible=visible;
  invalidate();
 }
 void setNightRaster(boolean enabled) {
  nightRaster=enabled;
  invalidate();
 }
 void setRadiusRulerVisible(boolean visible) {
  radiusRulerVisible=visible;
  invalidate();
 }

 private float bearing, pendingBearing;
 private boolean touchInProgress;
 private final Matrix touchRotation=new Matrix();

 void setBearing(double degrees){
  pendingBearing=Double.isNaN(degrees)?0:(float)degrees;
  if(!touchInProgress)applyBearing();
 }
 private void applyBearing(){
  if(bearing==pendingBearing)return;
  bearing=pendingBearing;
  invalidate();
 }
 private int visibleWidth(){
  if(bearing==0)return getWidth();
  double angle=Math.toRadians(bearing);
  return (int)Math.ceil(Math.abs(getWidth()*Math.cos(angle))+Math.abs(getHeight()*Math.sin(angle)));
 }
 private int visibleHeight(){
  if(bearing==0)return getHeight();
  double angle=Math.toRadians(bearing);
  return (int)Math.ceil(Math.abs(getWidth()*Math.sin(angle))+Math.abs(getHeight()*Math.cos(angle)));
 }

 public boolean onTouchEvent(MotionEvent event){
  if(inputLocked)return true;
  int action=event.getActionMasked();
  if(action==MotionEvent.ACTION_DOWN)touchInProgress=true;
  MotionEvent projected=event;
  if(bearing!=0){
   projected=MotionEvent.obtain(event);
   touchRotation.setRotate(bearing,getWidth()/2f,getHeight()/2f);
   projected.transform(touchRotation);
  }
  try{return handleMapTouch(projected);}
  finally{
   if(projected!=event)projected.recycle();
   if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL){
    touchInProgress=false;
    applyBearing();
   }
  }
 }
 private boolean handleMapTouch(MotionEvent event){
  if(inputLocked)return true;
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
 public double[] bounds(){double halfX=visibleWidth()/2.0/world(),halfY=visibleHeight()/2.0/world();return new double[]{halfX>=.5?-180:MapMath.lon(cx-halfX),MapMath.lat(Math.min(1,cy+halfY)),halfX>=.5?180:MapMath.lon(cx+halfX),MapMath.lat(Math.max(0,cy-halfY))};}
 void retryTiles(){
  OnlineTiles[] base=online;
  if(base!=null)for(OnlineTiles reader:base)reader.retryDns();
  RasterLayer[] layers=compositionLayers;
  if(layers!=null)for(RasterLayer layer:layers)if(layer.online!=null)
   for(OnlineTiles reader:layer.online)reader.retryDns();
  missing.clear();
  invalidate();
 }
 public void suspend(boolean value){paused=value;RasterLayer[] stack=compositionLayers;if(value&&stack!=null)for(RasterLayer layer:stack)layer.interrupt();if(value){OnlineTiles[] sources=online;if(sources!=null)for(OnlineTiles source:sources)source.interrupt();}else{missing.clear();invalidate();}}
 public void close(){if(disposed)return;disposed=true;RasterLayer[] stack=compositionLayers;if(stack!=null)for(RasterLayer layer:stack)layer.cancel();OnlineTiles[] sources=online;if(sources!=null)for(OnlineTiles source:sources)source.cancel();worker.execute(new Runnable(){public void run(){if(compositionLayers!=null)for(RasterLayer layer:compositionLayers)layer.close();if(tiles!=null)tiles.close();if(online!=null)for(OnlineTiles source:online)source.close();}});worker.shutdown();cache.evictAll();for(Bitmap bitmap:symbolBitmaps.values())bitmap.recycle();symbolBitmaps.clear();symbolImages.clear();}
}
