package ru.warriorrus.app;

import android.app.Dialog;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

/** Real Android widgets rendered offline in both phone orientations for layout review. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, qualifiers = "w360dp-h800dp-port-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class WorkspaceRenderTest {
  @Test public void portrait() throws Exception { render("portrait", 360, 800); }

  @Test @Config(qualifiers = "w800dp-h360dp-land-mdpi")
  public void landscape() throws Exception { render("landscape", 800, 360); }

  private void render(String name, int width, int height) throws Exception {
    RuntimeEnvironment.getApplication().getSharedPreferences("MainActivity", 0).edit().clear().commit();
    RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");
    try (ru.warriorrus.app.data.ObjectStore store = new ru.warriorrus.app.data.ObjectStore(RuntimeEnvironment.getApplication())) {
      store.create(0, "Полевой выход", "folder", 0, 0);
      store.create(0, "Точка 1", "point", 55.75, 37.62);
      store.create(0, "Точка 2", "point", 55.76, 37.63);
    }
    try (ActivityController<MainActivity> controller = Robolectric.buildActivity(MainActivity.class).setup().visible()) {
      View root = controller.get().getWindow().getDecorView();
      org.osmdroid.views.MapView map = (org.osmdroid.views.MapView) type(root, org.osmdroid.views.MapView.class);
      map.setUseDataConnection(false);
      snapshot(root, name + "-map", width, height);
      root.findViewWithTag("Меню").performClick();
      Dialog menu = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      snapshot(menu.getWindow().getDecorView(), name + "-menu", width, height);
      menu.dismiss();
      java.lang.reflect.Method settingsMethod = MainActivity.class.getDeclaredMethod("settingsMenu");
      settingsMethod.setAccessible(true); settingsMethod.invoke(controller.get());
      Dialog settings = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      snapshot(settings.getWindow().getDecorView(), name + "-settings", width, height);
      settings.dismiss();
      root.findViewWithTag("Карты").performClick();
      ((View) org.robolectric.shadows.ShadowDialog.getLatestDialog().getWindow().getDecorView().findViewWithTag("displayedMaps")).performClick();
      Dialog layers = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      snapshot(layers.getWindow().getDecorView(), name + "-layers", Math.min(360, width - 16), 250);
      layers.dismiss();
      root.findViewWithTag("Карты").performClick();
      Dialog maps = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      snapshot(maps.getWindow().getDecorView(), name + "-maps", width, height);
      maps.dismiss();
      root.findViewWithTag("Объекты").performLongClick();
      Dialog objects = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      snapshot(objects.getWindow().getDecorView(), name + "-objects", Math.min(640, width - 16), height - 24);
      objects.dismiss();
      java.lang.reflect.Method compassMethod=MainActivity.class.getDeclaredMethod("showCompass");compassMethod.setAccessible(true);compassMethod.invoke(controller.get());
      org.robolectric.shadows.ShadowDialog.getLatestDialog().dismiss();
      ru.warriorrus.app.map.CompassDial dial=root.findViewWithTag("compassDial");dial.ready=true;dial.heading=35;dial.topo=false;
      snapshot(root,name+"-compass-standard",width,height);
      dial.topo=true;dial.invalidate();snapshot(root,name+"-compass-topochaix",width,height);
      java.lang.reflect.Method closeCompass=MainActivity.class.getDeclaredMethod("closeCompass");closeCompass.setAccessible(true);closeCompass.invoke(controller.get());
      java.lang.reflect.Field drawingField=MainActivity.class.getDeclaredField("drawing");drawingField.setAccessible(true);
      ru.warriorrus.app.geometry.DrawingController drawing=(ru.warriorrus.app.geometry.DrawingController)drawingField.get(controller.get());
      drawing.start(null,"path",0,new org.osmdroid.util.GeoPoint(55.75,37.62));drawing.add(new org.osmdroid.util.GeoPoint(55.76,37.63));
      EditorPanel editor=root.findViewWithTag("drawingControls");editor.expanded(true);
      snapshot(root,name+"-drawing",width,height);drawing.cancel();
      java.lang.reflect.Field toolsField=MainActivity.class.getDeclaredField("mapTools");toolsField.setAccessible(true);
      ru.warriorrus.app.map.MapTools tools=(ru.warriorrus.app.map.MapTools)toolsField.get(controller.get());
      tools.start(new ru.warriorrus.app.data.Vertex(55.75,37.62));
      ((EditorPanel)root.findViewWithTag("measureControls")).expanded(true);
      snapshot(root,name+"-measurement",width,height);tools.finish();
    }
  }

  private void snapshot(View root, String name, int width, int height) throws Exception {
    root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
    root.layout(0, 0, width, height);
    org.robolectric.shadows.ShadowLooper.idleMainLooper();
    root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
    root.layout(0, 0, width, height);
    Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
    root.draw(new Canvas(bitmap));
    File file = new File("build/reports/ui/" + name + ".png");
    file.getParentFile().mkdirs();
    try (FileOutputStream output = new FileOutputStream(file)) {
      if (!bitmap.compress(Bitmap.CompressFormat.PNG, 100, output)) throw new AssertionError("PNG encoding failed");
    }
    bitmap.recycle();
  }

  private View type(View view, Class<?> cls) {
    if (cls.isInstance(view)) return view;
    if (view instanceof ViewGroup) {
      ViewGroup group = (ViewGroup) view;
      for (int i = 0; i < group.getChildCount(); i++) {
        View result = type(group.getChildAt(i), cls);
        if (result != null) return result;
      }
    }
    return null;
  }
}
