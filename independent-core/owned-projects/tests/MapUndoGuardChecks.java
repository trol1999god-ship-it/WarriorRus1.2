package org.rabochaya.maptests;
import android.app.*;import android.content.*;import android.view.*;import android.widget.*;import java.util.*;
/** Same-process history ordering and context isolation with real Activity rotations. */
final class MapUndoGuardChecks {
 final MapUndoRotationChecks u;final MapAndroidChecks m;final MapVertexConfirmationChecks c;final GeometryConfirmationChecks g;final ManagerVisualChecks v;final ManagerRotationChecks r;
 MapUndoGuardChecks(MapUndoRotationChecks u){this.u=u;m=u.m;c=u.c;g=u.g;v=u.v;r=u.r;}
 void open(long id,boolean multi)throws Exception{
  v.finish();m.getUiAutomation().setRotation(UiAutomation.ROTATION_FREEZE_0);
  m.activity=m.startActivitySync(new Intent().setClassName(m.getTargetContext().getPackageName(),"org.rabochaya.projects.GeometryEditorActivity").putExtra("project",id).putExtra("feature","point").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));c.p.rotate(UiAutomation.ROTATION_FREEZE_0);
  if(multi){m.clickDescription("Выбор геометрии и контура");m.click("Геометрия 0.1 · LineString");m.geometryReady();}
  m.inputs(g.main);m.click("Редактировать на карте");m.mapEditorReady();
 }
 void rotate(int direction)throws Exception{Activity old=m.activity;c.p.rotate(direction);m.check(old!=m.activity&&old.isDestroyed(),"Undo guard actually destroys and recreates Activity");if(m.editorField("mapCanvas")!=null){c.settledMapLayout();m.check(c.layout().getBoolean("interactiveThreshold"),"Undo guard retains original map80px interaction threshold");}}
 void cancel()throws Exception{String raw=m.editorText();int count=u.count();m.clickDescription("Удалить выбранную вершину");m.check(c.present(),"Undo guard explicit delete confirmation");m.click("Отмена");m.check(m.editorText().equals(raw)&&u.count()==count,"Undo guard Cancel never acts or consumes history");}
 void multiple(Object store)throws Exception{
  long id=g.fixture(store,false);try{Object doc=r.load(store,id);byte[] xml=r.xml(doc);Map<String,byte[]> assets=new HashMap<>(m.assets(doc));open(id,false);String token=(String)m.editorField("expected"),process=(String)m.editorField("VERTEX_SESSION");String[] raw=new String[4];raw[0]=m.editorText();
   for(int i=0;i<3;i++){m.dragVertex(1,i==1?-10:14,i==1?-6:8,false);raw[i+1]=m.editorText();m.check(!raw[i+1].equals(raw[i])&&u.count()==i+1,"each real drag adds one independently undoable step");g.unchanged(store,id,xml,assets);}
   double[] viewport=((double[])m.call(m.editorField("mapCanvas"),"viewport",new Class[]{})).clone();cancel();
   for(int direction:new int[]{UiAutomation.ROTATION_FREEZE_90,UiAutomation.ROTATION_FREEZE_0}){rotate(direction);m.check((Long)m.editorField("project")==id&&"point".equals(m.editorField("featureId"))&&process.equals(m.editorField("VERTEX_SESSION"))&&g.key().equals("0")&&token.equals(m.editorField("expected"))&&m.editorText().equals(raw[3])&&u.count()==3&&(Integer)m.call(m.vertexState(),"selected",new Class[]{})==1,"all three original steps/context/raw/selection survive actual rotations without action");double[] current=(double[])m.call(m.editorField("mapCanvas"),"viewport",new Class[]{});for(int axis=0;axis<3;axis++)m.check(Math.abs(current[axis]-viewport[axis])<1e-9,"multi Undo keeps original viewport");g.unchanged(store,id,xml,assets);}
   u.snapshot("multi-before-undo");for(int i=2;i>=0;i--){m.clickDescription("Отменить действие с вершиной");m.check(m.editorText().equals(raw[i])&&u.count()==i&&(Integer)m.call(m.vertexState(),"selected",new Class[]{})==1,"real explicit Undo restores preceding step in exact LIFO order");g.unchanged(store,id,xml,assets);}u.snapshot("multi-after-undo");v.emit("MAP_UNDO_MULTIPLE PASS");
  }finally{v.finish();m.call(store,"remove",new Class[]{long.class},id);}
 }
 void reject(Object store,String kind)throws Exception{
  long id=g.fixture(store,false);try{Object doc=r.load(store,id);Map<String,byte[]> assets=new HashMap<>(m.assets(doc));open(id,false);m.dragVertex(1,14,8,false);String raw=m.editorText(),token=(String)m.editorField("expected"),process=(String)m.editorField("VERTEX_SESSION");m.check(u.count()==1,"rejection fixture has original history");
   if(kind.equals("stale-before"))g.changed(store,id,false);rotate(UiAutomation.ROTATION_FREEZE_90);
   if(!kind.equals("stale-before"))m.check(u.count()==1&&u.available(),"valid first recreation preserves history before later conflict");
   if(kind.equals("stale-after"))g.changed(store,id,false);
   if(kind.equals("main-changed")){raw+="\n23.5 13.5 33.5";final String newer=raw;final EditText input=(EditText)m.editorField("input");m.runOnMainSync(()->input.setText(newer));}
   byte[] current=r.xml(r.load(store,id));rotate(UiAutomation.ROTATION_FREEZE_0);
   m.check(!u.available()&&u.count()==0&&m.editorText().equals(raw)&&(Long)m.editorField("project")==id&&"point".equals(m.editorField("featureId"))&&process.equals(m.editorField("VERTEX_SESSION"))&&g.key().equals("0")&&token.equals(m.editorField("expected"))&&(Integer)m.call(m.vertexState(),"selected",new Class[]{})==1,"stale/newer main keeps its own exact raw/context/selection and rejects old Undo");g.unchanged(store,id,current,assets);cancel();g.unchanged(store,id,current,assets);
   if(!kind.equals("main-changed")){m.click("Сохранить");m.geometryReady();m.waitText("Не удалось сохранить");m.check(m.editorText().equals(raw)&&!u.available(),"stale explicit Save cannot replace current KML or rebind Undo");g.unchanged(store,id,current,assets);}
   u.snapshot(kind);v.emit("MAP_UNDO_REJECT "+kind+" PASS");
  }finally{v.finish();m.call(store,"remove",new Class[]{long.class},id);}
 }
 void foreign(Object store,boolean project)throws Exception{
  long id=g.fixture(store,false),other=-1;try{Object doc=r.load(store,id);byte[] xml=r.xml(doc);Map<String,byte[]> assets=new HashMap<>(m.assets(doc));long target=id;if(project){Object copy=r.parse(xml);m.assets(copy).putAll(assets);other=(Long)m.call(store,"insert",new Class[]{m.codec,String.class},copy,"QA_UNDO_FOREIGN");target=other;}
   open(id,false);m.dragVertex(1,14,8,false);m.check(u.count()==1,"foreign fixture has history");final long pid=target;final String feature=project?"point":"other";m.runOnMainSync(()->m.activity.setIntent(new Intent(m.activity.getIntent()).putExtra("project",pid).putExtra("feature",feature)));
   for(int direction:new int[]{UiAutomation.ROTATION_FREEZE_90,UiAutomation.ROTATION_FREEZE_0}){rotate(direction);m.check((Long)m.editorField("project")==target&&feature.equals(m.editorField("featureId"))&&m.editorField("mapState")==null&&m.editorField("mapCanvas")==null&&!(Boolean)m.editorField("mapMode")&&m.editorText().equals(project?"20 10 30\n21 11 31\n22 12 32":"22 12 32"),"foreign sameXML owner/feature rejects old Undo/map/raw on both actual recreations");g.unchanged(store,id,xml,assets);g.unchanged(store,target,xml,assets);}
   u.snapshot(project?"foreign-project":"foreign-feature");v.emit("MAP_UNDO_FOREIGN project="+project+" PASS");
  }finally{v.finish();m.call(store,"remove",new Class[]{long.class},id);if(other>0)m.call(store,"remove",new Class[]{long.class},other);}
 }
 void key(Object store)throws Exception{
  long id=new VertexInsertionChecks(m).fixture(store,false);try{Object doc=r.load(store,id);byte[] xml=r.xml(doc);Map<String,byte[]> assets=new HashMap<>(m.assets(doc));open(id,true);m.dragVertex(1,14,8,false);m.check(u.count()==1&&g.key().equals("0.1"),"nonzero part has its own original Undo");m.clickDescription("Выбор геометрии и контура");m.click("Геометрия 0.0 · Point");m.click("Сменить контур");m.geometryReady();m.mapEditorReady();
   for(int direction:new int[]{UiAutomation.ROTATION_FREEZE_90,UiAutomation.ROTATION_FREEZE_0}){rotate(direction);m.check(g.key().equals("0.0")&&m.editorText().equals("8 9 7")&&!u.available()&&u.count()==0&&(Integer)m.call(m.vertexState(),"selected",new Class[]{})==-1,"explicit different part never inherits old history/raw/selection");g.unchanged(store,id,xml,assets);}u.snapshot("foreign-key");v.emit("MAP_UNDO_FOREIGN_KEY PASS");
  }finally{v.finish();m.call(store,"remove",new Class[]{long.class},id);}
 }
 void run()throws Exception{int requests=m.requests.get();Object store=m.storeClass.getConstructor(Context.class).newInstance(m.getTargetContext());try{multiple(store);for(String kind:new String[]{"stale-before","stale-after","main-changed"})reject(store,kind);foreign(store,true);foreign(store,false);key(store);m.check(m.requests.get()==requests,"all history guards stay local");}finally{v.finish();m.getUiAutomation().setRotation(UiAutomation.ROTATION_UNFREEZE);m.call(store,"close",new Class[]{});}}
}
