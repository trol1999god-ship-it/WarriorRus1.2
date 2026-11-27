package org.rabochaya.projects;

import java.util.ArrayList;
import java.util.List;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

/** Reads saved gx tracks without joining separate segments or gaps in the samples. */
final class KmlTrackStatistics {
 static final String GX="http://www.google.com/kml/ext/2.2";
 private static final String KML="http://www.opengis.net/kml/2.2";

 private KmlTrackStatistics(){}

 static TrackStatistics read(Element feature){
  TrackStatistics result=new TrackStatistics();
  for(Segment segment:segments(feature))result.addSegment(segment.vertices,segment.times);
  return result.points==0?null:result;
 }

 static final class Segment {
  final List<double[]> vertices;
  final List<String> times;
  Segment(List<double[]> vertices,List<String> times){
   this.vertices=vertices;
   this.times=times.size()==vertices.size()?times:null;
  }
 }

 static List<Segment> segments(Element parent){
  List<Segment> result=new ArrayList<>();
  collect(parent,result,0);
  return result;
 }

 private static void collect(Element parent,List<Segment> result,int depth){
  if(GX.equals(parent.getNamespaceURI())&&"Track".equals(parent.getLocalName())){
   addTrack(parent,result);
   return;
  }
  if(depth>64)return;
  for(Node node=parent.getFirstChild();node!=null;node=node.getNextSibling()){
   if(!(node instanceof Element))continue;
   String name=node.getLocalName(), namespace=node.getNamespaceURI();
   if(GX.equals(namespace)&&"Track".equals(name))addTrack((Element)node,result);
   else if((GX.equals(namespace)&&"MultiTrack".equals(name))
       ||(KML.equals(namespace)&&"MultiGeometry".equals(name)))collect((Element)node,result,depth+1);
  }
 }

 private static void addTrack(Element track,List<Segment> result){
  List<double[]> vertices=new ArrayList<>();
  List<String> times=new ArrayList<>();
  for(Node node=track.getFirstChild();node!=null;node=node.getNextSibling()){
   if(!(node instanceof Element))continue;
   String name=node.getLocalName(), namespace=node.getNamespaceURI();
   if(GX.equals(namespace)&&"coord".equals(name))vertices.add(position(node.getTextContent()));
   else if(KML.equals(namespace)&&"when".equals(name))times.add(node.getTextContent());
  }
  if(!vertices.isEmpty())result.add(new Segment(vertices,times));
 }

 private static double[] position(String text){
  String[] fields=text.trim().split("\\s+");
  if(fields.length<2||fields.length>3)return null;
  try{
   double lon=Double.parseDouble(fields[0]),lat=Double.parseDouble(fields[1]);
   if(!(Math.abs(lon)<=180&&Math.abs(lat)<=90))return null;
   if(fields.length==3){
    double height=Double.parseDouble(fields[2]);
    if(!Double.isNaN(height)&&!Double.isInfinite(height))return new double[]{lon,lat,height};
   }
   return new double[]{lon,lat};
  }catch(NumberFormatException invalid){return null;}
 }
}
