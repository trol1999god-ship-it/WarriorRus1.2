package ru.warriorrus.app.settings;

import java.util.Locale;
import mil.nga.mgrs.MGRS;
import mil.nga.mgrs.utm.UTM;
import mil.nga.grid.features.Point;
import ru.warriorrus.app.data.Vertex;

/** Local coordinate representations. Object storage always remains WGS84. */
public final class Coordinates {
  public static final String[] NAMES={"WGS84 · градусы","WGS84 · градусы и минуты","WGS84 · градусы, минуты, секунды","UTM (WGS84)","MGRS (WGS84)","СК-42 · Гаусс–Крюгер (6°)","СК-42 · широта и долгота","Пулково 1995 · широта и долгота","Web Mercator (EPSG:3857)","World Mercator (EPSG:3395)","Другая система EPSG"};
  private Coordinates() {}
  public static String format(int mode,double lat,double lon) {
    return format(mode,lat,lon,"EPSG:32637");
  }
  public static String system(int mode,double lat,double lon,String custom){
    switch(mode){case 3:case 4:if(lat < -80 || lat > 84)throw new IllegalArgumentException("Вне диапазона UTM");return "EPSG:"+((lat>=0?32600:32700)+UTM.from(Point.point(lon,lat)).getZone());case 5:return "EPSG:"+(28400+ProjectionMath.sk42Zone(lat,lon));case 6:return "EPSG:4284";case 7:return "EPSG:4200";case 8:return "EPSG:3857";case 9:return "EPSG:3395";case 10:return ProjectionMath.code(custom);default:return "EPSG:4326";}
  }
  public static String format(int mode,double lat,double lon,String custom) {
    new Vertex(lat,lon);
    if(mode>=5){try{String code=system(mode,lat,lon,custom);double[] p=ProjectionMath.project(code,lat,lon);
      if(ProjectionMath.geographic(code))return angle(p[1],p[1]<0?"S":"N",0)+"  "+angle(p[0],p[0]<0?"W":"E",0);
      return mode==5?String.format(Locale.ROOT,"X = %.1f  Y = %.1f",p[1],p[0]):String.format(Locale.ROOT,"E = %.1f  N = %.1f",p[0],p[1]);
    }catch(Exception invalid){return invalid.getMessage();}}
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
      if(input.matches("(?i)^(СК[- ]?42|SK[- ]?42).*")){
        String[] parts=input.replaceFirst("(?i)^(СК[- ]?42|SK[- ]?42)\\s*","").replaceAll("(?i)[XYХУ=]"," ").trim().split("[\\s;,]+");
        if(parts.length!=2)throw new IllegalArgumentException("СК42 X Y: северная координата, затем восточная с номером зоны");
        double north=Double.parseDouble(parts[0]),east=Double.parseDouble(parts[1]);int zone=(int)Math.floor(east/1000000);if(zone<2||zone>32)throw new IllegalArgumentException("В Y нужен номер зоны СК-42");return ProjectionMath.inverse("EPSG:"+(28400+zone),east,north);
      }
      if(input.matches("(?i)^EPSG:[0-9]+.*")) {String[] parts=input.trim().split("[\\s;,]+");if(parts.length!=3)throw new IllegalArgumentException("EPSG:код E N: восточная, затем северная координата");return ProjectionMath.inverse(parts[0],Double.parseDouble(parts[1]),Double.parseDouble(parts[2]));}
      String[] pair=input.split(",");if(pair.length==2)return new Vertex(Double.parseDouble(pair[0].trim()),Double.parseDouble(pair[1].trim()));
      Point p;
      if(input.matches("(?i)^\\d{1,2}\\s+[NS]\\s+.*"))p=UTM.parse(input).toPoint();
      else p=MGRS.parse(input).toPoint();
      return new Vertex(p.getLatitude(),p.getLongitude());
    }catch(Exception invalid){throw new IllegalArgumentException("Введите широту, долготу через запятую, UTM, MGRS, СК42 X Y или EPSG:код E N",invalid);}
  }
}
