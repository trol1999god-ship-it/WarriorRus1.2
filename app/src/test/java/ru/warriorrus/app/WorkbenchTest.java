package ru.warriorrus.app;

import static org.junit.Assert.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.explorer.*;
import ru.warriorrus.app.exchange.*;
import ru.warriorrus.app.geometry.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk={23,35})
public class WorkbenchTest {
  private ObjectStore store;
  @Before public void setup(){RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");store=new ObjectStore(RuntimeEnvironment.getApplication());}
  @After public void close(){store.close();}
  @Test public void dateAndDescriptionSearchesAllFoldersAndAtomicSetCanBeUndone(){
    long f=store.create(0,"Folder","folder",0,0),p=store.create(f,"Machine A","point",1,2);MapItem i=store.get(p);i.created=1000;i.description="survey";store.save(i);
    long q=store.create(0,"Machine B","point",1,2);i=store.get(q);i.created=3000;store.save(i);
    ExplorerController explorer=new ExplorerController(store);explorer.query="machine";explorer.fromDate=500;explorer.toDate=2000;assertEquals(p,explorer.entries().get(0).id);assertEquals(1,explorer.entries().size());
    explorer.query="survey";explorer.descriptions=true;assertEquals(p,explorer.entries().get(0).id);
    store.group(Arrays.asList(p,q),0,"Results",true);MapItem set=null;for(MapItem item:store.all())if("set".equals(item.kind))set=item;assertNotNull(set);assertTrue(set.isFolder());assertEquals(set.id,store.get(p).parent);store.undo();assertEquals(f,store.get(p).parent);assertEquals(3,store.all().size());
  }
  @Test public void profileDoesNotJoinSegmentGapsAndKeepsWaypointNotes()throws Exception{
    MapItem track=new MapItem();track.kind="track";track.name="Test";track.visible=true;track.opacity=1;
    track.segments.add(Arrays.asList(new Vertex(0,0,100.0,"2026-10-17T00:00:00Z","A","Note"),new Vertex(0,0.01,120.0,"2026-10-17T00:01:00Z")));
    track.segments.add(Arrays.asList(new Vertex(1,1,900.0,"2026-10-17T01:00:00Z"),new Vertex(1,1.01,890.0,"2026-10-17T01:01:00Z")));
    TrackStatistics stats=TrackStatistics.of(track);assertEquals(20,stats.ascent,0.01);assertEquals(10,stats.descent,0.01);assertEquals(120000,stats.movingMillis);
    ByteArrayOutputStream bytes=new ByteArrayOutputStream();PlacemarkFiles.write(Collections.singletonList(track),bytes,"gpx");MapItem back=PlacemarkFiles.read(new ByteArrayInputStream(bytes.toByteArray())).get(0);assertEquals("A",back.segments.get(0).get(0).name);assertEquals("Note",back.segments.get(0).get(0).description);
  }
  @Test public void csvEscapingGeojsonPolygonHoleAndOziDates()throws Exception{
    MapItem area=new MapItem();area.id=1;area.kind="area";area.name="Name, \"quoted\"\nline";area.description="Text, with \"quotes\"";area.visible=true;area.opacity=1;area.color=0xff123456;
    area.segments.add(Arrays.asList(new Vertex(0,0),new Vertex(0,1),new Vertex(1,1)));area.segments.add(Arrays.asList(new Vertex(0.1,0.2),new Vertex(0.1,0.3),new Vertex(0.2,0.3)));
    for(String format:Arrays.asList("csv","tsv","geojson")){ByteArrayOutputStream out=new ByteArrayOutputStream();TextFormats.write(Collections.singletonList(area),out,format);List<MapItem> back=TextFormats.read(out.toByteArray());assertEquals(area.name,back.get(0).name);assertEquals(area.description,back.get(0).description);assertEquals("area",back.get(0).kind);assertEquals(2,back.get(0).segments.size());}
    String plt="OziExplorer Track Point File Version 2.1\nWGS 84\nAltitude is in Feet\nReserved 3\n0,2,255,Test,1,0\n2\n0,0,1,100,25569\n0,1,0,110,25569.5";
    MapItem track=TextFormats.read(plt.getBytes(StandardCharsets.UTF_8)).get(0);assertEquals(30.48,track.segments.get(0).get(0).elevation,0.001);assertEquals("1970-01-01T00:00:00Z",track.segments.get(0).get(0).time);
    try{TextFormats.read("name,latitude,longitude\nBad,NaN,1".getBytes(StandardCharsets.UTF_8));fail();}catch(IllegalArgumentException expected){}
  }
}
