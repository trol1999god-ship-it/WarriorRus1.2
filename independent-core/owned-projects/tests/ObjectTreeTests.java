import org.rabochaya.projects.ObjectTree;
import java.util.*;import org.w3c.dom.*;import javax.xml.parsers.*;import javax.xml.transform.*;import javax.xml.transform.dom.DOMSource;import javax.xml.transform.stream.StreamResult;import java.io.*;
public final class ObjectTreeTests {
 static int checks;
 static void check(boolean yes){checks++;if(!yes)throw new AssertionError("check "+checks);}
 static Element parse(String xml)throws Exception{DocumentBuilderFactory f=DocumentBuilderFactory.newInstance();f.setNamespaceAware(true);return f.newDocumentBuilder().parse(new ByteArrayInputStream(xml.getBytes("UTF-8"))).getDocumentElement();}
 static String xml(Element e)throws Exception{StringWriter w=new StringWriter();TransformerFactory.newInstance().newTransformer().transform(new DOMSource(e),new StreamResult(w));return w.toString();}
 static void rejects(Element root,Runnable action)throws Exception{String before=xml(root);boolean bad=false;try{action.run();}catch(IllegalArgumentException|IllegalStateException e){bad=true;}check(bad);check(before.equals(xml(root)));}
 public static void main(String[] args)throws Exception{
  Element root=parse("<Document xmlns='http://www.opengis.net/kml/2.2' xmlns:x='urn:extra'><name>Project</name><Style id='shared'><LineStyle><color>ff00ff00</color></LineStyle></Style><Folder id='source'><name>A</name><visibility>0</visibility><Placemark id='one'><name>One</name><description><![CDATA[<a href='attachments/keep.bin'>keep</a>]]></description><styleUrl>#shared</styleUrl><ExtendedData><x:unknown id='custom'>opaque</x:unknown></ExtendedData><MultiGeometry><LineString><altitudeMode>absolute</altitudeMode><coordinates>10,20,123 11,21,-7</coordinates></LineString><Polygon><outerBoundaryIs><LinearRing><coordinates>0,0,1 2,0,2 2,2,3 0,0,1</coordinates></LinearRing></outerBoundaryIs><innerBoundaryIs><LinearRing><coordinates>0.1,0.1 0.2,0.1 0.2,0.2 0.1,0.1</coordinates></LinearRing></innerBoundaryIs></Polygon></MultiGeometry></Placemark><Folder><name>Nested</name><Placemark><name>Child</name></Placemark></Folder></Folder><Folder id='target'><name>B</name></Folder><x:Folder>foreign</x:Folder><NetworkLink><name>Passive</name><Link><href>https://invalid.example/private</href></Link></NetworkLink></Document>");
  check(ObjectTree.rows(root).size()==6);check(ObjectTree.rows(root).get(0).name.equals("A"));check(ObjectTree.rows(root).get(1).parent.equals("0"));check(ObjectTree.rows(root).get(3).depth==2);
  Element one=ObjectTree.resolve(root,"0/0"),target=ObjectTree.resolve(root,"1"),source=ObjectTree.resolve(root,"0");String content=xml(one),token=ObjectTree.token(root);
  check(ObjectTree.selectedCount(root,Arrays.asList("0","0/0","0/1/0"))==4);
  rejects(root,()->ObjectTree.move(root,Arrays.asList("0"),"0/1",token));rejects(root,()->ObjectTree.move(root,Arrays.asList("0"),"0",token));rejects(root,()->ObjectTree.move(root,Arrays.asList("0/0","9"),"1",token));
  rejects(root,()->ObjectTree.delete(root,Arrays.asList("0/0","9"),token));rejects(root,()->ObjectTree.move(root,Arrays.asList("0/0"),"0/0",token));
  check(ObjectTree.move(root,Arrays.asList("0/0"),"1",token)==1);check(one.getParentNode()==target&&xml(one).equals(content));check(source.getElementsByTagNameNS("*","Placemark").getLength()==1);check(root.getElementsByTagNameNS("urn:extra","Folder").getLength()==1);
  rejects(root,()->ObjectTree.rename(root,"1/0",token,"lost update"));
  String now=ObjectTree.token(root);check(ObjectTree.move(root,Arrays.asList("1/0"),"1",now)==0);check(now.equals(ObjectTree.token(root)));
  ObjectTree.createFolder(root,"1",now,"  Group  ");check(ObjectTree.resolve(root,"1/1").getLocalName().equals("Folder"));check(ObjectTree.rows(root).get(5).name.equals("Group"));
  String renameToken=ObjectTree.token(root);rejects(root,()->ObjectTree.rename(root,"1/0",renameToken,"\n"));rejects(root,()->ObjectTree.rename(root,"1/0",renameToken,"x\u0001y"));rejects(root,()->ObjectTree.createFolder(root,"1",renameToken,String.join("",Collections.nCopies(1001,"x"))));
  ObjectTree.rename(root,"1/1",renameToken,"Renamed");check(ObjectTree.resolve(root,"1/1").getTextContent().equals("Renamed"));check(xml(one).equals(content));
  String moveToken=ObjectTree.token(root);check(ObjectTree.move(root,Arrays.asList("1/0","1","1/1"),"0",moveToken)==1);check(target.getParentNode()==source);check(xml(one).equals(content));
  rejects(root,()->ObjectTree.delete(root,Arrays.asList(""),ObjectTree.token(root)));rejects(root,()->ObjectTree.delete(root,Arrays.asList("00"),ObjectTree.token(root)));rejects(root,()->ObjectTree.delete(root,Arrays.asList("999999999999999999999"),ObjectTree.token(root)));
  check(ObjectTree.delete(root,Arrays.asList("0/1/1"),ObjectTree.token(root))==1);check(xml(one).equals(content));
  Element shared=parse("<Document xmlns='http://www.opengis.net/kml/2.2'><Folder><Style id='s'/><Schema id='schema'/><Placemark><name>Keep?</name></Placemark></Folder><Placemark><styleUrl>#s</styleUrl><ExtendedData><SchemaData schemaUrl='#schema'/></ExtendedData></Placemark></Document>");
  rejects(shared,()->ObjectTree.delete(shared,Arrays.asList("0"),ObjectTree.token(shared)));check(ObjectTree.delete(shared,Arrays.asList("0","1"),ObjectTree.token(shared))==2);check(ObjectTree.rows(shared).isEmpty());
  Element prefix=parse("<k:Document xmlns:k='http://www.opengis.net/kml/2.2'><k:Placemark><k:name>P</k:name></k:Placemark></k:Document>");ObjectTree.createFolder(prefix,"",ObjectTree.token(prefix),"Папка & < >");check(ObjectTree.resolve(prefix,"1").getPrefix().equals("k"));check(ObjectTree.rows(prefix).get(1).name.equals("Папка & < >"));
  Element deep=parse("<Document/>");Element at=deep;for(int i=0;i<32;i++){Element f=deep.getOwnerDocument().createElement("Folder");at.appendChild(f);at=f;}
  check(ObjectTree.rows(deep).size()==32);String key=String.join("/",Collections.nCopies(32,"0"));rejects(deep,()->ObjectTree.createFolder(deep,key,ObjectTree.token(deep),"too deep"));
  Element order=parse("<Document><Folder><name>Destination</name></Folder><Placemark><name>one</name></Placemark><Placemark><name>two</name></Placemark></Document>");ObjectTree.move(order,Arrays.asList("2","1"),"0",ObjectTree.token(order));check(ObjectTree.rows(order).get(1).name.equals("one"));check(ObjectTree.rows(order).get(2).name.equals("two"));
  check(!ObjectTree.token(order).equals(ObjectTree.token(prefix)));
  System.out.println("PASS ObjectTree: "+checks+" assertions");
 }
}
