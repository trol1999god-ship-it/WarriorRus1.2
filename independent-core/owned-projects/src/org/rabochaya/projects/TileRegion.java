package org.rabochaya.projects;
import java.util.*;
/** Bounded XYZ selection, including antimeridian crossing. Coordinates are WGS84. */
public final class TileRegion implements Iterable<int[]> {
 public static final long MAX_TILES=20000;public final long count;private final ArrayList<int[]> ranges=new ArrayList<>();
 public TileRegion(double west,double south,double east,double north,int min,int max){this(west,south,east,north,min,max,false);}
 public TileRegion(double west,double south,double east,double north,int min,int max,boolean ellipsoid){
  if(!finite(west)||!finite(east)||!finite(south)||!finite(north)||west< -180||west>180||east< -180||east>180||south< -85.05112878||north>85.05112878||south>=north||west==east||min<0||max>23||min>max)throw new IllegalArgumentException("Проверьте границы и масштабы области (широты ±85.05112878)");
  long total=0;for(int z=min;z<=max;z++){int n=1<<z,top=clip((int)Math.floor(TileProjection.y(north,ellipsoid)*n),n),bottom=clip((int)Math.ceil(TileProjection.y(south,ellipsoid)*n)-1,n);bottom=Math.max(top,bottom);
   int left=clip((int)Math.floor(MapMath.x(west)*n),n),right=clip((int)Math.ceil(MapMath.x(east)*n)-1,n);
   if(west<east){ranges.add(new int[]{z,left,Math.max(left,right),top,bottom});total+=(long)(Math.max(left,right)-left+1)*(bottom-top+1);}
   else {ranges.add(new int[]{z,left,n-1,top,bottom});total+=(long)(n-left)*(bottom-top+1);if(left>0){int end=Math.min(right,left-1);ranges.add(new int[]{z,0,end,top,bottom});total+=(long)(end+1)*(bottom-top+1);}}
   if(total>MAX_TILES)throw new IllegalArgumentException("В области больше 20 000 тайлов; уменьшите её или масштаб");
  }count=total;
 }
 private static int clip(int x,int n){return Math.max(0,Math.min(n-1,x));}private static boolean finite(double x){return !Double.isNaN(x)&&!Double.isInfinite(x);}
 public Iterator<int[]> iterator(){return new Iterator<int[]>(){int r=0,x=ranges.get(0)[1],y=ranges.get(0)[3];public boolean hasNext(){return r<ranges.size();}public int[] next(){if(!hasNext())throw new NoSuchElementException();int[] a=ranges.get(r),out={a[0],x,y};if(++x>a[2]){x=a[1];if(++y>a[4]){r++;if(hasNext()){x=ranges.get(r)[1];y=ranges.get(r)[3];}}}return out;}public void remove(){throw new UnsupportedOperationException();}};}
}
