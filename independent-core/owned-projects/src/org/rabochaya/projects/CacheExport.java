package org.rabochaya.projects;
import android.content.*;import android.database.sqlite.*;import android.graphics.*;import java.io.*;import java.util.*;
/** Offline-only raster snapshot of the selected map/set, including its transparency.
 * Output is standard EPSG:3857 MBTiles/TMS; never copies projects or attachments. */
public final class CacheExport {
 public interface Progress {void update(int done,int total)throws IOException;}
 private static final long MAX_BYTES=512L*1024*1024;
 private CacheExport(){}
 public static int write(Context context,TileSource source,File destination,Progress progress)throws IOException{
  TileSource[] leaves=source.leafs();OnlineTiles[] readers=new OnlineTiles[leaves.length];SQLiteDatabase out=null;boolean complete=false;int count=0;
  try{
   TreeMap<String,int[]> keys=new TreeMap<>();
   for(int i=0;i<leaves.length;i++){
    readers[i]=new OnlineTiles(context,leaves[i]);
    for(int[] key:readers[i].keys()){
     int z=key[0],n=1<<z;int first=key[2],last=first;
     if(leaves[i].ellipsoid){double top=MapMath.y(TileProjection.latitude(first/(double)n,true))*n,bottom=MapMath.y(TileProjection.latitude((first+1.0)/n,true))*n;first=Math.max(0,(int)Math.floor(top+1e-9));last=Math.min(n-1,(int)Math.ceil(bottom-1e-9)-1);}
     for(int y=first;y<=last;y++){keys.put(z+"/"+key[1]+"/"+y,new int[]{z,key[1],y});if(keys.size()>20000)throw new IOException("Экспорт ограничен 20 000 выходных тайлов");}
    }
   }
   if(keys.isEmpty())throw new IOException("В кеше выбранной карты нет тайлов");progress.update(0,keys.size());
   if(destination.exists()&&!destination.delete())throw new IOException("Не удалось подготовить файл экспорта");
   out=SQLiteDatabase.openOrCreateDatabase(destination,null);out.execSQL("CREATE TABLE metadata(name TEXT PRIMARY KEY,value TEXT)");out.execSQL("CREATE TABLE tiles(zoom_level INTEGER NOT NULL,tile_column INTEGER NOT NULL,tile_row INTEGER NOT NULL,tile_data BLOB NOT NULL,PRIMARY KEY(zoom_level,tile_column,tile_row))");
   meta(out,"name",source.name);meta(out,"attribution",source.attribution);meta(out,"format","png");meta(out,"type","baselayer");meta(out,"version","1.3");meta(out,"scheme","tms");
   long bytes=0;int done=0,min=24,max=-1;out.beginTransaction();
   try{for(int[] key:keys.values()){
    progress.update(done,keys.size());Bitmap bitmap=render(readers,leaves,key[0],key[1],key[2]);
    if(bitmap!=null)try{ByteArrayOutputStream encoded=new ByteArrayOutputStream();if(!bitmap.compress(Bitmap.CompressFormat.PNG,100,encoded))throw new IOException("Не удалось сохранить изображение тайла");byte[] data=encoded.toByteArray();bytes+=data.length;if(bytes>MAX_BYTES)throw new IOException("Экспорт больше 512 МиБ; уменьшите кеш");ContentValues row=new ContentValues();row.put("zoom_level",key[0]);row.put("tile_column",key[1]);row.put("tile_row",MapMath.tmsRow(key[0],key[2]));row.put("tile_data",data);out.insertOrThrow("tiles",null,row);count++;min=Math.min(min,key[0]);max=Math.max(max,key[0]);}finally{bitmap.recycle();}
    done++;
   }if(count==0)throw new IOException("В кеше нет читаемых растровых тайлов");meta(out,"minzoom",Integer.toString(min));meta(out,"maxzoom",Integer.toString(max));out.setTransactionSuccessful();}finally{out.endTransaction();}
   out.close();out=null;try(RandomAccessFile f=new RandomAccessFile(destination,"rw")){f.getFD().sync();}progress.update(keys.size(),keys.size());complete=true;return count;
  }catch(Exception e){if(e instanceof IOException)throw (IOException)e;throw new IOException("Не удалось экспортировать кеш: "+e.getMessage(),e);}
  finally{if(out!=null)out.close();for(OnlineTiles r:readers)if(r!=null)r.close();if(!complete)destination.delete();}
 }
 private static void meta(SQLiteDatabase db,String name,String value){ContentValues row=new ContentValues();row.put("name",name);row.put("value",value);db.insertOrThrow("metadata",null,row);}
 private static Bitmap render(OnlineTiles[] readers,TileSource[] leaves,int z,int x,int y)throws IOException{
  Bitmap result=null;Paint paint=new Paint(Paint.FILTER_BITMAP_FLAG);int n=1<<z;
  try{for(int i=0;i<leaves.length;i++){
   TileSource s=leaves[i];if(!s.hasZoom(z))continue;
   int first=y,last=y;if(s.ellipsoid){first=Math.max(0,(int)Math.floor(TileProjection.y(MapMath.lat(y/(double)n),true)*n));last=Math.min(n-1,(int)Math.floor(TileProjection.y(MapMath.lat((y+1.0)/n),true)*n));}
   for(int sy=first;sy<=last;sy++){
    Bitmap tile=readers[i].tile(z,x,sy,false);if(tile==null)continue;
    try{if(result==null)result=Bitmap.createBitmap(256,256,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(result);
     if(!s.ellipsoid)canvas.drawBitmap(tile,null,new RectF(0,0,256,256),paint);
     else for(int row=0;row<tile.getHeight();row++){
      double top=MapMath.y(TileProjection.latitude((sy+row/(double)tile.getHeight())/n,true))*n,bottom=MapMath.y(TileProjection.latitude((sy+(row+1.0)/tile.getHeight())/n,true))*n;
      canvas.drawBitmap(tile,new Rect(0,row,tile.getWidth(),row+1),new RectF(0,(float)((top-y)*256),256,(float)((bottom-y)*256)),paint);
     }
    }finally{tile.recycle();}
   }
  }return result;}catch(IOException|RuntimeException e){if(result!=null)result.recycle();throw e;}
 }
}
