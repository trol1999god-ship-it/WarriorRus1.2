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

  private void click(BySelector selector) {
    UiObject2 object = device.wait(Until.findObject(selector), 8000);
    assertNotNull("Missing UI control: " + selector, object);
    object.click();
    device.waitForIdle();
  }

  @Test public void repeatedMarkerCreationDrawingRecreationAndPanelTouches() throws Exception {
    android.content.Context context = InstrumentationRegistry.getInstrumentation().getTargetContext();
    context.deleteDatabase("warrior2.db");
    context.getSharedPreferences("MainActivity", 0).edit().clear().putBoolean("mapOnline", false).commit();
    try (ActivityScenario<MainActivity> scenario = ActivityScenario.launch(MainActivity.class)) {
      for (int n = 1; n <= 8; n++) {
        click(By.desc("Действия в центре карты"));
        click(By.text("Создать метку"));
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
      click(By.desc("Свернуть или раскрыть координаты"));
      click(By.desc("Свернуть или раскрыть правую панель"));
      device.waitForIdle();
      scenario.onActivity(activity -> {
        View root = activity.getWindow().getDecorView();
        float density = activity.getResources().getDisplayMetrics().density;
        assertEquals(Math.round(48 * density), root.findViewWithTag("coordinatePanel").getWidth());
        assertEquals(View.GONE, root.findViewWithTag("coordinateDetails").getVisibility());
        assertEquals(Math.round(192 * density), root.findViewWithTag("bottomPanel").getWidth());
      });
      scenario.recreate();
      device.waitForIdle();
      scenario.onActivity(activity -> assertEquals(8, markerCount(activity)));
      click(By.desc("Свернуть или раскрыть правую панель"));
      click(By.desc("Увеличить"));
      click(By.desc("Свернуть или раскрыть координаты"));
      click(By.desc("Метки"));click(By.desc("Проводник меток"));
      assertNotNull(device.wait(Until.findObject(By.text("Объекты карты")), 8000));
    }
  }

  @Test public void manualGeometryCreationDrawingAndRestart() throws Exception {
    android.content.Context context = InstrumentationRegistry.getInstrumentation().getTargetContext();
    context.deleteDatabase("warrior2.db");
    context.getSharedPreferences("MainActivity", 0).edit().clear().putBoolean("mapOnline", false).commit();
    try (ActivityScenario<MainActivity> scenario = ActivityScenario.launch(MainActivity.class)) {
      for (String kind : new String[]{"Создать маршрут", "Создать область"}) {
        click(By.desc("Действия в центре карты")); click(By.text(kind));
        device.swipe(device.getDisplayWidth()/2, device.getDisplayHeight()/2,
            device.getDisplayWidth()/2+100, device.getDisplayHeight()/2+60, 10);
        click(By.desc("+ Точка"));
        if (kind.equals("Создать область")) {
          device.swipe(device.getDisplayWidth()/2, device.getDisplayHeight()/2,
              device.getDisplayWidth()/2-50, device.getDisplayHeight()/2+90, 10);
          click(By.desc("+ Точка"));
        }
        click(By.desc("Сохранить"));
        UiObject2 name = device.wait(Until.findObject(By.clazz(EditText.class)), 8000);
        assertNotNull(name); name.setText(kind); click(By.res("android:id/button1"));
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
        String[] labels = {"Меню", "Слои", "Карты и слои", "Метки", "Ориентация"};
        String[] fields = {"menuDialog", "layersDialog", "mapsDialog", "explorerDialog", "orientationDialog"};
        for (int index = 0; index < labels.length; index++) {
          if(labels[index].equals("Слои")){click(By.desc("Карты и слои"));click(By.desc("Отображаемые карты"));}
          else {click(By.desc(labels[index]));if(labels[index].equals("Метки"))click(By.desc("Проводник меток"));}
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
            assertNotNull(device.wait(Until.findObject(By.text("Метка в центре карты")), 8000));
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
    context.getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).commit();
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
      boolean[] visible={false};
      for(int attempt=0;attempt<40&&!visible[0];attempt++){
        android.os.SystemClock.sleep(200);scenario.onActivity(activity->{MapView map=(MapView)type(activity.getWindow().getDecorView(),MapView.class);android.graphics.Bitmap rendered=android.graphics.Bitmap.createBitmap(map.getWidth(),map.getHeight(),android.graphics.Bitmap.Config.ARGB_8888);map.draw(new android.graphics.Canvas(rendered));visible[0]=rendered.getPixel(map.getWidth()/2+30,map.getHeight()/2)==0xff1565c0;rendered.recycle();});
      }
      assertTrue("Imported MBTiles must render actual raster pixels offline",visible[0]);capture("offline-mbtiles");
      scenario.onActivity(activity->{MapView map=(MapView)type(activity.getWindow().getDecorView(),MapView.class);map.getController().setZoom(14.0);map.getController().setCenter(new org.osmdroid.util.GeoPoint(0,1));});device.waitForIdle();
      scenario.onActivity(activity->{try{java.lang.reflect.Field field=MainActivity.class.getDeclaredField("mapTools");field.setAccessible(true);ru.warriorrus.app.map.MapTools tools=(ru.warriorrus.app.map.MapTools)field.get(activity);tools.start(new ru.warriorrus.app.data.Vertex(0,0));assertEquals(111195,tools.previewLength(),50);tools.add();tools.finish();}catch(Exception error){throw new AssertionError(error);}});
      scenario.recreate();device.waitForIdle();
    }
  }

  private void capture(String name) throws Exception {
    device.executeShellCommand("screencap -p /data/local/tmp/rabochaya-screens/" + name + ".png");
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
