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

  private void seedMedia(long owner, String filename) throws Exception {
    java.io.File dir=new java.io.File(RuntimeEnvironment.getApplication().getFilesDir(),"point-attachments");
    dir.mkdirs();
    try(java.io.FileOutputStream out=new java.io.FileOutputStream(new java.io.File(dir,filename))) {
      out.write(new byte[]{1,2,3});
    }
    android.content.ContentValues v=new android.content.ContentValues();
    v.put("point_id",owner); v.put("display_name","photo.jpg");
    v.put("mime","image/jpeg"); v.put("filename",filename);
    store.getWritableDatabase().insertOrThrow("point_attachments",null,v);
  }
  @Test public void copyPointCreatesIndependentFileAndRetainsNote() throws Exception {
    String filename=java.util.UUID.randomUUID().toString()+".bin";
    seedMedia(point,filename);
    media.saveNote(point,"copied note");
    store.transfer(Collections.singleton(point),0,true);
    long copy=0;
    for(MapItem item:store.all()) if(item.id!=point) copy=item.id;
    assertNotEquals(0,copy);
    assertEquals("copied note",media.note(copy));
    assertEquals(1,media.list(copy).size());
    assertNotEquals(filename,media.list(copy).get(0).filename);
    assertTrue(media.file(media.list(copy).get(0)).exists());
    media.remove(point,media.list(point).get(0).id);
    assertTrue(media.file(media.list(copy).get(0)).exists());
  }
  @Test public void recursiveFolderCopyRetainsNestedMediaAfterRestart() throws Exception {
    long folder=store.create(0,"Group","folder",0,0);
    long nested=store.create(folder,"Nested","folder",0,0);
    long child=store.create(nested,"Child","point",1,2);
    seedMedia(child,java.util.UUID.randomUUID().toString()+".bin");
    store.transfer(Collections.singleton(folder),0,true);
    store.close();
    store=new ObjectStore(RuntimeEnvironment.getApplication());
    media=new PointAttachments(RuntimeEnvironment.getApplication(),store);
    int copies=0;
    for(MapItem item:store.all())
      if(!item.isFolder() && item.id!=child && item.id!=point) {
        assertEquals(1,media.list(item.id).size());
        copies++;
      }
    assertEquals(1,copies);
  }
  @Test public void deleteFolderThenUndoRestoresMediaAndCleanupPreservesOtherFiles() throws Exception {
    long folder=store.create(0,"Group","folder",0,0);
    long child=store.create(folder,"Child","point",1,2);
    seedMedia(child,java.util.UUID.randomUUID().toString()+".bin");
    seedMedia(point,java.util.UUID.randomUUID().toString()+".bin");
    store.delete(Collections.singleton(folder));
    assertEquals(1,media.list(point).size());
    store.undo();
    assertEquals(1,media.list(child).size());
    store.delete(Collections.singleton(folder));
    store.clearUndo();
    store.cleanupUnreferencedMedia();
    assertEquals(1,media.list(point).size());
    assertTrue(media.file(media.list(point).get(0)).exists());
  }
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
