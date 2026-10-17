package ru.warriorrus.app;

import static org.junit.Assert.*;

import android.app.*;
import android.view.*;
import android.widget.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.map.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {23, 35})
public class MapUiTest {
  @Before
  public void cleanFixture() {
    RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");
    RuntimeEnvironment.getApplication().getSharedPreferences("MainActivity", 0).edit().clear().commit();
  }

  @Test
  public void fullMapCompactMenusAndGridToggle() {
    try (ActivityController<MainActivity> c =
        Robolectric.buildActivity(MainActivity.class).setup()) {
      MainActivity a = c.get();
      org.osmdroid.views.MapView map =
          (org.osmdroid.views.MapView)
              findType(a.getWindow().getDecorView(), org.osmdroid.views.MapView.class);
      assertTrue(map.getParent() instanceof FrameLayout);
      assertEquals(-1, map.getLayoutParams().width);
      assertEquals(-1, map.getLayoutParams().height);
      assertNull(find(a.getWindow().getDecorView(), "Warrior Explorer"));
      find(a.getWindow().getDecorView(), "Объекты").performClick();
      AlertDialog d = org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
      assertEquals(5, d.getListView().getAdapter().getCount());
      assertEquals("Метки на экране", d.getListView().getAdapter().getItem(4));
      d.dismiss();
      find(a.getWindow().getDecorView(), "Меню").performClick();
      Dialog menu = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      find(menu.getWindow().getDecorView(), "Настройки").performClick();
      d = org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
      item(d, 0);
      assertTrue(map.getOverlays().stream().anyMatch(o -> o instanceof CoordinateGrid));
      find(a.getWindow().getDecorView(), "Меню").performClick();
      menu = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      find(menu.getWindow().getDecorView(), "Настройки").performClick();
      item(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog(), 0);
      assertFalse(map.getOverlays().stream().anyMatch(o -> o instanceof CoordinateGrid));
    }
  }

  @Test
  public void restartPreservesDatabaseAndIconFiles() throws Exception {
    android.content.Context context = RuntimeEnvironment.getApplication();
    long id;
    try (ObjectStore s = new ObjectStore(context)) {
      id = s.create(0, "Existing", "point", 55.7, 37.6);
      s.assignIcon(Collections.singleton(id), "user.svg", 0xff123456);
    }
    java.io.File file = new java.io.File(context.getFilesDir(), "user-retained.svg");
    try (java.io.FileOutputStream out = new java.io.FileOutputStream(file)) {
      out.write("retained".getBytes("UTF-8"));
    }
    try (ActivityController<MainActivity> c =
        Robolectric.buildActivity(MainActivity.class).setup()) {
      find(c.get().getWindow().getDecorView(), "Объекты").performClick();
      item(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog(), 0);
      Dialog explorer = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      find(explorer.getWindow().getDecorView(), "Вид").performClick();
      assertNotNull(find(explorer.getWindow().getDecorView(), "● Existing\n55.70000, 37.60000"));
    }
    try (ActivityController<MainActivity> c =
            Robolectric.buildActivity(MainActivity.class).setup();
        ObjectStore s = new ObjectStore(context)) {
      assertEquals("Existing", s.get(id).name);
      assertEquals("user.svg", s.get(id).icon);
      assertEquals(0xff123456, s.get(id).color);
      assertEquals(2, s.getReadableDatabase().getVersion());
      assertTrue(file.exists());
    }
  }

  @Test
  public void gridBoundsAreFiniteAndCrossDateLine() {
    assertTrue(CoordinateGrid.lines(10, 10).isEmpty());
    assertTrue(CoordinateGrid.lines(Double.NaN, 10).isEmpty());
    assertTrue(CoordinateGrid.lines(-90, 90).size() <= 32);
    assertEquals(181, CoordinateGrid.east(179, -179), 0);
    assertTrue(CoordinateGrid.contains(-5, 5, 179, -179, 0, -179.5));
    assertTrue(CoordinateGrid.contains(-5, 5, 179, -179, 0, 179.5));
    assertFalse(CoordinateGrid.contains(-5, 5, 179, -179, 0, 0));
  }

  @Test
  public void collapsedToolbarKeepsActionsAndSurvivesRestart() {
    try (ActivityController<MainActivity> c = Robolectric.buildActivity(MainActivity.class).setup()) {
      View root = c.get().getWindow().getDecorView();
      described(root, "Свернуть или раскрыть панель инструментов").performClick();
      Button objects = (Button) root.findViewWithTag("Объекты");
      assertEquals("", objects.getText().toString());
      assertNotNull(objects.getCompoundDrawablesRelative()[1]);
      objects.performClick();
      assertTrue(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog().isShowing());
      org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog().dismiss();
      described(root, "Свернуть или раскрыть координаты").performClick();
      assertEquals(View.GONE, root.findViewWithTag("coordinateDetails").getVisibility());
    }
    try (ActivityController<MainActivity> c = Robolectric.buildActivity(MainActivity.class).setup()) {
      View root = c.get().getWindow().getDecorView();
      assertEquals("", ((Button) root.findViewWithTag("Объекты")).getText().toString());
      assertEquals(View.GONE, root.findViewWithTag("coordinateDetails").getVisibility());
      described(root, "Свернуть или раскрыть панель инструментов").performClick();
      assertEquals("Объекты", ((Button) root.findViewWithTag("Объекты")).getText().toString());
    }
  }

  @Test
  public void twoPointsCreatedThroughUiStayVisibleAndMapLayersDoNotContainObjects() {
    try (ActivityController<MainActivity> c = Robolectric.buildActivity(MainActivity.class).setup()) {
      View root = c.get().getWindow().getDecorView();
      for (int n = 1; n <= 2; n++) {
        described(root, "Действия в центре карты").performClick();
        item(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog(), 0);
        AlertDialog editor = org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
        ((EditText) findType(editor.getWindow().getDecorView(), EditText.class)).setText("Point " + n);
        editor.getButton(-1).performClick();
        assertFalse(editor.isShowing());
      }
      org.osmdroid.views.MapView map = (org.osmdroid.views.MapView) findType(root, org.osmdroid.views.MapView.class);
      assertEquals(2, map.getOverlays().stream().filter(o -> o instanceof org.osmdroid.views.overlay.Marker).count());
      find(root, "Слои").performClick();
      Dialog layers = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      View layerRoot = layers.getWindow().getDecorView();
      assertNotNull(find(layerRoot, "Слои карт"));
      assertNull(find(layerRoot, "● Point 1"));
      Switch visible = (Switch) find(layerRoot, "OpenStreetMap");
      visible.setChecked(false);
      assertFalse(map.getOverlayManager().getTilesOverlay().isEnabled());
      SeekBar opacity = (SeekBar) findType(layerRoot, SeekBar.class);
      opacity.setProgress(40);
      assertEquals(2, map.getOverlays().stream().filter(o -> o instanceof org.osmdroid.views.overlay.Marker).count());
    }
    try (ActivityController<MainActivity> c = Robolectric.buildActivity(MainActivity.class).setup();
        ObjectStore store = new ObjectStore(c.get())) {
      org.osmdroid.views.MapView map = (org.osmdroid.views.MapView) findType(c.get().getWindow().getDecorView(), org.osmdroid.views.MapView.class);
      assertEquals(2, store.all().size());
      assertEquals(2, map.getOverlays().stream().filter(o -> o instanceof org.osmdroid.views.overlay.Marker).count());
      assertFalse(map.getOverlayManager().getTilesOverlay().isEnabled());
      find(c.get().getWindow().getDecorView(), "Слои").performClick();
      Dialog layers = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      assertNotNull(find(layers.getWindow().getDecorView(), "Непрозрачность: 40%"));
    }
  }

  private View described(View view, String text) {
    if (text.equals(view.getContentDescription())) return view;
    if (view instanceof ViewGroup) {
      ViewGroup group = (ViewGroup) view;
      for (int i = 0; i < group.getChildCount(); i++) {
        View result = described(group.getChildAt(i), text);
        if (result != null) return result;
      }
    }
    return null;
  }

  private void item(AlertDialog d, int n) {
    d.getListView()
        .performItemClick(d.getListView().getAdapter().getView(n, null, d.getListView()), n, n);
  }

  private View find(View v, String text) {
    if (v instanceof TextView && ((TextView) v).getText().toString().equals(text)) return v;
    if (v instanceof ViewGroup) {
      ViewGroup g = (ViewGroup) v;
      for (int n = 0; n < g.getChildCount(); n++) {
        View found = find(g.getChildAt(n), text);
        if (found != null) return found;
      }
    }
    return null;
  }

  private View findType(View v, Class<?> type) {
    if (type.isInstance(v)) return v;
    if (v instanceof ViewGroup) {
      ViewGroup g = (ViewGroup) v;
      for (int n = 0; n < g.getChildCount(); n++) {
        View found = findType(g.getChildAt(n), type);
        if (found != null) return found;
      }
    }
    return null;
  }
}
