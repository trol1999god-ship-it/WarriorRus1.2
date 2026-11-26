package org.rabochaya.projects;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.Locale;

/** Presentation only. Project coordinates, heights and distances remain in SI. */
final class DisplayUnits {
    static final String[] DISTANCE={"Метрический","Метрический, высота в футах","Английский",
        "Английский, высота в метрах","Английский, десятичные мили","Морской"};
    static final String[] AREA={"Квадратные метры и километры","Гектары","Квадратные футы и мили","Акры"};
    static final String[] SLOPE={"Проценты","Градусы","Коэффициент планирования"};
    static final String[] BEARING={"Градусы","Грады","Тысячные","Румбы"};
    private static final double FOOT=.3048, MILE=1609.344, NAUTICAL_MILE=1852;

    static SharedPreferences prefs(Context context){return context.getSharedPreferences("display-units",0);}
    static int distanceMode(Context context){return Math.max(0,Math.min(DISTANCE.length-1,prefs(context).getInt("distance",0)));}
    static int bearingMode(Context context){return Math.max(0,Math.min(BEARING.length-1,prefs(context).getInt("bearing",0)));}

    static int northMode(Context context){return Math.max(0,Math.min(NorthReference.NAMES.length-1,prefs(context).getInt("north",0)));}
    static int areaMode(Context context){return Math.max(0,Math.min(AREA.length-1,prefs(context).getInt("area",0)));}
    static int slopeMode(Context context){return Math.max(0,Math.min(SLOPE.length-1,prefs(context).getInt("slope",0)));}

    static String area(double metres,int mode){
        if(mode==1)return number(metres/10000)+" га";
        if(mode==3)return number(metres/4046.8564224)+" акр";
        if(mode==2)return metres>=MILE*MILE?number(metres/(MILE*MILE))+" ми²":number(metres/(FOOT*FOOT))+" фт²";
        return metres>=1_000_000?number(metres/1_000_000)+" км²":number(metres)+" м²";
    }
    static String slope(double run,double rise,int mode){
        if(!(run>0))return "—";
        if(mode==1)return String.format(Locale.US,"%.1f°",Math.toDegrees(Math.atan2(rise,run)));
        if(mode==2)return rise==0?"—":String.format(Locale.US,"%.1f:1",run/Math.abs(rise));
        return String.format(Locale.US,"%.1f %%",100*rise/run);
    }
    static double scaleUnit(double metres,int mode){
        if(mode==4)return MILE;
        if(mode==2||mode==3)return metres>=MILE?MILE:FOOT;
        if(mode==5&&metres>=NAUTICAL_MILE)return NAUTICAL_MILE;
        return 1;
    }
    static String scaleLabel(double metres,double unit){
        if(unit==MILE)return number(metres/unit)+" ми";
        if(unit==FOOT)return number(metres/unit)+" фт";
        if(unit==NAUTICAL_MILE)return number(metres/unit)+" мор. ми";
        if(metres>=1000)return String.format(Locale.US,"%,.0f км",metres/1000).replace(',', ' ');
        if(metres>=1)return String.format(Locale.US,"%.0f м",metres);
        return String.format(Locale.US,"%.0f см",metres*100);
    }
    static String distance(double metres,int mode){
        double unit=scaleUnit(metres,mode);
        if(unit!=1)return scaleLabel(metres,unit);
        if(metres>=1000)return String.format(Locale.US,"%.3f км",metres/1000);
        return String.format(Locale.US,"%.1f м",metres);
    }
    static String elevation(double metres,int mode){
        boolean feet=mode==1||mode==2||mode==4;
        return String.format(Locale.US,"%.1f %s",feet?metres/FOOT:metres,feet?"фт":"м");
    }
    static String bearing(double degrees,int mode){
        double angle=degrees-360*Math.floor(degrees/360);
        switch(mode){
        case 1:return String.format(Locale.US,"%.0f gon",angle*10/9);
        case 2:return String.format(Locale.US,"%.0f тыс.",angle*6400/360);
        case 3:
            String prefix=(angle<=90||angle>=270)?"С":"Ю";
            double offset=angle<=90?angle:angle<=180?180-angle:angle<=270?angle-180:360-angle;
            return String.format(Locale.US,"%s %.0f° %s",prefix,offset,angle<=180?"В":"З");
        default:return String.format(Locale.US,"%03d°",Math.round(angle)%360);
        }
    }
    private static String number(double value){
        if(value==0)return "0";
        if(value>=1)return String.format(Locale.US,"%.2f",value).replaceAll("0+$","").replaceAll("[.]$","");
        int digits=Math.min(6,(int)Math.ceil(-Math.log10(value)));
        return String.format(Locale.US,"%."+digits+"f",value);
    }
}
