import org.rabochaya.projects.*;import java.io.*;import java.nio.file.*;import java.util.*;
public final class DemProfileTests {
 static int checks;static void ck(boolean value){checks++;if(!value)throw new AssertionError("DEM profile "+checks);}interface Work{void run()throws Exception;}static void reject(Work w)throws Exception{boolean refused=false;try{w.run();}catch(IllegalArgumentException e){refused=true;}ck(refused);}
 public static void main(String[] args)throws Exception{Path dir=Files.createTempDirectory("dem-profile-");File file=dir.resolve("N10E005.hgt").toFile();try{
  try(DataOutputStream out=new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file)))){for(int y=0;y<=1200;y++)for(int x=0;x<=1200;x++)out.writeShort(x==500&&y==500?Short.MIN_VALUE:2*x+y-1800);}
  byte[] original=Files.readAllBytes(file.toPath());List<double[]> route=Arrays.asList(new double[]{5.25,10.75,321},new double[]{5.75,10.25,-123});
  try(HgtRaster dem=new HgtRaster(file,"N10E005.hgt")){
   DemProfile p=DemProfile.sample(dem,route,3);ck(p.valid==3);ck(Math.abs(p.height[0]+900)<1e-7&&Math.abs(p.height[1])<1e-7&&Math.abs(p.height[2]-900)<1e-7);ck(p.min==-900&&p.max==900);ck(p.gain==1800&&p.loss==0);ck(p.distance[0]==0&&p.distance[2]==p.length&&p.distance[1]==p.length/2);ck(route.get(0)[2]==321&&route.get(1)[2]==-123);
   p=DemProfile.sample(dem,Arrays.asList(route.get(1),route.get(0)),3);ck(p.gain==0&&p.loss==1800);
   p=DemProfile.sample(dem,Arrays.asList(new double[]{5+499.0/1200,11-500.0/1200},new double[]{5+501.0/1200,11-500.0/1200}),3);ck(p.valid==2&&Double.isNaN(p.height[1]));ck(p.gain==0&&p.loss==0);
   p=DemProfile.sample(dem,Arrays.asList(new double[]{0,0},new double[]{1,0}),9);ck(p.valid==0&&Double.isNaN(p.min)&&Double.isNaN(p.max));
   p=DemProfile.sample(dem,Arrays.asList(route.get(0),route.get(0),route.get(1),route.get(1)),512);ck(p.height.length==512&&p.valid==510);ck(Math.abs(p.height[511]-900)<1e-7);
   reject(()->DemProfile.sample(dem,route,2049));reject(()->DemProfile.sample(dem,route,1));reject(()->DemProfile.sample(dem,Arrays.asList(route.get(0),route.get(0)),10));reject(()->DemProfile.sample(dem,Arrays.asList(new double[]{Double.NaN,0},route.get(1)),10));reject(()->DemProfile.sample(dem,null,10));reject(()->DemProfile.sample(dem,Arrays.asList(new double[]{0,91},route.get(1)),10));
  }
  ck(Math.abs(DemProfile.metres(0,0,1,0)-111195.0802335329)<.001);ck(Math.abs(DemProfile.metres(179,0,-179,0)-222390.1604670658)<.001);
  try(HgtRaster dem=new HgtRaster(file,"N00E179.hgt")){DemProfile p=DemProfile.sample(dem,Arrays.asList(new double[]{179.5,.5},new double[]{-179.5,.5}),3);ck(p.height[0]==0&&p.height[1]==1200&&Double.isNaN(p.height[2]));ck(p.length<112000);}
  ck(Arrays.equals(original,Files.readAllBytes(file.toPath())));System.out.println("PASS DEM profile: "+checks+" assertions");
 }finally{Files.deleteIfExists(file.toPath());Files.deleteIfExists(dir);}}
}
