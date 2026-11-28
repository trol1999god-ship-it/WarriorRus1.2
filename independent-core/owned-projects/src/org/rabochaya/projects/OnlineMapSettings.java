package org.rabochaya.projects;
import android.content.*;
public final class OnlineMapSettings {
 public static SharedPreferences prefs(Context c){return c.getSharedPreferences("online-map",0);}
 public static TileSource source(Context c){SharedPreferences p=prefs(c);String key=p.getString("catalog","");if(!key.isEmpty()){TileSource selected=MapCatalog.find(key);if(selected!=null)return selected;}try{return new TileSource(p.getString("name","OpenStreetMap"),p.getString("template",TileSource.osm().template),p.getString("attribution",TileSource.osm().attribution),p.getInt("min",0),p.getInt("max",19),p.getBoolean("downloads",false));}catch(IllegalArgumentException e){return TileSource.osm();}}
 public static void save(Context c,TileSource s,long project){MapCompositionSettings.suspend(c,project);selection(c).remove("catalog").putString("name",s.name).putString("template",s.template).putString("attribution",s.attribution).putInt("min",s.minZoom).putInt("max",s.maxZoom).putBoolean("downloads",s.downloads).putBoolean("project_"+project,true).commit();}
 public static void select(Context c,String key,long project){if(MapCatalog.find(key)==null)throw new IllegalArgumentException("Неизвестная карта");MapCompositionSettings.suspend(c,project);selection(c).putString("catalog",key).putBoolean("project_"+project,true).commit();}
 private static SharedPreferences.Editor selection(Context context){
  SharedPreferences preferences=prefs(context);
  SharedPreferences.Editor edit=preferences.edit();
  if(!preferences.contains("network"))edit.putBoolean("network",true);
  return edit;
 }
 public static void setNetwork(Context context,boolean enabled){
  prefs(context).edit().putBoolean("network",enabled).commit();
 }
 public static boolean active(Context c,long project){return prefs(c).getBoolean("project_"+project,false);}
 public static boolean network(Context c){return prefs(c).getBoolean("network",false);}
 public static void use(Context c,long project,boolean active){MapCompositionSettings.suspend(c,project);prefs(c).edit().putBoolean("project_"+project,active).commit();}
}
