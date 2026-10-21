package ru.warriorrus.app.geometry;

import android.app.*;
import android.graphics.Color;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import java.util.*;
import java.util.function.Consumer;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.overlay.*;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.map.MapWorkspace;
import ru.warriorrus.app.EditorPanel;
import ru.warriorrus.app.settings.Coordinates;

/** Explicit manual drawing; the red focus is the only source for added coordinates. */
public final class DrawingController {
  private final Activity activity;
  private final FrameLayout host;
  private final MapWorkspace map;
  private final Consumer<MapItem> save;
  private final List<Overlay> preview=new ArrayList<>();
  private EditorPanel controls;
  private Button drawButton;
  private GeometryStatisticsView statistics;
  private boolean drawing, resumeSegment, layoutReady, propertiesPrepared;
  private MapItem draft;
  private int activeSegment;
  private final Overlay vertexOverlay=new Overlay(){
    private final android.graphics.Paint paint=new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
    @Override public void draw(android.graphics.Canvas canvas,org.osmdroid.views.MapView view,boolean shadow){
      if(shadow||draft==null||drawing)return;
      android.graphics.Point pixel=new android.graphics.Point();
      for(List<Vertex> line:draft.segments){int step=Math.max(1,line.size()/2000);for(int n=0;n<line.size();n+=step){Vertex point=line.get(n);view.getProjection().toPixels(new GeoPoint(point.latitude,point.longitude),pixel);if(pixel.x<0||pixel.y<0||pixel.x>view.getWidth()||pixel.y>view.getHeight())continue;paint.setColor(Color.WHITE);canvas.drawCircle(pixel.x,pixel.y,dp(4),paint);paint.setColor(0xff178bdc);canvas.drawCircle(pixel.x,pixel.y,dp(2),paint);}}
    }
    @Override public boolean onSingleTapConfirmed(MotionEvent event,org.osmdroid.views.MapView view){
      if(draft==null||drawing)return false;int[] nearest=null;double best=dp(24)*dp(24);android.graphics.Point pixel=new android.graphics.Point();
      for(int s=0;s<draft.segments.size();s++)for(int n=0;n<draft.segments.get(s).size();n++){Vertex point=draft.segments.get(s).get(n);view.getProjection().toPixels(new GeoPoint(point.latitude,point.longitude),pixel);double dx=pixel.x-event.getX(),dy=pixel.y-event.getY(),distance=dx*dx+dy*dy;if(distance<best){best=distance;nearest=new int[]{s,n};}}
      if(nearest==null)return false;activeSegment=nearest[0];vertexActions(nearest[0],nearest[1]);return true;
    }
  };
  public DrawingController(Activity activity,FrameLayout host,MapWorkspace map,Consumer<MapItem> save) {
    this.activity=activity;this.host=host;this.map=map;this.save=save;
    layoutReady=map.view.isLayoutOccurred();
    if(!layoutReady)map.view.addOnFirstLayoutListener((v,l,t,r,b)->layoutReady=true);
  }
  public void updateUnits(){if(active())render();}
  public boolean active(){return draft!=null;}
  public void startConfigured(MapItem properties,GeoPoint initial) {
    if(active())return;
    start(properties,properties.kind,properties.parent,null);
    propertiesPrepared=true;
    if(initial!=null)add(initial);
  }
  public void start(MapItem existing,String kind,long parent,GeoPoint initial) {
    if(active()){Toast.makeText(activity,"Сначала сохраните или отмените рисунок",Toast.LENGTH_SHORT).show();return;}
    propertiesPrepared=false;
    MapItem d=new MapItem();d.kind=kind;d.parent=parent;d.name="";d.visible=true;d.opacity=1;d.color=0xff3f6db5;
    if(existing!=null) {
      d.attachments.addAll(existing.attachments);d.created=existing.created;d.updated=existing.updated;d.position=existing.position;d.id=existing.id;d.kind=existing.kind;d.parent=existing.parent;d.name=existing.name;d.description=existing.description;
      d.visible=existing.visible;d.opacity=existing.opacity;d.color=existing.color;d.icon=existing.icon;d.appearance=existing.appearance.copy();
      d.segments.addAll(Geometry.decode(Geometry.encode(existing.segments)));
    } else {d.segments.add(new ArrayList<>());if(initial!=null)d.segments.get(0).add(new Vertex(initial.getLatitude(),initial.getLongitude()));}
    if(d.segments.isEmpty())d.segments.add(new ArrayList<>());
    draft=d;activeSegment=0;drawing=false;resumeSegment=false;showControls();render();
  }
  private int dp(int n){return Math.round(n*activity.getResources().getDisplayMetrics().density);}
  private void showControls() {
    controls=new EditorPanel(activity,host,"drawingControls","Создание метки",this::search,this::options,this::finish);
    controls.dockMap();
    controls.closeAction(ru.warriorrus.app.R.drawable.ui_check,"Сохранить");
    if(!"route".equals(draft.kind))drawButton=controls.action("Начертить","Рисовать линию",this::toggleDrawing);
    controls.action("Путевая точка","+ Точка",()->add((GeoPoint)map.view.getMapCenter()));
    controls.action("Удалить","Назад",this::removeLast);
    statistics=new GeometryStatisticsView(activity,draft);statistics.profile.onSelection(sample->inspect(sample.vertex));controls.statisticsContent(statistics);
    controls.show();updateDrawButton();
  }
  private void options(){
    pauseDrawing();
    new AlertDialog.Builder(activity).setTitle("Редактор метки")
        .setItems(new String[]{"Вершины","Контуры / сегменты","Обратить направление","Свойства","Отменить рисование"},(d,n)->{
          if(n==0)vertices();else if(n==1)segments();
          else if(n==2){Collections.reverse(draft.segments.get(activeSegment));render();}
          else if(n==3)properties();else confirmCancel();
        }).setNegativeButton("Закрыть",null).show();
  }
  private void properties(){
    if(!active())return;final MapItem edited=draft;
    try(ObjectStore store=new ObjectStore(activity)){
      ru.warriorrus.app.GeometryPropertiesDialog.show(activity,edited,store.all(),value->{
        if(draft!=edited)return;
        draft.name=value.name;draft.parent=value.parent;draft.color=value.color;
        draft.description=value.description;draft.visible=value.visible;draft.opacity=value.opacity;
        draft.appearance=value.appearance.copy();propertiesPrepared=true;render();
      });
    }
  }
  private void search(){
    EditText input=new EditText(activity);input.setHint("Широта, долгота / UTM / MGRS / EPSG:код E N");
    AlertDialog dialog=new AlertDialog.Builder(activity).setTitle("Поиск местоположения").setView(input).setPositiveButton("Показать",null).setNegativeButton("Отмена",null).create();
    dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{try{Vertex point=Coordinates.parse(input.getText().toString());pauseDrawing();map.view.getController().setCenter(new GeoPoint(point.latitude,point.longitude));dialog.dismiss();}catch(Exception error){input.setError(error.getMessage());}}));dialog.show();
  }
  public boolean isDrawing(){return drawing;}
  public void inspect(Vertex vertex){pauseDrawing();map.view.getController().setCenter(new GeoPoint(vertex.latitude,vertex.longitude));}
  private void pauseDrawing(){if(drawing){drawing=false;resumeSegment=!"area".equals(draft.kind);updateDrawButton();map.view.invalidate();}}
  public void toggleDrawing(){
    if(!active()||"route".equals(draft.kind))return;
    if(drawing){pauseDrawing();return;}
    if(resumeSegment&&draft.segments.get(activeSegment).size()>1){
      draft.segments.add(new ArrayList<>());activeSegment=draft.segments.size()-1;
    }
    resumeSegment=false;drawing=true;updateDrawButton();appendCenter(false);
  }
  private void updateDrawButton(){if(drawButton!=null){drawButton.setText("Начертить");ru.warriorrus.app.ReferenceAssets.applyNamed(drawButton,drawing?"atk_toolkit_widget_check_on_24":"atk_toolkit_widget_check_off_24",16,true);drawButton.setContentDescription(drawing?"Приостановить рисование":"Рисовать линию");}}
  /** Only map panning feeds the explicit draw mode; zoom and redraw do not add vertices. */
  public void onMapMoved(){if(layoutReady&&active()&&drawing)appendCenter(true);}
  private void appendCenter(boolean sampled){
    List<Vertex> line=draft.segments.get(activeSegment);Vertex next=new Vertex(map.view.getMapCenter().getLatitude(),map.view.getMapCenter().getLongitude());
    if(!line.isEmpty()){
      Vertex last=line.get(line.size()-1);double distance=Geometry.distance(last,next);
      // A screen-space threshold bounds event density while keeping detail at every zoom.
      double resolution=org.osmdroid.util.TileSystem.GroundResolution(next.latitude,map.view.getZoomLevelDouble());
      double threshold=Math.max(.05,resolution*dp(sampled?3:2));
      if(distance<threshold)return;
    }
    if(Geometry.count(draft)>=100000){pauseDrawing();Toast.makeText(activity,"Достигнут предел: 100000 точек",Toast.LENGTH_LONG).show();return;}
    line.add(next);render();
  }
  private void removeLast(){pauseDrawing();List<Vertex> line=draft.segments.get(activeSegment);if(!line.isEmpty())line.remove(line.size()-1);if(line.isEmpty()&&activeSegment>0){draft.segments.remove(activeSegment);activeSegment=Math.min(activeSegment-1,draft.segments.size()-1);}render();}
  public void add(GeoPoint point) {
    if(draft==null)return;if(Geometry.count(draft)>=100000){Toast.makeText(activity,"Слишком много точек",Toast.LENGTH_LONG).show();return;}draft.segments.get(activeSegment).add(new Vertex(point.getLatitude(),point.getLongitude()));render();
  }
  private void segments() {
    if(draft==null)return;pauseDrawing();List<String> names=new ArrayList<>();
    for(int n=0;n<draft.segments.size();n++)names.add((n==activeSegment?"✓ ":"")+(n==0?"Основной контур":"Контур / сегмент "+(n+1)));
    if(!"route".equals(draft.kind))names.add("area".equals(draft.kind)?"Добавить внутренний контур (отверстие)":"Добавить сегмент с разрывом");
    if(draft.segments.size()>1)names.add("Удалить активный внутренний контур / сегмент");
    new AlertDialog.Builder(activity).setTitle("Контуры").setItems(names.toArray(new String[0]),(d,n)->{
      if(n<draft.segments.size())activeSegment=n;
      else if(n==draft.segments.size()&&!"route".equals(draft.kind)){draft.segments.add(new ArrayList<>());activeSegment=draft.segments.size()-1;add((GeoPoint)map.view.getMapCenter());}
      else if(activeSegment>0){draft.segments.remove(activeSegment);activeSegment=0;}
      render();
    }).setNegativeButton("Закрыть",null).show();
  }
  public void vertices() {
    if(draft==null)return;
    List<String> labels=new ArrayList<>();List<int[]> indices=new ArrayList<>();
    for(int s=0;s<draft.segments.size();s++)for(int n=0;n<draft.segments.get(s).size();n++) {
      Vertex v=draft.segments.get(s).get(n);labels.add(String.format(Locale.ROOT,"%d.%d · %.6f, %.6f",s+1,n+1,v.latitude,v.longitude));indices.add(new int[]{s,n});
    }
    new AlertDialog.Builder(activity).setTitle("Вершины · "+draft.typeName()).setItems(labels.toArray(new String[0]),(d,n)->vertexActions(indices.get(n)[0],indices.get(n)[1])).setNegativeButton("Закрыть",null).show();
  }
  private void vertexActions(int segment,int index) {
    pauseDrawing();
    new AlertDialog.Builder(activity).setTitle("Вершина "+(index+1)).setItems(new String[]{"Изменить координаты","На карте","Вставить центр после","Удалить","Раньше","Позже","Обратить порядок контура","Перенести в центр карты","Разделить здесь"},(d,n)->{
      List<Vertex> line=draft.segments.get(segment);Vertex old=line.get(index);
      switch(n) {
        case 0:
          LinearLayout form=new LinearLayout(activity);form.setOrientation(LinearLayout.VERTICAL);EditText lat=new EditText(activity),lon=new EditText(activity);
          lat.setText(""+old.latitude);lat.setHint("Широта");lon.setText(""+old.longitude);lon.setHint("Долгота");form.addView(lat);form.addView(lon);EditText name=new EditText(activity),description=new EditText(activity);name.setHint("Название вершины");name.setText(old.name);description.setHint("Описание");description.setText(old.description);form.addView(name);form.addView(description);
          AlertDialog edit=new AlertDialog.Builder(activity).setTitle("Координаты вершины").setView(form).setPositiveButton("Сохранить",null).setNegativeButton("Отмена",null).create();
          edit.setOnShowListener(v->edit.getButton(-1).setOnClickListener(w->{try{line.set(index,new Vertex(Double.parseDouble(lat.getText().toString()),Double.parseDouble(lon.getText().toString()),old.elevation,old.time,name.getText().toString(),description.getText().toString()));render();edit.dismiss();}catch(Exception e){lat.setError("Неверные координаты");}}));edit.show();break;
        case 1:map.view.getController().setCenter(new GeoPoint(old.latitude,old.longitude));break;
        case 2:line.add(index+1,new Vertex(map.view.getMapCenter().getLatitude(),map.view.getMapCenter().getLongitude()));break;
        case 3:line.remove(index);break;
        case 4:if(index>0)Collections.swap(line,index,index-1);break;
        case 5:if(index+1<line.size())Collections.swap(line,index,index+1);break;
        case 6:Collections.reverse(line);break;
        case 7:line.set(index,new Vertex(map.view.getMapCenter().getLatitude(),map.view.getMapCenter().getLongitude(),old.elevation,old.time,old.name,old.description));break;
        case 8:try{Geometry.split(draft,segment,index);activeSegment=segment+1;}catch(IllegalArgumentException error){Toast.makeText(activity,error.getMessage(),Toast.LENGTH_LONG).show();}break;
      }render();
    }).setNegativeButton("Закрыть",null).show();
  }
  private void finish() {
    pauseDrawing();
    try{Geometry.validate(draft);}catch(Exception e){Toast.makeText(activity,e.getMessage(),Toast.LENGTH_LONG).show();return;}
    if(propertiesPrepared){
      if(draft.name==null||draft.name.trim().isEmpty())draft.name=draft.typeName()+" "+new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.ROOT).format(new Date());
      Vertex first=draft.segments.get(0).get(0);draft.latitude=first.latitude;draft.longitude=first.longitude;
      try{save.accept(draft);cancel();}catch(Exception error){new AlertDialog.Builder(activity).setTitle("Сохранение").setMessage(error.getMessage()).setPositiveButton("ОК",null).show();}
      return;
    }
    LinearLayout form=new LinearLayout(activity);form.setOrientation(LinearLayout.VERTICAL);EditText name=new EditText(activity),note=new EditText(activity);
    name.setHint("Название");name.setText(draft.name);note.setHint("Описание");note.setText(draft.description);form.addView(name);form.addView(note);
    AlertDialog dialog=new AlertDialog.Builder(activity).setTitle("Сохранить: "+draft.typeName()).setView(form).setPositiveButton("Сохранить",null).setNegativeButton("Назад к рисованию",null).create();
    dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{
      if(name.getText().toString().trim().isEmpty()){name.setError("Введите название");return;}
      draft.name=name.getText().toString().trim();draft.description=note.getText().toString();Vertex p=draft.segments.get(0).get(0);draft.latitude=p.latitude;draft.longitude=p.longitude;
      try{save.accept(draft);dialog.dismiss();cancel();}catch(Exception e){name.setError(e.getMessage());}
    }));dialog.show();
  }
  public void confirmCancel() {
    if(!active())return;new AlertDialog.Builder(activity).setTitle("Отменить рисование?").setMessage("Несохранённые изменения будут удалены.").setPositiveButton("Отменить рисование",(d,w)->cancel()).setNegativeButton("Продолжить",null).show();
  }
  public void cancel(){for(Overlay o:preview)map.view.getOverlays().remove(o);preview.clear();map.view.getOverlays().remove(vertexOverlay);if(controls!=null)host.removeView(controls);ru.warriorrus.app.EditorViewport.update(host);controls=null;statistics=null;draft=null;drawing=false;drawButton=null;map.view.invalidate();}
  private void render() {
    map.view.getOverlays().remove(vertexOverlay);
    for(Overlay o:preview)map.view.getOverlays().remove(o);preview.clear();
    controls.title(draft.name==null||draft.name.isEmpty()?"Создание: "+draft.typeName():draft.name);
    statistics.update(draft);
    if("area".equals(draft.kind)&&!draft.segments.isEmpty()&&draft.segments.get(0).size()>2){
      Polygon fill=new Polygon(map.view);List<GeoPoint> outer=new ArrayList<>();
      for(Vertex v:draft.segments.get(0))outer.add(new GeoPoint(v.latitude,v.longitude));fill.setPoints(outer);
      List<List<GeoPoint>> holes=new ArrayList<>();
      for(int s=1;s<draft.segments.size();s++)if(draft.segments.get(s).size()>2){List<GeoPoint> hole=new ArrayList<>();for(Vertex v:draft.segments.get(s))hole.add(new GeoPoint(v.latitude,v.longitude));holes.add(hole);}
      fill.setHoles(holes);fill.getOutlinePaint().setColor(Color.TRANSPARENT);
      fill.getFillPaint().setColor(ru.warriorrus.app.map.ObjectStyleRenderer.fill(draft,draft.opacity));fill.setOnClickListener((p,m,at)->false);
      preview.add(fill);map.view.getOverlays().add(fill);
    }
    boolean dynamic=!"area".equals(draft.kind)&&!"solid".equals(draft.appearance.colorMode);
    for(List<Vertex> segment:draft.segments) {
      List<GeoPoint> pts=new ArrayList<>();for(Vertex v:segment)pts.add(new GeoPoint(v.latitude,v.longitude));
      if("area".equals(draft.kind)&&pts.size()>2)pts.add(pts.get(0));
      Polyline line=new Polyline(map.view);line.setPoints(pts);ru.warriorrus.app.map.ObjectStyleRenderer.stroke(line.getOutlinePaint(),draft,draft.opacity,map.lineWidth,activity.getResources().getDisplayMetrics().density);if(dynamic)line.getOutlinePaint().setColor(Color.TRANSPARENT);line.setOnClickListener((l,m,p)->false);preview.add(line);map.view.getOverlays().add(line);
    }if(dynamic){ru.warriorrus.app.map.DynamicLineOverlay colors=new ru.warriorrus.app.map.DynamicLineOverlay(draft,draft.opacity,map.lineWidth);preview.add(colors);map.view.getOverlays().add(colors);}
    map.view.getOverlays().add(vertexOverlay);map.view.invalidate();
  }
  public void saveState(Bundle state) {
    state.putBoolean("draftPropertiesPrepared",propertiesPrepared);
    if(active()&&statistics!=null)statistics.profile.save(state,"draftProfile");
    if(active()){state.putString("draftAppearance",draft.appearance.encode());state.putString("draftIcon",draft.icon);state.putBoolean("draftDrawing",drawing);state.putBoolean("draftResumeSegment",resumeSegment);state.putBoolean("draftStatistics",controls.expanded());}
    if(!active())return;state.putInt("draftActive",activeSegment);state.putString("draftMedia",ObjectJson.attachments(draft.attachments));state.putLong("draftCreated",draft.created);state.putString("draftGeometry",Geometry.encode(draft.segments));state.putString("draftKind",draft.kind);state.putString("draftName",draft.name);state.putString("draftDescription",draft.description);state.putInt("draftPosition",draft.position);state.putLong("draftId",draft.id);state.putLong("draftParent",draft.parent);state.putInt("draftColor",draft.color);state.putBoolean("draftVisible",draft.visible);state.putFloat("draftOpacity",draft.opacity);
  }
  public void restore(Bundle state) {
    if(state==null||!state.containsKey("draftGeometry"))return;MapItem d=new MapItem();d.attachments.addAll(ObjectJson.attachments(state.getString("draftMedia","[]")));d.created=state.getLong("draftCreated");d.kind=state.getString("draftKind");d.name=state.getString("draftName");d.description=state.getString("draftDescription");d.position=state.getInt("draftPosition");d.id=state.getLong("draftId");d.parent=state.getLong("draftParent");d.color=state.getInt("draftColor");d.visible=state.getBoolean("draftVisible");d.opacity=state.getFloat("draftOpacity");d.icon=state.getString("draftIcon","builtin:pin");d.appearance=ObjectAppearance.decode(state.getString("draftAppearance","{}"));d.segments.addAll(Geometry.decode(state.getString("draftGeometry")));start(d,d.kind,d.parent,null);propertiesPrepared=state.getBoolean("draftPropertiesPrepared",false);activeSegment=Math.max(0,Math.min(state.getInt("draftActive",0),draft.segments.size()-1));drawing=state.getBoolean("draftDrawing",false);resumeSegment=state.getBoolean("draftResumeSegment",false);controls.expanded(state.getBoolean("draftStatistics",false));updateDrawButton();render();statistics.profile.restore(state,"draftProfile");
  }
}
