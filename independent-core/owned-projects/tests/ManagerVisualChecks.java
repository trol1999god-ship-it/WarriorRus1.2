package org.rabochaya.maptests;

import android.app.*;import android.content.*;import android.content.res.Configuration;import android.graphics.*;import android.os.*;import android.view.*;import android.view.inputmethod.InputMethodManager;import android.widget.*;import java.io.*;import java.util.*;import org.json.*;

/** Captures only a newly-created synthetic project, never personal device data. */
final class ManagerVisualChecks {
 final MapAndroidChecks m;final JSONArray observations=new JSONArray();
 ManagerVisualChecks(MapAndroidChecks checks){m=checks;}
 String shell(String command)throws Exception{ParcelFileDescriptor fd=m.getUiAutomation().executeShellCommand(command);try(InputStream in=new ParcelFileDescriptor.AutoCloseInputStream(fd);ByteArrayOutputStream out=new ByteArrayOutputStream()){byte[] b=new byte[4096];int n;while((n=in.read(b))!=-1)out.write(b,0,n);return out.toString("UTF-8");}}
 void emit(String value){Bundle b=new Bundle();b.putString("stream",value+"\n");m.sendStatus(0,b);}
 void finish(){if(m.activity!=null){Activity old=m.activity;m.runOnMainSync(()->old.finish());m.waitForIdleSync();m.activity=null;}}
 void launch(long project)throws Exception{m.activity=m.startActivitySync(new Intent().setClassName(m.getTargetContext().getPackageName(),"org.rabochaya.projects.ObjectManagerActivity").putExtra("project",project).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));m.geometryReady();m.waitText("Объекты проекта");}
 void rotate(int rotation)throws Exception{
  Instrumentation.ActivityMonitor monitor=m.addMonitor("org.rabochaya.projects.ObjectManagerActivity",null,false);
  m.check(m.getUiAutomation().setRotation(rotation),"visual rotation requested");
  Activity next=m.waitForMonitorWithTimeout(monitor,15000);m.removeMonitor(monitor);if(next!=null)m.activity=next;
  m.geometryReady();m.waitForIdleSync();Thread.sleep(700);
  m.check(m.activity.getResources().getConfiguration().orientation==(rotation==UiAutomation.ROTATION_FREEZE_0?Configuration.ORIENTATION_PORTRAIT:Configuration.ORIENTATION_LANDSCAPE),"actual orientation applied");
 }
 void inspect(View view,JSONArray texts)throws Exception{
  if(view instanceof TextView){TextView t=(TextView)view;String value=t.getText().toString();if(!value.isEmpty()){
   JSONObject row=new JSONObject();row.put("class",view.getClass().getSimpleName());row.put("text",value.length()>160?value.substring(0,160):value);row.put("foreground",String.format("#%08x",t.getCurrentTextColor()));
   Object expected=m.staticCall("WorkspaceUi","font",new Class[]{Activity.class},m.activity);row.put("arimo",expected.equals(t.getTypeface()));
   int[] xy=new int[2];view.getLocationOnScreen(xy);Rect visible=new Rect();boolean shown=view.getGlobalVisibleRect(visible);row.put("bounds",Arrays.toString(new int[]{xy[0],xy[1],view.getWidth(),view.getHeight()}));row.put("visible",shown);row.put("visibleBounds",visible.toShortString());row.put("fullyVisible",shown&&visible.width()==view.getWidth()&&visible.height()==view.getHeight());texts.put(row);
  }}
  if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)inspect(group.getChildAt(i),texts);}
 }
 void snapshot(String name,boolean keyboard)throws Exception{
  m.waitForIdleSync();Thread.sleep(700);final JSONObject state=new JSONObject();final RuntimeException[] error={null};
  m.runOnMainSync(()->{try{View root=m.activeDialogRoot();Rect frame=new Rect();root.getWindowVisibleDisplayFrame(frame);state.put("name",name);state.put("visibleFrame",frame.toShortString());state.put("orientation",m.activity.getResources().getConfiguration().orientation);state.put("nightMask",m.activity.getResources().getConfiguration().uiMode&Configuration.UI_MODE_NIGHT_MASK);JSONArray texts=new JSONArray();inspect(root,texts);state.put("texts",texts);}catch(Exception e){error[0]=new RuntimeException(e);}});
  if(error[0]!=null)throw error[0];String ime=shell("dumpsys input_method");boolean shown=ime.contains("mInputShown=true")||ime.contains("mIsInputViewShown=true")||ime.contains("isInputViewShown=true");state.put("keyboardRequested",keyboard);state.put("keyboardObserved",shown);
  m.capture("mvisual-"+name);observations.put(state);emit("MANAGER_VISUAL "+state.toString());
  if(keyboard)m.check(shown,"real soft keyboard visible for "+name);
 }
 void keyboard()throws Exception{
  final EditText[] input={null};m.runOnMainSync(()->{List<EditText> fields=new ArrayList<>();m.collectInputs(m.activeDialogRoot(),fields);if(!fields.isEmpty()){input[0]=fields.get(0);input[0].requestFocus();((InputMethodManager)m.activity.getSystemService(Context.INPUT_METHOD_SERVICE)).showSoftInput(input[0],InputMethodManager.SHOW_IMPLICIT);}});
  m.check(input[0]!=null,"visual dialog has editable field");Thread.sleep(1200);
 }
 void cancel()throws Exception{m.click("Отмена");m.waitForIdleSync();Thread.sleep(300);}
 void run()throws Exception{
  Context context=m.getTargetContext();Object store=m.storeClass.getConstructor(Context.class).newInstance(context);long id=-1;UiModeManager ui=(UiModeManager)context.getSystemService(Context.UI_MODE_SERVICE);int oldNight=ui.getNightMode();String oldKeyboard=shell("settings get secure show_ime_with_hard_keyboard").trim();
  try{
   Object doc=m.codec.getMethod("parse",byte[].class).invoke(null,(Object)("<kml xmlns='http://www.opengis.net/kml/2.2'><Document><Folder id='visual_folder'><name>QA_VISUAL_Папка</name></Folder><Placemark id='visual_point'><name>QA_VISUAL_Точка</name><description>Синтетическое описание для проверки читаемости</description><Point><coordinates>10,20,30</coordinates></Point></Placemark></Document></kml>").getBytes("UTF-8"));
   id=(Long)m.call(store,"insert",new Class[]{m.codec,String.class},doc,"QA_MANAGER_VISUAL");byte[] before=(byte[])m.call(doc,"xml",new Class[]{});
   shell("settings put secure show_ime_with_hard_keyboard 1");
   for(int night:new int[]{UiModeManager.MODE_NIGHT_NO,UiModeManager.MODE_NIGHT_YES}){
    finish();m.getUiAutomation().setRotation(UiAutomation.ROTATION_FREEZE_0);if(Build.VERSION.SDK_INT>=24)shell("cmd uimode night "+(night==UiModeManager.MODE_NIGHT_YES?"yes":"no"));else ui.setNightMode(night);Thread.sleep(700);launch(id);String theme=night==UiModeManager.MODE_NIGHT_YES?"night":"day";
    snapshot(theme+"-portrait-main",false);rotate(UiAutomation.ROTATION_FREEZE_90);snapshot(theme+"-landscape-main",false);
    m.managerAction("Новая папка / группа");m.inputs("QA_VISUAL_Новая папка");keyboard();snapshot(theme+"-landscape-name-ime",true);cancel();
    rotate(UiAutomation.ROTATION_FREEZE_0);m.managerAction("Новая папка / группа");m.inputs("QA_VISUAL_Новая папка");keyboard();snapshot(theme+"-portrait-name-ime",true);cancel();
    m.click("QA_VISUAL_Точка");m.managerAction("Изменить описание");keyboard();snapshot(theme+"-portrait-description-ime",true);cancel();
    rotate(UiAutomation.ROTATION_FREEZE_90);if(m.find(m.getUiAutomation().getRootInActiveWindow(),"QA_VISUAL_Точка",false)!=null){m.click("QA_VISUAL_Точка");m.managerAction("Изменить описание");keyboard();snapshot(theme+"-landscape-description-ime",true);cancel();}else emit("MANAGER_VISUAL_UNAVAILABLE "+theme+" landscape description: object row not visible");
    m.check(Arrays.equals(before,(byte[])m.call(m.call(store,"load",new Class[]{long.class},id),"xml",new Class[]{})),"visual capture and rotation preserve synthetic project bytes");
   }
  }finally{
   File directory=context.getExternalFilesDir(null);if(directory!=null)try(FileOutputStream out=new FileOutputStream(new File(directory,"manager-visual.json"))){out.write(observations.toString(2).getBytes("UTF-8"));}
   finish();m.getUiAutomation().setRotation(UiAutomation.ROTATION_UNFREEZE);if(Build.VERSION.SDK_INT>=24)shell("cmd uimode night "+(oldNight==UiModeManager.MODE_NIGHT_YES?"yes":oldNight==UiModeManager.MODE_NIGHT_NO?"no":"auto"));else ui.setNightMode(oldNight);shell(oldKeyboard.equals("null")?"settings delete secure show_ime_with_hard_keyboard":"settings put secure show_ime_with_hard_keyboard "+oldKeyboard);
   if(id>0)m.call(store,"remove",new Class[]{long.class},id);m.call(store,"close",new Class[]{});
  }
 }
}
