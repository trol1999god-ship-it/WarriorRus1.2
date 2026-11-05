package org.rabochaya.projects;

import org.w3c.dom.*;
import java.util.*;

/** Passive KML source editor. Keeps application-managed attachment blocks private. */
public final class ObjectDescription {
 public static final int MAX_NOTE=100000;
 private ObjectDescription(){}
 private static final class Content {
  Element property;String note;final List<String> blocks=new ArrayList<>();
 }
 public static String read(Element root,String key,String expected){return content(target(root,key,expected)).note;}
 public static void validate(String note){
  if(note==null||note.length()>MAX_NOTE)throw new IllegalArgumentException("Описание: не более 100 000 символов");
  for(int i=0;i<note.length();){int c=note.codePointAt(i);if(!(c==9||c==10||c==13||c>=32&&c<=0xd7ff||c>=0xe000&&c<=0xfffd||c>=0x10000&&c<=0x10ffff))throw new IllegalArgumentException("Описание содержит недопустимый символ XML");i+=Character.charCount(c);}
  if(note.contains("<!--rk-media-")||note.contains("<!--/rk-media-"))throw new IllegalArgumentException("Служебные блоки вложений меняются в менеджере вложений");
 }
 /** Returns false without touching DOM when the editable source is unchanged. */
 public static boolean apply(Element root,String key,String expected,String note){
  Element feature=target(root,key,expected);Content c=content(feature);validate(note);if(note.equals(c.note))return false;
  StringBuilder value=new StringBuilder(note);for(String block:c.blocks)value.append(block);
  Element property=c.property;
  if(property==null){if(value.length()==0)return false;String prefix=feature.getPrefix();property=feature.getOwnerDocument().createElementNS(feature.getNamespaceURI(),prefix==null||prefix.isEmpty()?"description":prefix+":description");
   // Feature description follows name/visibility/open/address/phone/Snippet metadata.
   Node before=feature.getFirstChild();for(Node n=feature.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element&&isMetadata((Element)n))before=n.getNextSibling();feature.insertBefore(property,before);
  }
  property.setTextContent(value.toString());return true;
 }
 private static boolean isMetadata(Element e){return is(e,"name")||is(e,"visibility")||is(e,"open")||is(e,"address")||is(e,"phoneNumber")||is(e,"Snippet")||is(e,"snippet")||is(e,"AddressDetails");}
 private static Element target(Element root,String key,String expected){if(expected==null||!expected.equals(ObjectTree.token(root)))throw new IllegalStateException("Проект изменился. Перечитайте список и повторите выбор");if(key==null||key.isEmpty())throw new IllegalArgumentException("Выберите один объект или папку");return ObjectTree.resolve(root,key);}
 private static Content content(Element feature){
  Content c=new Content();c.property=single(feature,"description");String raw=c.property==null?"":c.property.getTextContent();
  if(c.property!=null)for(Node n=c.property.getFirstChild();n!=null;n=n.getNextSibling())if(n.getNodeType()!=Node.TEXT_NODE&&n.getNodeType()!=Node.CDATA_SECTION_NODE)throw new IllegalArgumentException("Описание содержит XML-разметку; используйте экспорт для редактирования без потерь");
  Set<String> ids=new LinkedHashSet<>();Element ext=single(feature,"ExtendedData");if(ext!=null)for(Node n=ext.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element&&is((Element)n,"Data")){String id=((Element)n).getAttribute("name");if(id.matches("rk-media-[a-f0-9-]{36}")&&!ids.add(id))throw new IllegalArgumentException("Повтор идентификатора вложения; запись отменена");}
  String editable=raw;for(String id:ids){String start="<!--"+id+"-->",end="<!--/"+id+"-->";int a=editable.indexOf(start),b=editable.indexOf(end);if(a<0&&b<0)continue;if(a<0||b<a||editable.indexOf(start,a+start.length())>=0||editable.indexOf(end,b+end.length())>=0)throw new IllegalArgumentException("Повреждён служебный блок вложения; запись отменена");String block=editable.substring(a,b+end.length());if(block.substring(start.length(),block.length()-end.length()).contains("<!--rk-media-"))throw new IllegalArgumentException("Вложенные служебные блоки; запись отменена");c.blocks.add(block);editable=editable.substring(0,a)+editable.substring(b+end.length());}
  Collections.sort(c.blocks,(a,b)->Integer.compare(raw.indexOf(a),raw.indexOf(b)));c.note=editable;return c;
 }
 private static Element single(Element e,String tag){Element found=null;for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element&&is((Element)n,tag)){if(found!=null)throw new IllegalArgumentException("Несколько свойств "+tag+"; запись отменена");found=(Element)n;}return found;}
 private static boolean is(Element e,String tag){String ns=e.getNamespaceURI();return tag.equals(e.getLocalName()==null?e.getTagName():e.getLocalName())&&(ns==null||ns.isEmpty()||ns.equals("http://www.opengis.net/kml/2.2")||ns.matches("http://earth\\.google\\.com/kml/2\\.[012]"));}
}
