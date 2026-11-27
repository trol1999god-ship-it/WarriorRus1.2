package org.rabochaya.projects;

import java.io.IOException;
import java.util.*;
import org.json.*;
import org.w3c.dom.*;
import static org.rabochaya.projects.ObjectExchange.*;

final class GeoJsonExchange {
 static Document read(String input)throws Exception{
  JSONTokener reader=new JSONTokener(input);
  JSONObject object=(JSONObject)reader.nextValue();
  if(reader.nextClean()!=0)throw invalid("Лишние данные после GeoJSON");
  Document doc=newDocument();Element root=kml(doc);
  rejectLegacyCrs(object);
  switch(object.getString("type")){
   case "FeatureCollection":
    JSONArray features=object.getJSONArray("features");
    if(features.length()>10000)throw invalid("Слишком много объектов");
    for(int i=0;i<features.length();i++)readFeature(root,features.getJSONObject(i));
    break;
   case "Feature":readFeature(root,object);break;
   default:
    Element p=place(root,"","");
    data(p,GEO,new JSONObject().put("shape",readGeometry(p,object,0)).toString());
  }
  return doc;
 }

 private static void readFeature(Element root,JSONObject obj)throws Exception{
  rejectLegacyCrs(obj);
  if(!"Feature".equals(obj.getString("type")))throw invalid("Ожидался объект GeoJSON Feature");
  JSONObject properties=obj.isNull("properties")?new JSONObject():obj.getJSONObject("properties");
  Element p=place(root,named(properties,"name"),named(properties,"description"));
  JSONObject meta=new JSONObject().put("properties",properties).put("nullProperties",obj.isNull("properties"));
  if(!obj.isNull("id")){
   Object id=obj.get("id");
   if(!(id instanceof String)&&!(id instanceof Number))throw invalid("Некорректный идентификатор GeoJSON");
   meta.put("id",id);
  }
  if(obj.isNull("geometry"))throw invalid("Объект GeoJSON без геометрии");
  JSONObject geometry=obj.getJSONObject("geometry");
  Object shape=readGeometry(p,geometry,0);
  data(p,GEO,meta.put("shape",shape).toString());
  String kind=properties.optString("rk:gpx-kind");
  if("rte".equals(kind)||"trk".equals(kind))data(p,KIND,kind);
 }

 private static void rejectLegacyCrs(JSONObject object)throws IOException{
  if(object.has("crs"))throw invalid("Требуются координаты GeoJSON RFC 7946 в WGS 84");
 }

 private static String named(JSONObject properties,String name){
  Object value=properties.opt(name);
  return value instanceof String?(String)value:"";
 }

 /** The shape hint records which KML groups represent GeoJSON collections. */
 private static Object readGeometry(Element parent,JSONObject g,int depth)throws Exception{
  if(depth>DEPTH)throw invalid("Слишком глубокая геометрия");
  rejectLegacyCrs(g);
  String type=g.getString("type");
  if("GeometryCollection".equals(type)){
   JSONArray children=g.getJSONArray("geometries"),shapes=new JSONArray();
   if(children.length()==0)throw invalid("Пустая коллекция геометрий");
   Element group=add(parent,"MultiGeometry",null);
   for(int i=0;i<children.length();i++)shapes.put(readGeometry(group,children.getJSONObject(i),depth+1));
   return shapes;
  }
  JSONArray coordinates=g.getJSONArray("coordinates");
  switch(type){
   case "Point":ObjectExchange.geometry(parent,"Point",Collections.singletonList(point(coordinates)));break;
   case "LineString":ObjectExchange.geometry(parent,"LineString",line(coordinates,2));break;
   case "Polygon":ObjectExchange.polygon(parent,polygon(coordinates));break;
   case "MultiPoint": case "MultiLineString": case "MultiPolygon":
    if(coordinates.length()==0)throw invalid("Пустая геометрия");
    Element group=add(parent,"MultiGeometry",null);
    for(int i=0;i<coordinates.length();i++){
     JSONArray part=coordinates.getJSONArray(i);
     if(type.equals("MultiPoint"))ObjectExchange.geometry(group,"Point",Collections.singletonList(point(part)));
     else if(type.equals("MultiLineString"))ObjectExchange.geometry(group,"LineString",line(part,2));
     else ObjectExchange.polygon(group,polygon(part));
    }
    break;
   default:throw invalid("Неизвестная геометрия GeoJSON "+type);
  }
  return type;
 }

 private static double[] point(JSONArray array)throws Exception{
  int size=array.length();
  if(size<2||size>3)throw invalid("Позиция GeoJSON должна иметь 2 или 3 числа");
  for(int i=0;i<size;i++)if(!(array.get(i) instanceof Number))throw invalid("Координаты GeoJSON должны быть числами");
  return position(array.get(0).toString(),array.get(1).toString(),size==3?array.get(2).toString():null);
 }

 private static List<double[]> line(JSONArray array,int min)throws Exception{
  if(array.length()<min)throw invalid("В геометрии недостаточно координат");
  List<double[]> points=new ArrayList<>();
  for(int i=0;i<array.length();i++)points.add(point(array.getJSONArray(i)));
  return points;
 }

 private static List<List<double[]>> polygon(JSONArray array)throws Exception{
  if(array.length()==0)throw invalid("Нет внешнего контура области");
  List<List<double[]>> out=new ArrayList<>();
  for(int i=0;i<array.length();i++){
   List<double[]> ring=line(array.getJSONArray(i),4);requireRing(ring);out.add(ring);
  }
  return out;
 }

 static JSONObject write(Element kml)throws Exception{
  JSONArray features=new JSONArray();
  for(Element p:features(kml)){
   List<Element> geometry=geometries(p);
   if(geometry.isEmpty())continue;
   Map<String,String> data=data(p);
   JSONObject meta=data.containsKey(GEO)?new JSONObject(data.get(GEO)):new JSONObject();
   JSONObject properties=meta.optJSONObject("properties");
   if(properties==null)properties=new JSONObject();
   for(Map.Entry<String,String> field:data.entrySet()){
    String k=field.getKey();
    if(!k.startsWith("rk-")&&!properties.has(k))properties.put(k,field.getValue());
   }
   Element extension=child(p,"ExtendedData");
   if(extension!=null){
    for(Element schema:children(extension,"SchemaData")){
     for(Element field:children(schema,"SimpleData")){
      String key=field.getAttribute("name");
      if(!key.isEmpty()&&!key.startsWith("rk-")&&!properties.has(key))properties.put(key,field.getTextContent());
     }
    }
   }
   updateProperty(properties,"name",text(p,"name"));
   updateProperty(properties,"description",description(p));
   JSONObject feature=new JSONObject().put("type","Feature");
   if(meta.has("id"))feature.put("id",meta.get("id"));
   else if(!p.getAttribute("id").isEmpty()&&!data.containsKey(GEO))feature.put("id",p.getAttribute("id"));
   if("rte".equals(data.get(KIND))||"trk".equals(data.get(KIND)))properties.put("rk:gpx-kind",data.get(KIND));
   feature.put("properties",properties.length()==0&&meta.optBoolean("nullProperties")?JSONObject.NULL:properties);
   JSONObject shape=geometry.size()==1?writeGeometry(geometry.get(0),meta.opt("shape"),0):group(geometry,null,0);
   feature.put("geometry",shape);features.put(feature);
  }
  if(features.length()==0)throw invalid("Нет объектов для GeoJSON");
  return new JSONObject().put("type","FeatureCollection").put("features",features);
 }

 private static void updateProperty(JSONObject props,String name,String value)throws JSONException{
  if(!value.isEmpty())props.put(name,value);
  else if(props.opt(name) instanceof String&&!props.optString(name).isEmpty())props.remove(name);
 }

 private static JSONObject writeGeometry(Element g,Object hint,int depth)throws Exception{
  if(depth>DEPTH)throw invalid("Слишком глубокая геометрия");
  switch(tag(g)){
   case "Point":
    List<double[]> p=positions(g);if(p.size()!=1)throw invalid("Ожидалась одна точка");
    return geometry("Point",array(p.get(0)));
   case "LineString":
    List<double[]> points=positions(g);if(points.size()<2)throw invalid("Ожидалась линия");
    return geometry("LineString",array(points));
   case "Polygon":
    JSONArray coordinates=new JSONArray();
    for(List<double[]> ring:rings(g)){
     double area=orientation(ring);
     if(coordinates.length()==0?area<0:area>0)Collections.reverse(ring);
     coordinates.put(array(ring));
    }
    return geometry("Polygon",coordinates);
   case "MultiGeometry":return group(geometries(g),hint,depth+1);
   default:throw invalid("Неподдерживаемая геометрия KML");
  }
 }

 private static double orientation(List<double[]> ring){
  double sum=0,previous=ring.get(0)[0];
  for(int i=1;i<ring.size();i++){
   double[] a=ring.get(i-1),b=ring.get(i);
   double change=b[0]-a[0];
   if(change>180)change-=360;
   if(change< -180)change+=360;
   double next=previous+change;
   sum+=previous*b[1]-next*a[1];previous=next;
  }
  return sum;
 }

 private static JSONObject group(List<Element> list,Object hint,int depth)throws Exception{
  if(list.isEmpty())throw invalid("Пустая коллекция геометрий");
  JSONArray children=new JSONArray(),coordinates=new JSONArray();
  String uniform=null;
  boolean mixed=hint instanceof JSONArray;
  for(int i=0;i<list.size();i++){
   Object childHint=hint instanceof JSONArray?((JSONArray)hint).opt(i):null;
   JSONObject g=writeGeometry(list.get(i),childHint,depth);
   children.put(g);
   String type=g.getString("type");
   if(uniform==null)uniform=type;
   mixed|=!uniform.equals(type)||!g.has("coordinates");
   coordinates.put(g.opt("coordinates"));
  }
  if(!mixed&&Arrays.asList("Point","LineString","Polygon").contains(uniform))
   return geometry("Multi"+uniform,coordinates);
  return new JSONObject().put("type","GeometryCollection").put("geometries",children);
 }

 private static JSONObject geometry(String name,JSONArray coordinates)throws JSONException{
  return new JSONObject().put("type",name).put("coordinates",coordinates);
 }
 private static JSONArray array(List<double[]> points)throws JSONException{
  JSONArray array=new JSONArray();for(double[] point:points)array.put(array(point));return array;
 }
 private static JSONArray array(double[] point)throws JSONException{
  JSONArray array=new JSONArray();for(double c:point)array.put(c);return array;
 }
}
