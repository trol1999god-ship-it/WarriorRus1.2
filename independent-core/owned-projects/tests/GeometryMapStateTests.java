import org.rabochaya.projects.*;
import java.util.*;

public final class GeometryMapStateTests {
 static int checks;
 static void check(boolean condition){checks++;if(!condition)throw new AssertionError("check "+checks);}
 static void bad(Runnable action){boolean rejected=false;try{action.run();}catch(IllegalArgumentException e){rejected=true;}check(rejected);}
 public static void main(String[] args){
  String original="10 20 123\n11 21 -4\n12 22 7";
  GeometryMapState route=new GeometryMapState(original,"LineString",false);
  check(route.text().equals(original)&&route.size()==3&&!route.canUndo());route.select(1);route.move(1,35,25);
  check(Arrays.equals(route.point(1),new double[]{35,25,-4}));check(route.undoCount()==1);
  route.undo();check(route.text().equals(original)&&route.selected()==1);
  route.insert(23,13);check(route.size()==4&&route.selected()==2&&route.point(2)[2]==0);check(route.point(3)[2]==7);
  route.delete();check(route.size()==3);route.undo();check(route.size()==4&&route.selected()==2);route.undo();check(route.text().equals(original)&&route.selected()==1);
  double[] defensive=route.point(0);defensive[0]=100;check(route.point(0)[0]==20);
  String before=route.text();bad(()->route.move(1,181,0));bad(()->route.move(1,0,91));bad(()->route.move(1,Double.NaN,0));check(route.text().equals(before)&&!route.canUndo());
  route.move(1,21,11);check(!route.canUndo());
  GeometryMapState line=new GeometryMapState("0 0\n1 1","LineString",false);line.select(0);bad(()->line.delete());check(line.size()==2&&!line.canUndo());
  GeometryMapState polygon=new GeometryMapState("0 0 50\n0 1 60\n1 1 70\n0 0 50","Polygon",false);
  check(polygon.size()==3);polygon.select(0);bad(()->polygon.delete());bad(()->polygon.move(0,1,0));check(!polygon.canUndo());
  polygon.move(0,-1,-1);List<double[]> closed=GeometryCoordinates.parse(polygon.text(),"Polygon");check(closed.size()==4&&Arrays.equals(closed.get(0),closed.get(3))&&closed.get(3)[2]==50);
  polygon.undo();check(polygon.text().endsWith("0 0 50"));
  GeometryMapState point=new GeometryMapState("-90 180 999","Point",false);point.select(0);bad(()->point.delete());bad(()->point.insert(0,0));point.move(0,-179.5,85);check(point.size()==1&&point.point(0)[2]==999);point.undo();check(point.point(0)[0]==180&&point.point(0)[1]==-90);
  GeometryMapState hole=new GeometryMapState("","Polygon",true);check(!hole.complete()&&hole.size()==0);hole.insert(0,0);hole.insert(1,0);check(!hole.complete()&&hole.size()==2);hole.insert(1,1);check(hole.complete());hole.delete();check(!hole.complete());hole.undo();check(hole.complete());hole.undo();hole.undo();hole.undo();check(hole.text().isEmpty()&&!hole.canUndo());
  GeometryMapState bounded=new GeometryMapState("0 0\n1 1","LineString",false);for(int i=0;i<100;i++)bounded.move(0,i%100,0);check(bounded.undoCount()==32);for(int i=0;i<32;i++)bounded.undo();check(!bounded.canUndo());bad(()->bounded.undo());
  bad(()->new GeometryMapState("0 0","LineString",false));bad(()->new GeometryMapState("0 0","Point",true));bad(()->new GeometryMapState("0 0","Other",false));bad(()->new GeometryMapState("NaN 0","Polygon",true));bad(()->new GeometryMapState(null,"Polygon",true));
  // Real KML DOM: move one ring and preserve every adjacent part and attachment link.
  try{
   javax.xml.parsers.DocumentBuilderFactory factory=javax.xml.parsers.DocumentBuilderFactory.newInstance();factory.setNamespaceAware(true);
   String xml="<Placemark xmlns='http://www.opengis.net/kml/2.2' id='one'><description>attachments/keep.bin</description><Style id='style'/><MultiGeometry><LineString><coordinates>20,10,123 21,11,-4 22,12,7</coordinates></LineString><Polygon><outerBoundaryIs><LinearRing><coordinates>0,0,50 1,0,60 1,1,70 0,0,50</coordinates></LinearRing></outerBoundaryIs><innerBoundaryIs><LinearRing><coordinates>0.1,0.1 0.2,0.1 0.2,0.2 0.1,0.1</coordinates></LinearRing></innerBoundaryIs></Polygon></MultiGeometry></Placemark>";
   org.w3c.dom.Element feature=factory.newDocumentBuilder().parse(new java.io.ByteArrayInputStream(xml.getBytes("UTF-8"))).getDocumentElement();
   List<GeometryEdits.Part> parts=GeometryEdits.parts(feature);String adjacent=parts.get(0).text,holeText=parts.get(2).text;GeometryEdits.Part outer=parts.get(1);
   GeometryMapState state=new GeometryMapState(outer.text,outer.type,false);state.move(0,-2,-2);state.select(1);state.insert(2,0);
   GeometryEdits.replace(feature,outer.key,outer.token,state.text());parts=GeometryEdits.parts(feature);
   check(parts.get(0).text.equals(adjacent)&&parts.get(2).text.equals(holeText));check(feature.getElementsByTagNameNS("*","description").item(0).getTextContent().equals("attachments/keep.bin"));check(feature.getElementsByTagNameNS("*","Style").getLength()==1);
   List<double[]> ring=GeometryCoordinates.parse(parts.get(1).text,"Polygon");check(ring.get(0)[2]==50&&Arrays.equals(ring.get(0),ring.get(ring.size()-1)));
   boolean stale=false;try{GeometryEdits.replace(feature,outer.key,outer.token,state.text());}catch(IllegalStateException e){stale=true;}check(stale);
  }catch(Exception e){throw new RuntimeException(e);}
  try{
   java.io.File directory=java.nio.file.Files.createTempDirectory("map-draft-").toFile();String token=String.join("",Collections.nCopies(64,"a"));
   GeometryDraft first=new GeometryDraft("0/outer",token,"0 0",false),newer=new GeometryDraft("0/outer",token,"1 1",false);
   first.save(directory,1,"qa");newer.save(directory,1,"qa");check(!GeometryDraft.discardIfMatches(directory,1,"qa",first));check(GeometryDraft.load(directory,1,"qa").text.equals("1 1"));check(GeometryDraft.discardIfMatches(directory,1,"qa",newer));check(GeometryDraft.load(directory,1,"qa")==null);check(GeometryDraft.discardIfMatches(directory,1,"qa",newer));check(directory.delete());
  }catch(Exception e){throw new RuntimeException(e);}
  System.out.println("PASS GeometryMapState: "+checks+" assertions");
 }
}
