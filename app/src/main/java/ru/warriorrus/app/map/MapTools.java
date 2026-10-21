package ru.warriorrus.app.map;

import android.app.Activity;
import android.content.SharedPreferences;
import android.graphics.*;
import android.graphics.drawable.GradientDrawable;
import android.view.*;
import android.widget.*;
import java.util.*;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.Overlay;
import ru.warriorrus.app.data.Vertex;
import ru.warriorrus.app.geometry.Geometry;
import ru.warriorrus.app.EditorPanel;
import ru.warriorrus.app.ReferenceMenu;

/** Map-center-only target and measure tools; independent of positioning and user objects. */
public final class MapTools {
  private final Activity activity;private final MapView map;private final FrameLayout host;private final SharedPreferences prefs;
  private final List<List<Vertex>> measures=new ArrayList<>();private final List<Vertex> draft=new ArrayList<>();
  private Vertex target;private EditorPanel controls;private TextView targetInfo;public boolean measuring;
  private final Overlay overlay=new Overlay(){
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    @Override public void draw(Canvas canvas,MapView view,boolean shadow){if(shadow)return;paint.setStrokeWidth(dp(2));
      for(List<Vertex> line:measures)drawLine(canvas,line,false);if(measuring){List<Vertex> preview=new ArrayList<>(draft);preview.add(center());drawLine(canvas,preview,true);}
      if(target!=null&&prefs.getBoolean("targetLine",true)){paint.setColor(0xff23b8ff);paint.setPathEffect(new DashPathEffect(new float[]{dp(7),dp(4)},0));segment(canvas,center(),target);paint.setPathEffect(null);}
    }
    private void drawLine(Canvas canvas,List<Vertex> line,boolean preview){paint.setPathEffect(preview?new DashPathEffect(new float[]{dp(7),dp(3)},0):null);for(int n=1;n<line.size();n++){double b=Geometry.bearing(line.get(n-1),line.get(n));paint.setColor(b<90||b>270?0xffff6262:0xff4f9eff);segment(canvas,line.get(n-1),line.get(n));}paint.setPathEffect(null);}
    private void segment(Canvas canvas,Vertex a,Vertex b){Point x=new Point(),y=new Point();map.getProjection().toPixels(new GeoPoint(a.latitude,a.longitude),x);map.getProjection().toPixels(new GeoPoint(b.latitude,b.longitude),y);canvas.drawLine(x.x,x.y,y.x,y.y,paint);}
  };
  public MapTools(Activity activity,MapView map,FrameLayout host){
    this.activity=activity;this.map=map;this.host=host;prefs=activity.getPreferences(Activity.MODE_PRIVATE);
    try{measures.addAll(Geometry.decode(prefs.getString("measures","[]")));List<List<Vertex>> saved=Geometry.decode(prefs.getString("mapTarget","[]"));if(!saved.isEmpty()&&!saved.get(0).isEmpty())target=saved.get(0).get(0);draft.addAll(Geometry.decode(prefs.getString("measureDraft","[[]]")).get(0));measuring=prefs.getBoolean("measuring",false);}catch(Exception invalid){draft.clear();measuring=false;}
    map.getOverlays().add(overlay);targetInfo=new TextView(activity);targetInfo.setTag("targetInformation");targetInfo.setTextColor(ReferenceMenu.TEXT);targetInfo.setTextSize(11);targetInfo.setPadding(dp(8),dp(4),dp(8),dp(4));targetInfo.setBackground(background());
    FrameLayout.LayoutParams box=new FrameLayout.LayoutParams(-2,-2,Gravity.BOTTOM|Gravity.END);box.setMargins(dp(8),0,dp(8),dp(170));host.addView(targetInfo,box);if(measuring)controls();update();
  }
  private int dp(int n){return Math.round(n*activity.getResources().getDisplayMetrics().density);}
  private GradientDrawable background(){return new ReferenceMenu(activity).background();}
  public Vertex center(){return new Vertex(map.getMapCenter().getLatitude(),map.getMapCenter().getLongitude());}
  public boolean hasTarget(){return target!=null;}
  public void target(Vertex vertex){target=vertex;save();update();}
  public void jumpTarget(){if(target!=null)map.getController().setCenter(new GeoPoint(target.latitude,target.longitude));}
  public void start(Vertex initial){if(measuring)return;draft.clear();draft.add(initial);measuring=true;controls();save();update();}
  public void add(){if(!measuring||draft.size()>=10000)return;draft.add(center());save();update();}
  public void removeLast(){if(!draft.isEmpty())draft.remove(draft.size()-1);save();update();}
  public void finish(){saveState();if(draft.size()>1){measures.add(new ArrayList<>(draft));if(measures.size()>100)measures.remove(0);}draft.clear();measuring=false;if(controls!=null)host.removeView(controls);controls=null;save();update();}
  public void clear(){measures.clear();draft.clear();measuring=false;if(controls!=null)host.removeView(controls);controls=null;save();update();}
  public double previewLength(){double length=0;for(int n=1;n<draft.size();n++)length+=Geometry.distance(draft.get(n-1),draft.get(n));if(measuring&&!draft.isEmpty())length+=Geometry.distance(draft.get(draft.size()-1),center());return length;}
  private void controls(){
    controls=new EditorPanel(activity,host,"measureControls","Измерение",this::search,null,this::finish);
    controls.closeAction(ru.warriorrus.app.R.drawable.ui_close,"Закрыть измерение");
    controls.action("+ Местоположение","Местоположение",this::add);
    controls.action("Удалить","Удалить последнее",this::removeLast);
    controls.expanded(prefs.getBoolean("measureStatistics",false));controls.show();
  }
  private void search(){
    EditText input=new EditText(activity);input.setHint("Широта, долгота / UTM / MGRS / СК42 X Y / EPSG:код E N");
    android.app.AlertDialog dialog=new android.app.AlertDialog.Builder(activity).setTitle("Координаты назначения").setView(input).setPositiveButton("Показать на карте",null).setNegativeButton("Отмена",null).create();
    dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{try{Vertex point=ru.warriorrus.app.settings.Coordinates.parse(input.getText().toString());map.getController().setCenter(new GeoPoint(point.latitude,point.longitude));update();dialog.dismiss();}catch(Exception error){input.setError(error.getMessage());}}));dialog.show();
  }
  public void update(){
    ru.warriorrus.app.settings.DisplayUnits units=ru.warriorrus.app.settings.DisplayUnits.from(prefs);
    if(measuring&&controls!=null){Vertex from=draft.isEmpty()?center():draft.get(draft.size()-1);controls.title("Измерение · "+draft.size()+" · "+units.distance(previewLength()));controls.summary("Местоположений: "+draft.size()+"\nРасстояние: "+units.distance(previewLength())+"\nАзимут: "+units.bearing(Geometry.bearing(from,center())));}
    targetInfo.setVisibility(target!=null&&prefs.getBoolean("targetInfo",true)?View.VISIBLE:View.GONE);if(target!=null)targetInfo.setText("Цель от центра карты\n"+units.distance(Geometry.distance(center(),target))+" · "+units.bearing(Geometry.bearing(center(),target))+" / обратно "+units.bearing(Geometry.bearing(target,center())));map.invalidate();
  }
  public void saveState(){if(controls!=null)prefs.edit().putBoolean("measureStatistics",controls.expanded()).apply();save();}
  private void save(){prefs.edit().putString("measures",Geometry.encode(measures)).putString("mapTarget",target==null?"[]":Geometry.encode(Collections.singletonList(Collections.singletonList(target)))).putBoolean("measuring",measuring).putString("measureDraft",Geometry.encode(Collections.singletonList(draft))).apply();}
}
