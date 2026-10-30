package org.rabochaya.projects;
import java.util.List;
/** Screen-space selection using the same Mercator unwrapping as map drawing. */
public final class MapHitTest {
 private MapHitTest() {}
 public static double distance(String type,List<List<double[]>> rings,double cx,double cy,double world,int width,int height,double tapX,double tapY){
  double best=Double.POSITIVE_INFINITY;boolean inside=false;
  for(List<double[]> ring:rings){
   if(ring.isEmpty())continue;
   double previous=0,firstX=0,firstY=0,lastX=0,lastY=0;boolean first=true;
   for(double[] c:ring){
    double wx=MapMath.x(c[0]);
    double dx=first?MapMath.delta(wx,cx):previous+MapMath.delta(wx,MapMath.wrap(cx+previous));previous=dx;
    double x=width/2.0+dx*world,y=height/2.0+(MapMath.y(c[1])-cy)*world;
    if("Point".equals(type))best=Math.min(best,Math.hypot(tapX-x,tapY-y));
    else if(!first){best=Math.min(best,segment(tapX,tapY,lastX,lastY,x,y));if("Polygon".equals(type)&&crosses(tapX,tapY,lastX,lastY,x,y))inside=!inside;}
    if(first){firstX=x;firstY=y;first=false;}lastX=x;lastY=y;
   }
   if("Polygon".equals(type)){
    best=Math.min(best,segment(tapX,tapY,lastX,lastY,firstX,firstY));
    if(crosses(tapX,tapY,lastX,lastY,firstX,firstY))inside=!inside;
   }
  }
  return inside?0:best;
 }
 private static boolean crosses(double px,double py,double ax,double ay,double bx,double by){return (ay>py)!=(by>py)&&px<(bx-ax)*(py-ay)/(by-ay)+ax;}
 private static double segment(double px,double py,double ax,double ay,double bx,double by){
  double dx=bx-ax,dy=by-ay,length=dx*dx+dy*dy;
  double t=length==0?0:MapMath.clamp(((px-ax)*dx+(py-ay)*dy)/length,0,1);
  return Math.hypot(px-ax-t*dx,py-ay-t*dy);
 }
}
