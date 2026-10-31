import org.rabochaya.projects.GeometryCoordinates;
import java.util.*;
public final class GeometryCoordinatesTests {
 static int checks;
 static void check(boolean v){checks++;if(!v)throw new AssertionError();}
 static void bad(String input,String type){boolean rejected=false;try{GeometryCoordinates.parse(input,type);}catch(IllegalArgumentException e){rejected=true;}check(rejected);}
 public static void main(String[] args){
  List<double[]> p=GeometryCoordinates.parse("22 32 84","Point");check(p.size()==1&&p.get(0)[0]==32&&p.get(0)[1]==22&&p.get(0)[2]==84);
  p=GeometryCoordinates.parse("90 -180","Point");check(p.get(0)[0]==-180&&p.get(0)[1]==90&&p.get(0)[2]==0);
  p=GeometryCoordinates.parse("-90 180 -10","Point");check(p.get(0)[0]==180&&p.get(0)[1]==-90);
  p=GeometryCoordinates.parse("0 0\n0 1\n1 1","Polygon");check(p.size()==4&&Arrays.equals(p.get(0),p.get(3)));
  p=GeometryCoordinates.parse("0 0\n0 1\n1 1\n0 0","Polygon");check(p.size()==4);
  p=GeometryCoordinates.parse("0 0\r\n0 1","LineString");check(p.size()==2);
  for(String s:new String[]{"","91 0","-91 0","0 181","0 -181","NaN 0","0 Infinity","0 0 NaN","0 0 -Infinity","1","1 2 3 4","1,2 3","0 0\n1 1"})bad(s,"Point");
  bad("0 0","LineString");bad("0 0\n1 1","Polygon");bad("0 0\n0 0\n1 1","Polygon");bad("0 0","Other");bad(null,"Point");bad("0 0\n-0 0\n0 -0","Polygon");
  StringBuilder large=new StringBuilder();for(int i=0;i<10001;i++)large.append("0 0\n");bad(large.toString(),"LineString");
  System.out.println("PASS GeometryCoordinates: "+checks+" assertions");
 }
}
