import org.rabochaya.projects.SvgPath;import java.util.*;
/** Literal SVG path geometry and hostile input; independent from Android raster adapter. */
public final class SvgPathTests {
 static int n;static void ck(boolean ok){n++;if(!ok)throw new AssertionError("SVG path "+n);}
 static void near(double a,double b){ck(Math.abs(a-b)<1e-7);}
 static void bad(String s){try{SvgPath.parse(s);throw new AssertionError("accepted "+s);}catch(IllegalArgumentException expected){n++;}}
 public static void main(String[] ignored){
  List<SvgPath.Segment> p=SvgPath.parse("M1 2 3 4 l5 -2 h-1 v3 Z m2 3 l1 1");ck(p.size()==8);near(p.get(1).values[0],3);near(p.get(2).values[0],8);near(p.get(3).values[0],7);near(p.get(4).values[1],5);near(p.get(6).values[0],3);near(p.get(6).values[1],5);ck(p.get(5).command=='Z');
  p=SvgPath.parse("M0 0 C1 2 3 4 5 6 S8 9 10 11 Q12 13 14 15 T18 19");ck(p.size()==5);near(p.get(2).values[0],7);near(p.get(2).values[1],8);near(p.get(4).values[0],16);near(p.get(4).values[1],17);
  p=SvgPath.parse("M1e1-.5 L.5.25");near(p.get(0).values[0],10);near(p.get(0).values[1],-.5);near(p.get(1).values[1],.25);
  p=SvgPath.parse("M1 0 A1 1 0 0 1 0 1");ck(p.size()==2);SvgPath.Segment c=p.get(1);ck(c.command=='C');near(c.values[0],1);near(c.values[1],.5522847498307933);near(c.values[2],.5522847498307933);near(c.values[3],1);near(c.values[4],0);near(c.values[5],1);
  p=SvgPath.parse("M0 0 a0 4 0 0 0 3 4 a2 2 0 1 1 0 0");ck(p.size()==2);ck(p.get(1).command=='L');near(p.get(1).values[0],3);
  p=SvgPath.parse("M0 0 A-1 -1 0 0 1 4 0");ck(p.size()==3);near(p.get(2).values[4],4);near(p.get(2).values[5],0);
  p=SvgPath.parse("M0 0 A1 1 45 011 1");ck(p.size()>1); // adjacent flags and next coordinate are legal.
  for(String s:new String[]{"","L1 2","M1","M0 0 X1 2","MNaN 0","M1e999 0","M1000001 0","M0 0 C1 2 3 4","M0 0 A1 1 0 2 0 1 1","M0 0 A1 1 0 0.0 1 1 1","M0 0 Z1 2","M0,,0","M,0 0","M0 0,","M0 0 L","M0 0 1"})bad(s);
  StringBuilder many=new StringBuilder("M0 0");for(int i=0;i<4097;i++)many.append(" L0 0");bad(many.toString());
  try{p.add(null);throw new AssertionError("mutable list");}catch(UnsupportedOperationException expected){n++;}
  System.out.println("PASS SvgPath: "+n+" checks");
 }
}
