package ru.warriorrus.app.map;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.BitmapFactory;
import java.io.*;
import java.net.URI;
import java.util.*;
import java.util.function.*;
import org.json.*;

/** Bounded, resumable raster download. Only user-authorized custom tile endpoints. */
public final class TileDownload {
  public static final int MAX_TILES=20000;
  public static final class Tile {public final int z,x,y;Tile(int z,int x,int y){this.z=z;this.x=x;this.y=y;}}
  public static final class Spec {
    public String url,name,file,credit="";public double south,west,north,east;public int min,max;
    public String json(){try{return new JSONObject().put("url",url).put("credit",credit).put("name",name).put("file",file).put("south",south).put("west",west).put("north",north).put("east",east).put("min",min).put("max",max).toString();}catch(JSONException e){throw new IllegalArgumentException(e);}}
    public static Spec parse(String json)throws JSONException{JSONObject o=new JSONObject(json);Spec s=new Spec();s.url=o.getString("url");s.credit=o.optString("credit","");s.name=o.getString("name");s.file=o.getString("file");s.south=o.getDouble("south");s.west=o.getDouble("west");s.north=o.getDouble("north");s.east=o.getDouble("east");s.min=o.getInt("min");s.max=o.getInt("max");return s;}
  }
  public interface Fetcher {byte[] get(String url)throws Exception;}
  private TileDownload(){}
  public static List<Tile> tiles(Spec s) {
    MapCatalog.validateUrl(s.url);String host=URI.create(MapCatalog.tileUrl(s.url,0,0,0)).getHost();
    if(host.equalsIgnoreCase("tile.openstreetmap.org")||host.toLowerCase(Locale.ROOT).endsWith(".tile.openstreetmap.org"))throw new IllegalArgumentException("Публичный сервер OSM не разрешает загрузку области");
    if(s.min<0||s.max>22||s.max<s.min||!finite(s.south)||!finite(s.north)||!finite(s.west)||!finite(s.east)||s.south>=s.north||s.south< -85.05112878||s.north>85.05112878||Math.abs(s.west)>180||Math.abs(s.east)>180)throw new IllegalArgumentException("Неверная область или уровни 0…22");
    List<Tile> tiles=new ArrayList<>();
    for(int z=s.min;z<=s.max;z++) {int n=1<<z,left=x(s.west,n),right=x(s.east,n),top=y(s.north,n),bottom=y(s.south,n);
      long width=left<=right?(long)right-left+1:(long)n-left+right+1;
      if((long)tiles.size()+width*(bottom-top+1)>MAX_TILES)throw new IllegalArgumentException("Не более 20 000 тайлов за задание. Уменьшите область или глубину.");
      for(int col=left;;col=(col+1)%n){for(int row=top;row<=bottom;row++)tiles.add(new Tile(z,col,row));if(col==right)break;}
    }return tiles;
  }
  private static boolean finite(double v){return !Double.isNaN(v)&&!Double.isInfinite(v);}
  private static int x(double lon,int n){return Math.max(0,Math.min(n-1,(int)Math.floor((lon+180)/360*n)));}
  private static int y(double lat,int n){double r=Math.toRadians(lat);return Math.max(0,Math.min(n-1,(int)Math.floor((1-Math.log(Math.tan(r)+1/Math.cos(r))/Math.PI)/2*n)));}
  public static void run(Spec spec,File output,Fetcher fetch,BooleanSupplier cancelled,java.util.function.BiConsumer<Integer,Integer> progress)throws Exception {
    List<Tile> tiles=tiles(spec);
    try(SQLiteDatabase db=SQLiteDatabase.openOrCreateDatabase(output,null)) {
      RasterMaps.createMbtiles(db,spec.name);db.execSQL("INSERT OR REPLACE INTO metadata VALUES('attribution',?)",new Object[]{spec.credit});db.execSQL("INSERT OR REPLACE INTO metadata VALUES('bounds',?)",new Object[]{spec.west+","+spec.south+","+spec.east+","+spec.north});
      db.execSQL("INSERT OR REPLACE INTO metadata VALUES('minzoom',?),('maxzoom',?)",new Object[]{""+spec.min,""+spec.max});
      int done=0;long bytes=output.length();
      for(Tile tile:tiles) {
        if(cancelled.getAsBoolean())throw new InterruptedIOException("Загрузка приостановлена");
        long tms=(1L<<tile.z)-1-tile.y;boolean exists;
        try(Cursor c=db.rawQuery("SELECT 1 FROM tiles WHERE zoom_level=? AND tile_column=? AND tile_row=?",new String[]{""+tile.z,""+tile.x,""+tms})){exists=c.moveToFirst();}
        if(!exists) {
          byte[] image=fetch.get(MapCatalog.tileUrl(spec.url,tile.z,tile.x,tile.y));BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;BitmapFactory.decodeByteArray(image,0,image.length,options);
          if(options.outWidth<=0||options.outHeight<=0)throw new IOException("Сервер вернул не растровый тайл");
          if(options.outMimeType!=null)db.execSQL("INSERT OR REPLACE INTO metadata VALUES('format',?)",new Object[]{options.outMimeType.equals("image/jpeg")?"jpg":options.outMimeType.substring(options.outMimeType.indexOf('/')+1)});
          bytes+=image.length;if(bytes>1024L*1024*1024)throw new IOException("Архив достиг 1 ГиБ");
          ContentValues v=new ContentValues();v.put("zoom_level",tile.z);v.put("tile_column",tile.x);v.put("tile_row",tms);v.put("tile_data",image);db.insertOrThrow("tiles",null,v);
        }progress.accept(++done,tiles.size());
      }
    }
  }
}
