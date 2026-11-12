package org.rabochaya.projects;
import java.io.*;import java.util.*;
/** Read-only cell-centred Lambert shading of an explicitly owned SRTM grid. No network/GPS. */
public final class HgtHillshade implements Closeable {
 public static final int BLOCK=64,MAX_BLOCKS=64;private final HgtRaster height;private final GeoRasterTransform transform;private final double eastLight,northLight,upLight,step;private boolean closed;
 private final LinkedHashMap<Long,int[]> blocks=new LinkedHashMap<>(16,.75f,true);
 public HgtHillshade(File source,long owner)throws IOException{this(source,owner,315,45);}
 public HgtHillshade(File source,long owner,double azimuth,double altitude)throws IOException{
  lighting(azimuth,altitude);HgtRaster opened=HgtRaster.owned(source,owner);
  try{height=opened;int cells=height.samples-1;step=1.0/cells;transform=new GeoRasterTransform(cells,cells,4326,false,step,0,height.west,0,-step,height.south+1);double az=Math.toRadians(azimuth),el=Math.toRadians(altitude);eastLight=Math.cos(el)*Math.sin(az);northLight=Math.cos(el)*Math.cos(az);upLight=Math.sin(el);}catch(RuntimeException e){opened.close();throw new IOException("Не удалось подготовить отмывку HGT",e);}
 }
 private static boolean finite(double n){return !Double.isNaN(n)&&!Double.isInfinite(n);}
 private static void lighting(double azimuth,double altitude){if(!finite(azimuth)||!finite(altitude)||azimuth<0||azimuth>=360||altitude<=0||altitude>90)throw new IllegalArgumentException("Нужны азимут [0,360) и высота света (0,90] градусов");}
 /** Four corners: northwest, northeast, southwest, southeast; gradients at cell centre. */
 public static int shade(double nw,double ne,double sw,double se,double eastMetres,double northMetres,double azimuth,double altitude){lighting(azimuth,altitude);if(!finite(eastMetres)||!finite(northMetres)||eastMetres<=0||northMetres<=0)throw new IllegalArgumentException("Нужны положительные размеры ячейки в метрах");double az=Math.toRadians(azimuth),el=Math.toRadians(altitude);return shade(nw,ne,sw,se,eastMetres,northMetres,Math.cos(el)*Math.sin(az),Math.cos(el)*Math.cos(az),Math.sin(el));}
 private static int shade(double nw,double ne,double sw,double se,double dx,double dy,double east,double north,double up){
  if(!finite(nw)||!finite(ne)||!finite(sw)||!finite(se))return 0;
  double p=((ne-nw)+(se-sw))/(2*dx),q=((nw-sw)+(ne-se))/(2*dy);double brightness=(-p*east-q*north+up)/Math.sqrt(1+p*p+q*q);int gray=(int)Math.round(255*Math.max(0,Math.min(1,brightness)));return 0xff000000|gray<<16|gray<<8|gray;
 }
 public GeoRasterTransform transform(){return transform;}
 public synchronized int color(double lon,double lat)throws IOException{if(closed)throw new IOException("Отмывка HGT закрыта");long cell=transform.cell(lon,lat);if(cell<0)return 0;int x=(int)cell,y=(int)(cell>>>32),bx=x/BLOCK,by=y/BLOCK;long key=(long)by<<32|(bx&0xffffffffL);int[] block=blocks.get(key);if(block==null){block=readBlock(bx,by);while(blocks.size()>=MAX_BLOCKS){Iterator<Long> it=blocks.keySet().iterator();it.next();it.remove();}blocks.put(key,block);}return block[(y%BLOCK)*BLOCK+x%BLOCK];}
 private int[] readBlock(int bx,int by)throws IOException{int[] values=new int[BLOCK*BLOCK];int right=Math.min(transform.width,(bx+1)*BLOCK),bottom=Math.min(transform.height,(by+1)*BLOCK);double eccentricity=(1/298.257223563)*(2-1/298.257223563),radians=Math.toRadians(step);
  for(int y=by*BLOCK;y<bottom;y++){if(Thread.currentThread().isInterrupted())throw new IOException("Отмывка HGT прервана");double north=height.south+1-y*step,south=height.south+1-(y+1)*step,latitude=Math.toRadians((north+south)/2),sin=Math.sin(latitude),den=1-eccentricity*sin*sin;double dx=radians*GeoRasterTransform.RADIUS/Math.sqrt(den)*Math.cos(latitude),dy=radians*GeoRasterTransform.RADIUS*(1-eccentricity)/Math.pow(den,1.5);
   for(int x=bx*BLOCK;x<right;x++){double west=height.west+x*step,east=height.west+(x+1)*step;values[(y%BLOCK)*BLOCK+x%BLOCK]=shade(height.height(west,north),height.height(east,north),height.height(west,south),height.height(east,south),dx,dy,eastLight,northLight,upLight);}
  }return values;
 }
 public synchronized void close()throws IOException{if(closed)return;closed=true;blocks.clear();height.close();}
}
