package org.rabochaya.projects;

import android.app.Activity;
import android.graphics.*;
import android.view.*;
import android.widget.*;
import java.io.File;
import java.util.*;

/** A selected-part overlay over the existing map renderer and its tile policy. */
public final class GeometryMapCanvas extends LinearLayout implements LocalMapView.Listener {
    public interface Listener {void changed();void message(String message);}
    private final Activity activity;
    private final GeometryMapState state;
    private final Listener listener;
    private final LocalMapView map;
    private final Overlay overlay;
    private final List<List<double[]>> context=new ArrayList<>();
    private final List<String> contextTypes=new ArrayList<>();
    private final Button add,remove,undo;
    private boolean adding,editable=true,closed,initialised;
    private double[] initialViewport;

    public GeometryMapCanvas(Activity activity,long project,GeometryMapState state,List<GeometryEdits.Part> parts,String currentKey,boolean newHole,double[] viewport,Listener listener){
        super(activity);this.activity=activity;this.state=state;this.listener=listener;initialViewport=viewport;
        setOrientation(VERTICAL);setBackgroundColor(0xff232d1d);
        for(GeometryEdits.Part part:parts)if(newHole||!part.key.equals(currentKey))try{context.add(GeometryCoordinates.parse(part.text,part.type));contextTypes.add(part.type);}catch(IllegalArgumentException ignored){}
        FrameLayout scene=new FrameLayout(activity);addView(scene,new LinearLayout.LayoutParams(-1,0,1));
        TileSource source=OnlineMapSettings.active(activity,project)?OnlineMapSettings.source(activity):null;
        File file=new File(activity.getFilesDir(),"local_basemap_"+project+".mbtiles");
        map=new LocalMapView(activity,Collections.<KmlProject.Feature>emptyList(),file,this,source,source!=null&&OnlineMapSettings.network(activity));scene.addView(map,new FrameLayout.LayoutParams(-1,-1));
        overlay=new Overlay(activity);scene.addView(overlay,new FrameLayout.LayoutParams(-1,-1));
        LinearLayout zoom=new LinearLayout(activity);zoom.setOrientation(VERTICAL);
        button(zoom,"+","Увеличить карту редактора",()->map.step(1));button(zoom,"−","Уменьшить карту редактора",()->map.step(-1));
        scene.addView(zoom,new FrameLayout.LayoutParams(dp(48),dp(96),Gravity.TOP|Gravity.RIGHT));
        TextView credit=new TextView(activity);credit.setText(source!=null?source.attribution:file.isFile()?"Локальная карта MBTiles":"Обзорная карта");credit.setTextColor(-1);credit.setTextSize(10);credit.setMaxLines(3);credit.setBackgroundColor(0xcc232d1d);credit.setPadding(dp(4),dp(2),dp(4),dp(2));
        scene.addView(credit,new FrameLayout.LayoutParams(-2,-2,Gravity.BOTTOM|Gravity.LEFT));
        LinearLayout controls=new LinearLayout(activity);addView(controls,new LinearLayout.LayoutParams(-1,dp(48)));
        add=button(controls,"Добавить","Добавить вершину на карте",()->{overlay.cancelGesture();adding=!adding;update();listener.message(adding?"Коснитесь места новой вершины. Вставка после выбранной; высота новой вершины — 0 м":"Добавление отменено");});
        remove=button(controls,"Удалить","Удалить выбранную вершину",()->{
            if(state.selected()<0){listener.message("Сначала коснитесь вершины");return;}
            new android.app.AlertDialog.Builder(activity).setMessage("Удалить выбранную вершину из текущего ввода?").setPositiveButton("Удалить",(d,w)->act(()->state.delete())).setNegativeButton("Отмена",null).show();
        });
        undo=button(controls,"Шаг назад","Отменить действие с вершиной",()->act(()->state.undo()));
        button(controls,"Охват","Показать весь редактируемый контур",()->fit());update();
    }
    private int dp(float value){return WorkspaceUi.dp(activity,value);}
    private Button button(LinearLayout row,String title,String description,Runnable action){Button b=new Button(activity);b.setAllCaps(false);b.setText(title);b.setTextSize(12);b.setContentDescription(description);b.setTypeface(WorkspaceUi.font(activity));row.addView(b,new LinearLayout.LayoutParams(0,-1,1));if(row.getOrientation()==VERTICAL)b.setLayoutParams(new LinearLayout.LayoutParams(-1,0,1));b.setOnClickListener(v->{if(editable&&!closed)action.run();});return b;}
    private void act(Runnable action){if(closed||!editable)return;overlay.cancelGesture();try{action.run();adding=false;update();listener.changed();}catch(IllegalArgumentException e){listener.message(e.getMessage());}}
    private void update(){add.setEnabled(editable&&!"Point".equals(state.type));add.setText(adding?"Коснуться…":"Добавить");remove.setEnabled(editable&&state.selected()>=0&&!"Point".equals(state.type));undo.setEnabled(editable&&state.canUndo());overlay.invalidate();}
    public void setEditingEnabled(boolean value){editable=value;overlay.cancelGesture();update();}
    public void cancelGesture(){overlay.cancelGesture();}
    public void suspend(boolean value){if(value)overlay.cancelGesture();map.suspend(value);}
    public void close(){if(closed)return;closed=true;overlay.cancelGesture();map.close();}
    public double[] viewport(){return map.viewport();}
    public float[] screenVertex(int index){return screen(state.point(index));}
    public View touchSurface(){return overlay;}
    private float[] screen(double[] point){double[] v=map.viewport();double world=256*Math.pow(2,v[2]);return new float[]{(float)(map.getWidth()/2.0+MapMath.delta(MapMath.x(point[0]),v[0])*world),(float)(map.getHeight()/2.0+(MapMath.y(point[1])-v[1])*world)};}
    private double[] coordinate(float x,float y){double[] v=map.viewport();double world=256*Math.pow(2,v[2]);return new double[]{MapMath.lon(v[0]+(x-map.getWidth()/2.0)/world),MapMath.lat(v[1]+(y-map.getHeight()/2.0)/world)};}
    private void fit(){
        List<double[]> all=new ArrayList<>();for(int i=0;i<state.size();i++)all.add(state.point(i));if(all.isEmpty())for(List<double[]> ring:context)all.addAll(ring);
        double[] v=MapMath.fit(all.toArray(new double[all.size()][]),Math.max(1,map.getWidth()),Math.max(1,map.getHeight()));map.restore(v[0],v[1],state.size()==1?Math.min(16,v[2]):v[2]);
    }
    public void center(double lat,double lon,double zoom){if(overlay!=null)overlay.invalidate();}
    public void picked(KmlProject.Feature feature){}
    public void error(String message){if(!closed)listener.message(message);}
    public void settled(double x,double y,double zoom){if(overlay!=null)overlay.invalidate();}
    public void draftChanged(int count){}
    public void longPressed(double lat,double lon){}

    private final class Overlay extends View {
        private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        private MotionEvent down;
        private int vertex=-1;
        private boolean forwarding,dragging;
        private float startX,startY;
        private double[] preview;
        Overlay(Activity activity){super(activity);setContentDescription("Вершины контура на карте. Коснитесь вершины и перетащите. Свободное место — перемещение карты, два пальца — масштаб.");}
        protected void onSizeChanged(int w,int h,int oldw,int oldh){super.onSizeChanged(w,h,oldw,oldh);if(w>0&&h>0&&!initialised){initialised=true;if(initialViewport!=null&&initialViewport.length==3)map.restore(initialViewport[0],initialViewport[1],initialViewport[2]);else fit();}}
        protected void onDraw(Canvas canvas){super.onDraw(canvas);for(int i=0;i<context.size();i++)path(canvas,context.get(i),contextTypes.get(i),0xffa9b4a2,dp(1.5f));
            List<double[]> points=new ArrayList<>();for(int i=0;i<state.size();i++)points.add(i==vertex&&preview!=null?preview:state.point(i));
            path(canvas,points,state.type,0xff67def7,dp(3));
            for(int i=0;i<points.size();i++){float[] p=screen(points.get(i));if(p[0]<-dp(20)||p[0]>getWidth()+dp(20)||p[1]<-dp(20)||p[1]>getHeight()+dp(20))continue;paint.setStyle(Paint.Style.FILL);paint.setColor(i==state.selected()?0xffffc857:0xffe6fbff);canvas.drawCircle(p[0],p[1],dp(i==state.selected()?9:6),paint);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(dp(2));paint.setColor(0xff192417);canvas.drawCircle(p[0],p[1],dp(i==state.selected()?9:6),paint);}
        }
        private void path(Canvas canvas,List<double[]> points,String type,int color,int width){if(points.isEmpty())return;Path path=new Path();double[] v=map.viewport();double world=256*Math.pow(2,v[2]),previous=0;boolean first=true;
            for(double[] p:points){double dx=first?MapMath.delta(MapMath.x(p[0]),v[0]):previous+MapMath.delta(MapMath.x(p[0]),MapMath.wrap(v[0]+previous));previous=dx;float x=(float)(getWidth()/2.0+dx*world),y=(float)(getHeight()/2.0+(MapMath.y(p[1])-v[1])*world);if(first){path.moveTo(x,y);first=false;}else path.lineTo(x,y);}
            if("Polygon".equals(type)&&points.size()>2)path.close();paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(width);paint.setColor(color);canvas.drawPath(path,paint);
        }
        private int hit(float x,float y){double best=dp(24)*dp(24);int result=-1;for(int i=0;i<state.size();i++){float[] p=screen(state.point(i));double d=(x-p[0])*(x-p[0])+(y-p[1])*(y-p[1]);if(d<best||(d==best&&i==state.selected())){best=d;result=i;}}return result;}
        void cancelGesture(){if(forwarding&&down!=null){MotionEvent cancel=MotionEvent.obtain(down);cancel.setAction(MotionEvent.ACTION_CANCEL);map.dispatchTouchEvent(cancel);cancel.recycle();}if(down!=null){down.recycle();down=null;}forwarding=dragging=false;vertex=-1;preview=null;invalidate();}
        private void forward(MotionEvent event){map.dispatchTouchEvent(event);}
        public boolean onTouchEvent(MotionEvent event){
            if(!editable||closed)return true;int action=event.getActionMasked();float x=event.getX(),y=event.getY();
            if(action==MotionEvent.ACTION_DOWN){cancelGesture();down=MotionEvent.obtain(event);startX=x;startY=y;vertex=adding?-1:hit(x,y);if(vertex>=0){state.select(vertex);update();listener.message("Вершина "+(vertex+1)+": перетащите для изменения координат");}else if(!adding){forwarding=true;forward(event);}return true;}
            if(down==null)return true;
            if(action==MotionEvent.ACTION_POINTER_DOWN&&!forwarding){preview=null;vertex=-1;forwarding=true;forward(down);}
            if(forwarding){forward(event);if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL)cancelGesture();return true;}
            if(action==MotionEvent.ACTION_MOVE){float distance=Math.abs(x-startX)+Math.abs(y-startY);if(distance>ViewConfiguration.get(getContext()).getScaledTouchSlop()){
                if(vertex>=0){dragging=true;double[] p=coordinate(x,y);preview=new double[]{p[0],p[1],state.point(vertex)[2]};invalidate();}
                else {forwarding=true;forward(down);forward(event);}
            }return true;}
            if(action==MotionEvent.ACTION_CANCEL){cancelGesture();return true;}
            if(action==MotionEvent.ACTION_UP){final int chosen=vertex;boolean moved=dragging;cancelGesture();
                if(x<0||y<0||x>getWidth()||y>getHeight()){listener.message("Перенос отменён за пределами карты");return true;}
                if(adding){double[] p=coordinate(x,y);act(()->state.insert(p[0],p[1]));}
                else if(chosen>=0&&moved){double[] p=coordinate(x,y);act(()->state.move(chosen,p[0],p[1]));}
                performClick();return true;
            }return true;
        }
        public boolean performClick(){super.performClick();return true;}
    }
}
