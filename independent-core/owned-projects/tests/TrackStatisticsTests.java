package org.rabochaya.projects;
import java.util.Arrays;
import java.util.Collections;

public final class TrackStatisticsTests {
 public static void main(String[] args) throws Exception {
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
  if(!stats.firstTimed.time.equals("2026-11-27T01:00:00.125+01:00")||stats.firstTimed.point[0]!=179.99
      ||!stats.lastTimed.time.equals("2026-11-27T10:00:00Z")||stats.lastTimed.point[1]!=80)
   throw new AssertionError("saved GPX endpoint times");
  stats.addSegment(Arrays.asList(new double[]{1,2},new double[]{1,3}),
      Arrays.asList("2026-11-27T00:00:05Z","2026-11-27T00:00:04Z"));
  if(stats.timedLegs!=2)throw new AssertionError("reversed timestamps");
  String kml="<Placemark xmlns='http://www.opengis.net/kml/2.2' xmlns:gx='http://www.google.com/kml/ext/2.2'>"
      +"<gx:MultiTrack><gx:Track><when>2026-11-27T00:00:00Z</when>"
      +"<when>2026-11-27T00:00:10Z</when><gx:coord>10 20 100</gx:coord><gx:coord>10 20.01 110</gx:coord>"
      +"</gx:Track><gx:Track><when>2026-11-27T00:00:20Z</when><gx:coord>40 50 120</gx:coord>"
      +"<gx:coord>40 50.01 110</gx:coord></gx:Track></gx:MultiTrack></Placemark>";
  javax.xml.parsers.DocumentBuilderFactory factory=javax.xml.parsers.DocumentBuilderFactory.newInstance();
  factory.setNamespaceAware(true);
  org.w3c.dom.Element feature=factory.newDocumentBuilder()
      .parse(new org.xml.sax.InputSource(new java.io.StringReader(kml))).getDocumentElement();
  TrackStatistics kmlStats=KmlTrackStatistics.read(feature);
  if(kmlStats.segments!=2||kmlStats.points!=4||kmlStats.timedLegs!=1||kmlStats.legs!=2
      ||kmlStats.movingMillis!=10000||kmlStats.distance<2223||kmlStats.distance>2225
      ||kmlStats.gain!=10||kmlStats.loss!=10)
   throw new AssertionError("KML track totals");
  if(kmlStats.lastTimed.point[1]!=20.01||!kmlStats.lastTimed.time.equals("2026-11-27T00:00:10Z"))
   throw new AssertionError("unaligned KML timestamps must not become endpoint labels");
  System.out.println("Track statistics checks passed");
 }
}
