package ru.warriorrus.app.map;

import static org.junit.Assert.*;
import java.io.*;
import java.util.*;
import android.database.sqlite.SQLiteDatabase;
import android.database.Cursor;
import android.content.ContentValues;
import android.graphics.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import org.robolectric.android.controller.ActivityController;
import ru.warriorrus.app.MainActivity;
import ru.warriorrus.app.data.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk={23,35})
public class RasterMapsTest {
  private android.content.Context context;
  @Before public void before(){context=RuntimeEnvironment.getApplication();context.deleteDatabase("warrior2.db");context.getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).commit();}
  private byte[] png(){Bitmap b=Bitmap.createBitmap(256,256,Bitmap.Config.ARGB_8888);b.eraseColor(Color.BLUE);ByteArrayOutputStream out=new ByteArrayOutputStream();b.compress(Bitmap.CompressFormat.PNG,100,out);b.recycle();return out.toByteArray();}
  @Test public void importsMbtilesAndReadsCorrectTmsTileWithoutNetwork()throws Exception{
    File original=new File(context.getCacheDir(),"source-"+UUID.randomUUID()+".mbtiles");byte[] image=png();
    try(SQLiteDatabase db=SQLiteDatabase.openOrCreateDatabase(original,null)){RasterMaps.createMbtiles(db,"Test");ContentValues v=new ContentValues();v.put("zoom_level",2);v.put("tile_column",1);v.put("tile_row",2);v.put("tile_data",image);db.insertOrThrow("tiles",null,v);}
    RasterMaps.Imported imported;try(InputStream in=new FileInputStream(original)){imported=RasterMaps.importFile(context,in,"Test.mbtiles");}
    assertEquals(2,imported.min);assertEquals(2,imported.max);
    org.osmdroid.tileprovider.modules.MBTilesFileArchive archive=new org.osmdroid.tileprovider.modules.MBTilesFileArchive();archive.init(imported.file);
    try(InputStream tile=archive.getInputStream(null,org.osmdroid.util.MapTileIndex.getTileIndex(2,1,1))){assertNotNull(tile);assertArrayEquals(image,ru.warriorrus.app.exchange.PlacemarkFiles.bounded(tile,1024*1024));}archive.close();
  }
  @Test public void layersPreserveOrderOpacityAndVisibilityAcrossRestart()throws Exception{
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()){
      org.osmdroid.views.MapView view=find(c.get().getWindow().getDecorView());MapCatalog catalog=new MapCatalog(c.get(),view);
      MapCatalog.Layer custom=catalog.addOnline("Local","https://example.invalid/{z}/{x}/{y}.png","Test source",true);custom.visible=false;custom.opacity=35;catalog.reorder(custom,-1);catalog.save();assertEquals(custom.id,catalog.layers.get(0).id);catalog.close();
    }
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()){
      MapCatalog catalog=new MapCatalog(c.get(),find(c.get().getWindow().getDecorView()));assertEquals("Local",catalog.layers.get(0).name);assertFalse(catalog.layers.get(0).visible);assertEquals(35,catalog.layers.get(0).opacity);catalog.close();
    }
  }
  @Test public void boundedDownloadUsesTmsAndResumeSkipsAlreadyStoredTiles()throws Exception{
    TileDownload.Spec s=new TileDownload.Spec();s.url="https://example.invalid/{z}/{x}/{y}.png";s.name="Area";s.south=-10;s.north=10;s.west=-10;s.east=10;s.min=1;s.max=1;
    File file=new File(context.getCacheDir(),"download-"+UUID.randomUUID()+".mbtiles");int[] requests={0};byte[] image=png();
    TileDownload.run(s,file,url->{requests[0]++;return image;},()->false,(done,total)->{});assertEquals(4,requests[0]);
    TileDownload.run(s,file,url->{fail("Existing tile must not be fetched");return null;},()->false,(done,total)->{});
    try(SQLiteDatabase db=SQLiteDatabase.openDatabase(file.getPath(),null,SQLiteDatabase.OPEN_READONLY);Cursor c=db.rawQuery("SELECT COUNT(*) FROM tiles",null)){c.moveToFirst();assertEquals(4,c.getInt(0));}
    s.max=22;try{TileDownload.tiles(s);fail();}catch(IllegalArgumentException expected){}
    s.max=1;s.url="https://tile.openstreetmap.org/{z}/{x}/{y}.png";try{TileDownload.tiles(s);fail();}catch(IllegalArgumentException expected){}
  }
  private org.osmdroid.views.MapView find(android.view.View view){if(view instanceof org.osmdroid.views.MapView)return(org.osmdroid.views.MapView)view;if(view instanceof android.view.ViewGroup)for(int n=0;n<((android.view.ViewGroup)view).getChildCount();n++){org.osmdroid.views.MapView found=find(((android.view.ViewGroup)view).getChildAt(n));if(found!=null)return found;}return null;}
}
