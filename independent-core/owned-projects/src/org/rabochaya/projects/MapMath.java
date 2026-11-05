package org.rabochaya.projects;
/** Web Mercator normalized world coordinates. No Android or location APIs. */
public final class MapMath {
 public static double wrap(double x){return x-Math.floor(x);}
 public static double clamp(double v,double lo,double hi){return Math.max(lo,Math.min(hi,v));}
 public static double x(double lon){return (lon+180.0)/360.0;}
 public static double y(double lat){double a=Math.toRadians(clamp(lat,-85.05112878,85.05112878));return (1-Math.log(Math.tan(Math.PI/4+a/2))/Math.PI)/2;}
 public static double lon(double x){return wrap(x)*360-180;}
 public static double lat(double y){return Math.toDegrees(Math.atan(Math.sinh(Math.PI*(1-2*clamp(y,0,1)))));}
 public static double delta(double x,double center){double d=x-center;return d-Math.floor(d+.5);}
 public static long tmsRow(int zoom,long xyzRow){if(zoom<0||zoom>23||xyzRow<0||xyzRow>=(1L<<zoom))throw new IllegalArgumentException("Invalid tile");return (1L<<zoom)-1-xyzRow;}
 public static double[] fit(double[][] coordinates,int width,int height){
  if(coordinates.length==0)return new double[]{.5,.5,2};
  double anchor=x(coordinates[0][0]),left=Double.POSITIVE_INFINITY,right=-left,top=left,bottom=-left;
  for(double[] c:coordinates){double px=anchor+delta(x(c[0]),anchor),py=y(c[1]);left=Math.min(left,px);right=Math.max(right,px);top=Math.min(top,py);bottom=Math.max(bottom,py);}
  double scale=Math.min(Math.max(1,width-96)/Math.max(right-left,1e-8),Math.max(1,height-96)/Math.max(bottom-top,1e-8));
  double zoom=clamp(Math.log(scale/256)/Math.log(2),0,18);
  return new double[]{wrap((left+right)/2),clamp((top+bottom)/2,0,1),zoom};
 }
}
