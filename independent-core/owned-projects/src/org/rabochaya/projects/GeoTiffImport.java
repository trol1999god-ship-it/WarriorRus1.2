package org.rabochaya.projects;
import java.io.*;
/** Explicit GeoTIFF import using the shared local raster converter. */
public final class GeoTiffImport {
 private GeoTiffImport(){}
 public static int write(File source,File destination,CacheExport.Progress progress)throws IOException{
  if(source.getCanonicalFile().equals(destination.getCanonicalFile()))throw new IOException("Исходный GeoTIFF нельзя перезаписывать");
  try(GeoTiffRaster raster=new GeoTiffRaster(source)){return RasterMapImport.write(new RasterMapImport.Source(){public GeoRasterTransform transform(){return raster.transform;}public int color(double lon,double lat)throws IOException{return raster.color(lon,lat);}},destination,progress,"Локальный GeoTIFF",raster.matrixModel);}
 }
}
