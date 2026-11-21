package org.rabochaya.projects;
import java.util.*;
/** Shared validation for local vector coordinate editors; no Android dependencies. */
public final class GeometryCoordinates {
 private GeometryCoordinates(){}
 public static List<double[]> parse(String input,String type){
  if(input==null||input.length()>500000)throw new IllegalArgumentException("Слишком длинный список координат");
  ArrayList<double[]> points=new ArrayList<>();
  for(String line:input.trim().split("[\\r\\n]+")){
   String[] fields=line.trim().split("\\s+");if(fields.length<2||fields.length>3)throw new IllegalArgumentException("Каждая строка: широта долгота [высота]. Десятичный разделитель — точка");
   double lat,lon,alt=0;
   try{lat=Double.parseDouble(fields[0]);lon=Double.parseDouble(fields[1]);if(fields.length==3)alt=Double.parseDouble(fields[2]);}catch(NumberFormatException e){throw new IllegalArgumentException("Неверное число в координатах");}
   if(!finite(lat)||!finite(lon)||!finite(alt)||lat< -90||lat>90||lon< -180||lon>180)throw new IllegalArgumentException("Широта от −90 до 90, долгота от −180 до 180; числа должны быть конечными");
   points.add(new double[]{lon,lat,alt});if(points.size()>10000)throw new IllegalArgumentException("Предел — 10 000 вершин");
  }
  if("Point".equals(type)&&points.size()!=1)throw new IllegalArgumentException("Для метки нужна одна строка координат");
  if("LineString".equals(type)&&points.size()<2)throw new IllegalArgumentException("Для маршрута нужны минимум две вершины");
  if("Polygon".equals(type)){
   if(points.size()<3)throw new IllegalArgumentException("Для области нужны минимум три вершины");
   HashSet<String> distinct=new HashSet<>();for(double[] p:points){double lat=p[1]==0?0:p[1],lon=p[0]==0?0:p[0];if(lon==180)lon=-180;if(Math.abs(lat)==90)lon=0;distinct.add(lon+","+lat);}
   if(distinct.size()<3)throw new IllegalArgumentException("Для области нужны три разные вершины");
   double[] first=points.get(0),last=points.get(points.size()-1);if(first[0]!=last[0]||first[1]!=last[1]||first[2]!=last[2])points.add(first.clone());
  }
  if(!Arrays.asList("Point","LineString","Polygon").contains(type))throw new IllegalArgumentException("Неизвестный тип объекта");
  return points;
 }
 private static boolean finite(double v){return !Double.isNaN(v)&&!Double.isInfinite(v);}
 public static String kml(List<double[]> points){StringBuilder out=new StringBuilder();for(double[] p:points){if(out.length()>0)out.append(' ');out.append(p[0]).append(',').append(p[1]).append(',').append(p[2]);}return out.toString();}
}
