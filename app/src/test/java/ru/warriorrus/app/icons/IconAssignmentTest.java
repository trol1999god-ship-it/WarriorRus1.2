package ru.warriorrus.app.icons;

import static org.junit.Assert.*;

import android.database.sqlite.SQLiteDatabase;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.MainActivity;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.map.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class IconAssignmentTest {
  private ObjectStore store;

  @Before
  public void setup() {
    RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");
    store = new ObjectStore(RuntimeEnvironment.getApplication());
  }

  @After
  public void finish() {
    store.close();
  }

  @Test
  public void assignmentPersistsAndUndoRestoresMultiplePoints() {
    long a = store.create(0, "A", "point", 1, 2), b = store.create(0, "B", "point", 3, 4);
    store.assignIcon(Arrays.asList(a, b), "custom/p.svg", 0xffaa0000);
    store.close();
    store = new ObjectStore(RuntimeEnvironment.getApplication());
    assertEquals("custom/p.svg", store.get(a).icon);
    assertEquals(0xffaa0000, store.get(b).color);
    store.assignIcon(Arrays.asList(a, b), "builtin:star", 0xff0000aa);
    store.undo();
    assertEquals("custom/p.svg", store.get(b).icon);
  }

  @Test
  public void relocationUpdatesDescendantsAndUndoSnapshot() {
    long a = store.create(0, "A", "point", 1, 2);
    store.assignIcon(Collections.singleton(a), "A/B/p.svg", 123);
    store.edit(a, "Changed", 1, 2);
    store.relocateIcons(Collections.singletonMap("A", "Dest/A"));
    assertEquals("Dest/A/B/p.svg", store.get(a).icon);
    store.undo();
    assertEquals("Dest/A/B/p.svg", store.get(a).icon);
    assertEquals("A", store.get(a).name);
  }

  @Test
  public void missingSvgKeepsPointAndFallbackMarker() {
    try (org.robolectric.android.controller.ActivityController<MainActivity> activity =
        Robolectric.buildActivity(MainActivity.class).setup()) {
      long id = store.create(0, "Missing", "point", 1, 2);
      store.assignIcon(Collections.singleton(id), "missing.svg", 0xffaa0000);
      MapWorkspace map = new MapWorkspace(activity.get(), p -> {});
      map.view.setUseDataConnection(false);
      map.refresh(store);
      assertEquals(2, map.view.getOverlays().size());
      assertNotNull(store.get(id));
      assertEquals("missing.svg", store.get(id).icon);
      map.view.onDetach();
    }
  }

  @Test
  public void migratesVersionOneWithoutLosingPoints() {
    store.close();
    android.content.Context context = RuntimeEnvironment.getApplication();
    context.deleteDatabase("warrior2.db");
    java.io.File path = context.getDatabasePath("warrior2.db");
    path.getParentFile().mkdirs();
    try (SQLiteDatabase db = SQLiteDatabase.openOrCreateDatabase(path, null)) {
      db.execSQL(
          "CREATE TABLE objects(id INTEGER PRIMARY KEY,parent INTEGER,name TEXT,kind TEXT,latitude"
              + " REAL,longitude REAL,visible INTEGER,position INTEGER,color INTEGER,opacity"
              + " REAL)");
      db.execSQL("INSERT INTO objects VALUES(7,NULL,'Existing','point',1,2,1,0,123,1)");
      db.setVersion(1);
    }
    store = new ObjectStore(context);
    assertEquals("Existing", store.get(7).name);
    assertEquals("builtin:pin", store.get(7).icon);
    assertEquals(2, store.getReadableDatabase().getVersion());
  }
}
