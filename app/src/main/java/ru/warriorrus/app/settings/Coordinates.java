package ru.warriorrus.app.settings;

import java.util.Locale;
import mil.nga.mgrs.MGRS;
import mil.nga.mgrs.utm.UTM;
import mil.nga.grid.features.Point;
import ru.warriorrus.app.data.Vertex;

/** WGS84 representations, calculated locally. Does not query sensors or web services. */
public final class Coordinates {
  public static final String[] NAMES={"WGS84 · градусы","WGS84 · градусы и минуты","WGS84 · градусы, минуты, секунды","UTM (WGS84)","MGRS (WGS84)"};
  private Coordinates() {}
  public static String format(int mode,double lat,double lon) {
    new Vertex(lat,lon);
    if(mode>=3) {
      if(lat < -80 || lat > 84)return "Вне диапазона UTM/MGRS (−80…84°)";
      Point point=Point.point(lon,lat);
      return mode==3?UTM.from(point).toString():MGRS.from(point).toString();
    }
    return angle(lat,lat<0?"S":"N",mode)+"  "+angle(lon,lon<0?"W":"E",mode);
  }
  private static String angle(double value,String hemisphere,int mode) {
    double abs=Math.abs(value);
    if(mode==0)return String.format(Locale.ROOT,"%.6f° %s",abs,hemisphere);
    // Round the smallest unit before splitting, to avoid 60 seconds/minutes.
    if(mode==1){long minutes=Math.round(abs*60*10000);return String.format(Locale.ROOT,"%d° %07.4f′ %s",minutes/600000,minutes%600000/10000.0,hemisphere);}
    long seconds=Math.round(abs*3600*100);return String.format(Locale.ROOT,"%d° %02d′ %05.2f″ %s",seconds/360000,seconds/6000%60,seconds%6000/100.0,hemisphere);
  }
  public static Vertex parse(String text) {
    String input=text.trim();
    try {
      String[] pair=input.split(",");if(pair.length==2)return new Vertex(Double.parseDouble(pair[0].trim()),Double.parseDouble(pair[1].trim()));
      Point p;
      if(input.matches("(?i)^\\d{1,2}\\s+[NS]\\s+.*"))p=UTM.parse(input).toPoint();
      else p=MGRS.parse(input).toPoint();
      return new Vertex(p.getLatitude(),p.getLongitude());
    }catch(Exception invalid){throw new IllegalArgumentException("Введите широту, долготу через запятую, UTM или полный MGRS");}
  }
}
