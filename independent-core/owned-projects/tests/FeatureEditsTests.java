import org.rabochaya.projects.FeatureEdits;
import java.util.*;
public final class FeatureEditsTests {
 static int checks;
 static void check(boolean v){checks++;if(!v)throw new AssertionError();}
 static void bad(String input,String type){boolean rejected=false;try{FeatureEdits.coordinates(input,type);}catch(IllegalArgumentException e){rejected=true;}check(rejected);}
 public static void main(String[] args){
  List<double[]> p=FeatureEdits.coordinates("22 32 84","Point");check(p.size()==1&&p.get(0)[0]==32&&p.get(0)[1]==22&&p.get(0)[2]==84);
  p=FeatureEdits.coordinates("90 -180","Point");check(p.get(0)[0]==-180&&p.get(0)[1]==90&&p.get(0)[2]==0);
  p=FeatureEdits.coordinates("-90 180 -10","Point");check(p.get(0)[0]==180&&p.get(0)[1]==-90);
  p=FeatureEdits.coordinates("0 0\n0 1\n1 1","Polygon");check(p.size()==4&&Arrays.equals(p.get(0),p.get(3)));
  p=FeatureEdits.coordinates("0 0\n0 1\n1 1\n0 0","Polygon");check(p.size()==4);
  p=FeatureEdits.coordinates("0 0\r\n0 1","LineString");check(p.size()==2);
  for(String s:new String[]{"","91 0","-91 0","0 181","0 -181","NaN 0","0 Infinity","0 0 NaN","0 0 -Infinity","1","1 2 3 4","1,2 3","0 0\n1 1"})bad(s,"Point");
  bad("0 0","LineString");bad("0 0\n1 1","Polygon");bad("0 0\n0 0\n1 1","Polygon");bad("0 0","Other");
  StringBuilder large=new StringBuilder();for(int i=0;i<10001;i++)large.append("0 0\n");bad(large.toString(),"LineString");
  System.out.println("PASS FeatureEdits: "+checks+" assertions");
 }
}
