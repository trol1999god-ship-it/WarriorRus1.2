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
      click(By.desc("Объекты"));
      assertNotNull(device.wait(Until.findObject(By.text("Объекты карты")), 8000));
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
        String[] labels = {"Меню", "Слои", "Карты", "Объекты"};
        String[] fields = {"menuDialog", "layersDialog", "mapsDialog", "explorerDialog"};
        for (int index = 0; index < labels.length; index++) {
          click(By.desc(labels[index]));
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
      }
    } finally {
      device.setOrientationNatural();
      device.unfreezeRotation();
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
