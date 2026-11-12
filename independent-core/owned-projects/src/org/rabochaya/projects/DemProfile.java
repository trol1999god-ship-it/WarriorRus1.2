package org.rabochaya.projects;

import java.io.IOException;
import java.util.List;

/** Bounded read-only samples along one geographic polyline. Never edits input altitudes. */
public final class DemProfile {
 public final double[] distance,height;
 public final double length,min,max,gain,loss;
 public final int valid;
 private DemProfile(double[] distance,double[] height,double length){
  this.distance=distance;this.height=height;this.length=length;
  double lo=Double.POSITIVE_INFINITY,hi=Double.NEGATIVE_INFINITY,up=0,down=0;int count=0;
  for(int i=0;i<height.length;i++)if(!Double.isNaN(height[i])){count++;lo=Math.min(lo,height[i]);hi=Math.max(hi,height[i]);if(i>0&&!Double.isNaN(height[i-1])){double delta=height[i]-height[i-1];if(delta>0)up+=delta;else down-=delta;}}
  valid=count;min=count==0?Double.NaN:lo;max=count==0?Double.NaN:hi;gain=up;loss=down;
 }
 public static double metres(double lon1,double lat1,double lon2,double lat2){
  double a=Math.toRadians(lat1),b=Math.toRadians(lat2),dl=Math.toRadians(longitudeDelta(lon2-lon1)),dp=b-a;
  double h=Math.sin(dp/2)*Math.sin(dp/2)+Math.cos(a)*Math.cos(b)*Math.sin(dl/2)*Math.sin(dl/2);
  return 6371008.8*2*Math.asin(Math.sqrt(Math.max(0,Math.min(1,h))));
 }
 private static double longitudeDelta(double d){return d-360*Math.floor((d+180)/360);}
 private static boolean finite(double value){return !Double.isNaN(value)&&!Double.isInfinite(value);}
 public static DemProfile sample(HgtRaster dem,List<double[]> points,int count)throws IOException{
  if(dem==null||points==null||points.size()<2||points.size()>10000||count<2||count>2048)throw new IllegalArgumentException("Профиль: 2–10000 вершин и 2–2048 отсчётов");
  double[] cumulative=new double[points.size()];
  for(int i=0;i<points.size();i++){double[] p=points.get(i);if(p==null||p.length<2||!finite(p[0])||!finite(p[1])||Math.abs(p[0])>180||Math.abs(p[1])>90)throw new IllegalArgumentException("Некорректные координаты профиля");if(i>0){double[] previous=points.get(i-1);cumulative[i]=cumulative[i-1]+metres(previous[0],previous[1],p[0],p[1]);}}
  double total=cumulative[cumulative.length-1];if(!(total>0))throw new IllegalArgumentException("Для профиля нужна ненулевая длина");
  double[] distances=new double[count],heights=new double[count];int segment=1;
  for(int i=0;i<count;i++){
   double at=total*i/(count-1);distances[i]=at;
   while(segment<cumulative.length-1&&(cumulative[segment]<at||cumulative[segment]==cumulative[segment-1]))segment++;
   double span=cumulative[segment]-cumulative[segment-1],fraction=span==0?0:Math.max(0,Math.min(1,(at-cumulative[segment-1])/span));
   double[] a=points.get(segment-1),b=points.get(segment);double lon=a[0]+longitudeDelta(b[0]-a[0])*fraction;lon=longitudeDelta(lon);
   heights[i]=dem.height(lon,a[1]+(b[1]-a[1])*fraction);
  }
  return new DemProfile(distances,heights,total);
 }
}
