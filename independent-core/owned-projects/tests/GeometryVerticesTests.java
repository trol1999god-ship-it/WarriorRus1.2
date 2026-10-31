import org.rabochaya.projects.GeometryVertices;
import org.rabochaya.projects.GeometryCoordinates;
import java.util.*;

public final class GeometryVerticesTests {
    static int checks;
    static void check(boolean value){checks++;if(!value)throw new AssertionError("check "+checks);}
    static void bad(String text,String type,int index,String operation,String point){
        boolean rejected=false;try{GeometryVertices.edit(text,type,index,operation,point);}catch(IllegalArgumentException e){rejected=true;}check(rejected);
    }
    static List<double[]> points(String text,String type){return GeometryCoordinates.parse(text,type);}
    public static void main(String[] args){
        String line="10 20 123\n11 21 -4\n12 22 7";
        String changed=GeometryVertices.edit(line,"LineString",1,"replace","15 25 50");
        List<double[]> p=points(changed,"LineString");check(p.size()==3);check(Arrays.equals(p.get(0),new double[]{20,10,123}));check(Arrays.equals(p.get(1),new double[]{25,15,50}));check(p.get(2)[2]==7);
        p=points(GeometryVertices.edit(line,"LineString",0,"before","9 19"),"LineString");check(p.size()==4&&p.get(0)[1]==9&&p.get(1)[2]==123);
        p=points(GeometryVertices.edit(line,"LineString",2,"after","13 23 9"),"LineString");check(p.size()==4&&p.get(3)[2]==9);
        p=points(GeometryVertices.edit(line,"LineString",1,"delete",null),"LineString");check(p.size()==2&&p.get(1)[1]==12);
        changed=GeometryVertices.edit(line,"LineString",1,"up",null);p=points(changed,"LineString");check(p.get(0)[2]==-4&&p.get(1)[2]==123);
        p=points(GeometryVertices.edit(changed,"LineString",0,"down",null),"LineString");check(p.get(0)[2]==123&&p.get(1)[2]==-4);
        String ring="0 0 100\n0 1 200\n1 1 300\n0 0 100";
        check(GeometryVertices.rows(ring,"Polygon").size()==3);
        changed=GeometryVertices.edit(ring,"Polygon",0,"replace","-1 -1 400");p=points(changed,"Polygon");check(p.size()==4&&Arrays.equals(p.get(0),p.get(3))&&p.get(3)[2]==400);
        changed=GeometryVertices.edit(ring,"Polygon",0,"before","-1 -1 400");p=points(changed,"Polygon");check(p.size()==5&&Arrays.equals(p.get(0),p.get(4))&&p.get(1)[2]==100);
        changed=GeometryVertices.edit(changed,"Polygon",0,"delete",null);p=points(changed,"Polygon");check(p.size()==4&&p.get(0)[2]==100&&Arrays.equals(p.get(0),p.get(3)));
        p=points(GeometryVertices.edit(ring,"Polygon",0,"down",null),"Polygon");check(p.get(0)[2]==200&&Arrays.equals(p.get(0),p.get(3)));
        check(GeometryVertices.rows("0 0\n0 1\n1 1","Polygon").size()==3);
        bad(ring,"Polygon",1,"delete",null);bad(ring,"Polygon",0,"replace","0 1 200");
        bad("0 0\n1 1","LineString",0,"delete",null);
        bad("0 0","Point",0,"before","1 1");bad("0 0","Point",0,"after","1 1");bad("0 0","Point",0,"delete",null);
        p=points(GeometryVertices.edit("0 0","Point",0,"replace","90 180 -42"),"Point");check(p.size()==1&&p.get(0)[2]==-42);
        for(String invalid:new String[]{"NaN 0","91 0","0 181","1 2\n3 4","","1 2 Infinity"})bad(line,"LineString",0,"replace",invalid);
        bad(line,"LineString",-1,"delete",null);bad(line,"LineString",3,"delete",null);bad(line,"LineString",0,"up",null);bad(line,"LineString",2,"down",null);bad(line,"LineString",0,"unknown",null);
        bad("invalid","LineString",0,"replace","0 0");
        StringBuilder many=new StringBuilder();for(int i=0;i<10000;i++){if(i>0)many.append('\n');many.append("0 ").append(i%180);}
        bad(many.toString(),"LineString",0,"after","1 1");
        check(line.equals("10 20 123\n11 21 -4\n12 22 7"));
        System.out.println("PASS GeometryVertices: "+checks+" assertions");
    }
}
