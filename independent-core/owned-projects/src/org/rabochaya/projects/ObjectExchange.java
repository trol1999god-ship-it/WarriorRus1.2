package org.rabochaya.projects;

import android.util.Xml;
import android.app.Activity;
import android.widget.Toast;
import java.io.*;
import java.math.BigDecimal;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CodingErrorAction;
import java.util.*;
import javax.xml.parsers.DocumentBuilderFactory;
import org.json.*;
import org.w3c.dom.*;
import org.xmlpull.v1.XmlPullParser;

/** Local object interchange. Native projects and their assets stay in KML/KMZ. */
public final class ObjectExchange {
 static final String KML="http://www.opengis.net/kml/2.2", GPX="http://www.topografix.com/GPX/1/1";
 static final String EXT="urn:rabochaya-karta:exchange:1";
 static final String GEO="rk-exchange-geojson", KIND="rk-exchange-gpx-kind", GPX_DATA="rk-exchange-gpx-data";
 static final int LIMIT=4*1024*1024, DEPTH=64;
 private static final Charset UTF8=Charset.forName("UTF-8");

 private ObjectExchange(){}

 public static KmlProject read(InputStream stream, boolean zip) throws IOException {
  return readForImport(null,stream,zip);
 }

 public static KmlProject readForImport(Activity activity,InputStream stream,boolean zip)throws IOException{
  if(zip)return KmlProject.read(stream,true);
  byte[] payload=bounded(stream);
  int i=payload.length>=3&&(payload[0]&255)==239&&(payload[1]&255)==187&&(payload[2]&255)==191?3:0;
  while(i<payload.length&&(payload[i]==' '||payload[i]=='\n'||payload[i]=='\r'||payload[i]=='\t'))i++;
  try{
   if(i<payload.length&&payload[i]=='{')return imported(activity,GeoJsonExchange.read(jsonText(payload,i)));
   XmlPullParser parser=parser(payload);
   int token;
   do{token=parser.nextToken();if(token==XmlPullParser.DOCDECL)throw invalid("DTD запрещён");}
   while(token!=XmlPullParser.START_TAG&&token!=XmlPullParser.END_DOCUMENT);
   if(token==XmlPullParser.START_TAG&&"gpx".equals(parser.getName()))
    return imported(activity,GpxExchange.read(xml(payload)));
   return KmlProject.read(new ByteArrayInputStream(payload),false);
  }catch(IOException e){throw e;}
  catch(Exception e){throw new IOException("Не удалось прочитать файл объектов",e);}
 }

 public static byte[] write(KmlProject project,String format)throws IOException{
  try{
   byte[] result;
   if("gpx".equals(format))result=KmlXml.write(GpxExchange.write(project.root()));
   else if("geojson".equals(format))result=GeoJsonExchange.write(project.root()).toString().getBytes(UTF8);
   else throw invalid("Неизвестный формат обмена");
   if(result.length>LIMIT)throw invalid("Файл обмена больше 4 МиБ");
   return result;
  }catch(IOException e){throw e;}
  catch(Exception e){throw new IOException("Не удалось экспортировать объекты",e);}
 }

 private static KmlProject imported(Activity activity,Document document)throws IOException{
  if(features(document.getDocumentElement()).isEmpty())throw invalid("В файле нет поддерживаемых объектов");
  KmlProject result=KmlProject.parse(KmlXml.write(document));
  if(activity!=null)activity.runOnUiThread(()->Toast.makeText(activity,
    "Импортируются геометрия и поддерживаемые атрибуты. Свойства вне формата и сторонние расширения могут быть потеряны.",
    Toast.LENGTH_LONG).show());
  return result;
 }

 static byte[] bounded(InputStream stream)throws IOException{
  ByteArrayOutputStream out=new ByteArrayOutputStream();
  byte[] buffer=new byte[16384];int n;
  while((n=stream.read(buffer))!=-1){
   if(n>LIMIT-out.size())throw invalid("Файл объектов больше 4 МиБ");
   out.write(buffer,0,n);
  }
  return out.toByteArray();
 }

 private static String jsonText(byte[] data,int start)throws IOException{
  String text=UTF8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
    .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(data,start,data.length-start)).toString();
  boolean string=false,escape=false;int depth=0;
  for(int i=0;i<text.length();i++){
   char c=text.charAt(i);
   if(string){if(escape)escape=false;else if(c=='\\')escape=true;else if(c=='"')string=false;}
   else if(c=='"')string=true;
   else if((c=='['||c=='{')&&++depth>DEPTH)throw invalid("Слишком глубокий GeoJSON");
   else if(c==']'||c=='}')depth--;
  }
  return text;
 }

 private static XmlPullParser parser(byte[] payload)throws Exception{
  XmlPullParser reader=Xml.newPullParser();
  reader.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES,true);
  reader.setInput(new ByteArrayInputStream(payload),null);
  return reader;
 }

 private static Document xml(byte[] payload)throws Exception{
  XmlPullParser parser=parser(payload);
  Document doc=newDocument();
  Node current=doc;
  int count=0,token;
  while((token=parser.nextToken())!=XmlPullParser.END_DOCUMENT){
   switch(token){
    case XmlPullParser.DOCDECL: throw invalid("DTD запрещён");
    case XmlPullParser.START_TAG:
     if(parser.getDepth()>DEPTH||++count>120000)throw invalid("Слишком сложный GPX");
     Element child=doc.createElementNS(parser.getNamespace(),parser.getName());
     for(int i=0;i<parser.getAttributeCount();i++){
      String namespace=parser.getAttributeNamespace(i);
      if(namespace==null||namespace.isEmpty())child.setAttribute(parser.getAttributeName(i),parser.getAttributeValue(i));
     }
     current.appendChild(child);current=child;break;
    case XmlPullParser.END_TAG: current=current.getParentNode();break;
    case XmlPullParser.TEXT: case XmlPullParser.CDSECT: case XmlPullParser.ENTITY_REF:
     if(current!=doc){
      if(parser.getText()==null)throw invalid("Неизвестная сущность XML");
      current.appendChild(doc.createTextNode(parser.getText()));
     }
   }
  }
  return doc;
 }

 static Document newDocument()throws Exception{
  return DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
 }

 static Element kml(Document doc){
  Element root=doc.createElementNS(KML,"kml");
  doc.appendChild(root);
  return add(root,"Document",null);
 }

 static Element add(Element parent,String type,String data){
  Element e=parent.getOwnerDocument().createElementNS(parent.getNamespaceURI(),type);
  parent.appendChild(e);
  if(data!=null)e.setTextContent(data);
  return e;
 }

 static String tag(Element e){return e.getLocalName()!=null?e.getLocalName():e.getTagName();}
 static List<Element> children(Element e,String type){
  List<Element> out=new ArrayList<>();
  for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())
   if(n instanceof Element&&(type==null||type.equals(tag((Element)n))))out.add((Element)n);
  return out;
 }
 static Element child(Element e,String type){for(Element n:children(e,type))return n;return null;}
 static String text(Element e,String type){Element n=child(e,type);return n==null?"":n.getTextContent();}
 static List<Element> features(Element root)throws IOException{
  List<Element> out=new ArrayList<>(); collect(root,out,0);return out;
 }
 private static void collect(Element root,List<Element> out,int depth)throws IOException{
  if(depth>DEPTH)throw invalid("Слишком глубокий проект");
  for(Element e:children(root,null)){
   String name=tag(e);
   if("Placemark".equals(name))out.add(e);
   else if("Folder".equals(name)||"Document".equals(name)||"kml".equals(name))collect(e,out,depth+1);
   if(out.size()>10000)throw invalid("Слишком много объектов");
  }
 }
 static Element place(Element parent,String name,String desc){
  Element p=add(parent,"Placemark",null);
  if(!name.isEmpty())add(p,"name",name);
  if(!desc.isEmpty())add(p,"description",desc);
  return p;
 }
 static void data(Element p,String key,String value){
  Element ext=child(p,"ExtendedData");
  if(ext==null)ext=add(p,"ExtendedData",null);
  Element d=add(ext,"Data",null);d.setAttribute("name",key);add(d,"value",value);
 }
 static Map<String,String> data(Element p){
  Map<String,String> values=new LinkedHashMap<>();
  Element ext=child(p,"ExtendedData");
  if(ext!=null)for(Element d:children(ext,"Data"))values.put(d.getAttribute("name"),text(d,"value"));
  return values;
 }
 static String description(Element e){
  return text(e,"description").replaceAll("(?s)<!--rk-media-([a-f0-9-]+)-->.*?<!--/rk-media-\\1-->","");
 }
 static List<Element> geometries(Element e)throws IOException{
  List<Element> list=new ArrayList<>();
  for(Element g:children(e,null)){
   switch(tag(g)){
    case "Point": case "LineString": case "Polygon": case "MultiGeometry": list.add(g);break;
    case "Track": case "MultiTrack": case "Model": throw invalid("Геометрия "+tag(g)+" не поддерживается в этом экспорте");
   }
  }
  return list;
 }
 static void geometry(Element parent,String type,List<double[]> points)throws IOException{
  StringBuilder coords=new StringBuilder();boolean height=false;
  for(double[] p:points){
   if(coords.length()>0)coords.append(' ');
   coords.append(decimal(p[0])).append(',').append(decimal(p[1]));
   if(p.length==3){coords.append(',').append(decimal(p[2]));height=true;}
  }
  Element g=add(parent,type,null);
  if(height && !"LinearRing".equals(type))add(g,"altitudeMode","absolute");
  add(g,"coordinates",coords.toString());
 }
 static void polygon(Element parent,List<List<double[]>> rings)throws IOException{
  Element g=add(parent,"Polygon",null);
  boolean altitude=false;
  for(List<double[]> ring:rings)for(double[] p:ring)altitude|=p.length==3;
  if(altitude)add(g,"altitudeMode","absolute");
  for(int i=0;i<rings.size();i++)geometry(add(g,i==0?"outerBoundaryIs":"innerBoundaryIs",null),"LinearRing",rings.get(i));
 }
 static List<double[]> positions(Element g)throws IOException{
  List<double[]> positions=new ArrayList<>();
  String coords=text(g,"coordinates").trim();
  if(coords.isEmpty())throw invalid("Пустая геометрия");
  for(String point:coords.split("\\s+")){
   String[] values=point.split(",",-1);
   if(values.length<2||values.length>3)throw invalid("Некорректные координаты");
   positions.add(position(values[0],values[1],values.length==3?values[2]:null));
  }
  return positions;
 }
 static List<List<double[]>> rings(Element polygon)throws IOException{
  List<List<double[]>> out=new ArrayList<>();
  for(String type:new String[]{"outerBoundaryIs","innerBoundaryIs"}){
   List<Element> boundaries=children(polygon,type);
   if(type.equals("outerBoundaryIs")&&boundaries.size()!=1)throw invalid("Требуется один внешний контур");
   for(Element e:boundaries){
    Element ring=child(e,"LinearRing");
    if(ring==null)throw invalid("Некорректный контур");
    List<double[]> p=positions(ring);requireRing(p);out.add(p);
   }
  }
  return out;
 }
 static void requireRing(List<double[]> p)throws IOException{
  if(p.size()<4||!Arrays.equals(p.get(0),p.get(p.size()-1)))throw invalid("Контур области должен быть замкнут");
 }
 static double[] position(String lon,String lat,String height)throws IOException{
  try{
   double x=Double.parseDouble(lon),y=Double.parseDouble(lat);
   if(!(x>=-180&&x<=180&&y>=-90&&y<=90))throw invalid("Координаты вне WGS 84");
   if(height==null)return new double[]{x,y};
   double z=Double.parseDouble(height);
   if(Double.isNaN(z)||Double.isInfinite(z))throw invalid("Некорректная высота");
   return new double[]{x,y,z};
  }catch(NumberFormatException e){throw invalid("Некорректные координаты");}
 }
 static String decimal(double n){return BigDecimal.valueOf(n).stripTrailingZeros().toPlainString();}
 static IOException invalid(String message){return new IOException(message);}
}
