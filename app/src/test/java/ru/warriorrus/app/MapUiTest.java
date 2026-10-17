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
  private void openLayers(View root) {
    root.findViewWithTag("Карты").performClick();
    Dialog dialog=org.robolectric.shadows.ShadowDialog.getLatestDialog();
    find(dialog.getWindow().getDecorView(),"Карты на экране").performClick();
  }
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
      find(a.getWindow().getDecorView(), "Объекты").performLongClick();
      Dialog objects = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      assertNotNull(find(objects.getWindow().getDecorView(), "Локальные метки"));
      assertNull(objects.getWindow().getDecorView().findViewWithTag("filter:point"));
      objects.dismiss();
      c.get().getPreferences(0).edit().putBoolean("expandedCategory0",true).commit();
      for(boolean expected:new boolean[]{true,false}) {
        find(a.getWindow().getDecorView(),"Меню").performClick();Dialog menu=org.robolectric.shadows.ShadowDialog.getLatestDialog();CheckBox grid=(CheckBox)findType(menu.getWindow().getDecorView(),CheckBox.class);assertNotNull(grid);grid.setChecked(expected);assertEquals(expected,map.getOverlays().stream().anyMatch(o->o instanceof CoordinateGrid));menu.dismiss();
      }
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
      find(c.get().getWindow().getDecorView(), "Объекты").performLongClick();
      Dialog explorer = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      assertNotNull(find(explorer.getWindow().getDecorView(),"Existing"));
    }
    try (ActivityController<MainActivity> c =
            Robolectric.buildActivity(MainActivity.class).setup();
        ObjectStore s = new ObjectStore(context)) {
      assertEquals("Existing", s.get(id).name);
      assertEquals("user.svg", s.get(id).icon);
      assertEquals(0xff123456, s.get(id).color);
      assertEquals(4, s.getReadableDatabase().getVersion());
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

  @Test public void menuHideCommandKeepsMainButtonAndRestoresCategoriesAfterRestart(){
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup()){
      View root=c.get().getWindow().getDecorView();assertNull(root.findViewWithTag("bottomToggle"));Button main=root.findViewWithTag("Меню");main.performLongClick();assertEquals(View.GONE,root.findViewWithTag("Карты").getVisibility());assertEquals(Math.round(48*c.get().getResources().getDisplayMetrics().density),root.findViewWithTag("bottomPanel").getLayoutParams().width);
    }
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup()){
      View root=c.get().getWindow().getDecorView();assertEquals(View.GONE,root.findViewWithTag("Карты").getVisibility());root.findViewWithTag("Меню").performClick();assertEquals(View.VISIBLE,root.findViewWithTag("Карты").getVisibility());assertEquals(Math.round(192*c.get().getResources().getDisplayMetrics().density),root.findViewWithTag("bottomPanel").getLayoutParams().width);
    }
  }
  @Test public void mapControlsUseReferenceLayoutWithoutInheritedCollapseButtons(){
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup()){
      View root=c.get().getWindow().getDecorView();assertNull(root.findViewWithTag("coordinateToggle"));assertNull(root.findViewWithTag("rightToggle"));ViewGroup zoom=root.findViewWithTag("zoomControls");assertEquals(2,zoom.getChildCount());assertEquals("Увеличить",zoom.getChildAt(0).getContentDescription());assertEquals("Уменьшить",zoom.getChildAt(1).getContentDescription());assertEquals(View.VISIBLE,root.findViewWithTag("coordinatePanel").getVisibility());assertNotNull(root.findViewWithTag("mapInfoPanel"));
    }
  }

  @Test
  public void startupAttributionDisappearsAndLicenceRemainsInMaps() {
    try (ActivityController<MainActivity> c = Robolectric.buildActivity(MainActivity.class).setup().visible()) {
      View root = c.get().getWindow().getDecorView();
      View credit = root.findViewWithTag("mapAttribution");
      assertEquals(View.VISIBLE, credit.getVisibility());
      org.robolectric.shadows.ShadowLooper.idleMainLooper(4000, java.util.concurrent.TimeUnit.MILLISECONDS);
      assertEquals(View.VISIBLE, credit.getVisibility());
      org.robolectric.shadows.ShadowLooper.idleMainLooper(1000, java.util.concurrent.TimeUnit.MILLISECONDS);
      assertEquals(View.GONE, credit.getVisibility());
      root.findViewWithTag("Карты").performClick();
      Dialog maps = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      described(maps.getWindow().getDecorView(),"Карты").performClick();
      assertNotNull(find(org.robolectric.shadows.ShadowDialog.getLatestDialog().getWindow().getDecorView(),"© OpenStreetMap contributors\nhttps://www.openstreetmap.org/copyright"));
      maps.dismiss();
    }
  }

  @Test
  public void twoPointsCreatedThroughUiStayVisibleAndMapLayersDoNotContainObjects() {
    try (ActivityController<MainActivity> c = Robolectric.buildActivity(MainActivity.class).setup()) {
      View root = c.get().getWindow().getDecorView();
      for (int n = 1; n <= 2; n++) {
        described(root, "Действия в центре карты").performClick();
        find(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog().getWindow().getDecorView(),"Новая метка…").performClick();
        item(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog(),0);
        AlertDialog editor = org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
        org.robolectric.shadows.ShadowLooper.idleMainLooper();
        ((EditText) findType(editor.getWindow().getDecorView(), EditText.class)).setText("Point " + n);
        editor.getButton(-1).performClick();
        assertFalse("Point editor must save: " + ((EditText) findType(editor.getWindow().getDecorView(), EditText.class)).getError(), editor.isShowing());
      }
      org.osmdroid.views.MapView map = (org.osmdroid.views.MapView) findType(root, org.osmdroid.views.MapView.class);
      assertEquals(2, map.getOverlays().stream().filter(o -> o instanceof org.osmdroid.views.overlay.Marker).count());
      openLayers(root);
      Dialog layers = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      View layerRoot = layers.getWindow().getDecorView();
      assertNotNull(find(layerRoot,"Карты на экране"));
      assertNull(find(layerRoot, "● Point 1"));
      Switch visible=(Switch)described(layerRoot,"Видимость OpenStreetMap");
      visible.setChecked(false);
      assertFalse(map.getOverlayManager().getTilesOverlay().isEnabled());
      described(layerRoot,"Опции карты OpenStreetMap").performClick();android.app.AlertDialog actions=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();item(actions,4);Dialog opacityDialog=org.robolectric.shadows.ShadowDialog.getLatestDialog();
      SeekBar opacity=(SeekBar)findType(opacityDialog.getWindow().getDecorView(),SeekBar.class);
      opacity.setProgress(40);find(opacityDialog.getWindow().getDecorView(),"Закрыть").performClick();
      assertEquals(2, map.getOverlays().stream().filter(o -> o instanceof org.osmdroid.views.overlay.Marker).count());
    }
    try (ActivityController<MainActivity> c = Robolectric.buildActivity(MainActivity.class).setup();
        ObjectStore store = new ObjectStore(c.get())) {
      org.osmdroid.views.MapView map = (org.osmdroid.views.MapView) findType(c.get().getWindow().getDecorView(), org.osmdroid.views.MapView.class);
      assertEquals(2, store.all().size());
      assertEquals(2, map.getOverlays().stream().filter(o -> o instanceof org.osmdroid.views.overlay.Marker).count());
      assertFalse(map.getOverlayManager().getTilesOverlay().isEnabled());
      openLayers(c.get().getWindow().getDecorView());
      Dialog layers = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      assertNotNull(find(layers.getWindow().getDecorView(),"40 % непрозрачн."));
    }
  }

  @Test
  public void objectFiltersSearchAndCutPasteUseRealFolders() {
    long folder, point;
    try (ObjectStore store = new ObjectStore(RuntimeEnvironment.getApplication())) {
      folder = store.create(0, "Trip", "folder", 0, 0);
      point = store.create(0, "Alpha", "point", 10, 20);
      store.create(folder, "Beta", "point", 11, 21);
    }
    try (ActivityController<MainActivity> c = Robolectric.buildActivity(MainActivity.class).setup()) {
      View root = c.get().getWindow().getDecorView();
      root.findViewWithTag("Объекты").performLongClick();
      Dialog dialog = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      View objects = dialog.getWindow().getDecorView();
      described(objects,"Меню проводника").performClick();org.robolectric.shadows.ShadowPopupMenu.getLatestPopupMenu().getMenu().performIdentifierAction(11,0);
      EditText search=(EditText)objects.findViewWithTag("explorerSearch");search.setText("Beta");assertNotNull(find(objects,"Beta"));assertNull(find(objects,"Alpha"));search.setText("");
      described(objects,"Меню Alpha").performClick();Dialog itemDialog=org.robolectric.shadows.ShadowDialog.getLatestDialog();find(itemDialog.getWindow().getDecorView(),"Вырезать").performClick();described(objects,"Папка Trip").performClick();described(objects,"Буфер обмена").performClick();item(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog(),0);assertNotNull(find(objects,"Alpha"));
    }
    try (ObjectStore store = new ObjectStore(RuntimeEnvironment.getApplication())) {
      assertEquals(folder, store.get(point).parent);
      assertEquals(3, store.all().size());
      assertNotNull(store.get(point).icon);
    }
  }

  @Test
  public void offlineMapModeSurvivesRestart() {
    try (ActivityController<MainActivity> c = Robolectric.buildActivity(MainActivity.class).setup()) {
      View root = c.get().getWindow().getDecorView();
      root.findViewWithTag("Карты").performClick();
      Dialog maps = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      maps.dismiss();c.get().getPreferences(0).edit().putBoolean("expandedCategory1",true).commit();root.findViewWithTag("Карты").performClick();maps=org.robolectric.shadows.ShadowDialog.getLatestDialog();
      ((CheckBox)find(maps.getWindow().getDecorView(),"Использовать только сохранённый кэш карты")).setChecked(true);
      org.osmdroid.views.MapView map = (org.osmdroid.views.MapView) findType(root, org.osmdroid.views.MapView.class);
      assertFalse(map.useDataConnection());
    }
    try (ActivityController<MainActivity> c = Robolectric.buildActivity(MainActivity.class).setup()) {
      View root = c.get().getWindow().getDecorView();
      org.osmdroid.views.MapView map = (org.osmdroid.views.MapView) findType(root, org.osmdroid.views.MapView.class);
      assertFalse(map.useDataConnection());
      root.findViewWithTag("Карты").performClick();
      Dialog maps = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      ((CheckBox)find(maps.getWindow().getDecorView(),"Использовать только сохранённый кэш карты")).setChecked(false);
      assertTrue(map.useDataConnection());
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
    if (text.equals(v.getTag())) return v;
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
