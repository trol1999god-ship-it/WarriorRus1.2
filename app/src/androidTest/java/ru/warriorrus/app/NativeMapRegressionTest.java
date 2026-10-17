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
        click(By.text("Сохранить"));
        assertTrue(device.wait(Until.gone(By.text("Сохранить")), 8000));
        click(By.desc("Увеличить"));
        click(By.desc("Уменьшить"));
        device.swipe(device.getDisplayWidth() / 2, device.getDisplayHeight() / 2,
            device.getDisplayWidth() / 2 + 40, device.getDisplayHeight() / 2 + 15, 8);
        device.waitForIdle();
      }
      scenario.onActivity(activity -> assertEquals(8, markerCount(activity)));
      click(By.desc("Свернуть или раскрыть координаты"));
      click(By.desc("Свернуть или раскрыть панель инструментов"));
      click(By.desc("Свернуть или раскрыть правую панель"));
      device.waitForIdle();
      scenario.onActivity(activity -> {
        View root = activity.getWindow().getDecorView();
        float density = activity.getResources().getDisplayMetrics().density;
        assertEquals(Math.round(48 * density), root.findViewWithTag("coordinatePanel").getWidth());
        assertEquals(View.GONE, root.findViewWithTag("coordinateDetails").getVisibility());
        assertEquals(Math.round(240 * density), root.findViewWithTag("bottomPanel").getWidth());
      });
      scenario.recreate();
      device.waitForIdle();
      scenario.onActivity(activity -> assertEquals(8, markerCount(activity)));
      click(By.desc("Свернуть или раскрыть правую панель"));
      click(By.desc("Увеличить"));
      click(By.desc("Свернуть или раскрыть координаты"));
      click(By.desc("Свернуть или раскрыть панель инструментов"));
      click(By.desc("Объекты"));
      assertNotNull(device.wait(Until.findObject(By.text("Объекты карты")), 8000));
    }
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
