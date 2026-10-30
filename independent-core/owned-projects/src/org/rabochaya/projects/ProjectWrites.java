package org.rabochaya.projects;
import android.content.ContentValues;import android.database.Cursor;import android.database.sqlite.SQLiteDatabase;
import java.io.IOException;import java.util.*;
/** Atomic replacement of XML and chunked local assets in the existing SQLite schema. */
public final class ProjectWrites {
 public static final int MAX_FILE=8*1024*1024,MAX_PROJECT=32*1024*1024;
 private ProjectWrites(){}
 public static void save(ProjectStore store,long id,KmlProject project)throws IOException{
  save(store,id,project,true);
 }
 /** Structural manager operations retain even currently unreferenced asset bytes. */
 public static void savePreservingAssets(ProjectStore store,long id,KmlProject project)throws IOException{
  save(store,id,project,false);
 }
 private static void save(ProjectStore store,long id,KmlProject project,boolean collect)throws IOException{
  if(collect)MediaLinks.collectUnused(project);
  byte[] xml=project.xml();if(xml.length>4*1024*1024)throw new IOException("Предел KML — 4 МиБ");
  if(project.assets.size()>255)throw new IOException("Предел проекта — 255 вложенных файлов");
  long total=xml.length;KmlProject.safePath(project.entry);
  for(Map.Entry<String,byte[]> item:project.assets.entrySet()){
   String path=KmlProject.safePath(item.getKey());byte[] bytes=item.getValue();
   if(path.equals(project.entry)||bytes==null||bytes.length>MAX_FILE)throw new IOException("Недопустимое вложение или превышение 8 МиБ");
   total+=bytes.length;if(total>MAX_PROJECT)throw new IOException("Предел проекта с вложениями — 32 МиБ");
  }
  SQLiteDatabase db=store.getWritableDatabase();db.beginTransaction();
  try{
   try(Cursor c=db.rawQuery("SELECT id FROM projects WHERE id=?",new String[]{Long.toString(id)})){if(!c.moveToFirst())throw new IOException("Проект удалён");}
   db.delete("payloads","project=?",new String[]{Long.toString(id)});put(db,id,"",xml);
   for(Map.Entry<String,byte[]> item:project.assets.entrySet())put(db,id,item.getKey(),item.getValue());
   db.setTransactionSuccessful();
  }finally{db.endTransaction();}
 }
 private static void put(SQLiteDatabase db,long id,String name,byte[] bytes){
  int part=0,offset=0;do{int end=Math.min(bytes.length,offset+128*1024);ContentValues row=new ContentValues();row.put("project",id);row.put("name",name);row.put("part",part++);row.put("data",Arrays.copyOfRange(bytes,offset,end));db.insertOrThrow("payloads",null,row);offset=end;}while(offset<bytes.length);
 }
}
