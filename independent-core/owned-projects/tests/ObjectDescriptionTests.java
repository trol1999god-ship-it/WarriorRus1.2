import org.rabochaya.projects.*;
import java.util.*;import org.w3c.dom.*;import javax.xml.parsers.*;import javax.xml.transform.*;import javax.xml.transform.dom.DOMSource;import javax.xml.transform.stream.StreamResult;import java.io.*;
public final class ObjectDescriptionTests {
 static int checks;
 static void check(boolean yes){checks++;if(!yes)throw new AssertionError("check "+checks);}
 static Element parse(String text)throws Exception{DocumentBuilderFactory f=DocumentBuilderFactory.newInstance();f.setNamespaceAware(true);return f.newDocumentBuilder().parse(new ByteArrayInputStream(text.getBytes("UTF-8"))).getDocumentElement();}
 static String xml(Element e)throws Exception{StringWriter out=new StringWriter();TransformerFactory.newInstance().newTransformer().transform(new DOMSource(e),new StreamResult(out));return out.toString();}
 static void rejects(Element root,Runnable action)throws Exception{String before=xml(root),token=ObjectTree.token(root);boolean rejected=false;try{action.run();}catch(IllegalArgumentException|IllegalStateException e){rejected=true;}check(rejected);check(before.equals(xml(root)));check(token.equals(ObjectTree.token(root)));}
 static String read(Element root,String key){return ObjectDescription.read(root,key,ObjectTree.token(root));}
 static boolean save(Element root,String key,String value){return ObjectDescription.apply(root,key,ObjectTree.token(root),value);}
 public static void main(String[] args)throws Exception{
  String ns="http://www.opengis.net/kml/2.2",id="rk-media-11111111-1111-1111-1111-111111111111",id2="rk-media-22222222-2222-2222-2222-222222222222";
  String block="<!--"+id+"--><a href=\"attachments/keep.png\">Фото</a><!--/"+id+"-->",block2="<!--"+id2+"--><img src=\"attachments/second.png\"/><!--/"+id2+"-->";
  Element root=parse("<Document xmlns='"+ns+"' xmlns:x='urn:foreign'><Style id='s'/><Folder id='f'><name>Папка</name><description><![CDATA[  <b>текст &amp; ссылка</b>\n]]></description><Placemark id='p'><name>Точка</name><visibility>0</visibility><TimeStamp><when>2026-10-29</when></TimeStamp><styleUrl>#s</styleUrl><ExtendedData><x:data>keep</x:data></ExtendedData><Point><altitudeMode>absolute</altitudeMode><coordinates>37,54,123</coordinates></Point></Placemark></Folder></Document>");
  String token=ObjectTree.token(root),before=xml(root);check(read(root,"0").equals("  <b>текст &amp; ссылка</b>\n"));check(!save(root,"0",read(root,"0")));check(xml(root).equals(before));check(token.equals(ObjectTree.token(root)));
  Element feature=ObjectTree.resolve(root,"0/0");String featureBefore=xml(feature),folderName=ObjectTree.rows(root).get(0).name;
  check(save(root,"0","<p>Описание & ссылка <a href='https://invalid.example/never-fetch'>здесь</a></p>"));check(xml(feature).equals(featureBefore));check(ObjectTree.rows(root).get(0).name.equals(folderName));check(!ObjectTree.token(root).equals(token));
  rejects(root,()->ObjectDescription.apply(root,"0",token,"stale"));rejects(root,()->ObjectDescription.read(root,"0",null));rejects(root,()->save(root,"","root"));rejects(root,()->save(root,"99","missing"));rejects(root,()->save(root,"00","invalid"));
  check(read(root,"0/0").isEmpty());check(!save(root,"0/0",""));check(xml(feature).equals(featureBefore));check(save(root,"0/0","  a\nб\t😀 & < > \r\n"));check(read(root,"0/0").equals("  a\nб\t😀 & < > \r\n"));
  Element description=(Element)feature.getElementsByTagNameNS(ns,"description").item(0);feature.removeChild(description);check(xml(feature).equals(featureBefore));feature.insertBefore(description,feature.getElementsByTagNameNS(ns,"TimeStamp").item(0));
  check(save(root,"0/0",""));check(read(root,"0/0").isEmpty());check(!save(root,"0/0",""));
  for(String invalid:Arrays.asList("\u0000","x\u0001y","\u000b","\ud800","\udfff","\ufffe","\uffff",String.join("",Collections.nCopies(100001,"a")),"<!--rk-media-test-->","<!--/rk-media-test-->"))rejects(root,()->save(root,"0/0",invalid));
  rejects(root,()->save(root,"0",null));String max=String.join("",Collections.nCopies(100000,"x"));check(save(root,"0/0",max));check(read(root,"0/0").equals(max));
  for(String namespace:Arrays.asList("",ns,"http://earth.google.com/kml/2.0","http://earth.google.com/kml/2.1","http://earth.google.com/kml/2.2")){
   Element e=parse("<Document"+(namespace.isEmpty()?"":" xmlns='"+namespace+"'")+"><Placemark><name>P</name><Point><coordinates>1,2,3</coordinates></Point></Placemark></Document>");check(save(e,"0","Текст <b>& 😀"));check(read(e,"0").equals("Текст <b>& 😀"));check(!save(e,"0",read(e,"0")));check(read(parse(xml(e)),"0").equals("Текст <b>& 😀"));
  }
  Element prefix=parse("<k:Document xmlns:k='"+ns+"' xmlns:x='urn:foreign'><k:Folder><k:name>F</k:name><x:description>opaque</x:description></k:Folder></k:Document>");check(save(prefix,"0","new"));check(ObjectTree.resolve(prefix,"0").getElementsByTagNameNS(ns,"description").item(0).getPrefix().equals("k"));check(prefix.getElementsByTagNameNS("urn:foreign","description").item(0).getTextContent().equals("opaque"));
  String media="<ExtendedData><Data name='"+id+"'><value>attachments/keep.png</value></Data><Data name='"+id2+"'><value>attachments/second.png</value></Data></ExtendedData>";
  Element attachments=parse("<Document><Placemark><name>P</name><description><![CDATA[before"+block2+"after"+block+"]]></description>"+media+"<Point><coordinates>1,2,3</coordinates></Point></Placemark></Document>");
  String original=xml(attachments),mediaXml=xml((Element)attachments.getElementsByTagName("ExtendedData").item(0));check(read(attachments,"0").equals("beforeafter"));check(!save(attachments,"0","beforeafter"));check(xml(attachments).equals(original));
  check(save(attachments,"0","<b>new</b>"));check(attachments.getElementsByTagName("description").item(0).getTextContent().equals("<b>new</b>"+block2+block));check(xml((Element)attachments.getElementsByTagName("ExtendedData").item(0)).equals(mediaXml));check(read(attachments,"0").equals("<b>new</b>"));
  for(int i=0;i<10;i++){check(save(attachments,"0","edit "+i));check(read(attachments,"0").equals("edit "+i));check(!save(attachments,"0","edit "+i));}
  check(save(attachments,"0",""));check(attachments.getElementsByTagName("description").item(0).getTextContent().equals(block2+block));check(read(attachments,"0").isEmpty());check(!save(attachments,"0",""));
  for(String body:Arrays.asList("<description>a</description><description>b</description>","<description><b>XML child</b></description>","<description>a<!-- XML comment -->b</description>","<description><?pi test?></description>","<ExtendedData/><ExtendedData/>")){
   Element bad=parse("<Document><Placemark>"+body+"</Placemark></Document>");rejects(bad,()->save(bad,"0","no data loss"));
  }
  for(String broken:Arrays.asList("<!--"+id+"-->","<!--/"+id+"-->",block+block,"<!--/"+id+"--><!--"+id+"-->","<!--"+id+"-->"+block2+"<!--/"+id+"-->")){
   Element bad=parse("<Document><Placemark><description><![CDATA["+broken+"]]></description>"+media+"</Placemark></Document>");rejects(bad,()->save(bad,"0","safe"));
  }
  Element duplicate=parse("<Document><Placemark><description><![CDATA["+block+"]]></description><ExtendedData><Data name='"+id+"'/><Data name='"+id+"'/></ExtendedData></Placemark></Document>");rejects(duplicate,()->save(duplicate,"0","safe"));
  Element noBlock=parse("<Document><Placemark>"+media+"</Placemark></Document>");check(save(noBlock,"0","text"));check(read(noBlock,"0").equals("text"));check(xml((Element)noBlock.getElementsByTagName("ExtendedData").item(0)).equals(mediaXml));
  check(read(parse(xml(attachments)),"0").isEmpty());check(xml((Element)attachments.getElementsByTagName("ExtendedData").item(0)).equals(mediaXml));
  System.out.println("PASS ObjectDescription: "+checks+" assertions");
 }
}
