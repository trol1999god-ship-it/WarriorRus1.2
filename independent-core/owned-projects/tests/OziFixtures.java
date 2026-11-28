package org.rabochaya.maptests;
import java.util.Locale;
/** Synthetic independent calibration; image coordinates follow direct GDAL Ozi GCP convention. */
public final class OziFixtures {
 private OziFixtures(){}
 static String angle(double value,boolean latitude){double absolute=Math.abs(value);int degrees=(int)Math.floor(absolute);return degrees+","+String.format(Locale.US,"%.10f",(absolute-degrees)*60)+","+(latitude?(value<0?"S":"N"):(value<0?"W":"E"));}
 public static String point(int id,double x,double y,double lon,double lat){return "Point"+String.format(Locale.US,"%02d",id)+",xy,"+x+","+y+",in,deg,"+angle(lat,true)+","+angle(lon,false)+",grid,,,,N\n";}
 public static String map(String name,int width,int height,double[] m){StringBuilder s=new StringBuilder("OziExplorer Map Data File Version 2.2\nSynthetic calibration\n"+name+"\n1 ,Map Code,\nWGS 84,WGS 84,0.0000,0.0000,WGS 84\nReserved 1\nReserved 2\nMap Projection,Latitude/Longitude,PolyCal,No,AutoCalOnly,No,BSBUseWPX,No\nProjection Setup,,,,,,,,,,\nMSF,1\nIWH,Map Image Width/Height,"+width+","+height+"\n");int id=0;for(double[] p:new double[][]{{0,0},{width,0},{width,height},{0,height}})s.append(point(++id,p[0],p[1],m[0]*p[0]+m[1]*p[1]+m[2],m[3]*p[0]+m[4]*p[1]+m[5]));return s.toString();}
}
