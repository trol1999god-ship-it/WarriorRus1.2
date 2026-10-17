package ru.warriorrus.app.geometry;

import java.util.*;
import org.json.*;
import ru.warriorrus.app.data.*;

public final class Geometry {
  private static final double R = 6371008.8;
  private Geometry() {}
  public static String encode(List<List<Vertex>> segments) {
    JSONArray all = new JSONArray();
    try {
      for (List<Vertex> segment : segments) {
        JSONArray line = new JSONArray();
        for (Vertex v : segment) {
          JSONArray point = new JSONArray(); point.put(v.latitude); point.put(v.longitude);
          point.put(v.elevation == null ? JSONObject.NULL : v.elevation);
          point.put(v.time == null ? JSONObject.NULL : v.time); point.put(v.name); point.put(v.description); line.put(point);
        }
        all.put(line);
      }
      return all.toString();
    } catch (JSONException e) { throw new IllegalArgumentException("Неверная геометрия", e); }
  }
  public static List<List<Vertex>> decode(String json) {
    List<List<Vertex>> result = new ArrayList<>();
    try {
      JSONArray all = new JSONArray(json);
      for (int s = 0; s < all.length(); s++) {
        JSONArray line = all.getJSONArray(s); List<Vertex> vertices = new ArrayList<>();
        for (int p = 0; p < line.length(); p++) {
          JSONArray v = line.getJSONArray(p);
          vertices.add(new Vertex(v.getDouble(0), v.getDouble(1), v.isNull(2) ? null : v.getDouble(2), v.isNull(3) ? null : v.getString(3),v.optString(4,""),v.optString(5,"")));
        }
        result.add(vertices);
      }
      return result;
    } catch (JSONException e) { throw new IllegalArgumentException("Не удалось прочитать геометрию", e); }
  }
  public static int count(MapItem i) { int n=0; for (List<Vertex> s : i.segments) n+=s.size(); return n; }
  public static void validate(MapItem item) {
    if (!Arrays.asList("route", "path", "track", "area").contains(item.kind)) throw new IllegalArgumentException("Тип геометрии не поддерживается");
    if (item.segments.isEmpty()) throw new IllegalArgumentException("Добавьте точки");
    for (List<Vertex> s : item.segments)
      if (s.size() < ("area".equals(item.kind) ? 3 : "track".equals(item.kind) ? 1 : 2)) throw new IllegalArgumentException("area".equals(item.kind) ? "Для области нужны минимум 3 точки" : "Нужны минимум 2 точки");
    if (count(item)>100000) throw new IllegalArgumentException("Слишком много точек в объекте");
  }
  public static double distance(Vertex a, Vertex b) {
    double p=Math.toRadians(b.latitude-a.latitude), l=Math.toRadians(b.longitude-a.longitude);
    double h=Math.sin(p/2)*Math.sin(p/2)+Math.cos(Math.toRadians(a.latitude))*Math.cos(Math.toRadians(b.latitude))*Math.sin(l/2)*Math.sin(l/2);
    return 2*R*Math.asin(Math.sqrt(Math.max(0,Math.min(1,h))));
  }
  public static double bearing(Vertex a,Vertex b) {
    double p=Math.toRadians(a.latitude),q=Math.toRadians(b.latitude),d=Math.toRadians(b.longitude-a.longitude);
    return (Math.toDegrees(Math.atan2(Math.sin(d)*Math.cos(q),Math.cos(p)*Math.sin(q)-Math.sin(p)*Math.cos(q)*Math.cos(d)))+360)%360;
  }
  public static Vertex project(Vertex from,double bearing,double meters) {
    if(Double.isNaN(meters)||Double.isInfinite(meters)||meters<0||Double.isNaN(bearing)||Double.isInfinite(bearing))throw new IllegalArgumentException("Неверное расстояние или азимут");
    double d=meters/R,b=Math.toRadians(bearing),p=Math.toRadians(from.latitude),l=Math.toRadians(from.longitude);
    double q=Math.asin(Math.max(-1,Math.min(1,Math.sin(p)*Math.cos(d)+Math.cos(p)*Math.sin(d)*Math.cos(b))));
    double lon=l+Math.atan2(Math.sin(b)*Math.sin(d)*Math.cos(p),Math.cos(d)-Math.sin(p)*Math.sin(q));
    return new Vertex(Math.toDegrees(q),(Math.toDegrees(lon)+540)%360-180);
  }
  public static double length(MapItem i) {
    double total=0; for(List<Vertex> s:i.segments) {
      for(int n=1;n<s.size();n++) total+=distance(s.get(n-1),s.get(n));
      if("area".equals(i.kind)&&s.size()>2) total+=distance(s.get(s.size()-1),s.get(0));
    } return total;
  }
  /** Spherical ring area; additional rings are holes. Handles the antimeridian. */
  public static double area(MapItem i) {
    if(!"area".equals(i.kind)) return 0;
    double total=0; for(int ring=0;ring<i.segments.size();ring++) {
      List<Vertex> s=i.segments.get(ring); double sum=0;
      for(int n=0;n<s.size();n++) {
        Vertex a=s.get(n),b=s.get((n+1)%s.size());
        double dl=Math.toRadians(b.longitude-a.longitude); dl=Math.atan2(Math.sin(dl),Math.cos(dl));
        sum+=dl*(2+Math.sin(Math.toRadians(a.latitude))+Math.sin(Math.toRadians(b.latitude)));
      }
      double surface=Math.abs(sum*R*R/2), earth=4*Math.PI*R*R;
      surface=Math.min(surface,earth-surface);
      total+=ring==0?surface:-surface;
    } return Math.max(0,total);
  }
  public static String summary(MapItem i) {
    if(!i.isGeometry()) return "";
    return String.format(Locale.ROOT, "%s · точек: %d\n%s: %.3f км%s", i.typeName(), count(i), "area".equals(i.kind)?"Периметр":"Длина",length(i)/1000,
        "area".equals(i.kind)?String.format(Locale.ROOT,"\nПлощадь: %.3f км²",area(i)/1e6):"");
  }
}
