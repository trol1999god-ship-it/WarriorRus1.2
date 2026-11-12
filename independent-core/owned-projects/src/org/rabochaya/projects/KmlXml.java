package org.rabochaya.projects;

import java.io.*;import java.util.UUID;
import java.util.regex.*;
import javax.xml.parsers.SAXParserFactory;import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.*;import javax.xml.transform.dom.DOMSource;import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.*;import org.xml.sax.*;import org.xml.sax.helpers.DefaultHandler;

/** Work around Android 6 Transformer emitting individual UTF-16 surrogate references.
 * Only a private clone is transformed; returned UTF-8 must parse before any caller can save it. */
public final class KmlXml {
 private static final int MAX_XML=4*1024*1024;
 private KmlXml(){}
 public static byte[] write(Document document)throws IOException{
  try{
   if(document==null)throw new IOException("Отсутствует документ KML");
   String prefix;do{prefix="rK"+UUID.randomUUID().toString().substring(0,8)+"_";}while(contains(document,prefix,0));
   // Android 6 cannot clone Document nodes; import its children into a new owner.
   Document copy=DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();copy.setXmlVersion(document.getXmlVersion());copy.setXmlStandalone(document.getXmlStandalone());
   for(Node n=document.getFirstChild();n!=null;n=n.getNextSibling())copy.appendChild(copy.importNode(n,true));protect(copy,prefix,0);
   Transformer transformer=TransformerFactory.newInstance().newTransformer();transformer.setOutputProperty("encoding","UTF-8");transformer.setOutputProperty("indent","no");
   ByteArrayOutputStream buffer=new ByteArrayOutputStream();OutputStream limited=new FilterOutputStream(buffer){int count;public void write(int b)throws IOException{if(++count>32*1024*1024)throw new IOException("Слишком большой XML");out.write(b);}public void write(byte[] b,int off,int len)throws IOException{if(len>32*1024*1024-count)throw new IOException("Слишком большой XML");count+=len;out.write(b,off,len);}};
   transformer.transform(new DOMSource(copy),new StreamResult(limited));
   Matcher m=Pattern.compile(Pattern.quote(prefix)+"([0-9a-f]{5,6})_").matcher(new String(buffer.toByteArray(),"UTF-8"));StringBuffer text=new StringBuffer();
   while(m.find()){int point=Integer.parseInt(m.group(1),16);if(point<0x10000||point>0x10ffff)throw new IOException("Неверная замена символа XML");m.appendReplacement(text,Matcher.quoteReplacement(new String(Character.toChars(point))));}m.appendTail(text);
   byte[] result=text.toString().getBytes("UTF-8");if(result.length>MAX_XML)throw new IOException("KML слишком велик");
   SAXParserFactory parser=SAXParserFactory.newInstance();parser.setNamespaceAware(true);parser.newSAXParser().parse(new ByteArrayInputStream(result),new DefaultHandler(){public InputSource resolveEntity(String publicId,String systemId)throws SAXException{throw new SAXException("Внешние сущности XML запрещены");}});
   return result;
  }catch(IOException error){throw error;}catch(Exception error){throw new IOException("Ошибка записи KML",error);}
 }
 private static boolean contains(Node node,String prefix,int depth)throws IOException{if(depth>256)throw new IOException("Слишком глубокий XML");String value=node.getNodeValue();if(value!=null&&value.contains(prefix))return true;NamedNodeMap attributes=node.getAttributes();if(attributes!=null)for(int i=0;i<attributes.getLength();i++)if(contains(attributes.item(i),prefix,depth+1))return true;for(Node n=node.getFirstChild();n!=null;n=n.getNextSibling())if(contains(n,prefix,depth+1))return true;return false;}
 private static void protect(Node node,String prefix,int depth)throws IOException{
  if(depth>256)throw new IOException("Слишком глубокий XML");
  if(node.getNodeType()==Node.DOCUMENT_TYPE_NODE||node.getNodeType()==Node.ENTITY_REFERENCE_NODE)throw new IOException("DTD и сущности XML запрещены");
  String value=node.getNodeValue();if(value!=null){StringBuilder out=new StringBuilder();for(int i=0;i<value.length();){int point=value.codePointAt(i);if(!(point==9||point==10||point==13||point>=32&&point<=0xd7ff||point>=0xe000&&point<=0xfffd||point>=0x10000&&point<=0x10ffff))throw new IOException("Недопустимый символ XML");if(point>=0x10000)out.append(prefix).append(Integer.toHexString(point)).append('_');else out.append((char)point);i+=Character.charCount(point);}node.setNodeValue(out.toString());}
  NamedNodeMap attributes=node.getAttributes();if(attributes!=null)for(int i=0;i<attributes.getLength();i++)protect(attributes.item(i),prefix,depth+1);
  for(Node n=node.getFirstChild();n!=null;n=n.getNextSibling())protect(n,prefix,depth+1);
 }
}
