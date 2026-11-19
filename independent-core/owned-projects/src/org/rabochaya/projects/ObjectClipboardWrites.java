package org.rabochaya.projects;
import android.content.ContentValues;import android.database.Cursor;import android.database.sqlite.SQLiteDatabase;
import java.io.IOException;import java.util.*;import org.w3c.dom.Element;import org.w3c.dom.Node;
/** One app-private clipboard; cut consumption and project payloads commit together. */
public final class ObjectClipboardWrites {
 private ObjectClipboardWrites(){}
 private static void table(SQLiteDatabase db){db.execSQL("CREATE TABLE IF NOT EXISTS object_clipboard(slot INTEGER PRIMARY KEY CHECK(slot=1),data BLOB NOT NULL)");}
 private static ObjectClipboard read(SQLiteDatabase db)throws IOException{table(db);try(Cursor c=db.rawQuery("SELECT data FROM object_clipboard WHERE slot=1",null)){return c.moveToFirst()?ObjectClipboard.decode(c.getBlob(0)):null;}}
 private static void put(SQLiteDatabase db,ObjectClipboard clip)throws IOException{ContentValues row=new ContentValues();row.put("slot",1);row.put("data",clip.encode());if(db.insertWithOnConflict("object_clipboard",null,row,SQLiteDatabase.CONFLICT_REPLACE)<0)throw new IOException("Буфер не сохранён");}
 public static ObjectClipboard get(ProjectStore store)throws IOException{return read(store.getWritableDatabase());}
 public static void clear(ProjectStore store){SQLiteDatabase db=store.getWritableDatabase();table(db);db.delete("object_clipboard","slot=1",null);}
 public static void capture(ProjectStore store,long project,boolean cut,List<String> keys,String expected)throws IOException{
  SQLiteDatabase db=store.getWritableDatabase();db.beginTransaction();try{KmlProject p=store.load(project);List<String> chosen=ObjectTree.selection(p.root(),keys,expected);table(db);put(db,new ObjectClipboard(project,cut,expected,chosen));db.setTransactionSuccessful();}finally{db.endTransaction();}
 }
 public static KmlProject paste(ProjectStore store,long project,String destination,String expected,String fingerprint)throws IOException{
  return pasteInFolder(store,project,destination,expected,fingerprint).project;
 }
 static ObjectTreeWrites.EditResult pasteInFolder(ProjectStore store,long project,String destination,String expected,String fingerprint)throws IOException{
  SQLiteDatabase db=store.getWritableDatabase();db.beginTransaction();try{KmlProject p=store.load(project);ObjectClipboard clip=read(db);if(clip==null)throw new IllegalStateException("Буфер объектов пуст");if(!clip.fingerprint().equals(fingerprint))throw new IllegalStateException("Буфер изменился. Откройте вставку повторно");if(clip.project!=project)throw new IllegalStateException("Буфер относится к другому проекту");if(!clip.token.equals(expected)||!expected.equals(ObjectTree.token(p.root())))throw new IllegalStateException("Проект изменился после заполнения буфера. Повторите выбор и копирование или вырезание");
   List<Node> trail = ObjectTree.folderTrail(p.root(), destination);
   Set<Element> originals = Collections.newSetFromMap(new IdentityHashMap<Element, Boolean>());
   if (!clip.cut) {
    Set<String> sourceKeys = new HashSet<>(clip.keys);
    for (ObjectTree.Row row : ObjectTree.rows(p.root())) {
     if (sourceKeys.contains(row.key)) originals.add(row.element);
    }
   }
   if(clip.cut)ObjectTree.move(p.root(),clip.keys,destination,expected);else ObjectTree.copy(p.root(),clip.keys,destination,expected);
   ObjectTree.normalizeRoot(p.root());ProjectWrites.savePreservingAssets(store,project,p);
   String nextFolder = ObjectTree.survivingFolder(p.root(), trail);
   List<String> newKeys=new ArrayList<>();if(!clip.cut){for(ObjectTree.Row r:ObjectTree.rows(p.root()))if(originals.contains(r.element))newKeys.add(r.key);if(newKeys.size()!=clip.keys.size())throw new IllegalStateException("Не удалось сохранить выбор буфера");}
   // Reparse persisted XML before deriving the next token: serializers may add namespace declarations.
   p=store.load(project);if(clip.cut)db.delete("object_clipboard","slot=1",null);else put(db,new ObjectClipboard(project,false,ObjectTree.token(p.root()),newKeys));
   db.setTransactionSuccessful();return new ObjectTreeWrites.EditResult(p,nextFolder);
  }finally{db.endTransaction();}
 }
}
