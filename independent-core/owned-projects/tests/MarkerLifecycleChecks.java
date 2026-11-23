package org.rabochaya.maptests;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.net.Uri;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.List;
import org.json.JSONObject;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

/** UI and SQLite/KMZ checks for one marker, across a real runner force-stop. */
final class MarkerLifecycleChecks {
 private static final String PROJECT="QA_LIFECYCLE_PROJECT";
 private static final String INITIAL="QA_LIFECYCLE_DRAFT";
 private static final String NAME="QA_LIFECYCLE_EDITED";
 private static final String NOTE="QA_LIFECYCLE_NOTE";
 private static final String PHOTO="lifecycle-photo.png";
 private static final String COORDINATE="37.625,55.725,193.0";
 private static final String EMPTY="<kml xmlns='http://www.opengis.net/kml/2.2'><Document/></kml>";
 private final MapAndroidChecks test;
 private final Context context;

 MarkerLifecycleChecks(MapAndroidChecks test){
  this.test=test;
  context=test.getTargetContext();
 }

 private Object store()throws Exception{return test.storeClass.getConstructor(Context.class).newInstance(context);}
 private Object load(Object store,long project)throws Exception{return test.call(store,"load",new Class[]{long.class},project);}
 private SharedPreferences state(){return context.getSharedPreferences("qa_marker_lifecycle",0);}
 private Object parse(String xml)throws Exception{return test.codec.getMethod("parse",byte[].class).invoke(null,(Object)xml.getBytes(StandardCharsets.UTF_8));}
 private long insert(Object store,Object doc,String title)throws Exception{
  return (Long)test.call(store,"insert",new Class[]{test.codec,String.class},doc,title);
 }
 private void erase(Object store,long id)throws Exception{
  test.call(store,"remove",new Class[]{long.class},id);
  test.staticCall("LocalMapActivity","cleanupDeletedProject",new Class[]{Context.class,long.class},context,id);
 }
 private String text(Element node,String tag)throws Exception{
  return (String)test.codec.getMethod("text",Element.class,String.class).invoke(null,node,tag);
 }
 private Element marker(Object doc,String name)throws Exception{
  Element root=(Element)test.call(doc,"root",new Class[]{});
  NodeList children=root.getElementsByTagNameNS("*","Placemark");
  for(int i=0;i<children.getLength();i++){
   Element point=(Element)children.item(i);
   if(name.equals(text(point,"name")))return point;
  }
  throw new AssertionError("Marker missing: "+name);
 }
 private Activity map(long id)throws Exception{
  Activity activity=test.startActivitySync(new Intent().setClassName(context.getPackageName(),"org.rabochaya.projects.LocalMapActivity")
   .putExtra("project",id).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
  test.activity=activity;
  test.waitText("видимых объектов");
  test.stableMainMap();
  return activity;
 }
 private void card(String name)throws Exception{
  test.clickDescription("Метки");
  test.click("Поиск на карте");
  test.inputs(name);
  test.click("Найти");
  test.click(name);
  test.waitText("Координаты и контуры");
 }
 private Activity child(String className,String button,boolean icon)throws Exception{
  Instrumentation.ActivityMonitor monitor=test.addMonitor("org.rabochaya.projects."+className,null,false);
  try{
   if(icon)test.clickDescription(button);else test.click(button);
   Activity activity=test.waitForMonitorWithTimeout(monitor,30000);
   test.check(activity!=null,className+" reached from UI");
   test.activity=activity;
   return activity;
  }finally{test.removeMonitor(monitor);}
 }
 private void finish(Activity child,Activity parent)throws Exception{
  test.runOnMainSync(child::finish);
  test.waitForIdleSync();
  test.activity=parent;
  test.stableMainMap();
 }
 private static IntentFilter pickerFilter(String action)throws IntentFilter.MalformedMimeTypeException{
  IntentFilter filter=new IntentFilter(action);
  filter.addCategory(Intent.CATEGORY_OPENABLE);
  filter.addDataType("*/*");
  return filter;
 }

 private void picker(String action,Uri uri,String button)throws Exception{
  Instrumentation.ActivityMonitor monitor=test.addMonitor(pickerFilter(action),
   new Instrumentation.ActivityResult(Activity.RESULT_OK,new Intent().setData(uri)),true);
  try{
   test.click(button);
   test.check(monitor.getHits()==1,"requested system picker "+action+" for "+uri.getLastPathSegment());
  }finally{test.removeMonitor(monitor);}
 }
 private byte[] bytes(Uri uri)throws Exception{
  try(InputStream in=context.getContentResolver().openInputStream(uri);ByteArrayOutputStream out=new ByteArrayOutputStream()){
   byte[] buf=new byte[4096];
   for(int size;(size=in.read(buf))!=-1;)out.write(buf,0,size);
   return out.toByteArray();
  }
 }
 private String digest(byte[] bytes)throws Exception{
  StringBuilder hex=new StringBuilder();
  for(byte b:MessageDigest.getInstance("SHA-256").digest(bytes))hex.append(String.format(java.util.Locale.ROOT,"%02x",b&255));
  return hex.toString();
 }
 private JSONObject verify(Object doc)throws Exception{
  Element point=marker(doc,NAME);
  String id=point.getAttribute("id");
  test.check(COORDINATE.equals(test.kmlCoordinate(doc,id)),"readback preserves longitude, latitude and altitude");
  String note=(String)test.staticCall("MediaLinks","note",new Class[]{Element.class},point);
  test.check(NOTE.equals(note),"readback preserves edited description");
  NodeList hrefs=point.getElementsByTagNameNS("*","href");
  test.check(hrefs.getLength()==1,"readback preserves assigned icon reference");
  String icon=hrefs.item(0).getTextContent();
  String entry=(String)test.codec.getField("entry").get(doc);
  byte[] iconBytes=test.assets(doc).get(entry.substring(0,entry.lastIndexOf('/')+1)+icon);
  test.check(Arrays.equals(iconBytes,bytes(LifecycleFixtureProvider.SVG)),"readback preserves SVG bytes");
  Object photo=test.link(doc,id,PHOTO);
  String href=test.value(photo,"href");
  String path=(String)test.staticCall("MediaLinks","path",new Class[]{test.codec,String.class},doc,href);
  byte[] photoBytes=test.assets(doc).get(path);
  test.check(Arrays.equals(photoBytes,bytes(LifecycleFixtureProvider.PHOTO)),"readback preserves photo bytes");
  test.check(test.links(doc,id).size()==1&&test.assets(doc).size()==2,"exactly one attachment and one icon");
  return new JSONObject().put("name",NAME).put("coordinate",COORDINATE).put("note",note).put("svg_sha256",digest(iconBytes))
   .put("photo_sha256",digest(photoBytes)).put("photo_name",PHOTO);
 }
 private void writeEvidence(String name,byte[] bytes)throws Exception{
  try(OutputStream out=new FileOutputStream(new File(context.getExternalFilesDir(null),name))){out.write(bytes);}
 }

 private void preservedAssets(Object store)throws Exception{
  String orphan="attachments/rk-00112233-4455-6677-8899-aabbccddeeff.png";
  Object doc=parse("<kml xmlns='http://www.opengis.net/kml/2.2'><Document><Placemark id='probe'><name>Original</name>"
   +"<Point><coordinates>1,2,3</coordinates></Point></Placemark></Document></kml>");
  byte[] original={3,2,1};
  test.assets(doc).put(orphan,original);
  long id=insert(store,doc,"QA_ATTACH_TRANSACTION");
  try{
   Object latest=load(store,id);
   test.staticCall("FeatureEdits","metadata",new Class[]{Element.class,String.class,String.class},
    test.element(latest,"probe"),"Concurrent edit","Latest note");
   test.staticCall("ProjectWrites","savePreservingAssets",new Class[]{test.storeClass,long.class,test.codec},store,id,latest);
   test.staticCall("ProjectWrites","addAttachment",new Class[]{test.storeClass,long.class,String.class,String.class,String.class,byte[].class},
    store,id,"probe",PHOTO,"image/png",bytes(LifecycleFixtureProvider.PHOTO));
   Object saved=load(store,id);
   test.check("Concurrent edit".equals(text(test.element(saved,"probe"),"name")),"attachment retains the other editor's saved changes");
   test.check(Arrays.equals(original,test.assets(saved).get(orphan)),"adding a file leaves an unreferenced imported asset intact");
   Object added=test.link(saved,"probe",PHOTO);
   String attachmentPath=test.value(added,"href");
   test.staticCall("ProjectWrites","removeAttachment",new Class[]{test.storeClass,long.class,String.class,String.class},
    store,id,"probe",test.value(added,"id"));
   Object reduced=load(store,id);
   test.check(test.links(reduced,"probe").isEmpty()&&!test.assets(reduced).containsKey(attachmentPath),"deletion removes only the chosen link and its unused payload");
   test.check(Arrays.equals(original,test.assets(reduced).get(orphan)),"deleting a file leaves the unrelated imported asset intact");
  }finally{erase(store,id);}
 }

 private Activity recreateForm(Activity current,String title,String... values)throws Exception{
  Instrumentation.ActivityMonitor monitor=test.addMonitor("org.rabochaya.projects.LocalMapActivity",null,false);
  Activity recreated;
  try{
   test.runOnMainSync(current::recreate);
   recreated=test.waitForMonitorWithTimeout(monitor,30000);
  }finally{test.removeMonitor(monitor);}
  test.check(recreated!=null&&current!=recreated,"Android recreated the map Activity");
  test.activity=recreated;
  test.waitText(title);
  java.util.ArrayList<String> actual=new java.util.ArrayList<>();
  test.runOnMainSync(()->{
   java.util.ArrayList<android.widget.EditText> fields=new java.util.ArrayList<>();
   test.collectInputs(test.activeDialogRoot(),fields);
   for(android.widget.EditText field:fields)actual.add(field.getText().toString());
  });
  test.check(actual.equals(Arrays.asList(values)),"draft restored every field without persisting it");
  return recreated;
 }

 void run()throws Exception{
  Object store=store();
  long id=-1;
  boolean handoff=false;
  try{
   preservedAssets(store);
   id=insert(store,parse(EMPTY),PROJECT);
   Activity main=map(id);
   test.mapEvidence("marker-create","before","Метки","empty project");
   test.clickDescription("Метки");
   test.click("Создать");
   test.click("Метка");
   test.inputs(INITIAL,"Draft note","55.7 37.6 170");
   main=recreateForm(main,"Новый объект",INITIAL,"Draft note","55.7 37.6 170");
   test.check(((List<?>)test.call(load(store,id),"features",new Class[]{boolean.class},false)).isEmpty(),"Activity recreation does not save an unfinished marker");
   test.click("Сохранить");
   test.waitText("1 видимых объектов");
   Element initial=marker(load(store,id),INITIAL);
   String markerId=initial.getAttribute("id");
   test.mapEvidence("marker-create","after","Сохранить","a new marker was saved");
   card(INITIAL);
   test.mapEvidence("marker-edit","before","Изменить","original marker card");
   test.click("Изменить");
   test.inputs(NAME,NOTE,"55.725 37.625 193");
   main=recreateForm(main,"Изменить объект",NAME,NOTE,"55.725 37.625 193");
   test.check(markerId.equals(marker(load(store,id),INITIAL).getAttribute("id")),"existing marker is unchanged until explicit Save");
   test.click("Сохранить");
   test.waitText("1 видимых объектов");
   test.stableMainMap();
   test.check(markerId.equals(marker(load(store,id),NAME).getAttribute("id")),"editing preserves the original marker identity");
   test.mapEvidence("marker-edit","after","Сохранить","new name, coordinates and description saved");
   Activity manager=child("ObjectManagerActivity","Файловый менеджер",true);
   test.geometryReady();
   test.click(NAME);
   test.managerAction("Цвет и заливка KML");
   test.mapEvidence("marker-svg","before","Выбрать значок SVG","SVG action available");
   picker(Intent.ACTION_OPEN_DOCUMENT,LifecycleFixtureProvider.SVG,"Выбрать значок SVG");
   test.geometryReady();
   test.waitText("Изменения сохранены");
   test.mapEvidence("marker-svg","after","Выбрать значок SVG","SVG assigned");
   finish(manager,main);
   card(NAME);
   Activity panel=child("AttachmentsActivity","Вложения",false);
   test.waitText("Вложений: 0");
   test.mapEvidence("marker-photo","before","Добавить фото, аудио или видео","no attachment");
   picker(Intent.ACTION_OPEN_DOCUMENT,LifecycleFixtureProvider.PHOTO,"Добавить фото, аудио или видео");
   test.waitText("Вложений: 1");
   test.waitText(PHOTO);
   JSONObject readback=verify(load(store,id));
   test.mapEvidence("marker-photo","after","Добавить фото, аудио или видео","photo bytes persisted");
   test.openAttachment(PHOTO,"Фото готово");
   finish(panel,main);
   test.mapEvidence("marker-reopen","before","Принудительная остановка","project and marker saved");
   test.check(state().edit().putLong("project",id).putString("readback",readback.toString()).commit(),"restart handoff committed");
   handoff=true;
  }finally{
   if(!handoff&&id>0)erase(store,id);
   test.call(store,"close",new Class[]{});
  }
 }

 void reopen()throws Exception{
  Object store=store();
  long source=state().getLong("project",-1), imported=-1;
  try{
   test.check(source>0,"force-stop handoff found");
   JSONObject before=new JSONObject(state().getString("readback",""));
   map(source);
   card(NAME);
   test.waitText(NOTE);
   test.check(verify(load(store,source)).toString().equals(before.toString()),"restart matches pre-stop readback");
   test.mapEvidence("marker-reopen","after","Повторное открытие","same values and payload hashes");
   test.click("Закрыть");
   test.clickDescription("Меню");
   child("ProjectsActivity","Проекты и файлы KML/KMZ",false);
   test.click(PROJECT);
   test.waitText(NAME);
   try(OutputStream ignored=context.getContentResolver().openOutputStream(LifecycleFixtureProvider.KMZ,"wt")){}
   test.mapEvidence("marker-export","before","KMZ","saved project open");
   picker(Intent.ACTION_CREATE_DOCUMENT,LifecycleFixtureProvider.KMZ,"KMZ");
   long until=android.os.SystemClock.uptimeMillis()+15000;
   byte[] kmz=null;
   while(android.os.SystemClock.uptimeMillis()<until){
    byte[] candidate=bytes(LifecycleFixtureProvider.KMZ);
    try{
     Object parsed=test.codec.getMethod("read",InputStream.class,boolean.class)
      .invoke(null,new ByteArrayInputStream(candidate),true);
     if(test.assets(parsed).size()==2){kmz=candidate;break;}
    }catch(java.lang.reflect.InvocationTargetException incomplete){}
    Thread.sleep(150);
   }
   test.check(kmz!=null,"exported KMZ contains the expected payloads");
   writeEvidence("marker-lifecycle.kmz",kmz);
   test.mapEvidence("marker-export","after","KMZ","export verified: "+digest(kmz));
   int count=((List<?>)test.call(store,"list",new Class[]{})).size();
   test.mapEvidence("marker-import","before","Импорт","original project remains saved");
   picker(Intent.ACTION_OPEN_DOCUMENT,LifecycleFixtureProvider.KMZ,"Импорт");
   until=android.os.SystemClock.uptimeMillis()+15000;
   while(android.os.SystemClock.uptimeMillis()<until){
    List<?> rows=(List<?>)test.call(store,"list",new Class[]{});
    if(rows.size()==count+1){
     for(Object row:rows){
      long id=row.getClass().getField("id").getLong(row);
      if(id!=source){imported=id;break;}
     }
     break;
    }
    Thread.sleep(150);
   }
   test.check(imported>0 && imported!=source,"UI import created a separate project");
   JSONObject after=verify(load(store,imported));
   test.check(after.toString().equals(before.toString()),"KMZ import matches the saved marker and payloads");
   test.check(verify(load(store,source)).toString().equals(before.toString()),"export and import left the source unchanged");
   Activity importedMap=child("LocalMapActivity","Карта",false);
   test.check(importedMap.getIntent().getLongExtra("project",-1)==imported,"classic manager opens the imported project by its new id");
   test.waitText("1 видимых объектов");
   test.stableMainMap();
   card(NAME);
   test.waitText(NOTE);
   test.mapEvidence("marker-import","after","Импорт","name, coordinates, description, SVG and photo match");
   writeEvidence("marker-readback.json",new JSONObject().put("restart_and_import",after).put("kmz_sha256",digest(kmz)).toString(2).getBytes(StandardCharsets.UTF_8));
  }finally{
   if(imported>0)erase(store,imported);
   if(source>0)erase(store,source);
   test.call(store,"close",new Class[]{});
   state().edit().clear().commit();
  }
 }
}
