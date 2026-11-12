import org.rabochaya.projects.*;import org.w3c.dom.*;import javax.xml.parsers.*;import java.io.*;import java.util.*;
public final class KmlComponentStyleEditTests {
 static int n;static void ck(boolean yes){n++;if(!yes)throw new AssertionError("component edit "+n);}
 static Element parse(String text)throws Exception{DocumentBuilderFactory f=DocumentBuilderFactory.newInstance();f.setNamespaceAware(true);return f.newDocumentBuilder().parse(new ByteArrayInputStream(text.getBytes("UTF-8"))).getDocumentElement();}
 static byte[] xml(Element root)throws IOException{return KmlXml.write(root.getOwnerDocument());}
 static void apply(Element root,String op,String value){KmlComponentStyleEdit.apply(root,"0",ObjectTree.token(root),op,value);}
 static KmlComponentStyle style(Element root){return new KmlComponentStyle.Resolver(root.getOwnerDocument()).resolve(ObjectTree.resolve(root,"0"));}
 public static void main(String[] args)throws Exception{
  Element root=parse("<Document xmlns='http://www.opengis.net/kml/2.2'><Style id='s'><LineStyle><color>ffff0000</color><width>7</width></LineStyle><PolyStyle><fill>1</fill></PolyStyle></Style><StyleMap id='m'><Pair><key>normal</key><styleUrl>#s</styleUrl></Pair></StyleMap><Placemark id='p'><name>Свой</name><styleUrl>#m</styleUrl><Style><LineStyle><width>9</width></LineStyle><IconStyle><Icon><href>attachments/keep.svg</href></Icon></IconStyle></Style><Point><coordinates>10,20,30</coordinates></Point><ExtendedData><Data name='keep'><value>😀</value></Data></ExtendedData></Placemark><Placemark id='other'><styleUrl>#m</styleUrl><Point><coordinates>40,50</coordinates></Point></Placemark><Folder/></Document>");
  Node shared=root.getFirstChild().cloneNode(true),other=ObjectTree.resolve(root,"1").cloneNode(true),point=ObjectTree.resolve(root,"0").getElementsByTagNameNS("*","Point").item(0).cloneNode(true);
  ck(KmlComponentStyleEdit.read(root,"0",ObjectTree.token(root),"component-line").isEmpty());ck(style(root).line==0xff0000ff);
  String[] ops={"component-icon","component-line","component-polygon","component-label","component-fill","component-outline"};String[] values={"ff00ff00","ff0000ff","800000ff","4000ffff","0","0"};
  for(int i=0;i<ops.length;i++){apply(root,ops[i],values[i]);ck(KmlComponentStyleEdit.read(root,"0",ObjectTree.token(root),ops[i]).equals(values[i]));}
  KmlComponentStyle s=style(root);ck(s.icon==0xff00ff00&&s.line==0xffff0000&&s.polygon==0x80ff0000&&s.label==0x40ffff00&&!s.fill&&!s.outline);
  ck(shared.isEqualNode(root.getFirstChild()));ck(other.isEqualNode(ObjectTree.resolve(root,"1")));ck(point.isEqualNode(ObjectTree.resolve(root,"0").getElementsByTagNameNS("*","Point").item(0)));
  ck(ObjectTree.resolve(root,"0").getElementsByTagNameNS("*","width").item(0).getTextContent().equals("9"));ck(ObjectTree.resolve(root,"0").getElementsByTagNameNS("*","href").item(0).getTextContent().equals("attachments/keep.svg"));
  for(String bad:new String[]{"fff","#ff0000","fffffffff","xyz","ff 0000ff"}){byte[] before=xml(root);boolean refused=false;try{apply(root,"component-line",bad);}catch(IllegalArgumentException e){refused=true;}ck(refused&&Arrays.equals(before,xml(root)));}
  for(String bad:new String[]{"true","2","yes"}){byte[] before=xml(root);boolean refused=false;try{apply(root,"component-fill",bad);}catch(IllegalArgumentException e){refused=true;}ck(refused&&Arrays.equals(before,xml(root)));}
  String stale=ObjectTree.token(root);apply(root,"component-line","ffabcdef");byte[] before=xml(root);boolean refused=false;try{KmlComponentStyleEdit.apply(root,"0",stale,"component-line","ffffffff");}catch(IllegalStateException e){refused=true;}ck(refused&&Arrays.equals(before,xml(root)));
  refused=false;try{KmlComponentStyleEdit.apply(root,"2",ObjectTree.token(root),"component-line","ffffffff");}catch(IllegalArgumentException e){refused=true;}ck(refused&&Arrays.equals(before,xml(root)));
  apply(root,"component-line","");ck(style(root).line==0xff0000ff);apply(root,"component-fill","");ck(style(root).fill);ck(shared.isEqualNode(root.getFirstChild())&&other.isEqualNode(ObjectTree.resolve(root,"1")));
  Element round=parse(new String(xml(root),"UTF-8"));ck(style(round).line.equals(style(root).line)&&style(round).outline.equals(style(root).outline));
  for(String op:ops){ObjectEditorDraft d=new ObjectEditorDraft(7,op,"0",ObjectTree.token(root),"raw",1,2);ck(d.matches(7,root)&&!d.matches(8,root)&&d.start==1&&d.end==2);}
  System.out.println("PASS KML component editing: "+n+" assertions");
 }
}
