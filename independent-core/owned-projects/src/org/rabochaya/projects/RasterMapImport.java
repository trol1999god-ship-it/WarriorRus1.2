package org.rabochaya.projects;
import android.content.ContentValues;import android.database.sqlite.SQLiteDatabase;import android.graphics.Bitmap;import java.io.*;import java.util.Locale;
/** Shared bounded raster conversion; no network, project writes or source ownership. */
public final class RasterMapImport {
 private RasterMapImport(){}
 public interface Source {GeoRasterTransform transform();int color(double lon,double lat)throws IOException;}
 public static int write(Source raster,File destination,CacheExport.Progress progress,String label,boolean affine)throws IOException{return RasterExportFile.replace(destination,tmp->prepared(raster,tmp,progress,label,affine));}
 private static void meta(SQLiteDatabase db,String name,String value){ContentValues row=new ContentValues();row.put("name",name);row.put("value",value);db.insertOrThrow("metadata",null,row);}
 private static int prepared(Source raster,File file,CacheExport.Progress progress,String label,boolean affine)throws IOException{
  GeoRasterTransform t=raster.transform();if(t.south< -85.05112878||t.north>85.05112878)throw new IOException("Растр выходит за область Web Mercator");
  double left=MapMath.x(t.west),right=MapMath.x(t.east),top=MapMath.y(t.north),bottom=MapMath.y(t.south);
  if(!(right>left&&bottom>top))throw new IOException("Пустые границы растра");
  int zoom=0;double scale=Math.max(t.width/(right-left),t.height/(bottom-top));if(affine){double density=t.pixelsPerWorldUnit();if(!(density>0)||Double.isNaN(density)||Double.isInfinite(density))throw new IOException("Непредставимый шаг affine растра");scale=Math.max(scale,density);}while(zoom<23&&(256L<<zoom)<scale)zoom++;
  if((256L<<zoom)<scale)throw new IOException("Разрешение растра выше поддерживаемого z23");
  int total=0;for(int z=0;z<=zoom;z++){int n=1<<z;long count=(long)(last(right,n)-first(left,n)+1)*(last(bottom,n)-first(top,n)+1);if(count>20000-total)throw new IOException("Импорт ограничен 20 000 тайлов");total+=(int)count;}
  final int planned=total;progress.update(0,planned);if(file.exists()&&!file.delete())throw new IOException("Не удалось подготовить временную карту");SQLiteDatabase db=null;
  try{db=SQLiteDatabase.openOrCreateDatabase(file,null);db.execSQL("CREATE TABLE metadata(name TEXT PRIMARY KEY,value TEXT)");db.execSQL("CREATE TABLE tiles(zoom_level INTEGER NOT NULL,tile_column INTEGER NOT NULL,tile_row INTEGER NOT NULL,tile_data BLOB NOT NULL,PRIMARY KEY(zoom_level,tile_column,tile_row))");meta(db,"name",label);meta(db,"format","png");meta(db,"type","baselayer");meta(db,"version","1.3");meta(db,"scheme","tms");meta(db,"minzoom","0");meta(db,"maxzoom",Integer.toString(zoom));meta(db,"bounds",String.format(Locale.US,"%.12f,%.12f,%.12f,%.12f",t.west,t.south,t.east,t.north));int done=0;long bytes=0;
   db.beginTransaction();try{int[] pixels=new int[256*256];for(int z=0;z<=zoom;z++){int n=1<<z;for(int y=first(top,n);y<=last(bottom,n);y++)for(int x=first(left,n);x<=last(right,n);x++){
    progress.update(done,planned);for(int py=0;py<256;py++){double lat=MapMath.lat((y+(py+.5)/256)/n);for(int px=0;px<256;px++)pixels[py*256+px]=raster.color((x+(px+.5)/256)/n*360-180,lat);}
    Bitmap image=Bitmap.createBitmap(pixels,256,256,Bitmap.Config.ARGB_8888);byte[] encoded;try{ByteArrayOutputStream data=new ByteArrayOutputStream();if(!image.compress(Bitmap.CompressFormat.PNG,100,data))throw new IOException("Ошибка кодирования карты");encoded=data.toByteArray();}finally{image.recycle();}bytes+=encoded.length;if(bytes>512L*1024*1024)throw new IOException("Карта больше 512 МиБ");ContentValues row=new ContentValues();row.put("zoom_level",z);row.put("tile_column",x);row.put("tile_row",MapMath.tmsRow(z,y));row.put("tile_data",encoded);db.insertOrThrow("tiles",null,row);done++;
   }}progress.update(done,planned);db.setTransactionSuccessful();}finally{db.endTransaction();}return done;
  }catch(RuntimeException e){throw new IOException("Не удалось преобразовать локальный растр: "+e.getMessage(),e);}finally{if(db!=null)db.close();}
 }
 private static int first(double coordinate,int n){return Math.max(0,Math.min(n-1,(int)Math.floor(coordinate*n)));}
 private static int last(double coordinate,int n){return Math.max(0,Math.min(n-1,(int)Math.ceil(coordinate*n)-1));}
}
