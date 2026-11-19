package org.rabochaya.projects;
import android.database.sqlite.SQLiteDatabase;import java.io.*;import java.security.MessageDigest;import java.security.NoSuchAlgorithmException;import java.util.*;
import org.w3c.dom.Element;
/** Load, compare, mutate and replace under one SQLite write transaction. */
public final class ObjectTreeWrites {
 private ObjectTreeWrites(){}
 public static KmlProject apply(ProjectStore store,long id,String operation,List<String> keys,String value,String expected)throws IOException{
  SQLiteDatabase db=store.getWritableDatabase();db.beginTransaction();
  try{KmlProject p=store.load(id);
   if("create".equals(operation))ObjectTree.createFolder(p.root(),keys.get(0),expected,value);
   else if("rename".equals(operation))ObjectTree.rename(p.root(),keys.get(0),expected,value);
   else if("description".equals(operation)){if(keys==null||keys.size()!=1)throw new IllegalArgumentException("Выберите один объект");if(!ObjectDescription.apply(p.root(),keys.get(0),expected,value)){db.setTransactionSuccessful();return p;}}
   else if(KmlComponentStyleEdit.operation(operation)){if(keys==null||keys.size()!=1)throw new IllegalArgumentException("Выберите один объект");KmlComponentStyleEdit.apply(p.root(),keys.get(0),expected,operation,value);}
   else if("move".equals(operation))ObjectTree.move(p.root(),keys,value,expected);
   else if("delete".equals(operation))ObjectTree.delete(p.root(),keys,expected);
   else if("show".equals(operation)||"hide".equals(operation)){ObjectVisibility.Preview change=ObjectVisibility.apply(p.root(),keys,"show".equals(operation),expected);if(change.changed==0){db.setTransactionSuccessful();return p;}}
   else throw new IllegalArgumentException("Неизвестное действие");
   ObjectTree.normalizeRoot(p.root());ProjectWrites.savePreservingAssets(store,id,p);db.setTransactionSuccessful();return p;
  }finally{db.endTransaction();}
 }

 /** Commit against the latest project without overwriting another editor's changes. */
 public static KmlProject saveMapFeature(ProjectStore store, long id, Element original,
                                         String type, String title, String description,
                                         List<double[]> points) throws IOException {
  SQLiteDatabase db = store.getWritableDatabase();
  db.beginTransaction();
  try {
   KmlProject project = store.load(id);
   if (original == null) {
    FeatureEdits.create(project.root(), type, title, description, points);
   } else {
    Element current = project.byId(original.getAttribute("id"));
    if (current == null || !current.isEqualNode(original)) {
     throw new IllegalStateException("Объект изменился. Откройте его заново");
    }
    FeatureEdits.metadata(current, title, description);
    if (points != null) FeatureEdits.movePoint(current, points);
   }
   ProjectWrites.savePreservingAssets(store, id, project);
   KmlProject saved = store.load(id);
   db.setTransactionSuccessful();
   return saved;
  } finally {
   db.endTransaction();
  }
 }

 public static KmlProject assignSvg(ProjectStore store, long id, String key, String expected,
                                    InputStream input) throws IOException {
  byte[] bytes;
  try (InputStream selected = input) {
   bytes = readSvg(selected);
  }
  String href = "icons/rk-" + digest(bytes) + ".svg";
  SQLiteDatabase db = store.getWritableDatabase();
  db.beginTransaction();
  try {
   KmlProject project = store.load(id);
   Element feature = KmlComponentStyleEdit.marker(project.root(), key, expected);
   String entry = KmlProject.safePath(project.entry);
   String path = entry.substring(0, entry.lastIndexOf('/') + 1) + href;
   byte[] present = project.assets.get(path);
   if (path.equals(entry) || (present != null && !Arrays.equals(present, bytes))) {
    throw new IOException("SVG: путь значка уже занят");
   }
   if (present == null) project.assets.put(path, bytes);
   KmlComponentStyleEdit.assignIcon(feature, href);
   ProjectWrites.savePreservingAssets(store, id, project);
   KmlProject saved = store.load(id);
   db.setTransactionSuccessful();
   return saved;
  } finally {
   db.endTransaction();
  }
 }

 private static byte[] readSvg(InputStream input) throws IOException {
  if (input == null) throw new IOException("Не удалось открыть SVG");
  ByteArrayOutputStream out = new ByteArrayOutputStream();
  byte[] buffer = new byte[4096];
  for (int count; (count = input.read(buffer)) != -1;) {
   if (out.size() + count > 65536) throw new IOException("SVG: файл больше 64 КиБ");
   out.write(buffer, 0, count);
  }
  byte[] bytes = out.toByteArray();
  SvgIcon icon = SvgIcon.parse(bytes);
  if (icon.pixelWidth > 256 || icon.pixelHeight > 256) {
   throw new IOException("SVG: размер значка больше 256 × 256 px");
  }
  return bytes;
 }

 private static String digest(byte[] bytes) {
  try {
   StringBuilder hex = new StringBuilder();
   for (byte value : MessageDigest.getInstance("SHA-256").digest(bytes)) {
    hex.append(String.format(Locale.ROOT, "%02x", value & 255));
   }
   return hex.toString();
  } catch (NoSuchAlgorithmException unavailable) {
   throw new IllegalStateException(unavailable);
  }
 }
}
