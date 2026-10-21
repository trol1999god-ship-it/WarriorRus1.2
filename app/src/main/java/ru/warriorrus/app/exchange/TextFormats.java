package ru.warriorrus.app.exchange;

import java.io.*;
import java.nio.charset.*;
import java.nio.ByteBuffer;
import java.time.*;
import java.util.*;
import org.json.*;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.geometry.*;

/** Offline GeoJSON, delimited tables, Ozi WGS84 and IGC readers; no external links. */
public final class TextFormats {
  private TextFormats(){}
  public static List<MapItem> read(byte[] bytes)throws Exception {
    String text;
    try{text=StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString();}
    catch(CharacterCodingException badUtf8){text=new String(bytes,Charset.forName("windows-1251"));}
    text=text.replaceFirst("^\\ufeff","").trim();
    if(text.startsWith("{")) {List<MapItem> result=new ArrayList<>();json(new JSONObject(text),new JSONObject(),result);return require(result);}
    if(text.startsWith("OziExplorer"))return require(ozi(text));
    if(text.startsWith("A")&&text.contains("DTE")&&text.contains("\nB"))return require(igc(text));
    return require(csv(text));
  }
  private static List<MapItem> require(List<MapItem> r)throws IOException{if(r.isEmpty())throw new IOException("Нет поддерживаемых объектов");return r;}
  private static MapItem item(List<MapItem> list,String name,String kind)throws IOException {
    if(list.size()>=10000)throw new IOException("Слишком много объектов");MapItem i=new MapItem();i.id=-(list.size()+1);i.name=name==null||name.isEmpty()?"Объект "+(list.size()+1):name;i.kind=kind;i.visible=true;i.opacity=1;i.color=0xff3f6db5;i.position=list.size();list.add(i);return i;
  }
  private static Vertex coordinate(JSONArray a)throws JSONException{return new Vertex(a.getDouble(1),a.getDouble(0),a.length()>2&&!a.isNull(2)?a.getDouble(2):null,null);}
  private static List<Vertex> line(JSONArray a,boolean ring)throws JSONException{List<Vertex> r=new ArrayList<>();for(int n=0;n<a.length();n++)r.add(coordinate(a.getJSONArray(n)));if(ring&&r.size()>1){Vertex f=r.get(0),l=r.get(r.size()-1);if(f.latitude==l.latitude&&f.longitude==l.longitude)r.remove(r.size()-1);}return r;}
  private static void finish(MapItem i){if(i.isGeometry()){Geometry.validate(i);Vertex first=i.segments.get(0).get(0);i.latitude=first.latitude;i.longitude=first.longitude;}}
  private static void json(JSONObject o,JSONObject properties,List<MapItem> all)throws Exception {
    String type=o.getString("type");
    if("FeatureCollection".equals(type)){JSONArray a=o.getJSONArray("features");for(int n=0;n<a.length();n++)json(a.getJSONObject(n),properties,all);return;}
    if("Feature".equals(type)){if(o.isNull("geometry"))return;json(o.getJSONObject("geometry"),o.optJSONObject("properties")==null?new JSONObject():o.getJSONObject("properties"),all);return;}
    if("GeometryCollection".equals(type)){JSONArray a=o.getJSONArray("geometries");for(int n=0;n<a.length();n++)json(a.getJSONObject(n),properties,all);return;}
    JSONArray c=o.getJSONArray("coordinates");String name=properties.optString("name",properties.optString("title",""));
    if("MultiPoint".equals(type)||"MultiPolygon".equals(type)){for(int n=0;n<c.length();n++)json(new JSONObject().put("type","MultiPoint".equals(type)?"Point":"Polygon").put("coordinates",c.getJSONArray(n)),properties,all);return;}
    String kind="Point".equals(type)?"point":"Polygon".equals(type)?"area":"path";
    String declared=properties.optString("workmap:kind",kind);if(Arrays.asList("route","path","track").contains(declared)&&!"point".equals(kind)&&!"area".equals(kind))kind=declared;
    if(!Arrays.asList("Point","LineString","MultiLineString","Polygon").contains(type))throw new IOException("Неподдерживаемая геометрия GeoJSON: "+type);
    MapItem i=item(all,name,kind);i.description=properties.optString("description",properties.optString("desc",""));i.appearance=ObjectAppearance.decode(properties.optJSONObject("workmap:appearance")==null?"{}":properties.getJSONObject("workmap:appearance").toString());
    String color=properties.optString("color",properties.optString("stroke",""));if(color.matches("#[0-9a-fA-F]{6}"))i.color=(int)(0xff000000L|Long.parseLong(color.substring(1),16));
    if("point".equals(kind)){Vertex p=coordinate(c);i.latitude=p.latitude;i.longitude=p.longitude;i.segments.add(new ArrayList<>(Collections.singletonList(p)));}
    else if("LineString".equals(type))i.segments.add(line(c,false));else for(int n=0;n<c.length();n++)i.segments.add(line(c.getJSONArray(n),"area".equals(kind)));
    finish(i);
  }
  public static List<List<String>> rows(String text,char separator)throws IOException {
    List<List<String>> rows=new ArrayList<>();List<String> row=new ArrayList<>();StringBuilder value=new StringBuilder();boolean quoted=false;
    for(int n=0;n<text.length();n++){char c=text.charAt(n);if(c=='"'){if(quoted&&n+1<text.length()&&text.charAt(n+1)=='"'){value.append('"');n++;}else quoted=!quoted;}
      else if(c==separator&&!quoted){row.add(value.toString());value.setLength(0);}
      else if((c=='\n'||c=='\r')&&!quoted){if(c=='\r'&&n+1<text.length()&&text.charAt(n+1)=='\n')n++;row.add(value.toString());value.setLength(0);if(row.size()>1||!row.get(0).trim().isEmpty())rows.add(row);row=new ArrayList<>();if(rows.size()>100001)throw new IOException("Слишком много строк");}
      else value.append(c);
    }if(quoted)throw new IOException("Незакрытая кавычка CSV");if(value.length()>0||!row.isEmpty()){row.add(value.toString());rows.add(row);}return rows;
  }
  private static String cell(List<String> row,int index){return index>=0&&index<row.size()?row.get(index).trim():"";}
  private static int column(List<String> header,String... names){for(int n=0;n<header.size();n++)for(String name:names)if(name.equalsIgnoreCase(header.get(n).trim()))return n;return -1;}
  private static List<MapItem> csv(String text)throws Exception {
    String first=text.split("\\r?\\n",2)[0];char sep=first.contains("\t")?'\t':first.contains(";")?';':',';List<List<String>> table=rows(text,sep);if(table.isEmpty())throw new IOException("Пустой CSV");
    List<String> h=table.get(0);int lat=column(h,"latitude","lat","широта"),lon=column(h,"longitude","lon","lng","долгота"),name=column(h,"name","title","название"),desc=column(h,"description","desc","описание"),geom=column(h,"geometry"),kind=column(h,"kind");
    if((lat<0||lon<0)&&geom<0)throw new IOException("CSV: нужны заголовки name,latitude,longitude,description или geometry (GeoJSON)");List<MapItem> result=new ArrayList<>();
    for(int n=1;n<table.size();n++){List<String> row=table.get(n);if(geom>=0&&!cell(row,geom).isEmpty()){JSONObject properties=new JSONObject().put("name",cell(row,name)).put("description",cell(row,desc)).put("workmap:kind",cell(row,kind));json(new JSONObject(cell(row,geom)),properties,result);}
      else {Vertex p=new Vertex(Double.parseDouble(cell(row,lat)),Double.parseDouble(cell(row,lon)));MapItem i=item(result,cell(row,name),"point");i.latitude=p.latitude;i.longitude=p.longitude;i.description=cell(row,desc);}}
    return result;
  }
  private static List<MapItem> ozi(String text)throws Exception {
    String[] lines=text.split("\\r?\\n");if(lines.length<4||!lines[1].trim().equalsIgnoreCase("WGS 84"))throw new IOException("Ozi: поддерживаются координаты WGS 84");List<MapItem> result=new ArrayList<>();
    if(lines[0].contains("Waypoint")){for(int n=4;n<lines.length;n++){List<List<String>> rows=rows(lines[n],',');if(rows.isEmpty())continue;List<String> r=rows.get(0);if(r.size()<4)continue;MapItem i=item(result,cell(r,1).replace('Ñ',','),"point");i.latitude=Double.parseDouble(cell(r,2));i.longitude=Double.parseDouble(cell(r,3));new Vertex(i.latitude,i.longitude);i.description=cell(r,10).replace('Ñ',',');String time=oziTime(cell(r,4));Double alt=altFeet(cell(r,14));i.segments.add(new ArrayList<>(Collections.singletonList(new Vertex(i.latitude,i.longitude,alt,time))));Long created=TrackStatistics.time(time);if(created!=null)i.created=i.updated=created;}}
    else if(lines[0].contains("Track")){if(lines.length<6)throw new IOException("Повреждённый PLT");List<String> info=rows(lines[4],',').get(0);MapItem i=item(result,cell(info,3),"10".equals(cell(info,5))||"20".equals(cell(info,5))?"area":"track");List<Vertex> segment=new ArrayList<>();i.segments.add(segment);
      for(int n=6;n<lines.length;n++){List<List<String>> parsed=rows(lines[n],',');if(parsed.isEmpty())continue;List<String> r=parsed.get(0);if(r.size()<2)continue;if("1".equals(cell(r,2))&&!segment.isEmpty()){segment=new ArrayList<>();i.segments.add(segment);}segment.add(new Vertex(Double.parseDouble(cell(r,0)),Double.parseDouble(cell(r,1)),altFeet(cell(r,3)),oziTime(cell(r,4))));}finish(i);
    }else if(lines[0].contains("Route")){Map<String,MapItem> routes=new LinkedHashMap<>();for(int n=4;n<lines.length;n++){List<List<String>> parsed=rows(lines[n],',');if(parsed.isEmpty())continue;List<String> r=parsed.get(0);if("R".equals(cell(r,0))){MapItem i=item(result,cell(r,2).replace('Ñ',','),"route");i.description=cell(r,3).replace('Ñ',',');i.segments.add(new ArrayList<>());routes.put(cell(r,1),i);}else if("W".equals(cell(r,0))){MapItem i=routes.get(cell(r,1));if(i==null)throw new IOException("Ozi: отсутствует заголовок маршрута");i.segments.get(0).add(new Vertex(Double.parseDouble(cell(r,5)),Double.parseDouble(cell(r,6)),null,oziTime(cell(r,7)),cell(r,4),cell(r,13)));}}for(MapItem i:result)finish(i);}
    else throw new IOException("Ozi: поддерживаются WPT, PLT и RTE");return result;
  }
  private static Double altFeet(String value){if(value.isEmpty()||"-777".equals(value))return null;return Double.parseDouble(value)*0.3048;}
  private static String oziTime(String value){if(value.isEmpty())return null;double days=Double.parseDouble(value);if(Double.isNaN(days)||Double.isInfinite(days))throw new IllegalArgumentException("Неверная дата Ozi");return Instant.ofEpochMilli(Math.round((days-25569)*86400000)).toString();}
  private static List<MapItem> igc(String text)throws Exception {
    List<MapItem> result=new ArrayList<>();MapItem i=item(result,"Импорт IGC","track");LocalDate date=null;int previous=-1;List<Vertex> segment=new ArrayList<>();i.segments.add(segment);
    for(String line:text.split("\\r?\\n")){if(line.startsWith("H")&&line.contains("DTE")){int start=line.indexOf("DTE")+3;if(line.length()>=start+6){String d=line.substring(start,start+6);int year=Integer.parseInt(d.substring(4));date=LocalDate.of(year>=80?1900+year:2000+year,Integer.parseInt(d.substring(2,4)),Integer.parseInt(d.substring(0,2)));}}
      else if(line.startsWith("B")&&line.length()>=35){if(date==null)throw new IOException("IGC: отсутствует дата");if(line.charAt(24)!='A'){if(!segment.isEmpty()){segment=new ArrayList<>();i.segments.add(segment);}continue;}
        int seconds=Integer.parseInt(line.substring(1,3))*3600+Integer.parseInt(line.substring(3,5))*60+Integer.parseInt(line.substring(5,7));if(previous>=0&&seconds<previous-43200)date=date.plusDays(1);previous=seconds;
        double lat=Integer.parseInt(line.substring(7,9))+Integer.parseInt(line.substring(9,14))/60000.0,lon=Integer.parseInt(line.substring(15,18))+Integer.parseInt(line.substring(18,23))/60000.0;if(line.charAt(14)=='S')lat=-lat;if(line.charAt(23)=='W')lon=-lon;
        double height=Double.parseDouble(line.substring(30,35));String time=date.atStartOfDay().plusSeconds(seconds).toInstant(ZoneOffset.UTC).toString();segment.add(new Vertex(lat,lon,height,time));}}
    i.segments.removeIf(List::isEmpty);finish(i);return result;
  }
  public static boolean supports(String format){return Arrays.asList("geojson","csv","tsv","dxf").contains(format);}
  public static void write(List<MapItem> items,OutputStream output,String format)throws Exception {
    if("dxf".equals(format)){dxf(items,output);return;}
    if("geojson".equals(format)){JSONArray features=new JSONArray();for(MapItem i:items)if(!i.isFolder())features.put(new JSONObject().put("type","Feature").put("properties",properties(i)).put("geometry",geometry(i)));JSONObject root=new JSONObject().put("type","FeatureCollection").put("features",features);output.write(root.toString().getBytes(StandardCharsets.UTF_8));return;}
    char sep="tsv".equals(format)?'\t':',';StringBuilder text=new StringBuilder();writeRow(text,sep,Arrays.asList("name","latitude","longitude","description","kind","geometry"));
    for(MapItem i:items)if(!i.isFolder())writeRow(text,sep,Arrays.asList(i.name,""+i.latitude,""+i.longitude,i.description,i.kind,geometry(i).toString()));output.write(text.toString().getBytes(StandardCharsets.UTF_8));
  }
  private static JSONObject properties(MapItem i)throws JSONException{return new JSONObject().put("name",i.name).put("description",i.description).put("color",String.format(Locale.ROOT,"#%06x",i.color&0xffffff)).put("workmap:kind",i.kind).put("workmap:appearance",new JSONObject(i.appearance.encode()));}
  private static JSONArray point(Vertex p)throws JSONException {JSONArray a=new JSONArray().put(p.longitude).put(p.latitude);if(p.elevation!=null)a.put(p.elevation);return a;}
  private static JSONObject geometry(MapItem i)throws JSONException {
    if(!i.isGeometry())return new JSONObject().put("type","Point").put("coordinates",point(new Vertex(i.latitude,i.longitude)));
    JSONArray segments=new JSONArray();for(List<Vertex> line:i.segments){JSONArray coordinates=new JSONArray();for(Vertex p:line)coordinates.put(point(p));if("area".equals(i.kind)&&!line.isEmpty())coordinates.put(point(line.get(0)));segments.put(coordinates);}
    return new JSONObject().put("type","area".equals(i.kind)?"Polygon":i.segments.size()>1?"MultiLineString":"LineString").put("coordinates","area".equals(i.kind)||i.segments.size()>1?segments:segments.getJSONArray(0));
  }
  private static void writeRow(StringBuilder text,char sep,List<String> row){for(int n=0;n<row.size();n++){if(n>0)text.append(sep);text.append('"').append(row.get(n).replace("\"","\"\"")).append('"');}text.append("\r\n");}
  private static void dxf(List<MapItem> items,OutputStream out)throws IOException {StringBuilder b=new StringBuilder("0\nSECTION\n2\nHEADER\n999\nWGS84 longitude/latitude in degrees\n0\nENDSEC\n0\nSECTION\n2\nENTITIES\n");
    for(MapItem i:items)if(!i.isFolder()){if(!i.isGeometry())b.append("0\nPOINT\n8\nOBJECTS\n420\n").append(i.color&0xffffff).append("\n10\n").append(i.longitude).append("\n20\n").append(i.latitude).append("\n30\n0\n");
      else for(List<Vertex> segment:i.segments){b.append("0\nLWPOLYLINE\n100\nAcDbEntity\n8\nOBJECTS\n420\n").append(i.color&0xffffff).append("\n100\nAcDbPolyline\n90\n").append(segment.size()).append("\n70\n").append("area".equals(i.kind)?1:0).append('\n');for(Vertex p:segment)b.append("10\n").append(p.longitude).append("\n20\n").append(p.latitude).append('\n');}}
    b.append("0\nENDSEC\n0\nEOF\n");out.write(b.toString().getBytes(StandardCharsets.UTF_8));}
}
