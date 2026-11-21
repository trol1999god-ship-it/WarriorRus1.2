package org.rabochaya.projects;
import java.util.*;
import org.w3c.dom.*;
/** Local KML mutations. Does not resolve external styles or fetch attachments. */
public final class FeatureEdits {
 private static final String NS="http://www.opengis.net/kml/2.2";
 private FeatureEdits(){}
 public static List<double[]> coordinates(String input,String type){return GeometryCoordinates.parse(input,type);}
 public static Element create(Element parent,String type,String name,String description,List<double[]> points){
  Element feature=add(parent,"Placemark");feature.setAttribute("id","rk_"+UUID.randomUUID().toString());metadata(feature,name,description);
  Element geometry=add(feature,type),target=geometry;
  if("Polygon".equals(type))target=add(add(geometry,"outerBoundaryIs"),"LinearRing");
  put(target,"coordinates",serialize(points));return feature;
 }
 public static void metadata(Element feature,String name,String description){
  if(name.trim().isEmpty())throw new IllegalArgumentException("Укажите название");
  if(name.length()>1000||description.length()>100000)throw new IllegalArgumentException("Слишком длинное название или описание");
  put(feature,"name",name.trim());MediaLinks.setNote(feature,description);
 }
 public static void movePoint(Element feature,List<double[]> points){
  Element point=KmlProject.child(feature,"Point");
  if(point==null||points.size()!=1)throw new IllegalArgumentException("Редактирование координат доступно для отдельной метки");
  put(point,"coordinates",serialize(points));
 }
 private static String serialize(List<double[]> points){StringBuilder s=new StringBuilder();for(double[] p:points){if(s.length()>0)s.append(' ');s.append(p[0]).append(',').append(p[1]).append(',').append(p[2]);}return s.toString();}
 private static Element add(Element parent,String name){Element e=parent.getOwnerDocument().createElementNS(NS,name);parent.appendChild(e);return e;}
 private static void put(Element parent,String name,String value){Element e=KmlProject.child(parent,name);if(e==null)e=add(parent,name);e.setTextContent(value);}
}
