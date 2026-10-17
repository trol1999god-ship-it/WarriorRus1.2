package ru.warriorrus.app;

import static org.junit.Assert.*;

import android.view.*;
import android.widget.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.overlay.Marker;
import org.robolectric.*;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.map.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {23, 35})
public class WorkspaceTest {
  @Before
  public void reset() {
    RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");
  }

  @Test
  public void launchesRealWorkspaceAndFolderButtonOpensEditor() {
    try (ActivityController<MainActivity> c =
        Robolectric.buildActivity(MainActivity.class).setup()) {
      MainActivity a = c.get();
      assertNull(find(a.getWindow().getDecorView(), "Warrior Explorer"));
      find(a.getWindow().getDecorView(), "Объекты").performLongClick();
      android.app.Dialog explorerDialog = org.robolectric.shadows.ShadowDialog.getLatestDialog();
      View explorerView = explorerDialog.getWindow().getDecorView();
      assertNotNull(find(explorerView, "Объекты карты"));
      find(explorerView, "Операции").performClick();
      android.widget.PopupMenu operations =
          org.robolectric.shadows.ShadowPopupMenu.getLatestPopupMenu();
      operations.getMenu().performIdentifierAction(0, 0);
      View button = find(explorerView, "Операции");
      assertNotNull(button);

      org.robolectric.shadows.ShadowLooper.idleMainLooper();
      android.app.AlertDialog dialog =
          org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
      assertTrue(dialog.isShowing());
      EditText name = (EditText) findEdit(dialog.getWindow().getDecorView());
      assertNotNull(name);
      name.setText("Operations");
      dialog.getButton(-1).performClick();
      try (ObjectStore s = new ObjectStore(a)) {
        assertEquals("Operations", s.all().get(0).name);
      }
      assertNotNull(find(explorerView, "Объекты карты"));
      find(explorerView, "Operations").performClick();
      assertNotNull(find(explorerView, "› Operations"));
      find(explorerView, "Рабочая карта").performClick();
      assertNotNull(find(explorerView, "Operations"));
    }
  }

  @Test
  public void actualMapMarkersReflectLayerVisibilityAndEdits() {
    try (ActivityController<MainActivity> c =
            Robolectric.buildActivity(MainActivity.class).setup();
        ObjectStore store = new ObjectStore(c.get())) {
      MapWorkspace map = new MapWorkspace(c.get(), p -> {});
      map.view.setUseDataConnection(false);
      long f = store.create(0, "Layer", "folder", 0, 0), p = store.create(f, "P", "point", 10, 20);
      map.refresh(store);
      assertEquals(1, markers(map));
      store.edit(p, "Moved", 30, 40);
      map.refresh(store);
      Marker marker = (Marker) map.view.getOverlays().get(1);
      assertEquals(new GeoPoint(30.0, 40.0), marker.getPosition());
      store.style(java.util.Collections.singleton(f), false, null, null);
      map.refresh(store);
      assertEquals(0, markers(map));
      store.undo();
      map.refresh(store);
      assertEquals(1, markers(map));
      map.view.onDetach();
    }
  }

  private int markers(MapWorkspace m) {
    int count = 0;
    for (Object o : m.view.getOverlays()) if (o instanceof Marker) count++;
    return count;
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

  private View findEdit(View v) {
    if (v instanceof EditText) return v;
    if (v instanceof ViewGroup) {
      ViewGroup g = (ViewGroup) v;
      for (int n = 0; n < g.getChildCount(); n++) {
        View found = findEdit(g.getChildAt(n));
        if (found != null) return found;
      }
    }
    return null;
  }
}
