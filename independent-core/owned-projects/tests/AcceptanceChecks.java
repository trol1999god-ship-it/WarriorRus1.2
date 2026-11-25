package org.rabochaya.maptests;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation.ActivityMonitor;
import android.app.Instrumentation.ActivityResult;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import java.util.Arrays;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;

/** A single navigation pass collecting the actual windows used for the 13-screen review. */
final class AcceptanceChecks {
 private static final String PROJECT = "QA_ACCEPTANCE_PROJECT", POINT = "QA приемка";
 private static final String KML = "<kml xmlns='http://www.opengis.net/kml/2.2'><Document>" +
  "<Placemark id='review'><name>" + POINT + "</name><description>QA локальное описание</description>" +
  "<Point><coordinates>37.6,55.7,12</coordinates></Point></Placemark></Document></kml>";
 private final MapAndroidChecks test;
 private final Context context;
 private Activity map;

 AcceptanceChecks(MapAndroidChecks test) { this.test = test; context = test.getTargetContext(); }

 private void shot(String screen, String action) throws Exception {
  test.mapEvidence("accept-" + screen, "after", action, "visible window");
 }

 private void back() {
  test.getUiAutomation().performGlobalAction(android.accessibilityservice.AccessibilityService.GLOBAL_ACTION_BACK);
  test.waitForIdleSync();
 }

 private void closeChild() throws Exception {
  back();
  test.activity = map;
  test.stableMainMap();
 }

 private Activity open(String type, String action) throws Exception {
  ActivityMonitor monitor = test.addMonitor("org.rabochaya.projects." + type, null, false);
  try {
   test.click(action);
   Activity next = test.waitForMonitorWithTimeout(monitor, 15000);
   test.check(next != null, type + " opens through " + action);
   test.activity = next;
   return next;
  } finally { test.removeMonitor(monitor); }
 }

 private ImageView preview(View view) {
  if (view instanceof ImageView && "Предпросмотр значка".contentEquals(String.valueOf(view.getContentDescription()))) return (ImageView)view;
  if (view instanceof ViewGroup) {
   ViewGroup group = (ViewGroup)view;
   for (int i = 0; i < group.getChildCount(); i++) {
    ImageView found = preview(group.getChildAt(i));
    if (found != null) return found;
   }
  }
  return null;
 }

 private boolean hasBlueDescription(View view) {
  if (view instanceof android.widget.TextView &&
    ((android.widget.TextView)view).getText().toString().contains("QA локальное описание")) {
   return view.getBackground() instanceof android.graphics.drawable.ColorDrawable
    && ((android.graphics.drawable.ColorDrawable)view.getBackground()).getColor() == 0xff1a344b;
  }
  if (view instanceof ViewGroup) {
   ViewGroup group = (ViewGroup)view;
   for (int i = 0; i < group.getChildCount(); i++) if (hasBlueDescription(group.getChildAt(i))) return true;
  }
  return false;
 }

 private void iconImport() throws Exception {
  IntentFilter picker = new IntentFilter(Intent.ACTION_OPEN_DOCUMENT);
  picker.addCategory(Intent.CATEGORY_OPENABLE);
  picker.addDataType("*/*");
  ActivityMonitor monitor = test.addMonitor(picker,new ActivityResult(Activity.RESULT_OK,
    new Intent().setData(LifecycleFixtureProvider.SVG)),true);
  try { test.click("Импортировать SVG"); }
  finally { test.removeMonitor(monitor); }
  test.check(monitor.getHits() == 1, "icon library opens local document picker");
  test.click("lifecycle.svg");
  test.runOnMainSync(() -> {
   ImageView view = preview(test.activeDialogRoot());
   test.check(view != null && view.getDrawable() instanceof BitmapDrawable, "preview shows rasterized SVG");
   int size = ((BitmapDrawable)view.getDrawable()).getBitmap().getWidth();
   test.check(size > 24 && size <= 256, "preview uses a bounded raster larger than the 24-pixel source");
  });
 }

 private Activity recreate(Activity current) throws Exception {
  ArrayBlockingQueue<Activity> resumed = new ArrayBlockingQueue<>(1);
  Application app = current.getApplication();
  Application.ActivityLifecycleCallbacks listener = new Application.ActivityLifecycleCallbacks() {
   public void onActivityCreated(Activity activity, Bundle state) {}
   public void onActivityStarted(Activity activity) {}
   public void onActivityResumed(Activity activity) {
    if (activity != current && current.getClass() == activity.getClass()) resumed.offer(activity);
   }
   public void onActivityPaused(Activity activity) {}
   public void onActivityStopped(Activity activity) {}
   public void onActivitySaveInstanceState(Activity activity, Bundle out) {}
   public void onActivityDestroyed(Activity activity) {}
  };
  try {
   test.runOnMainSync(() -> { app.registerActivityLifecycleCallbacks(listener); current.recreate(); });
   Activity next = resumed.poll(30,TimeUnit.SECONDS);
   test.check(next != null, "Android recreated the format export activity");
   test.activity = next;
   return next;
  } finally { test.runOnMainSync(() -> app.unregisterActivityLifecycleCallbacks(listener)); }
 }

 void run() throws Exception {
  Object store = test.storeClass.getConstructor(Context.class).newInstance(context);
  Object doc = test.codec.getMethod("parse",byte[].class).invoke(null,(Object)KML.getBytes("UTF-8"));
  long id = (Long)test.call(store,"insert",new Class[]{test.codec,String.class},doc,PROJECT);
  String token = test.treeToken(test.call(store,"load",new Class[]{long.class},id));
  try {
   test.staticCall("ProjectSession","remember",new Class[]{Context.class,long.class},context,id);
   map = test.launchWorkspace();
   test.stableMainMap();
   double[] viewport = (double[])test.call(test.map(),"viewport",new Class[]{});
   shot("01-map","Карта");
   test.clickDescription("Настройки координат центра");
   test.waitText("Основной формат");
   shot("02-coordinates","Настройки координат центра");
   test.click("Отмена");
   test.clickDescription("Свернуть / развернуть инструменты");
   test.check(test.findDescription(test.getUiAutomation().getRootInActiveWindow(),"Карты")==null,"dock collapses on screen");
   shot("03-tools-collapsed","Свернуть инструменты");
   test.clickDescription("Свернуть / развернуть инструменты");
   shot("03-tools","Развернуть инструменты");
   test.clickDescription("Меню");
   test.waitText("Проекты и файлы KML/KMZ");
   shot("04-menu","Меню");
   back();

   test.clickDescription("Карты");
   open("MapLayersActivity","Слои карты");
   test.waitText("Показывать слой");
   shot("05-layers","Слои карты");
   closeChild();

   test.clickDescription("Карты");
   open("MapCatalogActivity","Онлайн-карты");
   test.waitText("Онлайн-карты");
   shot("06-catalog","Онлайн-карты");
   closeChild();

   test.clickDescription("Метки");
   open("ObjectManagerActivity","Список объектов");
   test.geometryReady();
   test.waitText(POINT);
   shot("07-objects","Список объектов");
   test.click(POINT);
   test.managerAction("Цвет и заливка KML");
   test.click("Менеджер значков");
   iconImport();
   shot("10-icons","Предпросмотр значка");
   test.click("Назад");
   test.click("Закрыть");
   closeChild();

   test.clickDescription("Меню");
   open("ProjectsActivity","Проекты и файлы KML/KMZ");
   test.waitText(PROJECT);
   shot("08-projects","Проекты и файлы KML/KMZ");
   test.click(PROJECT);
   test.waitText(POINT);
   test.click("Ещё");
   Activity exporter=open("FormatExportActivity","Экспорт GPX / GeoJSON");
   test.click("GPX 1.1");
   recreate(exporter);
   test.waitText("Экспорт GPX 1.1");
   shot("12-exchange","Подтверждение GPX после пересоздания");
   test.click("Отмена");
   back();
   test.waitText(PROJECT);
   closeChild();

   test.clickDescription("Метки");
   test.click("Поиск на карте");
   test.inputs(POINT);
   test.click("Найти");
   test.click(POINT);
   test.waitText("Координаты и контуры");
   test.runOnMainSync(() -> {
    View card = test.activeDialogRoot();
    test.check(hasBlueDescription(card),"object card uses the approved map panel palette");
   });
   shot("09-card","Карточка точки");
   test.click("Вложения");
   test.waitText("Вложений: 0");
   shot("09-attachments","Вложения");
   closeChild();

   test.clickDescription("Метки");
   test.click("Создать");
   test.click("Маршрут");
   test.waitText("Новый объект");
   shot("11-routes","Редактор маршрута");
   test.click("Отмена");

   test.clickDescription("Карты");
   open("OnlineMapActivity","Кеш / онлайн");
   test.waitText("Загружать тайлы из интернета");
   shot("13-settings","Кеш / онлайн");
   closeChild();
   test.check(Arrays.equals(viewport,(double[])test.call(test.map(),"viewport",new Class[]{})),"overview center and zoom survive acceptance navigation");
   test.check(token.equals(test.treeToken(test.call(store,"load",new Class[]{long.class},id))),"navigation and cancel leave project unchanged");
  } finally {
   if (map != null) test.runOnMainSync(map::finish);
   test.call(store,"remove",new Class[]{long.class},id);
   test.call(store,"close",new Class[]{});
  }
 }
}
