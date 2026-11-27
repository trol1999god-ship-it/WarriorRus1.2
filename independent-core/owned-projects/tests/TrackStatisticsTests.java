package org.rabochaya.projects;
import java.util.Arrays;
import java.util.Collections;

public final class TrackStatisticsTests {
 public static void main(String[] args) {
  TrackStatistics stats=new TrackStatistics();
  stats.addSegment(Arrays.asList(new double[]{179.99,0,10},new double[]{-179.99,0,15},
      new double[]{-179.99,0,15},new double[]{-179.98,0}),
      Arrays.asList("2026-11-27T01:00:00.125+01:00","2026-11-27T00:00:10.250Z",
          "2026-11-27T00:00:20.250Z","2026-02-30T00:00:30Z"));
  stats.addSegment(Collections.singletonList(new double[]{0,80,100}),
      Collections.singletonList("2026-11-27T10:00:00Z"));
  if(stats.segments!=2||stats.points!=5||stats.timedLegs!=2||stats.legs!=3
      ||stats.timedMillis!=20125||stats.movingMillis!=10125
      ||stats.distance<3335||stats.distance>3337||stats.gain!=5||stats.loss!=0)
   throw new AssertionError("track totals");
  stats.addSegment(Arrays.asList(new double[]{1,2},new double[]{1,3}),
      Arrays.asList("2026-11-27T00:00:05Z","2026-11-27T00:00:04Z"));
  if(stats.timedLegs!=2)throw new AssertionError("reversed timestamps");
  System.out.println("Track statistics checks passed");
 }
}
