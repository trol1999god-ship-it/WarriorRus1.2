import org.rabochaya.projects.Coordinates;
import java.util.*;
public final class CoordinateTests {
 static int checks;
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);checks++;}
 static void eq(double got,double expected,double tolerance){check(!Double.isNaN(got)&&Math.abs(got-expected)<=tolerance,got+" != "+expected+" ± "+tolerance);}
 static void reject(String text,int format){try{Coordinates.parse(text,format);throw new AssertionError("Accepted invalid: "+text);}catch(IllegalArgumentException expected){checks++;}}
 static void point(double lat,double lon){
  Coordinates.Grid grid=Coordinates.toUtm(lat,lon);Coordinates.Position inverse=Coordinates.fromUtm(grid);eq(inverse.lat,lat,2e-11);eq(inverse.lon,lon,2e-10);
  for(int format=0;format<5;format++){String text=Coordinates.format(lat,lon,format);Coordinates.Position p=Coordinates.parse(text,format);double epsilon=format==Coordinates.DMS?1.4e-6:format==Coordinates.DM?8.4e-7:format==Coordinates.DD?5.1e-7:format==Coordinates.MGRS?6e-5:1e-8;eq(p.lat,lat,epsilon);eq(p.lon,lon,epsilon/Math.max(.1,Math.cos(Math.toRadians(lat))));}
 }
 public static void main(String[] args){
  // Independently published PROJ examples; GRS80/WGS84 differences < 1 mm here.
  Coordinates.Grid g=Coordinates.toUtm(56,12);check(g.zone==33&&g.north,"standard zone at exact 12E boundary");eq(g.easting,312928.56,.006);eq(g.northing,6210141.33,.006);
  Coordinates.Position p=Coordinates.fromUtm(new Coordinates.Grid(32,true,687071.44,6210141.33));eq(p.lat,56,1e-7);eq(p.lon,12,1e-7);
  g=Coordinates.toUtm(-44,174);check(g.zone==60&&!g.north,"southern hemisphere and boundary zone");eq(g.easting,259473.68,.006);eq(g.northing,5123750.87,.006);p=Coordinates.fromUtm(new Coordinates.Grid(59,false,740526.32,5123750.87));eq(p.lat,-44,1e-7);eq(p.lon,174,1e-7);
  // Known central-meridian origins, exact by projection definition.
  for(int z=1;z<=60;z++){g=Coordinates.toUtm(0,z*6-183);eq(g.easting,500000,1e-8);eq(g.northing,0,1e-8);check(g.zone==z&&g.north,"zone origin "+z);}
  // NGA's independent MGRS example 15SWC8081751205 has UTM E580817/N4251205.
  p=Coordinates.fromMgrs("15SWC8081751205");g=Coordinates.toUtm(p.lat,p.lon);check(g.zone==15&&g.north,"MGRS S is latitude band, not south hemisphere");eq(g.easting,580817.5,2e-8);eq(g.northing,4251205.5,2e-8);check(Coordinates.mgrs(p.lat,p.lon,5).equals("15S WC 80817 51205"),"NGA MGRS example");
  check(Coordinates.zone(60,3)==32&&Coordinates.zone(60,2.999)==31,"Norway widening");
  int[] zones={31,33,33,35,35,37,37,38};double[] longitudes={8.9999,9,20.9999,21,32.9999,33,41.9999,42};for(int i=0;i<zones.length;i++)check(Coordinates.zone(76,longitudes[i])==zones[i],"Svalbard boundary");
  check(Coordinates.zone(0,-180)==1&&Coordinates.zone(0,180)==60,"date line two representations");
  double[][] edges={{-80,-179.9},{83.9999,179.9},{0,0},{-0.000001,-0.000001},{56,3},{63.9999,11.9999},{72,9},{76,20.9999},{84-1e-6,35},{55.75,37.6},{-33.8688,151.2093},{-79.9999,0},{0,179.99999},{0,-179.99999}};for(double[] edge:edges)point(edge[0],edge[1]);
  Random random=new Random(261027);for(int i=0;i<4000;i++)point(-79.999+random.nextDouble()*163.998,-179.999+random.nextDouble()*359.998);
  for(int precision=1;precision<=5;precision++)for(int i=0;i<1000;i++){double latitude=-79.9+random.nextDouble()*163.8,longitude=-179.99+random.nextDouble()*359.98;String grid=Coordinates.mgrs(latitude,longitude,precision);Coordinates.Position center=Coordinates.fromMgrs(grid);double dy=(center.lat-latitude)*111700,dx=(center.lon-longitude)*111700*Math.cos(Math.toRadians(latitude)),unit=Math.pow(10,5-precision);check(Math.hypot(dx,dy)<.72*unit,"MGRS cell centre precision "+precision);}
  for(int band=0;band<20;band++)for(int zone=1;zone<=60;zone++)for(double offset:new double[]{0,1e-7,-1e-7}){double latitude=-80+band*8+offset;if(latitude< -80||latitude>=84)continue;double longitude=zone*6-183;for(int precision=1;precision<=5;precision++){Coordinates.Position centre=Coordinates.fromMgrs(Coordinates.mgrs(latitude,longitude,precision));double unit=Math.pow(10,5-precision);check(Math.abs(centre.lat-latitude)*111700<.72*unit,"band boundary cell accepted");}}
  // Decimal signs, comma decimals, DMS hemispheres and rounding at minute/degree boundaries.
  p=Coordinates.parse("55,75 37,6",0);eq(p.lat,55.75,0);eq(p.lon,37.6,0);
  p=Coordinates.parse("33°52′07.68″ Ю; 151°12′33.48″ В",2);eq(p.lat,-33.8688,1e-12);eq(p.lon,151.2093,1e-12);
  p=Coordinates.parse("-0 30; -0 15",1);eq(p.lat,-.5,0);eq(p.lon,-.25,0);
  check(Coordinates.format(89.999999999,179.999999999,2).equals("90°00′00.00″ N; 180°00′00.00″ E"),"carry at 60 seconds");
  check(Coordinates.format(-0.0,-0.0,2).endsWith(" W"),"negative zero hemisphere");
  for(String bad:new String[]{"NaN 0","Infinity 0","91 0","0 181","1","1 2 3","1e999 0","0x1.0p0 0","1d 0"})reject(bad,0);
  for(String bad:new String[]{"90 0 1; 0 0 0","1 60 0; 1 0 0","1 0 60; 1 0 0","1.1 0 0; 1 0 0","1 0.1 0; 1 0 0","-1 0 0 N; 1 0 0 E","1 0 0 E; 1 0 0 E","1 0 0 NN; 1 0 0 E"})reject(bad,2);
  for(String bad:new String[]{"00 N 500000 0","61 N 500000 0","37 U 500000 0","37 N NaN 0","37 N 99999 0","37 N 900000 0","37 N 500000 -1","37 N 500000 10000001","37 N 500000 9999999"})reject(bad,3);
  for(String bad:new String[]{"0NAA1234567890","61NAA1234567890","32XAA1234567890","31NIA1234567890","31NAA1","31NAA123","31NAA","31NAA123456789012","31CAA0000000000","31NAA0000000000"})reject(bad,4);
  for(double lat:new double[]{84,90,-80.00001})try{Coordinates.toUtm(lat,0);throw new AssertionError("Accepted latitude "+lat);}catch(IllegalArgumentException expected){checks++;}
  String[] names=Coordinates.names();names[0]="modified";check(!Coordinates.name(0).equals("modified"),"format metadata not mutable");
  System.out.println("PASS Coordinates: "+checks+" assertions");
 }
}
