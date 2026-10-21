package ru.warriorrus.app.geometry;

import static org.junit.Assert.*;
import java.util.*;
import org.junit.Test;
import ru.warriorrus.app.data.*;

public class ProfileSeriesTest {
  private Vertex v(double lon,Double height,String time){return new Vertex(0,lon,height,time);}
  @Test public void excludesSegmentGapsAndNeverComputesSpeedOrSlopeAcrossThem(){
    MapItem item=new MapItem();item.kind="track";
    item.segments.add(Arrays.asList(v(0,100.0,"2026-10-21T00:00:00Z"),v(.001,110.0,"2026-10-21T00:01:00Z")));
    item.segments.add(Arrays.asList(v(100,900.0,"2026-10-21T01:00:00Z"),v(100.001,880.0,"2026-10-21T01:01:00Z")));
    ProfileSeries p=new ProfileSeries(item);assertEquals(Geometry.length(item),p.length,1e-6);assertEquals(p.samples.get(1).distance,p.samples.get(2).distance,1e-6);
    assertNull(p.samples.get(2).speed);assertNull(p.samples.get(2).slope);assertFalse(p.connected(p.samples.get(1),p.samples.get(2),ProfileSeries.Value.ELEVATION,ProfileSeries.Axis.DISTANCE));
    assertEquals(Geometry.distance(item.segments.get(0).get(0),item.segments.get(0).get(1))/60,p.samples.get(1).speed,1e-8);
    assertEquals(20,TrackStatistics.of(item).descent,1e-8);assertTrue(TrackStatistics.of(item).maxSpeed>0);
  }
  @Test public void missingRepeatedAndBackwardTimesStayGaps(){
    MapItem item=new MapItem();item.kind="track";item.segments.add(Arrays.asList(v(0,0.0,"2026-10-21T00:02:00Z"),v(.001,null,"bad"),v(.002,20.0,"2026-10-21T00:01:00Z"),v(.003,30.0,"2026-10-21T00:01:00Z"),v(.004,40.0,"2026-10-21T00:00:00Z")));
    ProfileSeries p=new ProfileSeries(item);assertEquals(120,p.x(p.samples.get(0),ProfileSeries.Axis.TIME),0);assertNull(p.x(p.samples.get(1),ProfileSeries.Axis.TIME));
    for(ProfileSeries.Sample sample:p.samples)assertNull(sample.speed);
    assertNull(p.samples.get(2).slope);assertFalse(p.connected(p.samples.get(0),p.samples.get(1),ProfileSeries.Value.ELEVATION,ProfileSeries.Axis.DISTANCE));
    assertFalse(p.connected(p.samples.get(3),p.samples.get(4),ProfileSeries.Value.ELEVATION,ProfileSeries.Axis.TIME));
    assertEquals(-1,p.nearest(5,ProfileSeries.Value.SPEED,ProfileSeries.Axis.TIME));
  }
  @Test public void nearestReturnsRealVertexAndDoesNotMutateSource(){
    MapItem item=new MapItem();item.kind="path";Vertex middle=v(.001,15.0,null);item.segments.add(Arrays.asList(v(0,0.0,null),middle,v(.002,10.0,null)));
    ProfileSeries p=new ProfileSeries(item);assertEquals(1,p.nearest(p.samples.get(1).distance,ProfileSeries.Value.ELEVATION,ProfileSeries.Axis.DISTANCE));assertSame(middle,p.samples.get(1).vertex);
    assertEquals(3,item.segments.get(0).size());assertTrue(p.bounds(ProfileSeries.Value.ELEVATION,ProfileSeries.Axis.TIME)[0]==Double.POSITIVE_INFINITY);
  }
}
