package org.rabochaya.projects;
import org.w3c.dom.*;import java.util.*;
/** Explicit per-placemark inline override. Shared definitions and other style properties are retained. */
public final class KmlComponentStyleEdit {
 private static final String NS="http://www.opengis.net/kml/2.2";
 private KmlComponentStyleEdit(){}
 public static boolean operation(String op){return Arrays.asList("component-icon","component-line","component-polygon","component-label","component-fill","component-outline").contains(op);}
 public static String title(String op){switch(op){case "component-icon":return "Цвет метки KML";case "component-line":return "Цвет линии и контура KML";case "component-polygon":return "Цвет заливки KML";case "component-label":return "Цвет подписи KML";case "component-fill":return "Заливка KML";case "component-outline":return "Контур KML";default:throw new IllegalArgumentException("Неизвестное свойство стиля");}}
 private static boolean flag(String op){return op.equals("component-fill")||op.equals("component-outline");}
 private static String part(String op){title(op);return op.equals("component-icon")?"IconStyle":op.equals("component-line")?"LineStyle":op.equals("component-label")?"LabelStyle":"PolyStyle";}
 private static String leaf(String op){return op.equals("component-fill")?"fill":op.equals("component-outline")?"outline":"color";}
 public static String value(String op,String raw){title(op);if(raw==null)throw new IllegalArgumentException("Укажите значение");String v=raw.trim();if(v.isEmpty())return v;if(flag(op)){if(!v.equals("0")&&!v.equals("1"))throw new IllegalArgumentException("Введите 1, 0 или оставьте пустым для наследования");}else if(KmlComponentStyle.color(v)==null)throw new IllegalArgumentException("Введите 8 знаков aabbggrr, например ff0000ff — красный; пусто — наследование");return v.toLowerCase(Locale.US);}
 private static boolean tag(Node n,String name){String ns=n.getNamespaceURI();return n instanceof Element&&(ns==null||ns.isEmpty()||NS.equals(ns))&&name.equals(n.getLocalName()==null?n.getNodeName():n.getLocalName());}
 private static Element child(Element e,String name){for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(tag(n,name))return (Element)n;return null;}
 private static Element target(Element root,String key,String token){ObjectTree.selection(root,Collections.singletonList(key),token);Element e=ObjectTree.resolve(root,key);if(!tag(e,"Placemark"))throw new IllegalArgumentException("Выберите один объект, а не папку");return e;}
 public static String read(Element root,String key,String token,String op){String part=part(op),leaf=leaf(op),result="";Element e=target(root,key,token);for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(tag(n,"Style")){Element p=child((Element)n,part),v=p==null?null:child(p,leaf);if(v!=null)result=v.getTextContent().trim();}if(flag(op)){if(result.equals("true"))return "1";if(result.equals("false"))return "0";}return result;}
 private static Element add(Element parent,String name){Element e=parent.getOwnerDocument().createElementNS(parent.getNamespaceURI(),name);parent.appendChild(e);return e;}
 private static void remove(Element parent,String name){for(Node n=parent.getFirstChild();n!=null;){Node next=n.getNextSibling();if(tag(n,name))parent.removeChild(n);n=next;}}
 public static void apply(Element root,String key,String token,String op,String raw){String v=value(op,raw),part=part(op),leaf=leaf(op);Element e=target(root,key,token),last=null;for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(tag(n,"Style")){last=(Element)n;for(Node p=n.getFirstChild();p!=null;p=p.getNextSibling())if(tag(p,part)){remove((Element)p,leaf);if(!flag(op))remove((Element)p,"colorMode");}}
  if(v.isEmpty())return;
  if(last==null){last=e.getOwnerDocument().createElementNS(e.getNamespaceURI(),"Style");Node before=null;for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(tag(n,"Point")||tag(n,"LineString")||tag(n,"Polygon")||tag(n,"MultiGeometry")||tag(n,"Model")){before=n;break;}e.insertBefore(last,before);}
  Element p=child(last,part);if(p==null)p=add(last,part);add(p,leaf).setTextContent(v);if(!flag(op))add(p,"colorMode").setTextContent("normal");
 }
}
