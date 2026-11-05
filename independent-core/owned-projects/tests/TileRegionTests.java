package org.rabochaya.projects;
import java.util.*;
public class TileRegionTests {
 static int checks;static void check(boolean ok){if(!ok)throw new AssertionError("case "+checks);checks++;}
 static Set<String> collect(TileRegion region){Set<String> all=new HashSet<>();for(int[] t:region){check(t[1]>=0&&t[1]<(1<<t[0])&&t[2]>=0&&t[2]<(1<<t[0]));check(all.add(Arrays.toString(t)));}check(all.size()==region.count);return all;}
 static void reject(double w,double s,double e,double n,int min,int max){try{new TileRegion(w,s,e,n,min,max);throw new AssertionError("accepted invalid");}catch(IllegalArgumentException expected){checks++;}}
 public static void main(String[] args){
  check(collect(new TileRegion(-180,-85.05112878,180,85.05112878,0,4)).size()==341);
  check(collect(new TileRegion(100,-1,90,1,2,2)).size()==8);
  check(collect(new TileRegion(170,-1,-170,1,2,2)).size()==4);
  check(collect(new TileRegion(-180,0,0,85.05112878,1,1)).equals(Collections.singleton("[1, 0, 0]")));
  Random r=new Random(26);for(int k=0;k<200;k++){double west=-180+r.nextDouble()*360,east=-180+r.nextDouble()*360;int z=r.nextInt(5),n=1<<z;TileRegion region=new TileRegion(west,-20,east,40,z,z);Set<String> actual=collect(region);Set<String> expected=new HashSet<>();for(int x=0;x<n;x++){double l=x*360.0/n-180,h=(x+1)*360.0/n-180;boolean hit=west<east?(l<east&&h>west):(h>west||l<east);for(int y=0;y<n;y++)if(hit&&MapMath.lat((y+1.0)/n)<40&&MapMath.lat(y/(double)n)>-20)expected.add(Arrays.toString(new int[]{z,x,y}));}check(actual.equals(expected));}
  reject(0,0,0,1,0,1);reject(-181,0,1,1,0,1);reject(0,-90,1,1,0,1);reject(0,0,1,90,0,1);reject(0,1,1,0,0,1);reject(0,0,1,1,2,1);reject(0,0,1,1,0,24);reject(0,0,Double.NaN,1,0,1);reject(-180,-85,180,85,0,22);
  TileSource osm=TileSource.osm();check(!osm.downloads);check(osm.url(2,1,3).equals("https://tile.openstreetmap.org/2/1/3.png"));
  TileSource custom=new TileSource("QA","https://tiles.example.org/{z}/{x}/{y}.png?key=fixed","QA ©",0,22,true);check(custom.downloads);check(custom.id.length()==64);check(custom.id.equals(new TileSource("other",custom.template,"other",1,22,false).id));
  check(!new TileSource("QA",osm.template,osm.attribution,0,19,true).downloads);
  String[] blocked={"http://tiles.example.org/{z}/{x}/{y}.png","https://user@tiles.example.org/{z}/{x}/{y}","https://tiles.example.org/{z}/{x}/{y}#fragment","https://tiles.example.org:444/{z}/{x}/{y}","https://localhost/{z}/{x}/{y}","https://127.0.0.1/{z}/{x}/{y}","https://tiles.example.org/{z}/{x}/{name}","https://tiles.example.org/{z}/{x}/{y}?note={note}"};for(String url:blocked){try{new TileSource("QA",url,"QA",0,22,true);throw new AssertionError(url);}catch(IllegalArgumentException expected){checks++;}}
  for(int z=1;z<=18;z++)for(int latitude=-80;latitude<=80;latitude+=5){double y=TileProjection.y(latitude,true);check(Math.abs(TileProjection.latitude(y,true)-latitude)<1e-8);}
  check(TileProjection.quadkey(3,3,5).equals("213"));check(TileProjection.y(55,true)>MapMath.y(55));
  int sourceCount=0,composites=0,urlCount=0;for(MapCatalog.Entry entry:MapCatalog.entries()){TileSource selected=entry.source;if(selected.layers!=null)composites++;else sourceCount++;for(TileSource leaf:selected.leafs())for(int z=leaf.minZoom;z<=leaf.maxZoom;z++)if(leaf.hasZoom(z)){String url=leaf.url(z,(1<<z)/2,(1<<z)/2);check(url.startsWith("https://")&&!url.contains("{")&&!url.contains("}"));urlCount++;}}
  check(sourceCount==54&&composites==3);check(MapCatalog.find("YANDEX_HYBRID").leafs().length==2);check(MapCatalog.find("ESRI_IMAGERY_LABELS").leafs().length==3);check(MapCatalog.find("YANDEX_SAT").ellipsoid);check(MapCatalog.find("OSMOTM").url(16,1,1).contains("opentopomap"));check(MapCatalog.find("OSMOTM").url(17,1,1).contains("cyclosm"));check(!MapCatalog.find("GMAPS").canDownload(5));check(!MapCatalog.find("SMMAP").canDownload(6));check(MapCatalog.find("SMMAP").canDownload(7));
  TileDownloadPlan plan=new TileDownloadPlan(MapCatalog.find("ESRI_IMAGERY_LABELS"),5,5,6,6,3,4);check(plan.count==6);check(plan.sources.length==3);
  System.out.println("PASS: "+checks+" tile region/source assertions");
 }
}
