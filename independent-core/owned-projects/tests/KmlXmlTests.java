import org.rabochaya.projects.KmlXml;
import org.w3c.dom.*;import java.io.*;import java.util.*;import javax.xml.parsers.*;
public final class KmlXmlTests {
 static int checks;
 static void check(boolean yes){checks++;if(!yes)throw new AssertionError("check "+checks);}
 static Document parse(String xml)throws Exception{DocumentBuilderFactory f=DocumentBuilderFactory.newInstance();f.setNamespaceAware(true);return f.newDocumentBuilder().parse(new ByteArrayInputStream(xml.getBytes("UTF-8")));}
 static void rejects(Document doc)throws Exception{boolean bad=false;try{KmlXml.write(doc);}catch(IOException error){bad=true;}check(bad);}
 public static void main(String[] args)throws Exception{
  String note="😀 𠀀 𐀀 "+new String(Character.toChars(0x10ffff))+" & < > \" ' ";
  Document d=parse("<k:Document xmlns:k='http://www.opengis.net/kml/2.2' xmlns:x='urn:foreign'><k:Placemark id='p' x:value='😀'><k:name>😀 name</k:name><k:description><![CDATA[😀 literal &#55357;&#56832; &amp; <b>HTML</b>]]></k:description><k:ExtendedData><x:data>𠀀</x:data></k:ExtendedData><k:Point><k:coordinates>1,2,3</k:coordinates></k:Point></k:Placemark><!--😀--><?passive 😀?></k:Document>");
  String before=d.getDocumentElement().getTextContent();byte[] first=KmlXml.write(d);Document round=parse(new String(first,"UTF-8"));check(Arrays.equals(first,KmlXml.write(d)));check(round.getDocumentElement().getTextContent().equals(before));check(d.getDocumentElement().getTextContent().equals(before));
  Element placemark=(Element)round.getElementsByTagNameNS("*","Placemark").item(0);check(placemark.getAttributeNS("urn:foreign","value").equals("😀"));check(round.getElementsByTagNameNS("*","description").item(0).getTextContent().equals("😀 literal &#55357;&#56832; &amp; <b>HTML</b>"));
  for(int i=0;i<5;i++){round=parse(new String(KmlXml.write(round),"UTF-8"));check(round.getDocumentElement().getTextContent().equals(before));}
  Element description=(Element)d.getElementsByTagNameNS("*","description").item(0);description.setTextContent(note);String exact=description.getTextContent();Document saved=parse(new String(KmlXml.write(d),"UTF-8"));check(saved.getElementsByTagNameNS("*","description").item(0).getTextContent().equals(note));check(description.getTextContent().equals(exact));
  for(String value:Arrays.asList("\ud800","\udfff","\u0000","\u0001","\ufffe","\uffff")){description.setTextContent(value);rejects(d);check(description.getTextContent().equals(value));}
  description.setTextContent("text &#xD83D;&#xDE00; &#55357;&#56832; <!--rKprefix_--> ]]> &😀");check(parse(new String(KmlXml.write(d),"UTF-8")).getElementsByTagNameNS("*","description").item(0).getTextContent().equals(description.getTextContent()));
  d.getDocumentElement().setAttribute("extra","\ud800");rejects(d);d.getDocumentElement().removeAttribute("extra");
  Document doctype=parse("<!DOCTYPE Document [<!ENTITY literal 'safe'>]><Document>safe</Document>");rejects(doctype);
  Document entity=parse("<Document/>");entity.getDocumentElement().appendChild(entity.createEntityReference("unknown"));rejects(entity);
  Document deep=parse("<Document/>");Node at=deep.getDocumentElement();for(int i=0;i<260;i++){Node next=deep.createElement("x");at.appendChild(next);at=next;}rejects(deep);
  Document large=parse("<Document/>");large.getDocumentElement().setTextContent(String.join("",Collections.nCopies(4*1024*1024,"x")));rejects(large);
  Document controls=parse("<Document/>");controls.getDocumentElement().setTextContent("\t\n\r Пробелы 😀");check(parse(new String(KmlXml.write(controls),"UTF-8")).getDocumentElement().getTextContent().equals(controls.getDocumentElement().getTextContent()));
  System.out.println("PASS KmlXml: "+checks+" assertions");
 }
}
