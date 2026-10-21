package ru.warriorrus.app;

import static org.junit.Assert.*;
import android.content.Context;
import android.database.sqlite.*;
import java.io.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.exchange.*;
import ru.warriorrus.app.geometry.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk={23,35})
public class ObjectAppearanceIntegrationTest {
  private Context context;
  @Before public void clear(){context=RuntimeEnvironment.getApplication();context.deleteDatabase("warrior2.db");}

  @Test public void versionFourDatabaseMigratesWithoutLosingObjectsAndStylesSurviveCopyUndoAndReopen(){
    SQLiteOpenHelper legacy=new SQLiteOpenHelper(context,"warrior2.db",null,4){
      @Override public void onCreate(SQLiteDatabase db){
        db.execSQL("CREATE TABLE objects(id INTEGER PRIMARY KEY AUTOINCREMENT,parent INTEGER,name TEXT NOT NULL,kind TEXT NOT NULL,latitude REAL DEFAULT 0,longitude REAL DEFAULT 0,visible INTEGER DEFAULT 1,position INTEGER DEFAULT 0,color INTEGER DEFAULT -12627531,opacity REAL DEFAULT 1,icon TEXT DEFAULT 'builtin:pin',subtype TEXT DEFAULT '',geometry TEXT DEFAULT '[]',description TEXT DEFAULT '',attachments TEXT DEFAULT '[]',created INTEGER DEFAULT 0,updated INTEGER DEFAULT 0,trashed INTEGER DEFAULT 0)");
        db.execSQL("CREATE TABLE history(id INTEGER PRIMARY KEY AUTOINCREMENT,snapshot TEXT NOT NULL,created INTEGER NOT NULL)");
        db.execSQL("INSERT INTO objects(name,kind,latitude,longitude,description) VALUES('Старая метка','point',55,37,'До обновления')");
      }
      @Override public void onUpgrade(SQLiteDatabase db,int oldVersion,int newVersion){fail();}
    };
    legacy.getWritableDatabase();legacy.close();long copy;
    try(ObjectStore store=new ObjectStore(context)){
      MapItem old=store.get(1);assertEquals("До обновления",old.description);assertEquals(55,old.latitude,0);
      assertEquals(0,old.appearance.lineWidth,0);old.appearance.labelSize=21;old.appearance.labelBold=true;old.appearance.keywords="проверка";store.save(old);
      store.transfer(Collections.singleton(1L),0,true);
      copy=store.all().stream().filter(i->i.id!=1).findFirst().get().id;
      MapItem changed=store.get(copy);changed.appearance.labelSize=9;store.save(changed);store.undo();
    }
    try(ObjectStore store=new ObjectStore(context)){
      assertEquals(21,store.get(copy).appearance.labelSize,0);assertTrue(store.get(copy).appearance.labelBold);
      assertEquals("проверка",store.get(1).appearance.keywords);store.delete(Collections.singleton(copy));
      store.restoreTrash(Collections.singleton(copy));assertEquals(21,store.get(copy).appearance.labelSize,0);
    }
  }

  private MapItem object(String kind,String name,long id){
    MapItem i=new MapItem();i.id=id;i.kind=kind;i.name=name;i.visible=true;i.opacity=.6f;i.color=0xff336699;i.latitude=55;i.longitude=37;
    i.appearance.lineWidth=7.5f;i.appearance.dash="dashdot";i.appearance.fillColor=0xffaa2255;
    i.appearance.fillOpacity=.35f;i.appearance.labelSize=22;i.appearance.labelBold=true;
    i.appearance.keywords="ключ & значение";i.appearance.url="https://example.invalid/?a=1&b=2";return i;
  }
  @Test public void kmlAndKmzKeepCircleCenterTextIdentityAndIndependentFillStyle()throws Exception{
    MapItem circle=object("area","Круг",1);circle.icon="builtin:circle";
    circle.appearance.circleLatitude=55d;circle.appearance.circleLongitude=37d;circle.appearance.circleRadiusMeters=1234.5;
    List<Vertex> ring=new ArrayList<>();for(int n=0;n<96;n++)ring.add(Geometry.project(new Vertex(55,37),n*360d/96,1234.5));circle.segments.add(ring);
    MapItem text=object("point","Текст",2);text.icon="builtin:text";text.appearance.textObject=true;
    for(String format:new String[]{"kml","kmz"}){
      ByteArrayOutputStream bytes=new ByteArrayOutputStream();BundleExchange.write(context,Arrays.asList(circle,text),bytes,format);
      List<MapItem> restored=BundleExchange.read(context,new ByteArrayInputStream(bytes.toByteArray()));
      MapItem c=restored.get(0),t=restored.get(1);
      assertTrue(format,c.isCircle());assertTrue(format,t.isText());assertEquals(55,c.latitude,1e-7);assertEquals(37,c.longitude,1e-7);
      assertEquals(1234.5,c.appearance.circleRadiusMeters,1e-6);assertEquals(96,Geometry.count(c));
      assertEquals(.6,c.opacity,1e-6);assertEquals(Integer.valueOf(0xffaa2255),c.appearance.fillColor);
      assertEquals(.35,c.appearance.fillOpacity,1e-6);assertEquals(7.5,c.appearance.lineWidth,1e-6);
      assertEquals("dashdot",c.appearance.dash);assertEquals("ключ & значение",c.appearance.keywords);assertTrue(t.appearance.labelBold);
    }
  }

  @Test public void standardKmlNormalStyleMapResolvesWidthFillAndLabelScale()throws Exception{
    String xml="<kml xmlns='http://www.opengis.net/kml/2.2'><Document><Style id='normal'><LineStyle><color>ff0000ff</color><width>8</width></LineStyle><PolyStyle><color>8000ff00</color><fill>1</fill><outline>0</outline></PolyStyle><LabelStyle><scale>0</scale></LabelStyle></Style><StyleMap id='mapped'><Pair><key>normal</key><styleUrl>#normal</styleUrl></Pair></StyleMap><Placemark><name>Область</name><styleUrl>#mapped</styleUrl><Polygon><outerBoundaryIs><LinearRing><coordinates>37,55 38,55 38,56 37,55</coordinates></LinearRing></outerBoundaryIs></Polygon></Placemark></Document></kml>";
    MapItem item=PlacemarkFiles.read(new ByteArrayInputStream(xml.getBytes("UTF-8"))).get(0);
    assertEquals(8,item.appearance.lineWidth,0);assertFalse(item.appearance.outline);assertFalse(item.appearance.labels);
    assertEquals(Integer.valueOf(0x8000ff00),item.appearance.fillColor);assertEquals(0xffff0000,item.color);
  }
}
