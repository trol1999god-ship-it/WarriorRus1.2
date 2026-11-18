import org.rabochaya.projects.*;import org.w3c.dom.*;import javax.xml.parsers.*;import javax.xml.validation.*;import javax.xml.transform.*;import javax.xml.transform.dom.*;import javax.xml.transform.stream.*;import javax.xml.XMLConstants;import java.io.*;import java.util.*;
public final class KmlComponentStyleEditTests {
 static int n;static void ck(boolean yes){n++;if(!yes)throw new AssertionError("component edit "+n);}
 static Element parse(String text)throws Exception{DocumentBuilderFactory f=DocumentBuilderFactory.newInstance();f.setNamespaceAware(true);return f.newDocumentBuilder().parse(new ByteArrayInputStream(text.getBytes("UTF-8"))).getDocumentElement();}
 static byte[] xml(Element root)throws IOException{return KmlXml.write(root.getOwnerDocument());}
 static void apply(Element root,String op,String value){KmlComponentStyleEdit.apply(root,"0",ObjectTree.token(root),op,value);}
 static KmlComponentStyle style(Element root){return new KmlComponentStyle.Resolver(root.getOwnerDocument()).resolve(ObjectTree.resolve(root,"0"));}
 static void schemaOrder(String path)throws Exception{
  java.nio.file.Path schemas=java.nio.file.Paths.get(path);SchemaFactory f=SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);f.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING,true);f.setProperty(XMLConstants.ACCESS_EXTERNAL_DTD,"");f.setProperty(XMLConstants.ACCESS_EXTERNAL_SCHEMA,"");Schema schema=f.newSchema(new Source[]{new StreamSource(schemas.resolve("atom-author-link.xsd").toFile()),new StreamSource(schemas.resolve("xAL.xsd").toFile()),new StreamSource(schemas.resolve("ogckml22.xsd").toFile())});String[] initial={"<ExtendedData><Data name='sentinel'><value>keep</value></Data></ExtendedData>","<Style><LineStyle><width>9</width></LineStyle></Style>","","<Style><PolyStyle><outline>0</outline></PolyStyle></Style>","<Style><IconStyle><scale>2</scale><Icon><href>icons/test.svg</href></Icon></IconStyle></Style>"};
  for(int i=0;i<initial.length;i++){
   Element kml=parse("<kml xmlns='http://www.opengis.net/kml/2.2'><Document><Placemark id='p'><name>QA</name>"+initial[i]+"<LineString><coordinates>10,20 11,21</coordinates></LineString></Placemark><Placemark id='other'><Point><coordinates>40,50</coordinates></Point></Placemark></Document></kml>");
   schema.newValidator().validate(new DOMSource(kml.getOwnerDocument()));ck(true);
   Element root=(Element)kml.getElementsByTagNameNS("*","Document").item(0);
   Node other=ObjectTree.resolve(root,"1").cloneNode(true), geometry=ObjectTree.resolve(root,"0").getElementsByTagNameNS("*","LineString").item(0).cloneNode(true);
   String op=i==3?"component-fill":i==4?"component-icon":"component-line";
   apply(root,op,i==3?"1":"ff0000ff");if(i==2)apply(root,"component-icon","ff00ff00");
   schema.newValidator().validate(new DOMSource(kml.getOwnerDocument()));ck(true);
   Element round=parse(new String(xml(kml),"UTF-8"));schema.newValidator().validate(new DOMSource(round.getOwnerDocument()));ck(true);
   ck(other.isEqualNode(ObjectTree.resolve(root,"1"))&&geometry.isEqualNode(ObjectTree.resolve(root,"0").getElementsByTagNameNS("*","LineString").item(0)));
   if(i==0)ck(root.getElementsByTagNameNS("*","value").item(0).getTextContent().equals("keep"));
   if(i==1)ck(root.getElementsByTagNameNS("*","width").item(0).getTextContent().equals("9"));
   if(i==3)ck(root.getElementsByTagNameNS("*","outline").item(0).getTextContent().equals("0"));
   if(i==4)ck(root.getElementsByTagNameNS("*","scale").item(0).getTextContent().equals("2")&&root.getElementsByTagNameNS("*","href").item(0).getTextContent().equals("icons/test.svg"));
  }
 }
 static Float metric(KmlComponentStyle style,String field)throws Exception{return (Float)KmlComponentStyle.class.getField(field).get(style);}
 static void metrics(String path)throws Exception{
  ck(KmlComponentStyleEdit.operation("component-width"));ck(KmlComponentStyleEdit.operation("component-label-scale"));
  ck(KmlComponentStyleEdit.value("component-width","2.50").equals("2.5"));
  String ns="http://www.opengis.net/kml/2.2";
  Element kml=parse("<kml xmlns='"+ns+"'><Document><Style id='s'><LabelStyle><scale>2</scale></LabelStyle><LineStyle><color>ff0000ff</color><width>8</width></LineStyle></Style><StyleMap id='m'><Pair><key>normal</key><styleUrl>#s</styleUrl></Pair></StyleMap><Placemark><styleUrl>#m</styleUrl><Style><LineStyle><width>3</width></LineStyle></Style><LineString><coordinates>10,20 11,21</coordinates></LineString></Placemark><Placemark><Point><coordinates>40,50</coordinates></Point></Placemark></Document></kml>");
  Element root=(Element)kml.getElementsByTagNameNS(ns,"Document").item(0);Node shared=root.getFirstChild().cloneNode(true),map=root.getChildNodes().item(1).cloneNode(true),other=ObjectTree.resolve(root,"1").cloneNode(true);
  ck(metric(style(root),"width")==3f&&metric(style(root),"labelScale")==2f);
  apply(root,"component-width","0");apply(root,"component-label-scale","1.5");ck(metric(style(root),"width")==0f&&metric(style(root),"labelScale")==1.5f);
  ck(style(root).line==0xffff0000);ck(KmlComponentStyleEdit.read(root,"0",ObjectTree.token(root),"component-label-scale").equals("1.5"));
  for(String op:new String[]{"component-width","component-label-scale"}){
   for(String bad:new String[]{"-1","NaN","INF","Infinity","0x1p0","1e300",op.equals("component-width")?"257":"16.1"}){byte[] before=xml(kml);boolean refused=false;try{apply(root,op,bad);}catch(IllegalArgumentException e){refused=true;}ck(refused&&Arrays.equals(before,xml(kml)));}
  }
  apply(root,"component-label-scale","0");ck(metric(style(root),"labelScale")==0f);
  apply(root,"component-width","");apply(root,"component-label-scale","");ck(metric(style(root),"width")==8f&&metric(style(root),"labelScale")==2f);
  ck(shared.isEqualNode(root.getFirstChild())&&map.isEqualNode(root.getChildNodes().item(1))&&other.isEqualNode(ObjectTree.resolve(root,"1")));
  Element round=parse(new String(xml(kml),"UTF-8"));Element rr=(Element)round.getElementsByTagNameNS(ns,"Document").item(0);ck(metric(style(rr),"width")==8f&&metric(style(rr),"labelScale")==2f);
  java.nio.file.Path schemas=java.nio.file.Paths.get(path);SchemaFactory factory=SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);factory.setProperty(XMLConstants.ACCESS_EXTERNAL_DTD,"");factory.setProperty(XMLConstants.ACCESS_EXTERNAL_SCHEMA,"");factory.newSchema(new Source[]{new StreamSource(schemas.resolve("atom-author-link.xsd").toFile()),new StreamSource(schemas.resolve("xAL.xsd").toFile()),new StreamSource(schemas.resolve("ogckml22.xsd").toFile())}).newValidator().validate(new DOMSource(round.getOwnerDocument()));ck(true);
 }
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
  schemaOrder(args[0]);metrics(args[0]);
  System.out.println("PASS KML component editing: "+n+" assertions");
 }
}
