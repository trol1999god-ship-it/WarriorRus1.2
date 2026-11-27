package org.rabochaya.projects;

import java.util.ArrayList;
import java.util.List;
import org.w3c.dom.Element;

/** Geometry adapter for the native KML project reader. The DOM stays untouched. */
public final class KmlTimedTrackGeometry {
 private KmlTimedTrackGeometry(){}

 public static boolean append(Element geometry,List<KmlProject.Geometry> output){
  String name=geometry.getLocalName();
  if(!KmlTrackStatistics.GX.equals(geometry.getNamespaceURI())
      ||!("Track".equals(name)||"MultiTrack".equals(name)))return false;
  for(KmlTrackStatistics.Segment input:KmlTrackStatistics.segments(geometry)){
   List<double[]> vertices=new ArrayList<>();
   for(double[] point:input.vertices){
    if(point==null){
     add(output,vertices);
     vertices=new ArrayList<>();
    }else vertices.add(point.length==2?new double[]{point[0],point[1],Double.NaN}:point);
   }
   add(output,vertices);
  }
  return true;
 }

 private static void add(List<KmlProject.Geometry> output,List<double[]> vertices){
  if(vertices.isEmpty())return;
  KmlProject.Geometry geometry=new KmlProject.Geometry();
  geometry.type=vertices.size()==1?"Point":"LineString";
  geometry.temporalTrack=true;
  geometry.rings.add(vertices);
  output.add(geometry);
 }
}
