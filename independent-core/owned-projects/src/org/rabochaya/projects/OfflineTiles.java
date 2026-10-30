package org.rabochaya.projects;
import android.database.Cursor;import android.database.sqlite.SQLiteDatabase;import android.graphics.*;import java.io.*;import java.util.*;
/** Read-only raster MBTiles table. No network, extensions, SQL from the file, or file extraction. */
public final class OfflineTiles implements Closeable {
 private final SQLiteDatabase db;private final boolean[] levels=new boolean[24];private final boolean xyz;private final String table;public final int minZoom,maxZoom;public static final long MAX_FILE=2L*1024*1024*1024;
 public OfflineTiles(File file)throws IOException{
  SQLiteDatabase opened=null;
  try {
   if(file.length()<100||file.length()>MAX_FILE)throw new IOException("Недопустимый размер MBTiles (предел 2 ГиБ)");
   byte[] signature=new byte[16];try(InputStream in=new FileInputStream(file)){if(in.read(signature)!=16||!Arrays.equals(signature,"SQLite format 3\0".getBytes("US-ASCII")))throw new IOException("Файл не является SQLite MBTiles");}
   opened=SQLiteDatabase.openDatabase(file.getAbsolutePath(),null,SQLiteDatabase.OPEN_READONLY|SQLiteDatabase.NO_LOCALIZED_COLLATORS);
   if(physical(opened,"tiles")){table="tiles";columns(opened,"tiles","zoom_level","tile_column","tile_row","tile_data");tileIndex(opened,"tiles");}
   else if(physical(opened,"map")&&physical(opened,"images")){
    columns(opened,"map","zoom_level","tile_column","tile_row","tile_id");columns(opened,"images","tile_id","tile_data");tileIndex(opened,"map");
    if(!index(opened,"images",new String[]{"tile_id"},true))throw new IOException("В images нет уникального индекса tile_id");
    // Use our own fixed JOIN, never execute a view stored in an imported file.
    table="(SELECT m.zoom_level,m.tile_column,m.tile_row,i.tile_data FROM map AS m JOIN images AS i ON m.tile_id=i.tile_id)";
   }else throw new IOException("Нужна растровая таблица tiles либо таблицы map и images");
   boolean metadata=false;try(Cursor c=opened.rawQuery("SELECT type FROM sqlite_master WHERE name='metadata'",null)){metadata=c.moveToFirst()&&"table".equals(c.getString(0));}
   String scheme="tms";if(metadata)try(Cursor c=opened.rawQuery("SELECT value FROM metadata WHERE name='scheme' LIMIT 1",null)){if(c.moveToFirst()&&c.getString(0)!=null)scheme=c.getString(0).trim().toLowerCase(Locale.US);}
   if(!"tms".equals(scheme)&&!"xyz".equals(scheme))throw new IOException("Неизвестная схема MBTiles: "+scheme);xyz="xyz".equals(scheme);
   int low=24,high=-1;
   for(int z=0;z<=23;z++)try(Cursor c=opened.rawQuery("SELECT 1 FROM "+table+" WHERE zoom_level=? AND tile_column>=0 AND tile_column<? AND tile_row>=0 AND tile_row<? LIMIT 1",new String[]{Integer.toString(z),Long.toString(1L<<z),Long.toString(1L<<z)})){if(c.moveToFirst()){levels[z]=true;low=Math.min(low,z);high=z;}}
   if(high<0)throw new IOException("В MBTiles нет уровней 0–23");
   // Validate at least one raster image before replacing the user's previous map.
   byte[] sample=null;try(Cursor c=opened.rawQuery("SELECT tile_data FROM "+table+" WHERE zoom_level=? AND typeof(tile_data)='blob' AND length(tile_data) BETWEEN 1 AND 1048576 LIMIT 1",new String[]{Integer.toString(low)})){if(c.moveToFirst())sample=c.getBlob(0);}
   Bitmap bitmap=decode(sample);if(bitmap==null)throw new IOException("Нужны растровые PNG/JPEG/WebP тайлы; векторные PBF не поддерживаются");bitmap.recycle();
   db=opened;minZoom=low;maxZoom=high;
  }catch(Exception e){if(opened!=null)opened.close();if(e instanceof IOException)throw (IOException)e;throw new IOException("Не удалось открыть MBTiles: "+e.getMessage(),e);}
 }
 private static boolean physical(SQLiteDatabase db,String name){try(Cursor c=db.rawQuery("SELECT type,sql FROM sqlite_master WHERE name=?",new String[]{name})){return c.moveToFirst()&&"table".equals(c.getString(0))&&c.getString(1)!=null&&!c.getString(1).toUpperCase(Locale.US).contains("VIRTUAL");}}
 private static void columns(SQLiteDatabase db,String name,String... required)throws IOException{Set<String> cols=new HashSet<>();try(Cursor c=db.rawQuery("PRAGMA table_info("+name+")",null)){while(c.moveToNext())cols.add(c.getString(1));}if(!cols.containsAll(Arrays.asList(required)))throw new IOException("Нет обязательных столбцов "+name);}
 private static void tileIndex(SQLiteDatabase db,String name)throws IOException{if(!index(db,name,new String[]{"zoom_level","tile_column","tile_row"},false))throw new IOException("В MBTiles нет индекса тайлов");}
 private static boolean index(SQLiteDatabase db,String table,String[] required,boolean unique){try(Cursor c=db.rawQuery("PRAGMA index_list("+table+")",null)){while(c.moveToNext()){if(unique&&c.getInt(2)!=1)continue;String name=c.getString(1);if(name==null)continue;List<String> keys=new ArrayList<>();try(Cursor k=db.rawQuery("PRAGMA index_info(\""+name.replace("\"","\"\"")+"\")",null)){while(k.moveToNext())keys.add(k.getString(2));}if(keys.size()>=required.length&&required[0].equals(keys.get(0))&&new HashSet<>(keys.subList(0,required.length)).equals(new HashSet<>(Arrays.asList(required))))return true;}}return false;}
 static Bitmap decode(byte[] bytes){
  if(bytes==null)return null;BitmapFactory.Options o=new BitmapFactory.Options();o.inJustDecodeBounds=true;BitmapFactory.decodeByteArray(bytes,0,bytes.length,o);
  if(o.outWidth<1||o.outHeight<1||o.outWidth>4096||o.outHeight>4096)return null;
  o.inJustDecodeBounds=false;o.inSampleSize=1;while(o.outWidth/o.inSampleSize>512||o.outHeight/o.inSampleSize>512)o.inSampleSize*=2;o.inPreferredConfig=Bitmap.Config.ARGB_8888;
  return BitmapFactory.decodeByteArray(bytes,0,bytes.length,o);
 }
 public int zoomFor(int requested){int z=(int)MapMath.clamp(requested,0,23);for(int i=z;i>=0;i--)if(levels[i])return i;for(int i=z+1;i<=23;i++)if(levels[i])return i;return minZoom;}
 public Bitmap tile(int z,int x,int xyzY){
  if(z<0||z>23||x<0||x>=(1<<z)||xyzY<0||xyzY>=(1<<z))return null;
  String[] args={Integer.toString(z),Integer.toString(x),Long.toString(xyz?xyzY:MapMath.tmsRow(z,xyzY))};
  try(Cursor c=db.rawQuery("SELECT tile_data FROM "+table+" WHERE zoom_level=? AND tile_column=? AND tile_row=? AND typeof(tile_data)='blob' AND length(tile_data) BETWEEN 1 AND 1048576 LIMIT 1",args)){return c.moveToFirst()?decode(c.getBlob(0)):null;}
 }
 public void close(){db.close();}
}
