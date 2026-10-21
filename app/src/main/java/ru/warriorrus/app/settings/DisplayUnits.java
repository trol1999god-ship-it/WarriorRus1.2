package ru.warriorrus.app.settings;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.Locale;

/** Formatting preferences never change stored coordinates, heights or times. */
public final class DisplayUnits {
  public static final String[] DISTANCE={"Метрический (м, км)","Метрический (м, км; высота в футах)","Английский (ft, mi)","Английский (ft, nmi)","Английский (ft, yd, mi)","Английский (ft, yd, ch, mi)","Английский (ft, yd, mi; высота в метрах)","Английский (ft, mi; высота в метрах)","Морской (м, nmi)","Морской (ft, nmi)"};
  public static final String[] AREA={"Метрический (м², км²)","Метрический (м², а, км²)","Метрический (м², а, га, км²)","Английский (ft², ac, mi²)","Английский (ft², yd², ac, mi²)","Морской (м², nmi²)","Морской (ft², nmi²)"};
  public static final String[] ANGLE={"Градусы (360°)","Градусы (±180°)","Градусы, минуты, секунды","Грады (400 gon)","Грады (±200 gon)","Тысячные (Exact, 6283.185)","Тысячные (NATO, 6400)","Тысячные (Warsaw Pact, 6000)","Тысячные (Swedish, 6300)"};
  public static final String[] SLOPE={"Проценты (%)","Градусы (°)","Тысячные (Exact)","Тысячные (NATO, 6400)","Тысячные (Warsaw Pact, 6000)","Коэффициент планирования (L/D)"};
  public static final String[] PRESSURE={"Гектопаскали / миллибары (hPa)","Миллиметры ртутного столба (mmHg)","Дюймы ртутного столба (inHg)","Фунты на квадратный дюйм (psi)"};
  public int distanceMode,areaMode,angleMode,slopeMode=1,pressureMode;
  public static DisplayUnits load(Context context){return from(context.getSharedPreferences("MainActivity",Context.MODE_PRIVATE));}
  public static DisplayUnits from(SharedPreferences prefs){DisplayUnits u=new DisplayUnits();u.distanceMode=bound(prefs.getInt("distanceUnits",0),DISTANCE.length);u.areaMode=bound(prefs.getInt("areaUnits",0),AREA.length);u.angleMode=bound(prefs.getInt("angleUnits",0),ANGLE.length);u.slopeMode=bound(prefs.getInt("slopeUnits",1),SLOPE.length);u.pressureMode=bound(prefs.getInt("pressureUnits",0),PRESSURE.length);return u;}
  private static int bound(int v,int size){return Math.max(0,Math.min(size-1,v));}
  private static String value(double number,String unit){return String.format(Locale.ROOT,"%.2f %s",number,unit);}
  public String distance(double meters){double abs=Math.abs(meters);
    if(distanceMode<=1)return value(abs<1000?meters:meters/1000,abs<1000?"м":"км");
    if(distanceMode==8)return value(abs<1852?meters:meters/1852,abs<1852?"м":"nmi");
    boolean nautical=distanceMode==3||distanceMode==9;double large=nautical?1852:1609.344;if(abs>=large)return value(meters/large,nautical?"nmi":"mi");
    if(distanceMode==5&&abs>=20.1168)return value(meters/20.1168,"ch");
    if((distanceMode==4||distanceMode==5||distanceMode==6)&&abs>=.9144)return value(meters/.9144,"yd");return value(meters/.3048,"ft");
  }
  public boolean feet(){return distanceMode==1||(distanceMode>=2&&distanceMode<=5)||distanceMode==9;}
  public String height(double meters){return value(feet()?meters/.3048:meters,feet()?"ft":"м");}
  public String speed(double metersPerSecond){if(distanceMode==3||distanceMode>=8)return value(metersPerSecond*3600/1852,"kn");if(distanceMode>=2)return value(metersPerSecond*3600/1609.344,"mph");return value(metersPerSecond*3.6,"км/ч");}
  public String area(double meters){double abs=Math.abs(meters);
    if(areaMode<=2){if(abs>=1e6)return value(meters/1e6,"км²");if(areaMode==2&&abs>=1e4)return value(meters/1e4,"га");if(areaMode>=1&&abs>=100)return value(meters/100,"а");return value(meters,"м²");}
    if(areaMode>=5)return abs>=1852.0*1852?value(meters/(1852.0*1852),"nmi²"):value(areaMode==6?meters/(.3048*.3048):meters,areaMode==6?"ft²":"м²");
    if(abs>=1609.344*1609.344)return value(meters/(1609.344*1609.344),"mi²");if(abs>=4046.8564224)return value(meters/4046.8564224,"ac");if(areaMode==4&&abs>=.9144*.9144)return value(meters/(.9144*.9144),"yd²");return value(meters/(.3048*.3048),"ft²");
  }
  public double turn(){switch(angleMode){case 3:case 4:return 400;case 5:return Math.PI*2000;case 6:return 6400;case 7:return 6000;case 8:return 6300;default:return 360;}}
  public String angleUnit(){return angleMode==3||angleMode==4?"gon":angleMode>=5?"mil":"°";}
  public double degrees(double input){return input*360/turn();}
  public String bearing(double degrees){double normalized=((degrees%360)+360)%360;if(angleMode==1||angleMode==4)if(normalized>180)normalized-=360;
    if(angleMode==2){long seconds=Math.round(normalized*3600)%1296000;return String.format(Locale.ROOT,"%d° %02d′ %02d″",seconds/3600,seconds/60%60,seconds%60);}
    return value(normalized*turn()/360,angleUnit());
  }
  public String slope(double degrees){switch(slopeMode){case 0:return value(Math.tan(Math.toRadians(degrees))*100,"%");case 2:return value(Math.toRadians(degrees)*1000,"mil");case 3:return value(degrees*6400/360,"mil");case 4:return value(degrees*6000/360,"mil");case 5:double tangent=Math.abs(Math.tan(Math.toRadians(degrees)));return tangent<1e-12?"∞ L/D":value(1/tangent,"L/D");default:return value(degrees,"°");}}
  public String pressure(double hpa){switch(pressureMode){case 1:return value(hpa/1.33322387415,"mmHg");case 2:return value(hpa/33.8638866667,"inHg");case 3:return value(hpa/68.9475729318,"psi");default:return value(hpa,"hPa");}}
}
