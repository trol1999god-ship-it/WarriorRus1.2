package ru.warriorrus.app.settings;

import java.util.*;
import org.locationtech.proj4j.*;
import ru.warriorrus.app.data.Vertex;

/** Bundled EPSG definitions and datum shifts. No network, location or sensor access. */
public final class ProjectionMath {
  private static final CRSFactory FACTORY=new CRSFactory();
  private static final CoordinateTransformFactory TRANSFORMS=new CoordinateTransformFactory();
  private static final Map<String,CoordinateReferenceSystem> CACHE=new LinkedHashMap<String,CoordinateReferenceSystem>(32,.75f,true){
    @Override protected boolean removeEldestEntry(Map.Entry<String,CoordinateReferenceSystem> e){return size()>64;}
  };
  private ProjectionMath(){}
  public static String code(String text){String value=text.trim().toUpperCase(Locale.ROOT);if(value.matches("[0-9]{3,7}"))value="EPSG:"+value;if(!value.matches("EPSG:[0-9]{3,7}"))throw new IllegalArgumentException("Введите код EPSG, например EPSG:28407");return value;}
  private static CoordinateReferenceSystem crs(String name){String key=code(name);CoordinateReferenceSystem result=CACHE.get(key);if(result==null){result=FACTORY.createFromName(key);if(result==null)throw new IllegalArgumentException("Система не найдена в локальном каталоге: "+key);CACHE.put(key,result);}return result;}
  public static synchronized boolean geographic(String name){return crs(name).isGeographic();}
  public static synchronized String name(String code){return crs(code).getName();}
  public static synchronized double[] transform(String from,String to,double x,double y){
    if(Double.isNaN(x)||Double.isInfinite(x)||Double.isNaN(y)||Double.isInfinite(y))throw new IllegalArgumentException("Неверные координаты");
    try{ProjCoordinate result=new ProjCoordinate();TRANSFORMS.createTransform(crs(from),crs(to)).transform(new ProjCoordinate(x,y),result);
      if(Double.isNaN(result.x)||Double.isInfinite(result.x)||Double.isNaN(result.y)||Double.isInfinite(result.y))throw new IllegalArgumentException("Точка вне области проекции");
      return new double[]{result.x,result.y};
    }catch(RuntimeException error){throw new IllegalArgumentException("Преобразование "+from+" → "+to+" недоступно: "+error.getMessage(),error);}
  }
  public static double[] project(String code,double latitude,double longitude){new Vertex(latitude,longitude);return transform("EPSG:4326",code,longitude,latitude);}
  public static Vertex inverse(String code,double east,double north){double[] p=transform(code,"EPSG:4326",east,north);return new Vertex(p[1],((p[0]+180)%360+360)%360-180);}
  public static int sk42Zone(double latitude,double longitude){double lon=longitude<0?longitude+360:longitude;int zone=(int)Math.floor(lon/6)+1;if(latitude<0||latitude>84||zone<2||zone>32)throw new IllegalArgumentException("СК-42: точка вне северных зон 2…32");return zone;}
}
