package ru.warriorrus.app.exchange;

import android.util.Xml;
import java.io.*;
import java.util.*;
import java.util.zip.*;
import org.xmlpull.v1.*;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.geometry.Geometry;

/** Local KML/KMZ/GPX interchange. Never follows network links or external entities. */
public final class PlacemarkFiles {
  private static final int LIMIT=25*1024*1024;
  private PlacemarkFiles() {}
  private static final class Node {
    String name,text=""; Map<String,String> attributes=new HashMap<>(); List<Node> children=new ArrayList<>();
    Node child(String n) { for(Node x:children) if(n.equals(x.name))return x; return null; }
    String value(String n) { Node x=child(n);return x==null?"":x.text.trim(); }
    List<Node> named(String n) { List<Node> r=new ArrayList<>(); for(Node x:children)if(n.equals(x.name))r.add(x);return r; }
  }
  public static byte[] bounded(InputStream in,int limit) throws IOException {
    ByteArrayOutputStream out=new ByteArrayOutputStream();byte[] b=new byte[8192];int n;
    while((n=in.read(b))!=-1) { if(out.size()+n>limit)throw new IOException("Файл слишком большой");out.write(b,0,n); } return out.toByteArray();
  }
  public static List<MapItem> read(InputStream input) throws Exception {
    BufferedInputStream in=new BufferedInputStream(input);in.mark(4);int a=in.read(),b=in.read();in.reset();
    byte[] xml;
    if(a=='P'&&b=='K') {
      xml=null; int entries=0,total=0; byte[] fallback=null;
      ZipInputStream zip=new ZipInputStream(in);ZipEntry e;
      while((e=zip.getNextEntry())!=null) {
        if(++entries>1000)throw new IOException("Слишком много файлов в KMZ");
        byte[] data=bounded(zip,LIMIT);total+=data.length;if(total>2*LIMIT)throw new IOException("KMZ слишком большой");
        if(!e.isDirectory()&&e.getName().toLowerCase(Locale.ROOT).endsWith(".kml")) {
          if(fallback==null)fallback=data;
          if("doc.kml".equalsIgnoreCase(e.getName()))xml=data;
        }
      }
      if(xml==null)xml=fallback;if(xml==null)throw new IOException("В KMZ нет KML");
    } else xml=bounded(in,LIMIT);
    Node root=parse(xml);List<MapItem> result=new ArrayList<>();
    if("kml".equals(root.name)) {
      Map<String,Node> styles=new HashMap<>();collectStyles(root,styles);kmlChildren(root,0,result,styles);
    } else if("gpx".equals(root.name)) gpx(root,result);
    else if("loc".equals(root.name)){for(Node waypoint:root.named("waypoint")){Node coord=waypoint.child("coord");if(coord==null)continue;Vertex v=new Vertex(Double.parseDouble(coord.attributes.get("lat")),Double.parseDouble(coord.attributes.get("lon")));MapItem i=item(waypoint.value("name"),"point",0,result);i.latitude=v.latitude;i.longitude=v.longitude;}}

    else throw new IOException("Поддерживаются KML, KMZ и GPX");
    if(result.isEmpty())throw new IOException("В файле нет поддерживаемых объектов");
    return result;
  }
  private static Node parse(byte[] data) throws Exception {
    XmlPullParser p=Xml.newPullParser();p.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES,true);
    p.setInput(new ByteArrayInputStream(data),null);Deque<Node> stack=new ArrayDeque<>();Node root=null;int nodes=0;
    for(int event=p.nextToken();event!=XmlPullParser.END_DOCUMENT;event=p.nextToken()) {
      if(event==XmlPullParser.DOCDECL)throw new IOException("DTD и внешние ссылки XML не поддерживаются");
      if(event==XmlPullParser.START_TAG) {
        if(++nodes>200000||stack.size()>64)throw new IOException("Слишком сложный XML");
        Node n=new Node();n.name=p.getName();for(int i=0;i<p.getAttributeCount();i++)n.attributes.put(p.getAttributeName(i),p.getAttributeValue(i));
        if(stack.isEmpty()) {if(root!=null)throw new IOException("Неверный XML");root=n;} else stack.peek().children.add(n);stack.push(n);
      } else if(event==XmlPullParser.TEXT||event==XmlPullParser.CDSECT||event==XmlPullParser.ENTITY_REF) {
        if(!stack.isEmpty()) { String text=p.getText();if(text==null)throw new IOException("Неизвестная XML-сущность");stack.peek().text+=text; }
      } else if(event==XmlPullParser.END_TAG) stack.pop();
    }
    if(root==null||!stack.isEmpty())throw new IOException("Пустой или повреждённый XML");return root;
  }
  private static void collectStyles(Node n,Map<String,Node> styles) {
    if("Style".equals(n.name)&&n.attributes.containsKey("id"))styles.put("#"+n.attributes.get("id"),n);
    for(Node c:n.children)collectStyles(c,styles);
  }
  private static MapItem item(String name,String kind,long parent,List<MapItem> all) throws IOException {
    if(all.size()>=10000)throw new IOException("Не более 10 000 объектов за импорт");
    MapItem i=new MapItem();i.id=-(all.size()+1);i.parent=parent;i.kind=kind;i.name=name.isEmpty()?"Объект "+(all.size()+1):name;
    i.visible=true;i.opacity=1;i.color=0xff3f6db5;i.position=all.size();all.add(i);return i;
  }
  private static void kmlChildren(Node node,long parent,List<MapItem> all,Map<String,Node> styles) throws Exception {
    for(Node n:node.children) {
      if("Document".equals(n.name)||"Folder".equals(n.name)) {
        long next=parent;
        if("Folder".equals(n.name)) {MapItem f=item(n.value("name"),"folder",parent,all);f.description=n.value("description");f.visible=!"0".equals(n.value("visibility"));next=f.id;}
        kmlChildren(n,next,all,styles);
      } else if("Placemark".equals(n.name)) {
        List<Node> shapes=new ArrayList<>();shapes(n,shapes);
        for(Node shape:shapes) {
          String kind="Point".equals(shape.name)?"point":"Polygon".equals(shape.name)?"area":"path";
          Node ext=n.child("ExtendedData");if(ext!=null)for(Node d:ext.named("Data"))
            if("workmap:kind".equals(d.attributes.get("name"))&&Arrays.asList("route","path","track").contains(d.value("value"))&&"path".equals(kind))kind=d.value("value");
          MapItem i=item(n.value("name"),kind,parent,all);i.description=n.value("description");i.visible=!"0".equals(n.value("visibility"));
          Node style=n.child("Style");if(style==null)style=styles.get(n.value("styleUrl"));
          if(style!=null) {Node line=style.child("LineStyle");if(line==null)line=style.child("IconStyle");if(line!=null&&!line.value("color").isEmpty())i.color=kmlColor(line.value("color"));}
          if("area".equals(kind)) {
            Node outer=shape.child("outerBoundaryIs");if(outer==null)throw new IOException("У области нет внешнего контура");
            i.segments.add(ring(outer));for(Node hole:shape.named("innerBoundaryIs"))i.segments.add(ring(hole));
          } else {
            List<Vertex> points=coordinates(shape.value("coordinates"));
            if(points.isEmpty())throw new IOException("Нет координат объекта");
            if(i.isGeometry())i.segments.add(points);
            else {i.latitude=points.get(0).latitude;i.longitude=points.get(0).longitude;}
          }
          if(i.isGeometry()) {Geometry.validate(i);Vertex v=i.segments.get(0).get(0);i.latitude=v.latitude;i.longitude=v.longitude;}
        }
      }
    }
  }
  private static void shapes(Node n,List<Node> result) {
    for(Node c:n.children) {if(Arrays.asList("Point","LineString","Polygon").contains(c.name))result.add(c);else if("MultiGeometry".equals(c.name))shapes(c,result);}
  }
  private static List<Vertex> ring(Node boundary) throws Exception {
    Node ring=boundary.child("LinearRing");if(ring==null)throw new IOException("Нет контура области");List<Vertex> v=coordinates(ring.value("coordinates"));
    if(v.size()>1&&v.get(0).latitude==v.get(v.size()-1).latitude&&v.get(0).longitude==v.get(v.size()-1).longitude)v.remove(v.size()-1);return v;
  }
  private static List<Vertex> coordinates(String text) throws Exception {
    List<Vertex> r=new ArrayList<>();for(String tuple:text.trim().split("\\s+"))if(!tuple.isEmpty()) {
      String[] p=tuple.split(",");if(p.length<2)throw new IOException("Неверные координаты KML");
      r.add(new Vertex(Double.parseDouble(p[1]),Double.parseDouble(p[0]),p.length>2&&!p[2].isEmpty()?Double.valueOf(p[2]):null,null));
    }return r;
  }
  private static int kmlColor(String s) throws IOException {try {long v=Long.parseLong(s.trim(),16);if(s.trim().length()!=8)throw new NumberFormatException();return ((int)v&0xff00ff00)|(((int)v&255)<<16)|(((int)v>>16)&255);}catch(Exception e){throw new IOException("Неверный цвет KML");}}
  private static void gpx(Node root,List<MapItem> all) throws Exception {
    for(Node n:root.children) {
      if(!Arrays.asList("wpt","rte","trk").contains(n.name))continue;
      MapItem i=item(n.value("name"),"wpt".equals(n.name)?"point":"rte".equals(n.name)?"route":"track",0,all);i.description=n.value("desc");
      if("point".equals(i.kind)) {Vertex v=gpxPoint(n);i.latitude=v.latitude;i.longitude=v.longitude;i.segments.add(new ArrayList<>(Collections.singletonList(v)));Long created=ru.warriorrus.app.geometry.TrackStatistics.time(v.time);if(created!=null)i.created=i.updated=created;}
      else {
        if("route".equals(i.kind)) {List<Vertex> line=new ArrayList<>();for(Node p:n.named("rtept"))line.add(gpxPoint(p));i.segments.add(line);}
        else for(Node seg:n.named("trkseg")) {List<Vertex> line=new ArrayList<>();for(Node p:seg.named("trkpt"))line.add(gpxPoint(p));if(!line.isEmpty())i.segments.add(line);}
        Geometry.validate(i);Vertex v=i.segments.get(0).get(0);i.latitude=v.latitude;i.longitude=v.longitude;ru.warriorrus.app.geometry.TrackStatistics stats=ru.warriorrus.app.geometry.TrackStatistics.of(i);if(stats.first!=Long.MAX_VALUE){i.created=stats.first;i.updated=stats.last;}
      }
    }
  }
  private static Vertex gpxPoint(Node n) {return new Vertex(Double.parseDouble(n.attributes.get("lat")),Double.parseDouble(n.attributes.get("lon")),n.value("ele").isEmpty()?null:Double.valueOf(n.value("ele")),n.value("time").isEmpty()?null:n.value("time"),n.value("name"),n.value("desc"));}
  public static void write(List<MapItem> items,OutputStream output,String format) throws Exception {
    if("kmz".equals(format)) {ZipOutputStream zip=new ZipOutputStream(output);zip.putNextEntry(new ZipEntry("doc.kml"));writeXml(items,zip,false,Collections.emptyMap(),Collections.emptyMap());zip.closeEntry();zip.finish();zip.flush();}
    else writeXml(items,output,"gpx".equals(format),Collections.emptyMap(),Collections.emptyMap());
  }
  public static void writeKmlDocument(List<MapItem> items,OutputStream output,Map<Long,String> icons,Map<Long,String> descriptions)throws Exception {writeXml(items,output,false,icons,descriptions);}
  private static void writeXml(List<MapItem> items,OutputStream output,boolean gpx,Map<Long,String> icons,Map<Long,String> descriptions) throws Exception {
    XmlSerializer x=Xml.newSerializer();x.setOutput(output,"UTF-8");x.startDocument("UTF-8",true);
    if(gpx) {
      for(MapItem i:items)if("area".equals(i.kind))throw new IOException("Для областей выберите KML или KMZ: GPX не поддерживает полигоны");
      x.startTag(null,"gpx").attribute(null,"xmlns","http://www.topografix.com/GPX/1/1").attribute(null,"version","1.1").attribute(null,"creator","Рабочая карта");
      // GPX schema orders all waypoints before routes, and routes before tracks.
      for(String category:Arrays.asList("point","route","track"))for(MapItem i:items)if(category.equals(i.kind)||("track".equals(category)&&"path".equals(i.kind))) {
        if("point".equals(i.kind)) {x.startTag(null,"wpt").attribute(null,"lat",""+i.latitude).attribute(null,"lon",""+i.longitude);if(!i.segments.isEmpty()&&!i.segments.get(0).isEmpty()){Vertex v=i.segments.get(0).get(0);if(v.elevation!=null)tag(x,"ele",""+v.elevation);if(v.time!=null)tag(x,"time",v.time);}tag(x,"name",i.name);tag(x,"desc",i.description);x.endTag(null,"wpt");}
        else {boolean route="route".equals(i.kind);String container=route?"rte":"trk";x.startTag(null,container);tag(x,"name",i.name);tag(x,"desc",i.description);
          for(List<Vertex> s:i.segments) {if(!route)x.startTag(null,"trkseg");for(Vertex v:s){String pt=route?"rtept":"trkpt";x.startTag(null,pt).attribute(null,"lat",""+v.latitude).attribute(null,"lon",""+v.longitude);if(v.elevation!=null)tag(x,"ele",""+v.elevation);if(v.time!=null)tag(x,"time",v.time);if(!v.name.isEmpty())tag(x,"name",v.name);if(!v.description.isEmpty())tag(x,"desc",v.description);x.endTag(null,pt);}if(!route)x.endTag(null,"trkseg");}x.endTag(null,container);}
      }
      x.endTag(null,"gpx");
    } else {
      x.startTag(null,"kml").attribute(null,"xmlns","http://www.opengis.net/kml/2.2");x.startTag(null,"Document");tag(x,"name","Рабочая карта");
      Set<Long> ids=new HashSet<>();for(MapItem i:items)ids.add(i.id);Set<Long> written=new HashSet<>();
      for(MapItem i:items)if(i.parent==0||!ids.contains(i.parent))writeKml(x,i,items,written,icons,descriptions);
      x.endTag(null,"Document");x.endTag(null,"kml");
    }
    x.endDocument();x.flush();
  }
  private static void writeKml(XmlSerializer x,MapItem i,List<MapItem> items,Set<Long> written,Map<Long,String> icons,Map<Long,String> descriptions) throws Exception {
    if(!written.add(i.id))return;String element=i.isFolder()?"Folder":"Placemark";x.startTag(null,element);tag(x,"name",i.name);tag(x,"description",descriptions.containsKey(i.id)?descriptions.get(i.id):i.description);tag(x,"visibility",i.visible?"1":"0");
    if(i.isFolder()) {for(MapItem child:items)if(child.parent==i.id)writeKml(x,child,items,written,icons,descriptions);}
    else {
      x.startTag(null,"Style");for(String style:Arrays.asList("LineStyle","IconStyle","PolyStyle")){x.startTag(null,style);int color=(i.color&0x00ffffff)|Math.round(255*i.opacity)<<24;int kml=(color&0xff00ff00)|((color&255)<<16)|((color>>16)&255);tag(x,"color","IconStyle".equals(style)&&icons.containsKey(i.id)?"ffffffff":String.format(Locale.ROOT,"%08x",kml));
        if("IconStyle".equals(style)&&icons.containsKey(i.id)){x.startTag(null,"Icon");tag(x,"href",icons.get(i.id));x.endTag(null,"Icon");}
        if("LineStyle".equals(style))tag(x,"width","3");x.endTag(null,style);}x.endTag(null,"Style");
      if(!i.isGeometry()){x.startTag(null,"Point");tag(x,"coordinates",i.longitude+","+i.latitude);x.endTag(null,"Point");}
      else {
        x.startTag(null,"ExtendedData");x.startTag(null,"Data").attribute(null,"name","workmap:kind");tag(x,"value",i.kind);x.endTag(null,"Data");x.endTag(null,"ExtendedData");
        if("area".equals(i.kind)){x.startTag(null,"Polygon");for(int n=0;n<i.segments.size();n++){String bound=n==0?"outerBoundaryIs":"innerBoundaryIs";x.startTag(null,bound);x.startTag(null,"LinearRing");tag(x,"coordinates",coordinateText(i.segments.get(n),true));x.endTag(null,"LinearRing");x.endTag(null,bound);}x.endTag(null,"Polygon");}
        else {boolean multi=i.segments.size()>1;if(multi)x.startTag(null,"MultiGeometry");for(List<Vertex> line:i.segments){x.startTag(null,"LineString");tag(x,"tessellate","1");tag(x,"coordinates",coordinateText(line,false));x.endTag(null,"LineString");}if(multi)x.endTag(null,"MultiGeometry");}
      }
    }x.endTag(null,element);
  }
  private static String coordinateText(List<Vertex> line,boolean close){StringBuilder b=new StringBuilder();for(Vertex v:line){if(b.length()>0)b.append(' ');b.append(v.longitude).append(',').append(v.latitude);if(v.elevation!=null)b.append(',').append(v.elevation);}if(close&&!line.isEmpty()){Vertex p=line.get(0);b.append(' ').append(p.longitude).append(',').append(p.latitude);if(p.elevation!=null)b.append(',').append(p.elevation);}return b.toString();}
  private static void tag(XmlSerializer x,String name,String value)throws IOException {x.startTag(null,name);x.text(value==null?"":value);x.endTag(null,name);}
}
