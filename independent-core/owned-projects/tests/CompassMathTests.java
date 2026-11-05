import org.rabochaya.projects.CompassMath;
public final class CompassMathTests {
 static int checks;static void eq(double value,double expected){checks++;double d=Math.abs(((value-expected+540)%360)-180);if(Double.isNaN(value)||d>1e-6)throw new AssertionError(value+" != "+expected);}
 public static void main(String[] args){float[] g={0,0,9.81f};eq(CompassMath.heading(g,new float[]{0,50,0},0),0);eq(CompassMath.heading(g,new float[]{-50,0,0},0),90);eq(CompassMath.heading(g,new float[]{0,-50,0},0),180);eq(CompassMath.heading(g,new float[]{50,0,0},0),270);
  for(int r=0;r<4;r++)eq(CompassMath.heading(g,new float[]{0,50,20},r),(360-r*90)%360);
  eq(CompassMath.heading(new float[]{0,4.905f,8.49571f},new float[]{0,43.30127f,-25},0),0);
  for(float[] a:new float[][]{null,new float[]{0,0,0},new float[]{Float.NaN,0,1},new float[]{0,1,0}}){checks++;if(!Double.isNaN(CompassMath.heading(a,new float[]{0,50,0},0)))throw new AssertionError("bad gravity accepted");}
  checks++;if(!Double.isNaN(CompassMath.heading(g,new float[]{0,0,50},0)))throw new AssertionError("vertical field accepted");
  eq(CompassMath.smooth(359,1),359.4);eq(CompassMath.smooth(1,359),.6);eq(CompassMath.smooth(Double.NaN,90),90);eq(CompassMath.wrap(-1),359);eq(CompassMath.wrap(721),1);
  System.out.println("PASS CompassMath: "+checks+" assertions");
 }
}
