package org.rabochaya.maptests;
import android.app.*;import android.content.*;import android.accessibilityservice.AccessibilityServiceInfo;import android.view.*;import android.widget.*;import java.util.*;
/** Only synthetic emulator data; actual orientation changes must recreate Activity. */
final class ManagerRotationChecks {
 final MapAndroidChecks m;final ManagerVisualChecks v;
 ManagerRotationChecks(MapAndroidChecks checks){m=checks;v=new ManagerVisualChecks(m);}
 void run()throws Exception{
  Context c=m.getTargetContext();Object store=m.storeClass.getConstructor(Context.class).newInstance(c);long id=-1;AccessibilityServiceInfo service=m.getUiAutomation().getServiceInfo();int flags=service.flags;service.flags|=AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;m.getUiAutomation().setServiceInfo(service);String keyboard=v.shell("settings get secure show_ime_with_hard_keyboard").trim();boolean all=true;
  try{
   Object doc=m.codec.getMethod("parse",byte[].class).invoke(null,(Object)("<kml xmlns='http://www.opengis.net/kml/2.2'><Document><Folder id='folder'><name>QA_ROTATE_FOLDER</name><Placemark id='nested'><name>QA_ROTATE_NESTED</name><Point><coordinates>11,21,31</coordinates></Point></Placemark></Folder><Placemark id='point'><name>QA_ROTATE_POINT</name><description>Original note</description><Point><coordinates>10,20,30</coordinates></Point></Placemark><Placemark id='other'><name>QA_ROTATE_OTHER</name><Point><coordinates>12,22,32</coordinates></Point></Placemark></Document></kml>").getBytes("UTF-8"));
   id=(Long)m.call(store,"insert",new Class[]{m.codec,String.class},doc,"QA_ROTATION");byte[] before=(byte[])m.call(m.call(store,"load",new Class[]{long.class},id),"xml",new Class[]{});v.shell("settings put secure show_ime_with_hard_keyboard 1");
   for(String kind:new String[]{"name","description"}){
    v.finish();m.getUiAutomation().setRotation(UiAutomation.ROTATION_FREEZE_0);v.launch(id);v.rotate(UiAutomation.ROTATION_FREEZE_0);m.click("QA_ROTATE_POINT");m.managerAction(kind.equals("name")?"Переименовать выбранное":"Изменить описание");String text=kind.equals("name")?"QA_ROTATE_Новое имя 😀":"QA_ROTATE_Описание 😀\nВторая строка";m.inputs(text);m.runOnMainSync(()->{List<EditText> inputs=new ArrayList<>();m.collectInputs(m.activeDialogRoot(),inputs);inputs.get(0).setSelection(3,8);});v.keyboard();v.snapshot("rotation-"+kind+"-before",true);Activity old=m.activity;
    v.rotate(UiAutomation.ROTATION_FREEZE_90);m.waitForIdleSync();Thread.sleep(1000);v.snapshot("rotation-"+kind+"-after",false);m.check(m.activity!=old&&old.isDestroyed(),"rotation really destroys and replaces Activity: "+kind);
    boolean[] restored={false};m.runOnMainSync(()->{List<EditText> inputs=new ArrayList<>();m.collectInputs(m.activeDialogRoot(),inputs);restored[0]=inputs.size()==1&&text.contentEquals(inputs.get(0).getText())&&inputs.get(0).getSelectionStart()==3&&inputs.get(0).getSelectionEnd()==8;});
    v.emit("ROTATION_RESULT kind="+kind+" restoredTextAndCursor="+restored[0]);all&=restored[0];m.check(Arrays.equals(before,(byte[])m.call(m.call(store,"load",new Class[]{long.class},id),"xml",new Class[]{})),"rotation never writes project: "+kind);
   }
   m.check(all,"name and description survive real Activity recreation with unsaved text/cursor");
  }finally{v.finish();service.flags=flags;m.getUiAutomation().setServiceInfo(service);m.getUiAutomation().setRotation(UiAutomation.ROTATION_UNFREEZE);v.shell(keyboard.equals("null")?"settings delete secure show_ime_with_hard_keyboard":"settings put secure show_ime_with_hard_keyboard "+keyboard);if(id>0)m.call(store,"remove",new Class[]{long.class},id);m.call(store,"close",new Class[]{});}
 }
}
