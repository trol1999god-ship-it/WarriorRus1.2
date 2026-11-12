package org.rabochaya.projects;
import java.io.*;
/** Explicit derived MBTiles via the existing bounded raster conversion, never modifies the DEM. */
public final class HgtHillshadeImport {
 private HgtHillshadeImport(){}
 public static int write(File source,long project,File destination,CacheExport.Progress progress)throws IOException{
  if(source.getCanonicalFile().equals(destination.getCanonicalFile()))throw new IOException("Нельзя заменять исходный DEM отмывкой");
  try(HgtHillshade shade=new HgtHillshade(source,project)){
   return RasterMapImport.write(new RasterMapImport.Source(){public GeoRasterTransform transform(){return shade.transform();}public int color(double lon,double lat)throws IOException{return shade.color(lon,lat);}},destination,progress,"Рельеф HGT · свет 315°/45°",true);
  }
 }
}
