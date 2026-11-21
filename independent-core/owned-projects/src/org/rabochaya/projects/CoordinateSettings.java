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
 public static String panel(Context context,double lat,double lon,double zoom){int first=primary(context),second=secondary(context);String result=(first==Coordinates.DD?"Центр WGS 84":"Центр "+Coordinates.name(first))+": "+display(lat,lon,first)+String.format(java.util.Locale.US," · z %.1f",zoom);if(prefs(context).getBoolean("show_secondary",true))result+="\n"+Coordinates.name(second)+": "+display(lat,lon,second);return result;}
}
