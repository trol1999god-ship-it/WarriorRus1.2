package ru.warriorrus.app;

import static org.junit.Assert.*;
import android.net.Uri;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.data.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28)
public class PointAttachmentsTest {
  private ObjectStore store;
  private PointAttachments media;
  private long point;
  @Before public void setup() {
    RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");
    store=new ObjectStore(RuntimeEnvironment.getApplication());
    media=new PointAttachments(RuntimeEnvironment.getApplication(),store);
    point=store.create(0,"Media point","point",10,20);
  }
  @After public void close() { store.close(); }
  @Test public void notesPersistAcrossReopen() {
    media.saveNote(point,"Заметка\nдва абзаца");
    store.close();
    store=new ObjectStore(RuntimeEnvironment.getApplication());
    media=new PointAttachments(RuntimeEnvironment.getApplication(),store);
    assertEquals("Заметка\nдва абзаца",media.note(point));
    media.saveNote(point,"Исправлено");
    assertEquals("Исправлено",media.note(point));
  }
  @Test public void mediaTablesCascadeOnPointDelete() {
    media.saveNote(point,"local");
    store.delete(Collections.singleton(point));
    try(android.database.Cursor c=store.getReadableDatabase().rawQuery("SELECT count(*) FROM point_notes",null)) {
      assertTrue(c.moveToFirst());
      assertEquals(0,c.getInt(0));
    }
  }
  @Test public void folderCannotOwnMedia() {
    long folder=store.create(0,"folder","folder",0,0);
    try { media.saveNote(folder,"invalid"); fail(); }
    catch(IllegalArgumentException expected) { }
  }
}
