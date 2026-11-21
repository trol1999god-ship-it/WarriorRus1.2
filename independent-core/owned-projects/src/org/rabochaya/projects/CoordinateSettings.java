package org.rabochaya.projects;
import android.content.*;
/** Shared coordinate presentation only; project XML always remains WGS84. */
public final class CoordinateSettings {
 private CoordinateSettings(){}
 public static SharedPreferences prefs(Context context){return context.getSharedPreferences("coordinate-display",0);}
 public static int primary(Context context){return valid(prefs(context).getInt("primary",Coordinates.DD),Coordinates.DD);}
 public static int secondary(Context context){return valid(prefs(context).getInt("secondary",Coordinates.UTM),Coordinates.UTM);}
 private static int valid(int value,int fallback){return value>=Coordinates.DD&&value<=Coordinates.MGRS?value:fallback;}
 public static String display(double lat,double lon,int format){try{return Coordinates.format(lat,lon,format);}catch(IllegalArgumentException e){return "вне диапазона выбранной системы";}}
 private static String panelName(int format){
  if(format==Coordinates.UTM)return "UTM";
  if(format==Coordinates.MGRS)return "MGRS";
  return "WGS 84";
 }
 public static String panel(Context context,double lat,double lon,double zoom){
  int first=primary(context),second=secondary(context);
  String result=panelName(first)+": "+display(lat,lon,first)
    +String.format(java.util.Locale.US," · z%.1f",zoom);
  if(prefs(context).getBoolean("show_secondary",true))result+="\n"+panelName(second)+": "+display(lat,lon,second);
  return result;
 }
}
