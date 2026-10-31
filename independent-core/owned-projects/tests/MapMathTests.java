import org.rabochaya.projects.MapMath;
public class MapMathTests {
 static int checks;static void eq(double actual,double expected,double epsilon){checks++;if(Math.abs(actual-expected)>epsilon||Double.isNaN(actual))throw new AssertionError(actual+" != "+expected);}
 public static void main(String[] args){
  eq(MapMath.x(0),.5,1e-14);eq(MapMath.y(0),.5,1e-14);eq(MapMath.y(85.05112878),0,1e-9);eq(MapMath.y(-85.05112878),1,1e-9);
  for(int lon=-179;lon<=179;lon+=7)for(int lat=-80;lat<=80;lat+=10){eq(MapMath.lon(MapMath.x(lon)),lon,1e-10);eq(MapMath.lat(MapMath.y(lat)),lat,1e-10);}
  for(int z=0;z<=23;z++){long n=1L<<z;eq(MapMath.tmsRow(z,0),n-1,0);eq(MapMath.tmsRow(z,n-1),0,0);}
  eq(MapMath.delta(MapMath.x(-179),MapMath.x(179)),2.0/360,1e-10);
  double[] v=MapMath.fit(new double[][]{{179,0},{-179,0}},720,1000);eq(Math.abs(MapMath.lon(v[0])),180,1e-10);if(v[2]<7)throw new AssertionError("date line not fitted narrowly");checks++;
  v=MapMath.fit(new double[][]{{10,20},{11,21}},720,1000);eq(MapMath.lon(v[0]),10.5,1e-10);if(MapMath.lat(v[1])<20||MapMath.lat(v[1])>21)throw new AssertionError();checks++;
  eq(MapMath.lat(MapMath.y(90)),85.05112878,1e-8);eq(MapMath.lat(MapMath.y(-90)),-85.05112878,1e-8);
  boolean bad=false;try{MapMath.tmsRow(24,0);}catch(IllegalArgumentException ok){bad=true;}if(!bad)throw new AssertionError();checks++;
  System.out.println("PASS MapMath: "+checks+" assertions");
 }
}
