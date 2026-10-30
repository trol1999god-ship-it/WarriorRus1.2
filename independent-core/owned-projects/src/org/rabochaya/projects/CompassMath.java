package org.rabochaya.projects;
/** Magnetic heading of the screen's top edge. Accelerometer + magnetometer only. */
public final class CompassMath {
 private CompassMath(){}
 public static double heading(float[] acceleration,float[] magnetic,int rotation){
  if(acceleration==null||magnetic==null||acceleration.length<3||magnetic.length<3)return Double.NaN;
  double ax=acceleration[0],ay=acceleration[1],az=acceleration[2],mx=magnetic[0],my=magnetic[1],mz=magnetic[2];
  double gravity=Math.sqrt(ax*ax+ay*ay+az*az);if(!finite(gravity)||gravity<.1||!finite(mx)||!finite(my)||!finite(mz))return Double.NaN;
  ax/=gravity;ay/=gravity;az/=gravity;
  double ex=my*az-mz*ay,ey=mz*ax-mx*az,ez=mx*ay-my*ax,length=Math.sqrt(ex*ex+ey*ey+ez*ez);
  if(!finite(length)||length<.01)return Double.NaN;ex/=length;ey/=length;ez/=length;
  double nx=ay*ez-az*ey,ny=az*ex-ax*ez;double vx,vy;
  switch(rotation){case 1:vx=-1;vy=0;break;case 2:vx=0;vy=-1;break;case 3:vx=1;vy=0;break;default:vx=0;vy=1;}
  double east=ex*vx+ey*vy,north=nx*vx+ny*vy;if(Math.hypot(east,north)<.05)return Double.NaN;
  return wrap(Math.toDegrees(Math.atan2(east,north)));
 }
 public static double wrap(double value){return (value%360+360)%360;}
 public static double smooth(double previous,double next){if(!finite(previous))return next;return wrap(previous+.2*(wrap(next-previous+180)-180));}
 private static boolean finite(double value){return !Double.isNaN(value)&&!Double.isInfinite(value);}
}
