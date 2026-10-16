package ru.warriorrus.app;

import static org.junit.Assert.*;

import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.explorer.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class ObjectStoreTest {
  private ObjectStore store;

  @Before
  public void setup() {
    RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");
    store = new ObjectStore(RuntimeEnvironment.getApplication());
  }

  @After
  public void close() {
    store.close();
  }

  private long folder(long parent, String name) {
    return store.create(parent, name, "folder", 0, 0);
  }

  private long point(long parent, String name) {
    return store.create(parent, name, "point", 55.75, 37.62);
  }

  @Test
  public void survivesDatabaseReopen() {
    long f = folder(0, "Field"), p = point(f, "Checkpoint");
    store.close();
    store = new ObjectStore(RuntimeEnvironment.getApplication());
    assertEquals(f, store.get(p).parent);
    assertEquals(55.75, store.get(p).latitude, 0.00001);
  }

  @Test
  public void recursiveCopyPreservesStylesAndDoesNotDuplicateNestedSelection() {
    long f = folder(0, "A"), p = point(f, "P"), target = folder(0, "B");
    store.style(Collections.singleton(p), false, 0.3f, 0xff123456);
    store.transfer(Arrays.asList(f, p), target, true);
    assertEquals(5, store.all().size());
    MapItem copied = null;
    for (MapItem i : store.all()) if (i.id != p && !i.isFolder()) copied = i;
    assertNotNull(copied);
    assertFalse(copied.visible);
    assertEquals(0.3f, copied.opacity, 0.001);
    assertEquals(0xff123456, copied.color);
    assertTrue(store.descendant(copied.id, target));
  }

  @Test
  public void rejectsCyclesAtomically() {
    long a = folder(0, "A"), b = folder(a, "B"), p = point(0, "P");
    try {
      store.transfer(Arrays.asList(a, p), b, false);
      fail();
    } catch (IllegalArgumentException expected) {
    }
    assertEquals(0, store.get(a).parent);
    assertEquals(0, store.get(p).parent);
  }

  @Test
  public void deleteTreeAndUndoRestoreIdentity() {
    long a = folder(0, "A"), b = folder(a, "B"), p = point(b, "P");
    store.delete(Arrays.asList(a, p));
    assertTrue(store.all().isEmpty());
    store.undo();
    assertEquals(3, store.all().size());
    assertEquals(b, store.get(p).parent);
    assertFalse(store.canUndo());
  }

  @Test
  public void visibilityAndOpacityAreInherited() {
    long a = folder(0, "A"), p = point(a, "P");
    store.style(Collections.singleton(a), true, 0.5f, null);
    store.style(Collections.singleton(p), true, 0.4f, null);
    assertEquals(0.2f, store.effectiveOpacity(store.get(p)), 0.001);
    store.style(Collections.singleton(a), false, null, null);
    assertEquals(0, store.effectiveOpacity(store.get(p)), 0.001);
    store.undo();
    assertEquals(0.2f, store.effectiveOpacity(store.get(p)), 0.001);
  }

  @Test
  public void clipboardMoveAndUndo() {
    long a = folder(0, "A"), b = folder(0, "B"), p = point(a, "P");
    ExplorerController c = new ExplorerController(store);
    c.toggle(p);
    c.clipboard(true);
    c.open(b);
    c.paste();
    assertEquals(b, store.get(p).parent);
    assertFalse(c.hasClipboard());
    store.undo();
    assertEquals(a, store.get(p).parent);
  }

  @Test
  public void searchSortAndBreadcrumb() {
    long a = folder(0, "Folder"), b = folder(a, "Nested");
    point(b, "Zulu");
    point(b, "Alpha");
    ExplorerController c = new ExplorerController(store);
    c.open(b);
    assertEquals("Рабочая карта / Folder / Nested", c.breadcrumb());
    c.alphabetical = true;
    assertEquals("Alpha", c.entries().get(0).name);
    c.folder = 0;
    c.query = "zUL";
    assertEquals(1, c.entries().size());
  }

  @Test
  public void invalidCoordinatesAndParentDoNotWrite() {
    try {
      store.create(0, "Bad", "point", 91, 0);
      fail();
    } catch (IllegalArgumentException expected) {
    }
    long p = point(0, "P");
    try {
      folder(p, "Bad");
      fail();
    } catch (IllegalArgumentException expected) {
    }
    assertEquals(1, store.all().size());
  }

  @Test
  public void folderOrderControlsNestedMapLayers() {
    long a = folder(0, "A"), b = folder(0, "B"), p = point(a, "P"), q = point(b, "Q");
    store.reorder(b, -1);
    List<MapItem> rendered = store.renderItems();
    assertEquals(b, rendered.get(0).id);
    assertEquals(q, rendered.get(1).id);
    assertEquals(a, rendered.get(2).id);
    assertEquals(p, rendered.get(3).id);
  }

  @Test
  public void reorderSurvivesAndUndoRestores() {
    long a = point(0, "A"), b = point(0, "B");
    store.reorder(b, -1);
    assertEquals(b, store.all().get(0).id);
    store.undo();
    assertEquals(a, store.all().get(0).id);
  }
}
