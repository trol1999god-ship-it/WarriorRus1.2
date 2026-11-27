package org.rabochaya.projects;

import java.io.IOException;
import java.util.*;
import org.json.*;
import org.w3c.dom.*;
import static org.rabochaya.projects.ObjectExchange.*;

final class GpxExchange {
 private static final String[] COMMON={"name","cmt","desc","src","link","number","type"};
 private static final String[] POINT={"time","magvar","geoidheight","name","cmt","desc","src","link","sym","type",
  "fix","sat","hdop","vdop","pdop","ageofdgpsdata","dgpsid"};

 static Document read(Document input)throws Exception{
  Element gpx=input.getDocumentElement();
  if(!GPX.equals(gpx.getNamespaceURI())||!"1.1".equals(gpx.getAttribute("version")))
   throw invalid("Требуется GPX 1.1");
  Document doc=newDocument();
  Element root=kml(doc);
  for(Element e:children(gpx,null)){
   String type=tag(e);
   if(!GPX.equals(e.getNamespaceURI())||!(type.equals("wpt")||type.equals("rte")||type.equals("trk")))continue;
   Element p=place(root,text(e,"name"),text(e,"desc"));
   JSONObject meta=new JSONObject().put("fields",fields(e,type.equals("wpt")?POINT:COMMON));
   Element ext=child(e,"extensions");
   boolean area=false;
   if(ext!=null)for(Element option:children(ext,"area"))area|=EXT.equals(option.getNamespaceURI());
   List<List<double[]>> segments=new ArrayList<>();
   JSONArray points=new JSONArray();
   if(type.equals("wpt"))segments.add(Collections.singletonList(coordinate(e)));
   else if(type.equals("rte"))segments.add(segment(e,"rtept",points));
   else for(Element s:children(e,"trkseg"))segments.add(segment(s,"trkpt",points));
   if(segments.isEmpty())throw invalid("Пустой трек GPX");
   if(type.equals("wpt")&&!text(e,"time").isEmpty())add(add(p,"TimeStamp",null),"when",text(e,"time"));
   data(p,KIND,area&&type.equals("trk")?"area":type);
   if(area&&type.equals("trk")){
    for(List<double[]> ring:segments)requireRing(ring);
    polygon(p,segments);
   }else{
    Element target=segments.size()>1?add(p,"MultiGeometry",null):p;
    for(List<double[]> part:segments)geometry(target,part.size()==1?"Point":"LineString",part);
   }
   data(p,GPX_DATA,meta.put("points",points).toString());
  }
  return doc;
 }

 private static double[] coordinate(Element e)throws IOException{
  String elevation=text(e,"ele");
  return position(e.getAttribute("lon"),e.getAttribute("lat"),elevation.isEmpty()?null:elevation);
 }

 private static List<double[]> segment(Element e,String type,JSONArray metadata)throws Exception{
  List<double[]> points=new ArrayList<>();
  JSONArray values=new JSONArray();
  for(Element point:children(e,type)){
   double[] position=coordinate(point);
   points.add(position);
   values.put(fields(point,POINT).put("_lon",position[0]).put("_lat",position[1]));
  }
  if(points.isEmpty())throw invalid("Пустой маршрут или сегмент GPX");
  metadata.put(values);
  return points;
 }

 private static JSONObject fields(Element e,String[] names)throws JSONException{
  JSONObject out=new JSONObject();
  for(String name:names){
   if(name.equals("link")){
    JSONArray links=new JSONArray();
    for(Element value:children(e,name))links.put(new JSONObject().put("href",value.getAttribute("href"))
      .put("text",text(value,"text")).put("type",text(value,"type")));
    if(links.length()>0)out.put(name,links);
   }else if(child(e,name)!=null)out.put(name,text(e,name));
  }
  return out;
 }

 static TrackStatistics statistics(Element feature){
  Map<String,String> stored=data(feature);
  if(!"trk".equals(stored.get(KIND)))return null;
  try{
   List<Element> parts=flatten(geometries(feature),0);
   if(parts.isEmpty()||!onlyTrackParts(parts))return null;
   JSONObject metadata=new JSONObject();
   String saved=stored.get(GPX_DATA);
   if(saved!=null){
    try{metadata=new JSONObject(saved);}catch(JSONException invalid){/* Coordinates remain usable. */}
   }
   JSONArray segments=metadata.optJSONArray("points");
   TrackStatistics result=new TrackStatistics();
   for(int i=0;i<parts.size();i++){
    List<double[]> vertices=positions(parts.get(i));
    JSONArray segment=segments!=null&&segments.length()==parts.size()?segments.optJSONArray(i):null;
    List<String> times=null;
    if(segment!=null&&segment.length()==vertices.size()){
     times=new ArrayList<>(vertices.size());
     for(int j=0;j<vertices.size();j++){
      JSONObject point=segment.optJSONObject(j);
      double[] vertex=vertices.get(j);
      times.add(point!=null&&point.optDouble("_lon")==vertex[0]&&point.optDouble("_lat")==vertex[1]
          ?point.optString("time",null):null);
     }
    }
    result.addSegment(vertices,times);
   }
   return result;
  }catch(IOException invalid){return null;}
 }

 /** Keep per-vertex fields aligned with both halves of a saved GPX track. */
 static void splitTrackLine(Element feature,String key,String expected,int vertex){
  Map<String,String> stored=data(feature);
  String saved=stored.get(GPX_DATA);
  if(!"trk".equals(stored.get(KIND))||saved==null){
   GeometryEdits.splitLine(feature,key,expected,vertex);
   return;
  }
  Element extended=child(feature,"ExtendedData");
  Element value=trackMetadataValue(extended);
  try{
   JSONObject metadata=new JSONObject(saved);
   JSONArray segments=metadata.optJSONArray("points");
   JSONArray points=segments!=null&&segments.length()==1?segments.optJSONArray(0):null;
   Element line=child(feature,"LineString");
   if(line==null||points==null||points.length()!=positions(line).size()){
    GeometryEdits.splitLine(feature,key,expected,vertex);
    return;
   }
   if(vertex<=0||vertex>=points.length()-1)throw new IllegalArgumentException("Выберите внутреннюю вершину");
   String first=trackMetadataSlice(metadata,points,0,vertex+1);
   String second=trackMetadataSlice(metadata,points,vertex,points.length());
   Element copy=GeometryEdits.splitLine(feature,key,expected,vertex);
   value.setTextContent(first);
   trackMetadataValue(child(copy,"ExtendedData")).setTextContent(second);
  }catch(IOException|JSONException invalid){
   throw new IllegalArgumentException("Не удалось сохранить поля точек GPX",invalid);
  }
 }

 private static Element trackMetadataValue(Element extended){
  Element value=null;
  for(Element field:children(extended,"Data"))
   if(GPX_DATA.equals(field.getAttribute("name")))value=child(field,"value");
  return value;
 }

 private static String trackMetadataSlice(JSONObject metadata,JSONArray points,int start,int end)throws JSONException{
  JSONArray slice=new JSONArray();
  for(int index=start;index<end;index++)slice.put(points.get(index));
  return metadata.put("points",new JSONArray().put(slice)).toString();
 }

 static Document write(Element kml)throws Exception{
  Document document=newDocument();
  Element gpx=document.createElementNS(GPX,"gpx");
  gpx.setAttribute("version","1.1");gpx.setAttribute("creator","Рабочая карта");
  document.appendChild(gpx);
  List<Element> waypoints=new ArrayList<>(),routes=new ArrayList<>(),tracks=new ArrayList<>();
  for(Element p:features(kml)){
   Map<String,String> data=data(p);
   String kind=data.get(KIND);
   JSONObject meta=data.containsKey(GPX_DATA)?new JSONObject(data.get(GPX_DATA)):new JSONObject();
   List<Element> parts=flatten(geometries(p),0);
   if("trk".equals(kind)&&!parts.isEmpty()&&onlyTrackParts(parts)){
    tracks.add(track(gpx,p,parts,false,meta));
    continue;
   }
   if("rte".equals(kind)&&parts.size()==1&&onlyTrackParts(parts)){
    Element route=detached(gpx,"rte");writeFields(route,header(p,optFields(meta)),COMMON);
    writeSegment(route,"rtept",positions(parts.get(0)),segmentMeta(meta,0));
    routes.add(route);continue;
   }
   for(int i=0;i<parts.size();i++){
    Element g=parts.get(i);
    switch(tag(g)){
     case "Point":
      List<double[]> point=positions(g);
      if(point.size()!=1)throw invalid("Ожидалась одна точка");
      Element wpt=detached(gpx,"wpt");
      JSONObject attributes=header(p,optFields(meta));
      Element time=child(p,"TimeStamp");
      String timestamp=time==null?"":text(time,"when");
      if(timestamp.matches("-?[0-9]{4,}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}(?:\\.[0-9]+)?(?:Z|[+-][0-9]{2}:[0-9]{2})?"))attributes.put("time",timestamp);
      else attributes.remove("time");
      writePoint(wpt,point.get(0),attributes);waypoints.add(wpt);break;
     case "LineString":
      tracks.add(track(gpx,p,Collections.singletonList(g),false,new JSONObject()));
      break;
     case "Polygon": tracks.add(track(gpx,p,Collections.singletonList(g),true,meta));break;
    }
   }
  }
  if(waypoints.isEmpty()&&routes.isEmpty()&&tracks.isEmpty())throw invalid("Нет объектов для GPX");
  for(List<Element> group:Arrays.asList(waypoints,routes,tracks))for(Element e:group)gpx.appendChild(e);
  return document;
 }

 private static List<Element> flatten(List<Element> geometry,int depth)throws IOException{
  if(depth>DEPTH)throw invalid("Слишком глубокая геометрия");
  List<Element> out=new ArrayList<>();
  for(Element e:geometry){
   if("MultiGeometry".equals(tag(e)))out.addAll(flatten(geometries(e),depth+1));
   else out.add(e);
  }
  return out;
 }
 private static boolean onlyTrackParts(List<Element> list){
  for(Element g:list)if(!"LineString".equals(tag(g))&&!"Point".equals(tag(g)))return false;
  return true;
 }
 private static Element track(Element root,Element p,List<Element> parts,boolean area,JSONObject meta)throws Exception{
  Element trk=detached(root,"trk");
  writeFields(trk,header(p,optFields(meta)),COMMON);
  if(area){
   Element extension=add(trk,"extensions",null);
   extension.appendChild(root.getOwnerDocument().createElementNS(EXT,"rk:area"));
  }
  int i=0;
  for(Element g:parts){
   List<List<double[]>> segments=area?rings(g):Collections.singletonList(positions(g));
   for(List<double[]> segment:segments)writeSegment(add(trk,"trkseg",null),"trkpt",segment,segmentMeta(meta,i++));
  }
  return trk;
 }
 private static Element detached(Element parent,String name){return parent.getOwnerDocument().createElementNS(GPX,name);}
 private static JSONObject optFields(JSONObject meta){JSONObject f=meta.optJSONObject("fields");return f==null?new JSONObject():f;}
 private static JSONObject header(Element p,JSONObject fields)throws JSONException{
  JSONObject out=new JSONObject(fields.toString());
  out.remove("name");out.remove("desc");
  String name=text(p,"name"),description=description(p);
  if(!name.isEmpty())out.put("name",name);
  if(!description.isEmpty())out.put("desc",description);
  return out;
 }
 private static JSONArray segmentMeta(JSONObject meta,int i){JSONArray points=meta.optJSONArray("points");return points==null?null:points.optJSONArray(i);}
 private static void writeSegment(Element parent,String kind,List<double[]> points,JSONArray meta)throws JSONException{
  for(int i=0;i<points.size();i++){
   double[] p=points.get(i);
   JSONObject attributes=meta!=null&&meta.length()==points.size()?meta.optJSONObject(i):null;
   if(attributes==null||attributes.optDouble("_lon")!=p[0]||attributes.optDouble("_lat")!=p[1])attributes=new JSONObject();
   writePoint(add(parent,kind,null),p,attributes);
  }
 }
 private static void writePoint(Element e,double[] p,JSONObject fields)throws JSONException{
  e.setAttribute("lat",decimal(p[1]));e.setAttribute("lon",decimal(p[0]==180?-180:p[0]));
  if(p.length==3)add(e,"ele",decimal(p[2]));
  writeFields(e,fields,POINT);
 }
 private static void writeFields(Element e,JSONObject fields,String[] names)throws JSONException{
  for(String name:names){
   if(name.equals("link")){
    JSONArray links=fields.optJSONArray(name);
    for(int i=0;links!=null&&i<links.length();i++){
     JSONObject entry=links.getJSONObject(i);
     Element l=add(e,name,null);l.setAttribute("href",entry.getString("href"));
     for(String c:new String[]{"text","type"})if(!entry.optString(c).isEmpty())add(l,c,entry.getString(c));
    }
   }else if(fields.has(name))add(e,name,fields.getString(name));
  }
 }
}
