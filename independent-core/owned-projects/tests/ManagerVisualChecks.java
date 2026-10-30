package org.rabochaya.maptests;

import android.accessibilityservice.AccessibilityServiceInfo;import android.view.accessibility.AccessibilityWindowInfo;import android.app.*;import android.content.*;import android.content.res.Configuration;import android.graphics.*;import android.os.*;import android.view.*;import android.view.inputmethod.InputMethodManager;import android.widget.*;import java.io.*;import java.util.*;import org.json.*;

/** Captures only a newly-created synthetic project, never personal device data. */
final class ManagerVisualChecks {
 final MapAndroidChecks m;final JSONArray observations=new JSONArray();
 ManagerVisualChecks(MapAndroidChecks checks){m=checks;}
 String shell(String command)throws Exception{ParcelFileDescriptor fd=m.getUiAutomation().executeShellCommand(command);try(InputStream in=new ParcelFileDescriptor.AutoCloseInputStream(fd);ByteArrayOutputStream out=new ByteArrayOutputStream()){byte[] b=new byte[4096];int n;while((n=in.read(b))!=-1)out.write(b,0,n);return out.toString("UTF-8");}}
 void emit(String value){Bundle b=new Bundle();b.putString("stream",value+"\n");m.sendStatus(0,b);}
 void finish(){if(m.activity!=null){Activity old=m.activity;m.runOnMainSync(()->old.finish());m.waitForIdleSync();m.activity=null;}}
 void launch(long project)throws Exception{m.activity=m.startActivitySync(new Intent().setClassName(m.getTargetContext().getPackageName(),"org.rabochaya.projects.ObjectManagerActivity").putExtra("project",project).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));m.geometryReady();m.waitText("Объекты проекта");}
 void rotate(int rotation)throws Exception{
  int desired=rotation==UiAutomation.ROTATION_FREEZE_0?Configuration.ORIENTATION_PORTRAIT:Configuration.ORIENTATION_LANDSCAPE;
  m.check(m.getUiAutomation().setRotation(rotation),"visual rotation requested");long until=System.currentTimeMillis()+15000;int stable=0;final int[] state=new int[3];
  while(System.currentTimeMillis()<until){
   m.runOnMainSync(()->{View root=m.activeDialogRoot();ViewGroup content=(ViewGroup)root.findViewById(android.R.id.content);if(content!=null&&content.getChildCount()>0){Context current=content.getChildAt(0).getContext();while(current instanceof ContextWrapper&&!(current instanceof Activity))current=((ContextWrapper)current).getBaseContext();if(current instanceof Activity&&current.getClass().getName().equals("org.rabochaya.projects.ObjectManagerActivity"))m.activity=(Activity)current;}
    View decor=m.activity.getWindow().getDecorView();state[0]=decor.getWidth();state[1]=decor.getHeight();state[2]=m.activity.getResources().getConfiguration().orientation;
   });
   boolean dimensions=desired==Configuration.ORIENTATION_PORTRAIT?state[1]>state[0]:state[0]>state[1];
   if(!m.activity.isDestroyed()&&state[2]==desired&&dimensions){if(++stable>=3){m.geometryReady();return;}}else stable=0;Thread.sleep(100);
  }emit("VISUAL_ROTATION_STATE desired="+desired+" actual="+Arrays.toString(state)+" activity="+m.activity);throw new AssertionError("visual orientation did not settle: "+desired);
 }
 JSONArray imeWindows()throws Exception{JSONArray windows=new JSONArray();for(AccessibilityWindowInfo window:m.getUiAutomation().getWindows())if(window.getType()==AccessibilityWindowInfo.TYPE_INPUT_METHOD){Rect bounds=new Rect();window.getBoundsInScreen(bounds);if(bounds.width()>0&&bounds.height()>0)windows.put(bounds.toShortString());}return windows;}
 void inspect(View view,JSONArray texts)throws Exception{
  if(view instanceof TextView){TextView t=(TextView)view;String value=t.getText().toString();if(!value.isEmpty()){
   JSONObject row=new JSONObject();row.put("class",view.getClass().getSimpleName());row.put("text",value.length()>160?value.substring(0,160):value);row.put("foreground",String.format("#%08x",t.getCurrentTextColor()));
   Object expected=m.staticCall("WorkspaceUi","font",new Class[]{Activity.class},m.activity);row.put("arimo",Typeface.create((Typeface)expected,t.getTypeface()==null?0:t.getTypeface().getStyle()).equals(t.getTypeface()));
   int[] xy=new int[2];view.getLocationOnScreen(xy);Rect visible=new Rect();boolean shown=view.getGlobalVisibleRect(visible);row.put("bounds",Arrays.toString(new int[]{xy[0],xy[1],view.getWidth(),view.getHeight()}));row.put("visible",shown);row.put("visibleBounds",visible.toShortString());row.put("fullyVisible",shown&&visible.width()==view.getWidth()&&visible.height()==view.getHeight());texts.put(row);
  }}
  if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)inspect(group.getChildAt(i),texts);}
 }
 void snapshot(String name,boolean keyboard)throws Exception{
  m.waitForIdleSync();Thread.sleep(700);final JSONObject state=new JSONObject();final RuntimeException[] error={null};
  m.runOnMainSync(()->{try{View root=m.activeDialogRoot();Rect frame=new Rect();root.getWindowVisibleDisplayFrame(frame);state.put("name",name);state.put("visibleFrame",frame.toShortString());state.put("orientation",m.activity.getResources().getConfiguration().orientation);state.put("nightMask",m.activity.getResources().getConfiguration().uiMode&Configuration.UI_MODE_NIGHT_MASK);JSONArray texts=new JSONArray();inspect(root,texts);state.put("texts",texts);}catch(Exception e){error[0]=new RuntimeException(e);}});
  if(error[0]!=null)throw error[0];JSONArray ime=imeWindows();boolean shown=ime.length()>0;state.put("imeWindows",ime);state.put("keyboardRequested",keyboard);state.put("keyboardObserved",shown);
  m.capture("mvisual-"+name);observations.put(state);emit("MANAGER_VISUAL "+state.toString());
  if(keyboard){m.check(shown,"real soft keyboard window visible for "+name);buttonsReachable();editableLineVisible();}
  JSONArray texts=state.getJSONArray("texts");for(int i=0;i<texts.length();i++){JSONObject text=texts.getJSONObject(i);if(text.getBoolean("visible"))m.check(text.getBoolean("arimo"),"Arimo on visible manager text: "+text.getString("text"));}
  if(name.endsWith("-main")){m.check(m.find(m.getUiAutomation().getRootInActiveWindow(),"QA_VISUAL_Папка",false)!=null,"object list survives main layout");final View[] footer={null};m.runOnMainSync(()->footer[0]=button(m.activity.getWindow().getDecorView(),"Проекты, импорт и экспорт"));m.check(footer[0]!=null&&fullyVisible(footer[0]),"footer reachable inside app window");final boolean[] navigation={false};m.runOnMainSync(()->{View root=m.activity.getWindow().getDecorView();View actions=button(root,"Действия"),close=button(root,"Закрыть");navigation[0]=actions!=null&&close!=null&&fullyVisible(actions)&&fullyVisible(close);});m.check(navigation[0],"navigation buttons remain fully visible without header scrolling");}
 }
 View button(View root,String label){if(root instanceof Button&&label.contentEquals(((Button)root).getText()))return root;if(root instanceof ViewGroup){ViewGroup group=(ViewGroup)root;for(int i=0;i<group.getChildCount();i++){View found=button(group.getChildAt(i),label);if(found!=null)return found;}}return null;}
 boolean fullyVisible(View view){Rect actual=new Rect(),frame=new Rect();int[] xy=new int[2];view.getLocationOnScreen(xy);view.getWindowVisibleDisplayFrame(frame);return view.getGlobalVisibleRect(actual)&&actual.width()==view.getWidth()&&actual.height()==view.getHeight()&&frame.contains(xy[0],xy[1],xy[0]+view.getWidth(),xy[1]+view.getHeight());}
 void editableLineVisible(){final boolean[] visible={false};m.runOnMainSync(()->{List<EditText> fields=new ArrayList<>();m.collectInputs(m.activeDialogRoot(),fields);for(EditText field:fields){Rect bounds=new Rect();if(field.getGlobalVisibleRect(bounds)&&bounds.height()>=field.getLineHeight())visible[0]=true;}});m.check(visible[0],"at least one editable text line remains visible above keyboard");}
 void buttonsReachable(){final boolean[] good={false};m.runOnMainSync(()->{View root=m.activeDialogRoot();View save=button(root,"Сохранить"),cancel=button(root,"Отмена");good[0]=save!=null&&cancel!=null&&fullyVisible(save)&&fullyVisible(cancel);});m.check(good[0],"Save and Cancel fully visible above IME/system insets");}
 void keyboard()throws Exception{
  final EditText[] input={null};m.runOnMainSync(()->{List<EditText> fields=new ArrayList<>();m.collectInputs(m.activeDialogRoot(),fields);if(!fields.isEmpty()){input[0]=fields.get(0);input[0].requestFocus();((InputMethodManager)m.activity.getSystemService(Context.INPUT_METHOD_SERVICE)).showSoftInput(input[0],InputMethodManager.SHOW_IMPLICIT);}});
  m.check(input[0]!=null,"visual dialog has editable field");long end=System.currentTimeMillis()+7000;while(System.currentTimeMillis()<end){if(imeWindows().length()>0)return;Thread.sleep(200);}throw new AssertionError("soft keyboard window never appeared");
 }
 void cancel()throws Exception{
  final int[] xy=new int[2];final float[] center=new float[2];m.runOnMainSync(()->{View cancel=button(m.activeDialogRoot(),"Отмена");cancel.getLocationOnScreen(xy);center[0]=xy[0]+cancel.getWidth()/2f;center[1]=xy[1]+cancel.getHeight()/2f;});
  long down=SystemClock.uptimeMillis();for(int action:new int[]{0,1}){MotionEvent event=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,center[0],center[1],0);event.setSource(InputDevice.SOURCE_TOUCHSCREEN);m.check(m.getUiAutomation().injectInputEvent(event,true),"real Cancel touch "+action);event.recycle();Thread.sleep(90);}m.waitText("Объекты проекта");m.waitForIdleSync();Thread.sleep(300);
 }
 void run()throws Exception{
  Context context=m.getTargetContext();Object store=m.storeClass.getConstructor(Context.class).newInstance(context);long id=-1;UiModeManager ui=(UiModeManager)context.getSystemService(Context.UI_MODE_SERVICE);int oldNight=ui.getNightMode();AccessibilityServiceInfo service=m.getUiAutomation().getServiceInfo();int oldFlags=service.flags;service.flags|=AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;m.getUiAutomation().setServiceInfo(service);String oldKeyboard=shell("settings get secure show_ime_with_hard_keyboard").trim();
  try{
   Object doc=m.codec.getMethod("parse",byte[].class).invoke(null,(Object)("<kml xmlns='http://www.opengis.net/kml/2.2'><Document><Folder id='visual_folder'><name>QA_VISUAL_Папка</name></Folder><Placemark id='visual_point'><name>QA_VISUAL_Точка</name><description>Синтетическое описание для проверки читаемости</description><Point><coordinates>10,20,30</coordinates></Point></Placemark></Document></kml>").getBytes("UTF-8"));
   id=(Long)m.call(store,"insert",new Class[]{m.codec,String.class},doc,"QA_MANAGER_VISUAL");byte[] before=(byte[])m.call(doc,"xml",new Class[]{});
   shell("settings put secure show_ime_with_hard_keyboard 1");
   for(int night:new int[]{UiModeManager.MODE_NIGHT_NO,UiModeManager.MODE_NIGHT_YES}){
    finish();m.getUiAutomation().setRotation(UiAutomation.ROTATION_FREEZE_0);if(Build.VERSION.SDK_INT>=24)shell("cmd uimode night "+(night==UiModeManager.MODE_NIGHT_YES?"yes":"no"));else ui.setNightMode(night);Thread.sleep(700);launch(id);rotate(UiAutomation.ROTATION_FREEZE_0);m.check((m.activity.getResources().getConfiguration().uiMode&Configuration.UI_MODE_NIGHT_MASK)==(night==UiModeManager.MODE_NIGHT_YES?Configuration.UI_MODE_NIGHT_YES:Configuration.UI_MODE_NIGHT_NO),"actual system night mask applied");String theme=night==UiModeManager.MODE_NIGHT_YES?"night":"day";
    snapshot(theme+"-portrait-main",false);rotate(UiAutomation.ROTATION_FREEZE_90);snapshot(theme+"-landscape-main",false);
    m.managerAction("Новая папка / группа");m.inputs("QA_VISUAL_Новая папка");keyboard();snapshot(theme+"-landscape-name-ime",true);
    m.sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);long hidden=System.currentTimeMillis()+7000;while(imeWindows().length()>0&&System.currentTimeMillis()<hidden)Thread.sleep(100);m.check(imeWindows().length()==0,"Back hides keyboard without closing editor");m.waitText("Новая папка / группа");snapshot(theme+"-landscape-name-restored",false);m.check(m.find(m.getUiAutomation().getRootInActiveWindow(),"Новая папка / группа",true).isVisibleToUser(),"normal dialog title returns after IME dismissal");buttonsReachable();final boolean[] restored={false};m.runOnMainSync(()->{List<EditText> fields=new ArrayList<>();m.collectInputs(m.activeDialogRoot(),fields);restored[0]=fields.size()==1&&"QA_VISUAL_Новая папка".contentEquals(fields.get(0).getText());});m.check(restored[0],"keyboard dismissal preserves unsaved name");
    keyboard();buttonsReachable();cancel();
    rotate(UiAutomation.ROTATION_FREEZE_0);m.managerAction("Новая папка / группа");m.inputs("QA_VISUAL_Новая папка");keyboard();snapshot(theme+"-portrait-name-ime",true);cancel();
    m.click("QA_VISUAL_Точка");m.managerAction("Изменить описание");keyboard();snapshot(theme+"-portrait-description-ime",true);cancel();
    rotate(UiAutomation.ROTATION_FREEZE_90);m.click("QA_VISUAL_Точка");m.managerAction("Изменить описание");keyboard();snapshot(theme+"-landscape-description-ime",true);cancel();
    m.check(Arrays.equals(before,(byte[])m.call(m.call(store,"load",new Class[]{long.class},id),"xml",new Class[]{})),"visual capture and rotation preserve synthetic project bytes");
   }
  }finally{
   File directory=context.getExternalFilesDir(null);if(directory!=null)try(FileOutputStream out=new FileOutputStream(new File(directory,"manager-visual.json"))){out.write(observations.toString(2).getBytes("UTF-8"));}
   finish();service.flags=oldFlags;m.getUiAutomation().setServiceInfo(service);m.getUiAutomation().setRotation(UiAutomation.ROTATION_UNFREEZE);if(Build.VERSION.SDK_INT>=24)shell("cmd uimode night "+(oldNight==UiModeManager.MODE_NIGHT_YES?"yes":oldNight==UiModeManager.MODE_NIGHT_NO?"no":"auto"));else ui.setNightMode(oldNight);shell(oldKeyboard.equals("null")?"settings delete secure show_ime_with_hard_keyboard":"settings put secure show_ime_with_hard_keyboard "+oldKeyboard);
   if(id>0)m.call(store,"remove",new Class[]{long.class},id);m.call(store,"close",new Class[]{});
  }
 }
}
