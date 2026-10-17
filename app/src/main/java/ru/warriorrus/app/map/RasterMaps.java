package ru.warriorrus.app.map;

import android.content.*;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.BitmapFactory;
import java.io.*;
import java.util.*;

/** Validates local raster archives before they enter the catalog. No online fallbacks. */
public final class RasterMaps {
  public static final class Imported {public File file;public int min=0,max=22;public String name;public double[] bounds;}
  private RasterMaps(){}
  public static Imported importFile(Context context,InputStream input,String original)throws Exception {
    String lower=original.toLowerCase(Locale.ROOT),ext=lower.substring(lower.lastIndexOf('.')+1);
    if(!Arrays.asList("mbtiles","sqlite","gemf","zip","gpkg").contains(ext))throw new IOException("Выберите растровый MBTiles, GeoPackage (EPSG:3857), osmdroid SQLite/ZIP или GEMF");
    File root=new File(context.getFilesDir(),"maps");if(!root.isDirectory()&&!root.mkdirs())throw new IOException("Хранилище карт недоступно");
    File file=new File(root,UUID.randomUUID()+"."+ext);boolean done=false;
    try {
      try(FileOutputStream output=new FileOutputStream(file)){byte[] buffer=new byte[65536];long size=0;int n;while((n=input.read(buffer))!=-1){size+=n;if(size>4L*1024*1024*1024)throw new IOException("Архив больше 4 ГиБ");output.write(buffer,0,n);}output.getFD().sync();}
      Imported result=new Imported();result.file=file;result.name=original;
      if("gpkg".equals(ext)){File converted=new File(root,UUID.randomUUID()+".mbtiles");convertGeoPackage(file,converted);file.delete();file=converted;result.file=converted;ext="mbtiles";}
      if("mbtiles".equals(ext)) {
        try(SQLiteDatabase db=SQLiteDatabase.openDatabase(file.getPath(),null,SQLiteDatabase.OPEN_READONLY|SQLiteDatabase.NO_LOCALIZED_COLLATORS)) {
          try(Cursor c=db.rawQuery("SELECT MIN(zoom_level),MAX(zoom_level),COUNT(*) FROM tiles",null)){if(!c.moveToFirst()||c.getLong(2)==0)throw new IOException("В архиве нет тайлов");result.min=c.getInt(0);result.max=c.getInt(1);if(result.min<0||result.max>22)throw new IOException("Неподдерживаемые уровни масштаба");}
          try(Cursor c=db.rawQuery("SELECT tile_data FROM tiles LIMIT 1",null)){c.moveToFirst();byte[] tile=c.getBlob(0);BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;BitmapFactory.decodeByteArray(tile,0,tile.length,options);if(options.outWidth<=0||options.outHeight<=0)throw new IOException("Нужен растровый MBTiles: векторные PBF не поддерживаются");}
          try(Cursor c=db.rawQuery("SELECT value FROM metadata WHERE name='bounds' LIMIT 1",null)){if(c.moveToFirst()){String[] pair=c.getString(0).split(",");if(pair.length==4){result.bounds=new double[4];for(int n=0;n<4;n++)result.bounds[n]=Double.parseDouble(pair[n]);}}}catch(Exception ignored){}
        }
      } else {
        org.osmdroid.tileprovider.modules.IArchiveFile archive=org.osmdroid.tileprovider.modules.ArchiveFileFactory.getArchiveFile(file);
        if(archive==null)throw new IOException("Файл не распознан как архив карты");archive.close();
      }
      done=true;return result;
    }finally{if(!done)file.delete();}
  }
  private static void convertGeoPackage(File input,File output)throws Exception {
    boolean done=false;
    try(SQLiteDatabase source=SQLiteDatabase.openDatabase(input.getPath(),null,SQLiteDatabase.OPEN_READONLY|SQLiteDatabase.NO_LOCALIZED_COLLATORS)) {
      String table;
      try(Cursor c=source.rawQuery("SELECT c.table_name FROM gpkg_contents c JOIN gpkg_spatial_ref_sys s ON s.srs_id=c.srs_id WHERE c.data_type='tiles' AND s.organization='EPSG' AND s.organization_coordsys_id=3857 LIMIT 1",null)){if(!c.moveToFirst())throw new IOException("GeoPackage должен содержать растровую карту EPSG:3857");table=c.getString(0);}
      try(Cursor c=source.rawQuery("SELECT min_x,min_y,max_x,max_y FROM gpkg_tile_matrix_set WHERE table_name=?",new String[]{table})){if(!c.moveToFirst()||Math.abs(c.getDouble(0)+20037508.342789244)>1||Math.abs(c.getDouble(1)+20037508.342789244)>1||Math.abs(c.getDouble(2)-20037508.342789244)>1||Math.abs(c.getDouble(3)-20037508.342789244)>1)throw new IOException("GeoPackage использует локальную матрицу; требуется глобальная Web Mercator");}
      try(Cursor c=source.rawQuery("SELECT zoom_level,matrix_width,matrix_height FROM gpkg_tile_matrix WHERE table_name=?",new String[]{table})){while(c.moveToNext()){int z=c.getInt(0);if(z<0||z>22||c.getLong(1)!=(1L<<z)||c.getLong(2)!=(1L<<z))throw new IOException("Неподдерживаемая матрица GeoPackage");}}
      try(SQLiteDatabase target=SQLiteDatabase.openOrCreateDatabase(output,null)) {
        createMbtiles(target,input.getName());target.beginTransaction();
        try(Cursor c=source.rawQuery("SELECT zoom_level,tile_column,tile_row,tile_data FROM \""+table.replace("\"","\"\"")+"\"",null)){
          while(c.moveToNext()){int z=c.getInt(0);ContentValues v=new ContentValues();v.put("zoom_level",z);v.put("tile_column",c.getInt(1));v.put("tile_row",(1L<<z)-1-c.getLong(2));v.put("tile_data",c.getBlob(3));target.insertOrThrow("tiles",null,v);}target.setTransactionSuccessful();
        }finally{target.endTransaction();}
      }done=true;
    }finally{if(!done)output.delete();}
  }
  public static void createMbtiles(SQLiteDatabase db,String name){db.execSQL("CREATE TABLE IF NOT EXISTS metadata(name TEXT PRIMARY KEY,value TEXT)");db.execSQL("CREATE TABLE IF NOT EXISTS tiles(zoom_level INTEGER,tile_column INTEGER,tile_row INTEGER,tile_data BLOB,UNIQUE(zoom_level,tile_column,tile_row))");db.execSQL("INSERT OR IGNORE INTO metadata(name,value) VALUES('name',?),('format','png'),('type','baselayer'),('version','1.3')",new Object[]{name});}
}
