package org.rabochaya.projects;
/** Ellipsoidal Mercator used by Yandex; viewport and KML remain WGS84/Web Mercator. */
public final class TileProjection {
 private static final double E=.08181919084262149;
 public static double y(double latitude,boolean ellipsoid){if(!ellipsoid)return MapMath.y(latitude);double p=Math.toRadians(MapMath.clamp(latitude,-85.05112878,85.05112878)),s=Math.sin(p);return (1-(Math.log(Math.tan(Math.PI/4+p/2))-E/2*Math.log((1+E*s)/(1-E*s)))/Math.PI)/2;}
 public static double latitude(double y,boolean ellipsoid){if(!ellipsoid)return MapMath.lat(y);double t=Math.exp(Math.PI*(1-2*y)),p=2*Math.atan(t)-Math.PI/2;for(int i=0;i<12;i++){double s=Math.sin(p);p=2*Math.atan(t*Math.pow((1+E*s)/(1-E*s),E/2))-Math.PI/2;}return Math.toDegrees(p);}
 public static String quadkey(int z,int x,int y){StringBuilder q=new StringBuilder();for(int i=z-1;i>=0;i--)q.append(((x>>i)&1)+2*((y>>i)&1));return q.toString();}
 public static String bbox(int z,int x,int y){double h=20037508.342789244,span=2*h/(1<<z);return decimal(-h+x*span)+","+decimal(h-(y+1)*span)+","+decimal(-h+(x+1)*span)+","+decimal(h-y*span);}
 private static String decimal(double x){return String.format(java.util.Locale.US,"%.8f",x);}
}
