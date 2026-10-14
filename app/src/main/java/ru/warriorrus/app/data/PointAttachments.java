package ru.warriorrus.app.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.provider.OpenableColumns;
import java.io.*;
import java.util.*;

/** Private copies of SAF-selected files, indexed for future KMZ packaging. */
public final class PointAttachments {
  public static final class Entry {
    public long id, pointId;
    public String name, mime, filename;
    Entry(long id, long pointId, String name, String mime, String filename) {
      this.id=id; this.pointId=pointId; this.name=name; this.mime=mime; this.filename=filename;
    }
  }
  private final Context context;
  private final ObjectStore store;
  private final File directory;
  public PointAttachments(Context context, ObjectStore store) {
    this.context=context.getApplicationContext();
    this.store=store;
    directory=new File(context.getFilesDir(), "point-attachments");
    if (!directory.isDirectory() && !directory.mkdirs()) throw new IllegalStateException("Cannot create media directory");
  }
  private void requirePoint(long id) {
    MapItem point=store.get(id);
    if (point==null || point.isFolder()) throw new IllegalArgumentException("Точка не найдена");
  }
  public String note(long pointId) {
    requirePoint(pointId);
    try (Cursor c=store.getReadableDatabase().rawQuery("SELECT note FROM point_notes WHERE point_id=?",new String[]{""+pointId})) {
      return c.moveToFirst()?c.getString(0):"";
    }
  }
  public void saveNote(long pointId,String text) {
    requirePoint(pointId);
    ContentValues v=new ContentValues();
    v.put("point_id",pointId);
    v.put("note",text==null?"":text);
    store.getWritableDatabase().insertWithOnConflict("point_notes",null,v,SQLiteDatabase.CONFLICT_REPLACE);
  }
  public List<Entry> list(long pointId) {
    requirePoint(pointId);
    List<Entry> result=new ArrayList<>();
    try (Cursor c=store.getReadableDatabase().rawQuery(
      "SELECT id,point_id,display_name,mime,filename FROM point_attachments WHERE point_id=? ORDER BY id",
      new String[]{""+pointId})) {
      while(c.moveToNext()) result.add(new Entry(c.getLong(0),c.getLong(1),c.getString(2),c.getString(3),c.getString(4)));
    }
    return result;
  }
  /** Import by streaming SAF data to app-private storage; never persist external URI grants. */
  public Entry importUri(long pointId,Uri source) throws IOException {
    requirePoint(pointId);
    String mime=context.getContentResolver().getType(source);
    if(mime==null) mime="application/octet-stream";
    if(!(mime.startsWith("image/")||mime.startsWith("video/")||mime.startsWith("audio/")))
      throw new IOException("Поддерживаются фото, видео и аудио");
    String display="Вложение";
    try(Cursor c=context.getContentResolver().query(source,new String[]{OpenableColumns.DISPLAY_NAME},null,null,null)) {
      if(c!=null && c.moveToFirst() && !c.isNull(0)) display=c.getString(0);
    }
    String filename=UUID.randomUUID().toString()+".bin";
    File target=new File(directory,filename);
    try(InputStream in=context.getContentResolver().openInputStream(source)) {
      if(in==null) throw new IOException("Не удалось открыть файл");
      try(OutputStream out=new FileOutputStream(target)) {
        byte[] buffer=new byte[65536];
        int n;
        while((n=in.read(buffer))!=-1) out.write(buffer,0,n);
      }
    } catch(Exception e) {
      target.delete();
      if(e instanceof IOException) throw (IOException)e;
      throw new IOException("Ошибка копирования вложения",e);
    }
    try {
      ContentValues v=new ContentValues();
      v.put("point_id",pointId);
      v.put("display_name",display);
      v.put("mime",mime);
      v.put("filename",filename);
      long id=store.getWritableDatabase().insertOrThrow("point_attachments",null,v);
      return new Entry(id,pointId,display,mime,filename);
    } catch(RuntimeException e) {
      target.delete();
      throw e;
    }
  }
  public File file(Entry entry) {
    if(!entry.filename.matches("[a-fA-F0-9-]{36}\\.bin")) throw new IllegalArgumentException("Invalid attachment path");
    return new File(directory,entry.filename);
  }
  public void remove(long pointId,long attachmentId) {
    requirePoint(pointId);
    Entry found=null;
    for(Entry e:list(pointId)) if(e.id==attachmentId) found=e;
    if(found==null) throw new IllegalArgumentException("Вложение не найдено");
    int count=store.getWritableDatabase().delete("point_attachments","id=? AND point_id=?",
      new String[]{""+attachmentId,""+pointId});
    if(count==1) file(found).delete();
  }
}
