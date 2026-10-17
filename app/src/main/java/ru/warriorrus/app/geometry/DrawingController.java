package ru.warriorrus.app.geometry;

import android.app.*;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import java.util.*;
import java.util.function.Consumer;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.overlay.*;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.map.MapWorkspace;

/** Explicit manual drawing; the red focus is the only source for added coordinates. */
public final class DrawingController {
  private final Activity activity;
  private final FrameLayout host;
  private final MapWorkspace map;
  private final Consumer<MapItem> save;
  private final List<Overlay> preview=new ArrayList<>();
  private LinearLayout controls;
  private TextView caption;
  private MapItem draft;
  private int activeSegment;
  public DrawingController(Activity activity,FrameLayout host,MapWorkspace map,Consumer<MapItem> save) {
    this.activity=activity;this.host=host;this.map=map;this.save=save;
  }
  public void updateUnits(){if(active())render();}
  public boolean active(){return draft!=null;}
  public void start(MapItem existing,String kind,long parent,GeoPoint initial) {
    if(active()){Toast.makeText(activity,"Сначала сохраните или отмените рисунок",Toast.LENGTH_SHORT).show();return;}
    MapItem d=new MapItem();d.kind=kind;d.parent=parent;d.name="";d.visible=true;d.opacity=1;d.color=0xff3f6db5;
    if(existing!=null) {
      d.attachments.addAll(existing.attachments);d.created=existing.created;d.updated=existing.updated;d.position=existing.position;d.id=existing.id;d.kind=existing.kind;d.parent=existing.parent;d.name=existing.name;d.description=existing.description;
      d.visible=existing.visible;d.opacity=existing.opacity;d.color=existing.color;d.icon=existing.icon;
      d.segments.addAll(Geometry.decode(Geometry.encode(existing.segments)));
    } else {d.segments.add(new ArrayList<>());if(initial!=null)d.segments.get(0).add(new Vertex(initial.getLatitude(),initial.getLongitude()));}
    draft=d;activeSegment=0;showControls();render();
  }
  private int dp(int n){return Math.round(n*activity.getResources().getDisplayMetrics().density);}
  private Button button(String text,Runnable action) {
    Button b=new Button(activity);b.setText(text);b.setTextSize(12);b.setTextColor(0xffd9edf7);b.setMinHeight(dp(48));
    GradientDrawable background=new GradientDrawable();background.setColor(0xff12344c);background.setCornerRadius(dp(6));background.setStroke(dp(1),0xff326b92);b.setBackground(background);
    b.setContentDescription(text);b.setOnClickListener(v->action.run());return b;
  }
  private void showControls() {
    controls=new LinearLayout(activity);controls.setOrientation(LinearLayout.VERTICAL);controls.setTag("drawingControls");
    GradientDrawable bg=new GradientDrawable();bg.setColor(0xf510293b);bg.setCornerRadius(dp(12));controls.setBackground(bg);
    caption=new TextView(activity);caption.setTextColor(Color.WHITE);caption.setTextSize(12);caption.setPadding(dp(8),dp(4),dp(8),0);controls.addView(caption);
    HorizontalScrollView scroll=new HorizontalScrollView(activity);LinearLayout row=new LinearLayout(activity);scroll.addView(row);controls.addView(scroll);
    row.addView(button("+ Точка",()->add((GeoPoint)map.view.getMapCenter())));
    row.addView(button("Назад",()->{List<Vertex> line=draft.segments.get(activeSegment);if(!line.isEmpty())line.remove(line.size()-1);render();}));
    row.addView(button("Вершины",this::vertices));row.addView(button("Контуры",this::segments));row.addView(button("Сохранить",this::finish));row.addView(button("Отмена",this::confirmCancel));
    FrameLayout.LayoutParams p=new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM|Gravity.START);p.setMargins(dp(8),0,dp(8),dp(64));host.addView(controls,p);
  }
  public void add(GeoPoint point) {
    if(draft==null)return;draft.segments.get(activeSegment).add(new Vertex(point.getLatitude(),point.getLongitude()));render();
  }
  private void segments() {
    if(draft==null)return;List<String> names=new ArrayList<>();
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
    new AlertDialog.Builder(activity).setTitle("Вершина "+(index+1)).setItems(new String[]{"Изменить координаты","На карте","Вставить центр после","Удалить","Раньше","Позже","Обратить порядок контура"},(d,n)->{
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
      }render();
    }).setNegativeButton("Закрыть",null).show();
  }
  private void finish() {
    try{Geometry.validate(draft);}catch(Exception e){Toast.makeText(activity,e.getMessage(),Toast.LENGTH_LONG).show();return;}
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
  public void cancel(){for(Overlay o:preview)map.view.getOverlays().remove(o);preview.clear();if(controls!=null)host.removeView(controls);controls=null;draft=null;map.view.invalidate();}
  private void render() {
    for(Overlay o:preview)map.view.getOverlays().remove(o);preview.clear();
    caption.setText(draft.typeName()+" · контур "+(activeSegment+1)+" · точек: "+Geometry.count(draft)+" · "+ru.warriorrus.app.settings.DisplayUnits.load(activity).distance(Geometry.length(draft)));
    for(List<Vertex> segment:draft.segments) {
      List<GeoPoint> pts=new ArrayList<>();for(Vertex v:segment)pts.add(new GeoPoint(v.latitude,v.longitude));
      if("area".equals(draft.kind)&&pts.size()>2)pts.add(pts.get(0));
      Polyline line=new Polyline(map.view);line.setPoints(pts);line.getOutlinePaint().setColor(0xff37c1ff);line.getOutlinePaint().setStrokeWidth(dp(3));line.setOnClickListener((l,m,p)->false);preview.add(line);map.view.getOverlays().add(line);
    }map.view.invalidate();
  }
  public void saveState(Bundle state) {
    if(!active())return;state.putInt("draftActive",activeSegment);state.putString("draftMedia",ObjectJson.attachments(draft.attachments));state.putLong("draftCreated",draft.created);state.putString("draftGeometry",Geometry.encode(draft.segments));state.putString("draftKind",draft.kind);state.putString("draftName",draft.name);state.putString("draftDescription",draft.description);state.putInt("draftPosition",draft.position);state.putLong("draftId",draft.id);state.putLong("draftParent",draft.parent);state.putInt("draftColor",draft.color);state.putBoolean("draftVisible",draft.visible);state.putFloat("draftOpacity",draft.opacity);
  }
  public void restore(Bundle state) {
    if(state==null||!state.containsKey("draftGeometry"))return;MapItem d=new MapItem();d.attachments.addAll(ObjectJson.attachments(state.getString("draftMedia","[]")));d.created=state.getLong("draftCreated");d.kind=state.getString("draftKind");d.name=state.getString("draftName");d.description=state.getString("draftDescription");d.position=state.getInt("draftPosition");d.id=state.getLong("draftId");d.parent=state.getLong("draftParent");d.color=state.getInt("draftColor");d.visible=state.getBoolean("draftVisible");d.opacity=state.getFloat("draftOpacity");d.segments.addAll(Geometry.decode(state.getString("draftGeometry")));start(d,d.kind,d.parent,null);activeSegment=Math.min(state.getInt("draftActive",0),draft.segments.size()-1);render();
  }
}
