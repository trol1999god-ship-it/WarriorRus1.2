import org.rabochaya.projects.MapHitTest;
import java.util.*;
public class MapHitTestTests {
 static int checks;
 static List<double[]> ring(double... pairs){List<double[]> r=new ArrayList<>();for(int i=0;i<pairs.length;i+=2)r.add(new double[]{pairs[i],pairs[i+1],0});return r;}
 @SafeVarargs static List<List<double[]>> rings(List<double[]>... r){return Arrays.asList(r);}
 static double hit(String type,List<List<double[]>> r,double x,double y){return MapHitTest.distance(type,r,.5,.5,360,360,180,x,y);}
 static void eq(double a,double b){checks++;if(Math.abs(a-b)>1e-8||Double.isNaN(a))throw new AssertionError(a+" != "+b);}
 static void yes(boolean value){checks++;if(!value)throw new AssertionError();}
 public static void main(String[] args){
  List<List<double[]>> line=rings(ring(-80,0,80,0));
  eq(hit("LineString",line,180,90),0); // midpoint, far from either vertex
  eq(hit("LineString",line,180,100),10);
  eq(hit("LineString",line,270,90),10); // beyond endpoint
  eq(hit("LineString",rings(ring(0,0,0,0)),183,94),5);
  eq(hit("Point",rings(ring(0,0)),183,94),5);
  List<double[]> outer=ring(-40,-40,40,-40,40,40,-40,40);
  List<double[]> hole=ring(-10,-10,10,-10,10,10,-10,10);
  eq(hit("Polygon",rings(outer),180,90),0);
  eq(hit("Polygon",rings(outer,hole),200,90),0);
  yes(hit("Polygon",rings(outer,hole),180,90)>9.9); // hole is not area
  yes(hit("Polygon",rings(outer,hole),240,90)>19.9);
  eq(hit("Polygon",rings(outer),140,90),0); // closing edge
  yes(Double.isInfinite(hit("LineString",rings(ring()),180,90)));
  eq(MapHitTest.distance("LineString",rings(ring(170,0,-170,0)),0,.5,360,360,180,180,90),0);
  yes(MapHitTest.distance("LineString",rings(ring(170,0,-170,0)),.5,.5,360,360,180,180,90)>169); // no line across whole world
  eq(MapHitTest.distance("Polygon",rings(ring(170,-10,-170,-10,-170,10,170,10)),0,.5,360,360,180,180,90),0);
  // Selection tolerance remains in display pixels at different scales.
  for(int z=0;z<=22;z++)eq(MapHitTest.distance("LineString",line,.5,.5,256*Math.pow(2,z),720,1000,360,510),10);
  System.out.println("PASS MapHitTest: "+checks+" assertions");
 }
}
