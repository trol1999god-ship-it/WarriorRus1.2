package org.rabochaya.projects;
import java.io.*;
/** Explicit local pair import into the same MBTiles storage/renderer as GeoTIFF. */
public final class OziImport {
 private OziImport(){}
 public static int write(File calibration,File image,String selectedImage,File destination,CacheExport.Progress progress)throws IOException{
  File target=destination.getCanonicalFile();if(target.equals(calibration.getCanonicalFile())||target.equals(image.getCanonicalFile()))throw new IOException("Ozi: исходные файлы нельзя перезаписывать");
  try(OziRaster raster=new OziRaster(calibration,image,selectedImage)){return RasterMapImport.write(raster,destination,progress,"Локальная Ozi карта",true);}
 }
}
