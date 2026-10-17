package ru.warriorrus.app.geometry;

import static org.junit.Assert.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.exchange.PlacemarkFiles;
import ru.warriorrus.app.settings.Coordinates;

@RunWith(RobolectricTestRunner.class)
@Config(sdk={23,35})
public class GeometryAndExchangeTest {
  private ObjectStore store;
  @Before public void before(){RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");store=new ObjectStore(RuntimeEnvironment.getApplication());}
  @After public void after(){store.close();}
  private MapItem shape(String kind) {
    MapItem i=new MapItem();i.name="Тест & <контур>";i.kind=kind;i.visible=true;i.opacity=1;i.color=0xff123456;i.description="Текст\nс деталями & < >";
    i.segments.add(new ArrayList<>(Arrays.asList(new Vertex(0,0,120.0,"2026-10-17T00:00:00Z"),new Vertex(0,1,121.0,"2026-10-17T00:01:00Z"),new Vertex(1,1,122.0,"2026-10-17T00:02:00Z"))));return i;
  }
  private List<MapItem> read(String xml)throws Exception{return PlacemarkFiles.read(new ByteArrayInputStream(xml.getBytes(StandardCharsets.UTF_8)));}
  @Test public void migratesVersionTwoPreservingFolderIdsIconsAndStyle() {
    store.close();android.content.Context context=RuntimeEnvironment.getApplication();context.deleteDatabase("warrior2.db");
    java.io.File path=context.getDatabasePath("warrior2.db");path.getParentFile().mkdirs();
    try(android.database.sqlite.SQLiteDatabase db=android.database.sqlite.SQLiteDatabase.openOrCreateDatabase(path,null)) {
      db.execSQL("CREATE TABLE objects(id INTEGER PRIMARY KEY,parent INTEGER REFERENCES objects(id),name TEXT NOT NULL,kind TEXT NOT NULL CHECK(kind IN ('folder','point')),latitude REAL,longitude REAL,visible INTEGER,position INTEGER,color INTEGER,opacity REAL,icon TEXT)");
      db.execSQL("INSERT INTO objects VALUES(7,NULL,'Folder','folder',0,0,1,0,-12627531,1,'builtin:pin')");
      db.execSQL("INSERT INTO objects VALUES(8,7,'Point','point',55,37,0,1,-15584170,0.5,'custom.svg')");db.setVersion(2);
    }
    store=new ObjectStore(context);MapItem p=store.get(8);assertEquals(7,p.parent);assertEquals("custom.svg",p.icon);assertFalse(p.visible);assertEquals(0.5,p.opacity,0.0001);assertEquals(-15584170,p.color);assertEquals("",p.description);assertTrue(p.segments.isEmpty());
    MapItem route=shape("route");route.parent=7;store.save(route);assertEquals(3,store.all().size());assertEquals("Point",store.get(8).name);
  }
  @Test public void geometryNotesCopyReopenDeleteUndo() {
    long folder=store.create(0,"Контуры","folder",0,0);MapItem area=shape("area");area.parent=folder;long id=store.save(area);
    store.close();store=new ObjectStore(RuntimeEnvironment.getApplication());assertEquals(3,Geometry.count(store.get(id)));assertEquals(area.description,store.get(id).description);
    store.transfer(Collections.singleton(folder),0,true);assertEquals(4,store.all().size());
    for(MapItem i:store.all())if(i.isGeometry())assertEquals(Geometry.encode(area.segments),Geometry.encode(i.segments));
    store.delete(Collections.singleton(folder));assertNull(store.get(id));store.undo();assertNotNull(store.get(id));
  }
  @Test public void importsAtomicallyAndOneUndoRestoresWorkspace() throws Exception {
    long existing=store.create(0,"До импорта","point",5,6);
    List<MapItem> imported=read("<kml><Document><Folder><name>A</name><Placemark><name>P</name><Point><coordinates>37,55</coordinates></Point></Placemark></Folder></Document></kml>");
    store.importItems(imported,0);assertEquals(3,store.all().size());assertNotEquals(0,store.all().get(2).parent);store.undo();assertEquals(1,store.all().size());assertEquals(existing,store.all().get(0).id);
    imported.get(1).parent=-999;
    try {store.importItems(imported,0);fail();}catch(IllegalArgumentException expected){}
    assertEquals(1,store.all().size());assertEquals(existing,store.all().get(0).id);
  }
  @Test public void kmlAndKmzPreserveFolderPolygonHoleDescriptionColor() throws Exception {
    long f=store.create(0,"Папка","folder",0,0);MapItem area=shape("area");area.parent=f;
    area.segments.add(new ArrayList<>(Arrays.asList(new Vertex(0.1,0.2),new Vertex(0.1,0.3),new Vertex(0.2,0.3))));store.save(area);
    for(String format:Arrays.asList("kml","kmz")) {
      ByteArrayOutputStream out=new ByteArrayOutputStream();PlacemarkFiles.write(store.all(),out,format);
      List<MapItem> back=PlacemarkFiles.read(new ByteArrayInputStream(out.toByteArray()));assertEquals(2,back.size());MapItem actual=back.get(1);
      assertEquals("area",actual.kind);assertEquals(area.name,actual.name);assertEquals(area.description,actual.description);assertEquals(area.color,actual.color);
      assertEquals(2,actual.segments.size());assertEquals(3,actual.segments.get(0).size());assertEquals(back.get(0).id,actual.parent);
      assertEquals(Geometry.area(area),Geometry.area(actual),0.01);
    }
  }
  @Test public void gpxPreservesSeparateSegmentsTimeAndElevation() throws Exception {
    MapItem track=shape("track");track.id=1;track.segments.add(new ArrayList<>(Arrays.asList(new Vertex(-30,10,3.0,"2026-10-17T02:00:00Z"),new Vertex(-31,11,4.0,"2026-10-17T02:01:00Z"))));
    ByteArrayOutputStream out=new ByteArrayOutputStream();PlacemarkFiles.write(Collections.singletonList(track),out,"gpx");
    MapItem actual=PlacemarkFiles.read(new ByteArrayInputStream(out.toByteArray())).get(0);assertEquals("track",actual.kind);assertEquals(2,actual.segments.size());
    assertEquals(Geometry.encode(track.segments),Geometry.encode(actual.segments));assertEquals(track.description,actual.description);
    MapItem one=read("<gpx><trk><name>Single</name><trkseg><trkpt lat='1' lon='2'><ele>4</ele></trkpt></trkseg></trk></gpx>").get(0);assertEquals(1,Geometry.count(one));
  }
  @Test public void distanceAndAreaHandleAntimeridianAndDoNotJoinTrackGaps() {
    assertEquals(111195,Geometry.distance(new Vertex(0,0),new Vertex(0,1)),10);
    MapItem area=shape("area");area.segments.clear();area.segments.add(Arrays.asList(new Vertex(0,179),new Vertex(0,-179),new Vertex(1,-179),new Vertex(1,179)));
    assertEquals(24727,Geometry.area(area)/1e6,10);
    MapItem track=shape("track");track.segments.clear();track.segments.add(Arrays.asList(new Vertex(0,0),new Vertex(0,1)));track.segments.add(Arrays.asList(new Vertex(0,100),new Vertex(0,101)));
    assertEquals(222390,Geometry.length(track),20);
  }
  @Test public void rejectsInvalidCoordinatesAndXmlEntitiesWithoutWriting() throws Exception {
    for(String xml:Arrays.asList("<!DOCTYPE kml [<!ENTITY test SYSTEM 'https://example.invalid/data'>]><kml>&test;</kml>","<kml><Placemark><Point><coordinates>0,91</coordinates></Point></Placemark></kml>")) {
      try{read(xml);fail();}catch(Exception expected){}assertTrue(store.all().isEmpty());
    }
    try{store.save(shape("unknown"));fail();}catch(IllegalArgumentException expected){}
    assertTrue(store.all().isEmpty());
  }
  @Test public void gpxRefusesToSilentlyLosePolygons() throws Exception {
    try{PlacemarkFiles.write(Collections.singletonList(shape("area")),new ByteArrayOutputStream(),"gpx");fail();}catch(IOException expected){}
  }
  @Test public void coordinateFormatsRoundTripKnownReferenceAndSouthernHemisphere() {
    for(Vertex v:Arrays.asList(new Vertex(63.98862388,29.06755082),new Vertex(-33.8568,151.2153),new Vertex(0,3))) {
      for(int mode:new int[]{3,4}) {String text=Coordinates.format(mode,v.latitude,v.longitude);Vertex back=Coordinates.parse(text);assertTrue(text,Geometry.distance(v,back)<3);}
    }
    assertTrue(Coordinates.format(4,63.98862388,29.06755082).startsWith("35V"));
    assertFalse(Coordinates.format(2,12.999999999,0).contains("60.00"));
    try{Coordinates.parse("NaN, 20");fail();}catch(IllegalArgumentException expected){}
  }
}
