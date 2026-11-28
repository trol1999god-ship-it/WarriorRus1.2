package org.rabochaya.projects;
import java.util.*;
/** Original catalogue order and presentation metadata, independent of the old UI. */
public final class CatalogIndex {
 private static final String[] ORDER={"Яндекс Карты","ESRI Community Maps","Советские топокарты — независимый источник","OpenStreetMap Maps","Bing Maps","Google Maps","USGS Maps (USA)"};
 private CatalogIndex(){}
 public static List<String> groups(){LinkedHashSet<String> actual=new LinkedHashSet<>();for(MapCatalog.Entry e:MapCatalog.entries())actual.add(e.group);ArrayList<String> out=new ArrayList<>();for(String g:ORDER)if(actual.remove(g))out.add(g);out.addAll(actual);return Collections.unmodifiableList(out);}
 public static List<MapCatalog.Entry> entries(String group){ArrayList<MapCatalog.Entry> out=new ArrayList<>();for(MapCatalog.Entry e:MapCatalog.entries())if(e.group.equals(group))out.add(e);return Collections.unmodifiableList(out);}
 public static MapCatalog.Entry find(String key){for(MapCatalog.Entry e:MapCatalog.entries())if(e.key.equals(key))return e;return null;}
 public static String preview(String key){
  if("BINGHYB".equals(key))return "hybr";
  if("BINGMAP".equals(key))return "road";
  if("BINGPT".equals(key))return "road";
  if("BINGSAT".equals(key))return "sate";
  if("BINGTERRAIN".equals(key))return "topo";
  if("ESRI_IMAGERY_LABELS".equals(key))return "hybr";
  if("ESRI_LIGHT_GRAY".equals(key))return "road";
  if("ESRI_NATGEO".equals(key))return "topo";
  if("ESRI_OCEAN".equals(key))return "topo";
  if("ESRI_PHYSICAL".equals(key))return "topo";
  if("ESRI_PLACES_LAYER".equals(key))return "road";
  if("ESRI_REFERENCE_LAYER".equals(key))return "road";
  if("ESRI_ROADS_LAYER".equals(key))return "road";
  if("ESRI_SHADED_RELIEF".equals(key))return "topo";
  if("ESRI_TERRAIN".equals(key))return "topo";
  if("ESRI_WORLD_IMAGERY".equals(key))return "sate";
  if("ESRI_WORLD_STREETS".equals(key))return "road";
  if("ESRI_WORLD_TOPO".equals(key))return "topo";
  if("GBIKEL".equals(key))return "road";
  if("GEARTH".equals(key))return "sate";
  if("GHYBRID".equals(key))return "hybr";
  if("GMAPS".equals(key))return "road";
  if("GMAPSLOC".equals(key))return "road";
  if("GMBIKE".equals(key))return "road";
  if("GMPT".equals(key))return "road";
  if("GROADS".equals(key))return "road";
  if("GROADSPTL".equals(key))return "road";
  if("GTERR".equals(key))return "topo";
  if("OSMCYC".equals(key))return "topo";
  if("OSMFR".equals(key))return "road";
  if("OSMHBMAP".equals(key))return "road";
  if("OSMHOT".equals(key))return "road";
  if("OSMLAND".equals(key))return "topo";
  if("OSMMPN".equals(key))return "road";
  if("OSMMPQ".equals(key))return "road";
  if("OSMOMSAB".equals(key))return "road";
  if("OSMOMSCTR".equals(key))return "cont";
  if("OSMOMSHYB".equals(key))return "road";
  if("OSMOMSROADS".equals(key))return "road";
  if("OSMOTM".equals(key))return "topo";
  if("OSMOUTD".equals(key))return "topo";
  if("OSMSHD".equals(key))return "hill";
  if("OSMTSP".equals(key))return "road";
  if("OSMWMCC".equals(key))return "road";
  if("OSMWMHC".equals(key))return "road";
  if("SMMAP".equals(key))return "topo";
  if("USGSCTL".equals(key))return "cont";
  if("USGSHYD".equals(key))return "road";
  if("USGSIMG".equals(key))return "sate";
  if("USGSIMGTOPO".equals(key))return "hybr";
  if("USGSRDL".equals(key))return "road";
  if("USGSSCAN".equals(key))return "topo";
  if("USGSTOPO".equals(key))return "topo";
  if("YANDEX_HYBRID".equals(key))return "hybr";
  if("YANDEX_LABELS".equals(key))return "road";
  if("YANDEX_MAP".equals(key))return "road";
  if("YANDEX_SAT".equals(key))return "sate";
  return "road";
 }
}
