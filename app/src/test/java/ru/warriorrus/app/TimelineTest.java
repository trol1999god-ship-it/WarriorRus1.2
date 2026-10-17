package ru.warriorrus.app;

import static org.junit.Assert.*;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.geometry.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk={23,35})
public class TimelineTest {
  private static final long BASE=1704067200000L;
  private Vertex vertex(double lon,int seconds){return new Vertex(0,lon,100.0+seconds,java.time.Instant.ofEpochMilli(BASE+seconds*1000L).toString());}
  private MapItem track(List<Vertex>... segments){MapItem i=new MapItem();i.kind="track";i.name="Synthetic track";i.visible=true;i.opacity=1;for(List<Vertex> s:segments)i.segments.add(new ArrayList<>(s));return i;}
  private TimelineModel model(MapItem i){TimelineModel m=new TimelineModel();assertTrue(m.bounds(Collections.singletonList(i)));m.active=true;return m;}
  @Test public void interpolatesClippedWindowWithoutMutatingSource(){
    MapItem i=track(Arrays.asList(vertex(0,0),vertex(1,60),vertex(2,120)));String saved=Geometry.encode(i.segments);TimelineModel m=model(i);m.seek(7500);m.windowMillis=60000;
    MapItem view=m.view(i);assertNotSame(i,view);assertEquals(1,view.segments.size());List<Vertex> line=view.segments.get(0);assertEquals(3,line.size());assertEquals(.5,line.get(0).longitude,1e-9);assertEquals(1.5,line.get(2).longitude,1e-9);assertEquals(190,line.get(2).elevation,1e-9);assertEquals(1.5,m.head(i).longitude,1e-9);assertEquals(saved,Geometry.encode(i.segments));m.active=false;assertSame(i,m.view(i));
  }
  @Test public void segmentGapsDoNotBecomeConnectingLinesOrMovingPositions(){
    MapItem i=track(Arrays.asList(vertex(0,0),vertex(1,60)),Arrays.asList(vertex(10,120),vertex(11,180)));TimelineModel m=model(i);m.cursor=BASE+90000;assertEquals(1,m.view(i).segments.size());assertEquals(1,m.head(i).longitude,1e-9);m.windowMillis=10000;assertNull(m.view(i));assertNull(m.head(i));m.cursor=BASE+150000;assertEquals(10.5,m.head(i).longitude,1e-9);assertEquals(1,m.view(i).segments.size());
  }
  @Test public void missingAndReversedTimesBreakInterpolationButUntimedObjectsStayVisible(){
    MapItem i=track(Arrays.asList(vertex(0,0),new Vertex(0,5),vertex(10,120),vertex(20,60)));TimelineModel m=model(i);m.cursor=BASE+90000;assertEquals(20,m.head(i).longitude,1e-9);for(List<Vertex> s:m.view(i).segments)assertEquals(1,s.size());MapItem untimed=track(Arrays.asList(new Vertex(1,1),new Vertex(2,2)));assertSame(untimed,m.view(untimed));MapItem area=track(Arrays.asList(vertex(0,0),vertex(1,10),vertex(2,20)));area.kind="area";assertSame(area,m.view(area));assertFalse(new TimelineModel().bounds(Collections.singletonList(area)));
  }
  @Test public void antimeridianUsesShortestCrossingAndKeepsExactVertexMetadata(){
    Vertex a=new Vertex(0,179,10.0,java.time.Instant.ofEpochMilli(BASE).toString(),"A","note");Vertex b=new Vertex(0,-179,20.0,java.time.Instant.ofEpochMilli(BASE+60000).toString());MapItem i=track(Arrays.asList(a,b));TimelineModel m=model(i);m.seek(5000);assertEquals(180,Math.abs(m.head(i).longitude),1e-9);assertSame(a,TimelineModel.interpolate(a,b,0,BASE));assertEquals("note",m.view(i).segments.get(0).get(0).description);
  }
  @Test public void timestampedPointsAndLongTimeRangesAreClamped(){
    MapItem i=track(Arrays.asList(vertex(0,0),vertex(1,120)));TimelineModel m=model(i);MapItem point=track(Collections.singletonList(vertex(3,100)));point.kind="point";m.seek(5000);assertNull(m.view(point));m.seek(10000);assertSame(point,m.view(point));m.windowMillis=10000;assertNull(m.view(point));m.first=-8000000000000000L;m.last=8000000000000000L;m.seek(5000);assertEquals(0,m.cursor);assertEquals(5000,m.progress());m.seek(-100);assertEquals(m.first,m.cursor);m.seek(20000);assertEquals(m.last,m.cursor);
  }
}
