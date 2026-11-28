package org.rabochaya.projects;
/** Documented two-dimensional GeoTIFF raster/model relation. No device position or CRS guessing. */
public final class GeoRasterTransform {
 public static final double RADIUS=6378137,HALF_WORLD=Math.PI*RADIUS;
 public final int width,height,crs;public final boolean point;public final double west,south,east,north;
 private final double a,b,c,d,e,f,det;
 public GeoRasterTransform(int width,int height,int crs,boolean point,double a,double b,double c,double d,double e,double f){
  if(width<1||height<1||width>20000||height>20000||(crs!=4326&&crs!=3857))throw new IllegalArgumentException("Неподдерживаемый размер или CRS растра");
  double determinant=a*e-b*d;if(!finite(a)||!finite(b)||!finite(c)||!finite(d)||!finite(e)||!finite(f)||!finite(determinant)||determinant==0)throw new IllegalArgumentException("Вырожденная/нечисловая геопривязка");
  this.width=width;this.height=height;this.crs=crs;this.point=point;this.a=a;this.b=b;this.c=c;this.d=d;this.e=e;this.f=f;det=determinant;
  double left=point?-.5:0,top=left,right=point?width-.5:width,bottom=point?height-.5:height;double w=Double.POSITIVE_INFINITY,s=w,ee=Double.NEGATIVE_INFINITY,n=ee;
  for(double i:new double[]{left,right})for(double j:new double[]{top,bottom}){double x=a*i+b*j+c,y=d*i+e*j+f;if(!finite(x)||!finite(y)||crs==3857&&(Math.abs(x)>HALF_WORLD+1e-7||Math.abs(y)>HALF_WORLD+1e-7))throw new IllegalArgumentException("Растр выходит за поддерживаемую область CRS");double lon=crs==4326?x:x/RADIUS*180/Math.PI,lat=crs==4326?y:Math.toDegrees(Math.atan(Math.sinh(y/RADIUS)));if(lon< -180-1e-9||lon>180+1e-9||lat< -90||lat>90)throw new IllegalArgumentException("Некорректный географический extent");w=Math.min(w,lon);ee=Math.max(ee,lon);s=Math.min(s,lat);n=Math.max(n,lat);}
  west=Math.max(-180,w);east=Math.min(180,ee);south=s;north=n;
 }
 /** Compressed strip streaming is suitable only when output rows advance source rows. */
 public boolean forwardRows(){return d==0&&e<0;}
 /** Conservative raster-pixel displacement per unit of square Mercator world coordinates.
  * Inverse-Jacobian row sums cover rotation/shear, unlike bounding-box dimensions.
  * Geographic dLat/dWorldY is bounded using the latitude closest to the equator. */
 public double pixelsPerWorldUnit(){double xUnits=crs==4326?360:2*HALF_WORLD;double latitude=south<=0&&north>=0?0:Math.min(Math.abs(south),Math.abs(north));double yUnits=crs==4326?360*Math.cos(Math.toRadians(latitude)):xUnits;return Math.max(Math.abs(e)*xUnits+Math.abs(b)*yUnits,Math.abs(d)*xUnits+Math.abs(a)*yUnits)/Math.abs(det);}
 public static GeoRasterTransform scale(int width,int height,int crs,boolean point,double sx,double sy,double i,double j,double x,double y){return new GeoRasterTransform(width,height,crs,point,sx,0,x-sx*i,0,-sy,y+sy*j);}
 private static boolean finite(double v){return !Double.isNaN(v)&&!Double.isInfinite(v);}
 /** Packed row/column, or -1 outside raster. Callers avoid one allocation per output pixel. */
 public long cellModel(double x,double y){if(!finite(x)||!finite(y))return -1;double xx=x-c,yy=y-f,i=(e*xx-b*yy)/det,j=(-d*xx+a*yy)/det;if(point){i+=.5;j+=.5;}if(!finite(i)||!finite(j)||i<0||j<0||i>=width||j>=height)return -1;return ((long)(int)Math.floor(j)<<32)|((long)(int)Math.floor(i)&0xffffffffL);}
 public long cell(double lon,double lat){if(!finite(lon)||!finite(lat)||lon< -180||lon>180||lat< -90||lat>90)return -1;if(crs==4326)return cellModel(lon,lat);if(Math.abs(lat)>85.05112878)return -1;return cellModel(Math.toRadians(lon)*RADIUS,RADIUS*Math.log(Math.tan(Math.PI/4+Math.toRadians(lat)/2)));}
 public double[] model(double i,double j){return new double[]{a*i+b*j+c,d*i+e*j+f};}
 /** Raster bounds describe a continuous interval, including extents wider than180 degrees. */
 public static double[] viewport(double west,double south,double east,double north,int width,int height){double l=MapMath.x(west),r=MapMath.x(east),t=MapMath.y(north),b=MapMath.y(south);if(!(r>l&&b>t))throw new IllegalArgumentException("Пустые границы растра");double scale=Math.min(Math.max(1,width-96)/Math.max(r-l,1e-8),Math.max(1,height-96)/Math.max(b-t,1e-8));return new double[]{(l+r)/2,(t+b)/2,MapMath.clamp(Math.log(scale/256)/Math.log(2),0,18)};}
}
