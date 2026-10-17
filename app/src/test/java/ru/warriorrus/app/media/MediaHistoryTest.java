package ru.warriorrus.app.media;

import static org.junit.Assert.*;
import java.io.*;
import java.util.*;
import java.util.zip.*;
import java.nio.charset.StandardCharsets;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.exchange.*;
import ru.warriorrus.app.icons.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk={23,35},shadows=ru.warriorrus.app.icons.IconsActivityTest.MediaContext.class)
public class MediaHistoryTest {
  private ObjectStore store;private LocalMedia media;private android.content.Context context;
  @Before public void setup()throws Exception{context=RuntimeEnvironment.getApplication();context.deleteDatabase("warrior2.db");store=new ObjectStore(context);media=new LocalMedia(context);}
  @After public void close(){store.close();}
  private long point(String name){return store.create(0,name,"point",55,37);}
  private Attachment attach(long id)throws Exception {Attachment a=media.add(new ByteArrayInputStream(new byte[]{1,2,3,4}),"Снимок.jpg","image/jpeg");MapItem i=store.get(id);i.attachments.add(a);store.save(i);return a;}
  @Test public void mediaNotesAndUndoSurviveRestart()throws Exception{
    long id=point("One");Attachment a=attach(id);store.delete(Collections.singleton(id));store.close();store=new ObjectStore(context);
    assertNull(store.get(id));assertTrue(store.canUndo());assertEquals(1,store.includingTrash().size());store.undo();assertEquals(a.key,store.get(id).attachments.get(0).key);assertTrue(media.resolve(a.key).isFile());
  }
  @Test public void copyDeleteRestoreAndPermanentCleanupKeepSharedFiles()throws Exception{
    long id=point("One");Attachment a=attach(id);store.transfer(Collections.singleton(id),0,true);long copy=store.all().get(1).id;
    assertEquals(a.key,store.get(copy).attachments.get(0).key);store.delete(Collections.singleton(id));store.emptyTrash();media.cleanup(store.referencedMedia());assertTrue(media.resolve(a.key).isFile());
    store.delete(Collections.singleton(copy));store.close();store=new ObjectStore(context);store.restoreTrash(Collections.singleton(copy));assertNotNull(store.get(copy));
    store.delete(Collections.singleton(copy));store.emptyTrash();media.cleanup(store.referencedMedia());assertFalse(media.resolve(a.key).exists());assertFalse(store.canUndo());
  }
  @Test public void kmzIsStandardAndRoundTripsMediaIconsAndSelectionWithoutParent()throws Exception{
    long folder=store.create(0,"Folder","folder",0,0),id=store.create(folder,"Point & photo","point",55,37);Attachment a=attach(id);
    String svg="<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'><path d='M0 0 L32 0 L16 32 Z'/></svg>";
    String key=IconLibrary.open(context).importSvg("","test-"+UUID.randomUUID()+".svg",new ByteArrayInputStream(svg.getBytes(StandardCharsets.UTF_8)));store.assignIcon(Collections.singleton(id),key,0xffcc5533);
    ByteArrayOutputStream out=new ByteArrayOutputStream();BundleExchange.write(context,store.exportItems(Collections.singleton(id)),out,"kmz");
    Set<String> files=new HashSet<>();String kml="";try(ZipInputStream zip=new ZipInputStream(new ByteArrayInputStream(out.toByteArray()))){ZipEntry e;while((e=zip.getNextEntry())!=null){files.add(e.getName());byte[] bytes=PlacemarkFiles.bounded(zip,1024*1024);if(e.getName().equals("doc.kml"))kml=new String(bytes,StandardCharsets.UTF_8);}}
    assertTrue(files.contains("doc.kml"));assertTrue(files.contains("workmap.json"));assertTrue(files.contains("media/"+a.key));assertTrue(kml.contains("<href>icons/object-"));assertTrue(kml.contains("media/"));
    List<MapItem> back=BundleExchange.read(context,new ByteArrayInputStream(out.toByteArray()));assertEquals(1,back.size());MapItem p=back.get(0);assertEquals(0,p.parent);assertEquals(0xffcc5533,p.color);assertNotEquals(key,p.icon);assertEquals(svg,IconLibrary.open(context).text(p.icon));
    assertEquals(a.name,p.attachments.get(0).name);assertArrayEquals(new byte[]{1,2,3,4},bytes(media.resolve(p.attachments.get(0).key)));
    store.importItems(back,0);assertEquals(3,store.all().size());
  }
  @Test public void rejectsZipTraversalAndNonMedia()throws Exception{
    ByteArrayOutputStream out=new ByteArrayOutputStream();try(ZipOutputStream zip=new ZipOutputStream(out)){zip.putNextEntry(new ZipEntry("../escaped.txt"));zip.write(1);zip.closeEntry();}
    try{BundleExchange.read(context,new ByteArrayInputStream(out.toByteArray()));fail();}catch(IOException expected){}
    try{media.add(new ByteArrayInputStream(new byte[]{1}),"bad","application/pdf");fail();}catch(IOException expected){}
    assertTrue(store.all().isEmpty());
  }
  @Test public void movingIconFolderUpdatesTrashAndPersistentUndo(){
    long id=point("Icon");store.assignIcon(Collections.singleton(id),"old/a.svg",0xff123456);store.delete(Collections.singleton(id));
    store.relocateIcons(Collections.singletonMap("old","new"));store.restoreTrash(Collections.singleton(id));assertEquals("new/a.svg",store.get(id).icon);
    store.undo();assertNull(store.get(id));store.undo();assertEquals("new/a.svg",store.get(id).icon);
  }
  private byte[] bytes(File f)throws Exception{try(InputStream in=new FileInputStream(f)){return PlacemarkFiles.bounded(in,1024);}}
}
