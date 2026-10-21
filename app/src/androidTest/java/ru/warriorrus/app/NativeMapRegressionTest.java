package ru.warriorrus.app;

import static org.junit.Assert.*;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import androidx.test.core.app.ActivityScenario;
import androidx.test.ext.junit.runners.AndroidJUnit4;
import androidx.test.platform.app.InstrumentationRegistry;
import androidx.test.uiautomator.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.Marker;

/** Runs against real Android, including desugared collections and the actual drawing thread. */
@RunWith(AndroidJUnit4.class)
public class NativeMapRegressionTest {
  private final UiDevice device = UiDevice.getInstance(InstrumentationRegistry.getInstrumentation());

  private void dismissSystemEducation() {
    UiObject2 tip=device.findObject(By.pkg("com.android.systemui").text(java.util.regex.Pattern.compile("(?i)got it|понятно")));
    if(tip!=null){tip.click();device.waitForIdle();}
  }

  private void click(BySelector selector) {
    dismissSystemEducation();
    UiObject2 object = device.wait(Until.findObject(selector), 8000);
    if(object==null){try{capture("missing-control");}catch(Exception ignored){}}
    assertNotNull("Missing UI control: "+selector,object);
    object.click();
    device.waitForIdle();
  }

  @Test public void profileTouchAxesAndRotationPreserveLocalTrack()throws Exception{
    android.content.Context context=InstrumentationRegistry.getInstrumentation().getTargetContext();context.deleteDatabase("warrior2.db");context.getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).commit();
    ru.warriorrus.app.data.MapItem item=new ru.warriorrus.app.data.MapItem();item.kind="track";item.name="Native profile";item.visible=true;item.opacity=1;
    item.segments.add(java.util.Arrays.asList(new ru.warriorrus.app.data.Vertex(48,11,500.0,"2026-10-21T00:00:00Z"),new ru.warriorrus.app.data.Vertex(48.001,11.001,540.0,"2026-10-21T00:01:00Z"),new ru.warriorrus.app.data.Vertex(48.002,11.002,520.0,"2026-10-21T00:03:00Z")));
    final long id;try(ru.warriorrus.app.data.ObjectStore store=new ru.warriorrus.app.data.ObjectStore(context)){id=store.save(item);}final String source=ru.warriorrus.app.geometry.Geometry.encode(item.segments);
    try(ActivityScenario<MainActivity> scenario=ActivityScenario.launch(MainActivity.class)){
      scenario.onActivity(activity->{try{java.lang.reflect.Field f=MainActivity.class.getDeclaredField("drawing");f.setAccessible(true);((MapView)type(activity.getWindow().getDecorView(),MapView.class)).getController().setZoom(17.0);((ru.warriorrus.app.geometry.DrawingController)f.get(activity)).start(item,"track",0,null);}catch(Exception e){throw new AssertionError(e);}});device.waitForIdle();
      UiScrollable scroll=new UiScrollable(new UiSelector().scrollable(true));assertTrue(scroll.scrollIntoView(new UiSelector().description("Установить по оси Y")));
      click(By.desc("Установить по оси Y"));click(By.text("Скорость"));assertTrue(device.wait(Until.gone(By.text("Установить по оси Y")),8000));
      click(By.desc("Установить по оси X"));click(By.text("Время"));assertTrue(device.wait(Until.gone(By.text("Установить по оси X")),8000));
      assertTrue(scroll.scrollIntoView(new UiSelector().description("Профиль объекта Native profile")));UiObject2 chart=device.wait(Until.findObject(By.desc("Профиль объекта Native profile")),8000);assertNotNull(chart);android.graphics.Rect rect=chart.getVisibleBounds();assertTrue(rect.height()>20);device.swipe(rect.left+20,rect.centerY(),rect.right-20,rect.centerY(),15);device.waitForIdle();capture("profile-speed-time");
      scenario.onActivity(activity->assertProfileState(activity,source));device.setOrientationLeft();device.waitForIdle();scenario.onActivity(activity->assertProfileState(activity,source));capture("profile-landscape");
      try(ru.warriorrus.app.data.ObjectStore store=new ru.warriorrus.app.data.ObjectStore(context)){assertEquals(source,ru.warriorrus.app.geometry.Geometry.encode(store.get(id).segments));}
    }finally{device.setOrientationNatural();device.unfreezeRotation();}
  }
  private void assertProfileState(MainActivity activity,String geometry){try{java.lang.reflect.Field f=MainActivity.class.getDeclaredField("drawing");f.setAccessible(true);android.os.Bundle state=new android.os.Bundle();((ru.warriorrus.app.geometry.DrawingController)f.get(activity)).saveState(state);assertEquals(geometry,state.getString("draftGeometry"));assertEquals(1,state.getInt("draftProfileValue"));assertEquals(1,state.getInt("draftProfileAxis"));assertTrue(state.getInt("draftProfileCursor",-1)>=0);}catch(Exception e){throw new AssertionError(e);}}

  @Test public void compassSettingsCalibrationAndModePersistence() throws Exception {
    android.content.Context context=InstrumentationRegistry.getInstrumentation().getTargetContext();
    context.getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).putInt("compassMode",0).commit();
    try(ActivityScenario<MainActivity> scenario=ActivityScenario.launch(MainActivity.class)){
      click(By.desc("Ориентирование"));click(By.text("Компас"));
      click(By.desc("Настройки компаса"));click(By.res("android:id/button3"));assertNotNull(device.wait(Until.findObject(By.desc("Датчик")),8000));click(By.clazz(android.widget.Spinner.class).desc("Компас"));click(By.text("TopoChaix"));click(By.res("android:id/button1"));
      assertTrue(device.wait(Until.gone(By.res("android:id/button1")),8000));scenario.onActivity(activity->assertEquals(1,activity.getPreferences(0).getInt("compassMode",-1)));capture("compass-topochaix");
      scenario.onActivity(activity->{View root=activity.getWindow().getDecorView();View panel=root.findViewWithTag("compassPanel"),map=root.findViewWithTag("mapCanvas");assertNotNull(panel);assertTrue(map.getBottom()<=panel.getTop());});
      click(By.desc("Справка о компасе"));assertNotNull(device.wait(Until.findObject(By.desc("Поворот устройства по трём осям")),8000));click(By.res("android:id/button1"));
      scenario.recreate();device.waitForIdle();click(By.desc("Настройки компаса"));
      assertNotNull(device.wait(Until.findObject(By.text("TopoChaix")),8000));
      click(By.clazz(android.widget.Spinner.class).desc("Компас"));click(By.text("Стандартный"));click(By.res("android:id/button1"));capture("compass-standard");
      click(By.desc("Закрыть компас"));scenario.onActivity(activity->assertNull(activity.getWindow().getDecorView().findViewWithTag("compassPanel")));
    }
  }

  @Test public void repeatedMarkerCreationDrawingRecreationAndPanelTouches() throws Exception {
    android.content.Context context = InstrumentationRegistry.getInstrumentation().getTargetContext();
    context.deleteDatabase("warrior2.db");
    context.getSharedPreferences("MainActivity", 0).edit().clear().putBoolean("mapOnline", false).commit();
    try (ActivityScenario<MainActivity> scenario = ActivityScenario.launch(MainActivity.class)) {
      for (int n = 1; n <= 8; n++) {
        click(By.desc("Действия в центре карты"));
        click(By.text("Новая метка…"));click(By.text("Путевая точка"));
        UiObject2 name = device.wait(Until.findObject(By.clazz(EditText.class)), 8000);
        assertNotNull(name);
        name.setText("Test point " + n);
        click(By.res("android:id/button1"));
        assertTrue(device.wait(Until.gone(By.res("android:id/button1")), 8000));
        click(By.desc("Увеличить"));
        click(By.desc("Уменьшить"));
        device.swipe(device.getDisplayWidth() / 2, device.getDisplayHeight() / 2,
            device.getDisplayWidth() / 2 + 40, device.getDisplayHeight() / 2 + 15, 8);
        device.waitForIdle();
      }
      scenario.onActivity(activity -> assertEquals(8, markerCount(activity)));
      scenario.onActivity(activity->{View root=activity.getWindow().getDecorView();assertNull(root.findViewWithTag("coordinateToggle"));assertNull(root.findViewWithTag("rightToggle"));assertEquals(2,((ViewGroup)root.findViewWithTag("zoomControls")).getChildCount());});
      scenario.recreate();
      device.waitForIdle();
      scenario.onActivity(activity -> assertEquals(8, markerCount(activity)));
      click(By.desc("Увеличить"));
      click(By.desc("Метки"));click(By.desc("Все метки"));
      assertNotNull(device.wait(Until.findObject(By.text("Локальные метки")), 8000));
    }
  }

  @Test public void manualGeometryCreationDrawingAndRestart() throws Exception {
    android.content.Context context = InstrumentationRegistry.getInstrumentation().getTargetContext();
    context.deleteDatabase("warrior2.db");
    context.getSharedPreferences("MainActivity", 0).edit().clear().putBoolean("mapOnline", false).commit();
    try (ActivityScenario<MainActivity> scenario = ActivityScenario.launch(MainActivity.class)) {
      for (String kind : new String[]{"Маршрут", "Область"}) {
        click(By.desc("Действия в центре карты"));click(By.text("Новая метка…"));click(By.text(kind));
        UiObject2 propertiesName=device.wait(Until.findObject(By.clazz(EditText.class)),8000);assertNotNull(propertiesName);propertiesName.setText(kind);click(By.res("android:id/button1"));
        device.waitForIdle();scenario.onActivity(this::assertDrawingViewport);capture("geometry-editor-expanded");
        click(By.desc("Свернуть статистику"));device.waitForIdle();scenario.onActivity(this::assertDrawingViewport);
        click(By.desc("Развернуть статистику"));device.waitForIdle();scenario.onActivity(this::assertDrawingViewport);
        device.swipe(device.getDisplayWidth()/2, device.getDisplayHeight()/2,
            device.getDisplayWidth()/2+100, device.getDisplayHeight()/2+60, 10);
        click(By.desc("+ Точка"));
        if (kind.equals("Область")) {
          device.swipe(device.getDisplayWidth()/2, device.getDisplayHeight()/2,
              device.getDisplayWidth()/2-50, device.getDisplayHeight()/2+90, 10);
          click(By.desc("+ Точка"));
        }
        click(By.desc("Сохранить"));
        assertTrue(device.wait(Until.gone(By.res("android:id/button1")), 8000));
      }
      scenario.recreate(); device.waitForIdle();
      scenario.onActivity(activity -> {
        try (ru.warriorrus.app.data.ObjectStore store = new ru.warriorrus.app.data.ObjectStore(activity)) {
          assertEquals(2,store.all().size());
          assertEquals("route",store.all().get(0).kind); assertEquals("area",store.all().get(1).kind);
          MapView map = (MapView) type(activity.getWindow().getDecorView(), MapView.class);
          assertEquals(1,map.getOverlays().stream().filter(o -> o instanceof org.osmdroid.views.overlay.Polygon).count());
          assertEquals(1,map.getOverlays().stream().filter(o -> o instanceof org.osmdroid.views.overlay.Polyline).count());
        }
      });
      device.executeShellCommand("mkdir -p /data/local/tmp/rabochaya-screens");
      capture("manual-route-area");
    }
  }

  @Test public void pendingPropertiesAndEditorPropertiesSurviveRecreation() throws Exception {
    android.content.Context context=InstrumentationRegistry.getInstrumentation().getTargetContext();
    context.deleteDatabase("warrior2.db");context.getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).putInt("compassMode",0).commit();
    try(ActivityScenario<MainActivity> scenario=ActivityScenario.launch(MainActivity.class)){
      click(By.desc("Действия в центре карты"));click(By.text("Новая метка…"));click(By.text("Путь"));
      UiObject2 name=device.wait(Until.findObject(By.clazz(EditText.class)),8000);assertNotNull(name);name.setText("До поворота");
      scenario.recreate();device.waitForIdle();name=device.wait(Until.findObject(By.clazz(EditText.class)),8000);
      assertNotNull(name);assertEquals("До поворота",name.getText());
      dismissKeyboard();capture("properties-before-confirm");click(By.res("android:id/button1"));
      assertTrue(device.wait(Until.gone(By.res("android:id/button1")),8000));
      click(By.desc("+ Точка"));click(By.desc("Опции редактора"));click(By.text("Свойства"));
      name=device.wait(Until.findObject(By.clazz(EditText.class)),8000);assertNotNull(name);name.setText("После изменения");
      click(By.res("android:id/button1"));scenario.recreate();device.waitForIdle();scenario.onActivity(this::assertDrawingViewport);
      click(By.desc("Сохранить"));scenario.recreate();device.waitForIdle();
      scenario.onActivity(activity->{try(ru.warriorrus.app.data.ObjectStore store=new ru.warriorrus.app.data.ObjectStore(activity)){
        assertEquals(1,store.all().size());assertEquals("После изменения",store.all().get(0).name);assertEquals(2,ru.warriorrus.app.geometry.Geometry.count(store.all().get(0)));
      }});
      capture("properties-recreated");
    }
  }

  private void assertDrawingViewport(MainActivity activity) {
    View root=activity.getWindow().getDecorView();View editor=root.findViewWithTag("drawingControls");
    View canvas=root.findViewWithTag("mapCanvas"),focus=root.findViewWithTag("mapFocus");
    assertNotNull(editor);assertEquals(editor.getTop(),canvas.getBottom());
    assertEquals(canvas.getTop()+canvas.getHeight()/2f,focus.getY()+focus.getHeight()/2f,2f);
    assertTrue(root.findViewWithTag("bottomPanel").getBottom()<=editor.getTop());
    assertTrue(root.findViewWithTag("zoomControls").getBottom()<=editor.getTop());
  }

  @Test @androidx.test.filters.SdkSuppress(minSdkVersion = 30)
  public void drawModeStatisticsAndSaveRemainUsableAfterRotation() throws Exception {
    android.content.Context context=InstrumentationRegistry.getInstrumentation().getTargetContext();
    context.deleteDatabase("warrior2.db");context.getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).putInt("compassMode",0).commit();
    try(ActivityScenario<MainActivity> scenario=ActivityScenario.launch(MainActivity.class)){
      click(By.desc("Действия в центре карты"));click(By.text("Новая метка…"));click(By.text("Путь"));
      UiObject2 propertiesName=device.wait(Until.findObject(By.clazz(EditText.class)),8000);assertNotNull(propertiesName);propertiesName.setText("Нарисованная линия");click(By.res("android:id/button1"));
      click(By.desc("Рисовать линию"));
      device.swipe(device.getDisplayWidth()/2,device.getDisplayHeight()/3,device.getDisplayWidth()/2+100,device.getDisplayHeight()/3+50,25);device.waitForIdle();
      click(By.desc("Приостановить рисование"));click(By.desc("Свернуть статистику"));click(By.desc("Развернуть статистику"));
      device.setOrientationLeft();device.waitForIdle();
      scenario.onActivity(activity->{View panel=activity.getWindow().getDecorView().findViewWithTag("drawingControls");assertNotNull(panel);assertWithinSafeArea(activity,panel);assertWithinSafeArea(activity,described(panel,"Сохранить"));assertTrue(((EditorPanel)panel).expanded());});
      capture("landscape-drawing-statistics");click(By.desc("Сохранить"));
      assertTrue(device.wait(Until.gone(By.res("android:id/button1")),8000));
      scenario.recreate();device.waitForIdle();
      scenario.onActivity(activity->{try(ru.warriorrus.app.data.ObjectStore store=new ru.warriorrus.app.data.ObjectStore(activity)){assertEquals(1,store.all().size());assertTrue(ru.warriorrus.app.geometry.Geometry.count(store.all().get(0))>2);}});
    }finally{device.setOrientationNatural();device.unfreezeRotation();}
  }

  @Test @androidx.test.filters.SdkSuppress(minSdkVersion = 30)
  public void systemNavigationDoesNotCoverPanelsOrAddButton() throws Exception {
    android.content.Context context = InstrumentationRegistry.getInstrumentation().getTargetContext();
    context.getSharedPreferences("MainActivity", 0).edit().clear().putBoolean("mapOnline", false).commit();
    device.executeShellCommand("mkdir -p /data/local/tmp/rabochaya-screens");
    try (ActivityScenario<MainActivity> scenario = ActivityScenario.launch(MainActivity.class)) {
      for (int orientation = 0; orientation < 2; orientation++) {
        if (orientation == 0) device.setOrientationNatural(); else device.setOrientationLeft();
        device.waitForIdle();
        String prefix = orientation == 0 ? "portrait" : "landscape";
        scenario.onActivity(activity -> assertWithinSafeArea(activity,
            activity.getWindow().getDecorView().findViewWithTag("bottomPanel")));
        capture(prefix + "-map");
        String[] labels = {"Меню", "Слои", "Карты и слои", "Метки", "Ориентирование"};
        String[] fields = {"menuDialog", "layersDialog", "mapsDialog", "explorerDialog", "orientationDialog"};
        for (int index = 0; index < labels.length; index++) {
          if(labels[index].equals("Слои")){click(By.desc("Карты и слои"));click(By.desc("Карты на экране"));}
          else {click(By.desc(labels[index]));if(labels[index].equals("Метки"))click(By.desc("Все метки"));}
          final String fieldName = fields[index];
          scenario.onActivity(activity -> {
            try {
              java.lang.reflect.Field field = MainActivity.class.getDeclaredField(fieldName);
              field.setAccessible(true);
              android.app.Dialog dialog = (android.app.Dialog) field.get(activity);
              View host = dialog.getWindow().getDecorView().findViewWithTag("dialogSafeArea");
              assertNotNull(host);
              assertWithinSafeArea(activity, ((ViewGroup) host).getChildAt(0));
              if (fieldName.equals("explorerDialog"))
                assertWithinSafeArea(activity, described(host, "Создать объект"));
            } catch (ReflectiveOperationException error) { throw new AssertionError(error); }
          });
          capture(prefix + "-" + fieldName);
          if (fieldName.equals("explorerDialog")) {
            click(By.desc("Создать объект"));
            assertNotNull(device.wait(Until.findObject(By.text("Метка")), 8000));
            device.pressBack();
            device.waitForIdle();
          }
          device.pressBack();
          device.waitForIdle();
        }
        click(By.desc("Меню")); click(By.desc("Настройки"));
        scenario.onActivity(activity -> {
          try {
            java.lang.reflect.Field field=MainActivity.class.getDeclaredField("settingsDialog");field.setAccessible(true);
            android.app.Dialog dialog=(android.app.Dialog)field.get(activity);
            ViewGroup host=(ViewGroup)dialog.getWindow().getDecorView().findViewWithTag("dialogSafeArea");
            assertWithinSafeArea(activity,host.getChildAt(0));
          }catch(ReflectiveOperationException error){throw new AssertionError(error);}
        });
        capture(prefix+"-settings");device.pressBack();device.waitForIdle();
      }
    } finally {
      device.setOrientationNatural();
      device.unfreezeRotation();
    }
  }

  @Test public void localMediaKmzHistoryAndOfflineRasterOnRealAndroid() throws Exception {
    android.content.Context context=InstrumentationRegistry.getInstrumentation().getTargetContext();context.deleteDatabase("warrior2.db");
    context.getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).putInt("compassMode",0).commit();
    android.graphics.Bitmap image=android.graphics.Bitmap.createBitmap(256,256,android.graphics.Bitmap.Config.ARGB_8888);image.eraseColor(0xff1565c0);
    java.io.ByteArrayOutputStream data=new java.io.ByteArrayOutputStream();image.compress(android.graphics.Bitmap.CompressFormat.PNG,100,data);image.recycle();byte[] png=data.toByteArray();
    long original;String mediaKey;
    try(ru.warriorrus.app.data.ObjectStore store=new ru.warriorrus.app.data.ObjectStore(context)){
      original=store.create(0,"Photo point","point",55,37);ru.warriorrus.app.data.MapItem item=store.get(original);item.description="Local photo and note";
      ru.warriorrus.app.data.Attachment photo=new ru.warriorrus.app.media.LocalMedia(context).add(new java.io.ByteArrayInputStream(png),"Photo.png","image/png");mediaKey=photo.key;item.attachments.add(photo);store.save(item);
      java.io.ByteArrayOutputStream kmz=new java.io.ByteArrayOutputStream();ru.warriorrus.app.exchange.BundleExchange.write(context,store.all(),kmz,"kmz");
      boolean icon=false;try(java.util.zip.ZipInputStream zip=new java.util.zip.ZipInputStream(new java.io.ByteArrayInputStream(kmz.toByteArray()))){java.util.zip.ZipEntry entry;while((entry=zip.getNextEntry())!=null)if(entry.getName().endsWith(".png")&&entry.getName().startsWith("icons/")){byte[] bytes=ru.warriorrus.app.exchange.PlacemarkFiles.bounded(zip,1024*1024);android.graphics.Bitmap rendered=android.graphics.BitmapFactory.decodeByteArray(bytes,0,bytes.length);assertNotNull(rendered);rendered.recycle();icon=true;}}assertTrue(icon);
      java.util.List<ru.warriorrus.app.data.MapItem> back=ru.warriorrus.app.exchange.BundleExchange.read(context,new java.io.ByteArrayInputStream(kmz.toByteArray()));assertEquals(1,back.size());assertEquals("Local photo and note",back.get(0).description);assertEquals(1,back.get(0).attachments.size());
      store.importItems(back,0);store.delete(java.util.Collections.singleton(original));assertNull(store.get(original));
    }
    try(ru.warriorrus.app.data.ObjectStore store=new ru.warriorrus.app.data.ObjectStore(context)){assertTrue(store.canUndo());store.undo();assertNotNull(store.get(original));assertTrue(new ru.warriorrus.app.media.LocalMedia(context).resolve(mediaKey).isFile());}
    java.io.File dir=new java.io.File(context.getFilesDir(),"maps");dir.mkdirs();java.io.File file=new java.io.File(dir,"native-"+java.util.UUID.randomUUID()+".mbtiles");
    try(android.database.sqlite.SQLiteDatabase db=android.database.sqlite.SQLiteDatabase.openOrCreateDatabase(file,null)){
      ru.warriorrus.app.map.RasterMaps.createMbtiles(db,"Blue offline test");android.content.ContentValues tile=new android.content.ContentValues();tile.put("zoom_level",0);tile.put("tile_column",0);tile.put("tile_row",0);tile.put("tile_data",png);db.insertOrThrow("tiles",null,tile);
    }
    try(ActivityScenario<MainActivity> scenario=ActivityScenario.launch(MainActivity.class)){
      scenario.onActivity(activity->{try{java.lang.reflect.Field field=MainActivity.class.getDeclaredField("catalog");field.setAccessible(true);ru.warriorrus.app.map.MapCatalog catalog=(ru.warriorrus.app.map.MapCatalog)field.get(activity);catalog.find("osm").visible=false;catalog.addOffline(file,"Blue offline test",0,0);catalog.save();catalog.updateAppearance();MapView map=(MapView)type(activity.getWindow().getDecorView(),MapView.class);map.getController().setCenter(new org.osmdroid.util.GeoPoint(0,0));map.getController().setZoom(0.0);map.invalidate();assertFalse(map.useDataConnection());}catch(Exception error){throw new AssertionError(error);}});
      int[] pixel=new int[2];scenario.onActivity(activity->{MapView map=(MapView)type(activity.getWindow().getDecorView(),MapView.class);map.getLocationOnScreen(pixel);pixel[0]+=map.getWidth()/2+30;pixel[1]+=map.getHeight()/2;});
      boolean visible=false;
      for(int attempt=0;attempt<40&&!visible;attempt++){
        android.os.SystemClock.sleep(200);android.graphics.Bitmap screen=InstrumentationRegistry.getInstrumentation().getUiAutomation().takeScreenshot();
        if(screen!=null){visible=screen.getPixel(pixel[0],pixel[1])==0xff1565c0;screen.recycle();}
      }
      assertTrue("Imported MBTiles must render actual raster pixels on the device screen",visible);capture("offline-mbtiles");
      scenario.onActivity(activity->{MapView map=(MapView)type(activity.getWindow().getDecorView(),MapView.class);map.getController().setZoom(14.0);map.getController().setCenter(new org.osmdroid.util.GeoPoint(0.0,1.0));});device.waitForIdle();
      scenario.onActivity(activity->{try{java.lang.reflect.Field field=MainActivity.class.getDeclaredField("mapTools");field.setAccessible(true);ru.warriorrus.app.map.MapTools tools=(ru.warriorrus.app.map.MapTools)field.get(activity);tools.start(new ru.warriorrus.app.data.Vertex(0,0));assertEquals(111195,tools.previewLength(),50);tools.add();tools.finish();}catch(Exception error){throw new AssertionError(error);}});
      scenario.recreate();device.waitForIdle();
    }
  }

  private void dismissKeyboard(){
    BySelector keyboard=By.pkg(java.util.regex.Pattern.compile(".*inputmethod.*"));
    if(device.hasObject(keyboard)){device.pressBack();assertTrue("Keyboard did not close",device.wait(Until.gone(keyboard),8000));device.waitForIdle();}
  }

  private void capture(String name) throws Exception {
    device.executeShellCommand("mkdir -p /data/local/tmp/rabochaya-screens");
    device.executeShellCommand("screencap -p /data/local/tmp/rabochaya-screens/" + name + ".png");
  }

  @Test @androidx.test.filters.SdkSuppress(minSdkVersion=30)
  public void timestampPlaybackSurvivesRotationAndNeverChangesImportedTrack() throws Exception {
    android.content.Context context=InstrumentationRegistry.getInstrumentation().getTargetContext();context.deleteDatabase("warrior2.db");context.getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).putInt("primaryCoordinates",5).putInt("distanceUnits",2).putInt("angleUnits",6).commit();
    final long id;final String original;
    try(ru.warriorrus.app.data.ObjectStore store=new ru.warriorrus.app.data.ObjectStore(context)){
      ru.warriorrus.app.data.MapItem item=new ru.warriorrus.app.data.MapItem();item.name="Synthetic timed track";item.kind="track";item.latitude=55.75;item.longitude=37.62;item.visible=true;item.opacity=1;item.color=0xff3da5ff;
      item.segments.add(java.util.Arrays.asList(new ru.warriorrus.app.data.Vertex(55.75,37.62,100.0,"2024-01-01T00:00:00Z"),new ru.warriorrus.app.data.Vertex(55.76,37.64,120.0,"2024-01-01T00:02:00Z")));id=store.save(item);original=ru.warriorrus.app.geometry.Geometry.encode(item.segments);
    }
    device.executeShellCommand("mkdir -p /data/local/tmp/rabochaya-screens");
    try(ActivityScenario<MainActivity> scenario=ActivityScenario.launch(MainActivity.class)){
      click(By.desc("Метки"));click(By.desc("Время движения по треку"));
      scenario.onActivity(a->{android.widget.SeekBar seek=a.getWindow().getDecorView().findViewWithTag("timelineSeek");assertNotNull(seek);android.os.Bundle args=new android.os.Bundle();args.putFloat(android.view.accessibility.AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE,5000);assertTrue(seek.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS.getId(),args));});device.waitForIdle();
      for(int orientation=0;orientation<2;orientation++){
        if(orientation==0)device.setOrientationNatural();else device.setOrientationLeft();device.waitForIdle();
        scenario.onActivity(a->{try{java.lang.reflect.Field field=MainActivity.class.getDeclaredField("timeline");field.setAccessible(true);ru.warriorrus.app.geometry.TimelineController time=(ru.warriorrus.app.geometry.TimelineController)field.get(a);assertTrue(time.model.active);assertEquals(5000,time.model.progress());View controls=a.getWindow().getDecorView().findViewWithTag("timelineControls");assertWithinSafeArea(a,controls);assertTrue("Restored time panel must retain room for controls",controls.getHeight()>140*a.getResources().getDisplayMetrics().density);try(ru.warriorrus.app.data.ObjectStore store=new ru.warriorrus.app.data.ObjectStore(a)){assertEquals(original,ru.warriorrus.app.geometry.Geometry.encode(store.get(id).segments));assertEquals(37.63,time.model.head(store.get(id)).longitude,1e-6);}}catch(ReflectiveOperationException e){throw new AssertionError(e);}});
        capture(orientation==0?"time-portrait":"time-landscape");
      }
      click(By.desc("В начало"));click(By.desc("Воспроизвести"));
      java.util.concurrent.atomic.AtomicInteger playbackProgress=new java.util.concurrent.atomic.AtomicInteger();
      long playbackDeadline=android.os.SystemClock.uptimeMillis()+8000;
      do{
        scenario.onActivity(a->{try{java.lang.reflect.Field f=MainActivity.class.getDeclaredField("timeline");f.setAccessible(true);playbackProgress.set(((ru.warriorrus.app.geometry.TimelineController)f.get(a)).model.progress());}catch(ReflectiveOperationException e){throw new AssertionError(e);}});
        if(playbackProgress.get()==10000)break;
        Thread.sleep(50);
      }while(android.os.SystemClock.uptimeMillis()<playbackDeadline);
      assertEquals(10000,playbackProgress.get());
      scenario.onActivity(a->{try{java.lang.reflect.Field f=MainActivity.class.getDeclaredField("timeline");f.setAccessible(true);assertEquals(10000,((ru.warriorrus.app.geometry.TimelineController)f.get(a)).model.progress());}catch(ReflectiveOperationException e){throw new AssertionError(e);}});
      click(By.desc("Закрыть контроль времени"));scenario.onActivity(a->assertNull(a.getWindow().getDecorView().findViewWithTag("timelineControls")));
      try(ru.warriorrus.app.data.ObjectStore store=new ru.warriorrus.app.data.ObjectStore(context)){assertEquals(original,ru.warriorrus.app.geometry.Geometry.encode(store.get(id).segments));}
    }finally{device.setOrientationNatural();device.unfreezeRotation();}
  }

  @android.annotation.TargetApi(30)
  private void assertWithinSafeArea(MainActivity activity, View view) {
    assertNotNull(view);
    android.view.WindowMetrics metrics = activity.getWindowManager().getCurrentWindowMetrics();
    android.graphics.Rect safe = new android.graphics.Rect(metrics.getBounds());
    android.graphics.Insets bars = metrics.getWindowInsets().getInsets(
        android.view.WindowInsets.Type.systemBars() | android.view.WindowInsets.Type.displayCutout());
    safe.left += bars.left; safe.top += bars.top;
    safe.right -= bars.right; safe.bottom -= bars.bottom;
    int[] point = new int[2];
    view.getLocationOnScreen(point);
    android.graphics.Rect actual = new android.graphics.Rect(point[0], point[1],
        point[0] + view.getWidth(), point[1] + view.getHeight());
    assertTrue("Control " + actual + " overlaps Android system area outside " + safe,
        safe.contains(actual));
  }

  private View described(View view, String description) {
    if (description.equals(view.getContentDescription())) return view;
    if (view instanceof ViewGroup) {
      ViewGroup group = (ViewGroup) view;
      for (int n = 0; n < group.getChildCount(); n++) {
        View found = described(group.getChildAt(n), description);
        if (found != null) return found;
      }
    }
    return null;
  }

  private int markerCount(MainActivity activity) {
    MapView map = (MapView) type(activity.getWindow().getDecorView(), MapView.class);
    int count = 0;
    for (Object overlay : map.getOverlays()) if (overlay instanceof Marker) count++;
    return count;
  }

  private View type(View root, Class<?> cls) {
    if (cls.isInstance(root)) return root;
    if (root instanceof ViewGroup) {
      ViewGroup group = (ViewGroup) root;
      for (int n = 0; n < group.getChildCount(); n++) {
        View found = type(group.getChildAt(n), cls);
        if (found != null) return found;
      }
    }
    return null;
  }
}
