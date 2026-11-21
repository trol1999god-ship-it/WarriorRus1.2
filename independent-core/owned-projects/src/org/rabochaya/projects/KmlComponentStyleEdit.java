package org.rabochaya.projects;
import org.w3c.dom.*;import java.util.*;
/** Explicit per-placemark inline override. Shared definitions and other style properties are retained. */
public final class KmlComponentStyleEdit {
 private static final String NS="http://www.opengis.net/kml/2.2";
 private KmlComponentStyleEdit(){}
 public static boolean operation(String op){return Arrays.asList("component-icon","component-line","component-polygon","component-label","component-fill","component-outline","component-width","component-label-scale").contains(op);}
 public static String title(String op){switch(op){case "component-width":return "Ширина линии KML (px)";case "component-label-scale":return "Масштаб подписи KML";case "component-icon":return "Цвет метки KML";case "component-line":return "Цвет линии и контура KML";case "component-polygon":return "Цвет заливки KML";case "component-label":return "Цвет подписи KML";case "component-fill":return "Заливка KML";case "component-outline":return "Контур KML";default:throw new IllegalArgumentException("Неизвестное свойство стиля");}}
 private static boolean metric(String op){return op.equals("component-width")||op.equals("component-label-scale");}
 private static boolean flag(String op){return op.equals("component-fill")||op.equals("component-outline");}
 private static String part(String op){title(op);return op.equals("component-icon")?"IconStyle":(op.equals("component-line")||op.equals("component-width"))?"LineStyle":(op.equals("component-label")||op.equals("component-label-scale"))?"LabelStyle":"PolyStyle";}
 private static String leaf(String op){return op.equals("component-width")?"width":op.equals("component-label-scale")?"scale":op.equals("component-fill")?"fill":op.equals("component-outline")?"outline":"color";}
 public static String value(String op,String raw){title(op);if(raw==null)throw new IllegalArgumentException("Укажите значение");String v=raw.trim();if(v.isEmpty())return v;if(metric(op)){Float number=KmlComponentStyle.dimension(v,op.equals("component-width"));if(number==null)throw new IllegalArgumentException(op.equals("component-width")?"Ширина: от 0 до 256 px; пусто — наследование":"Масштаб подписи: от 0 до 16; пусто — наследование");return Float.toString(number);}if(flag(op)){if(!v.equals("0")&&!v.equals("1"))throw new IllegalArgumentException("Введите 1, 0 или оставьте пустым для наследования");}else if(KmlComponentStyle.color(v)==null)throw new IllegalArgumentException("Введите 8 знаков aabbggrr, например ff0000ff — красный; пусто — наследование");return v.toLowerCase(Locale.US);}
 private static boolean tag(Node n,String name){String ns=n.getNamespaceURI();return n instanceof Element&&(ns==null||ns.isEmpty()||NS.equals(ns))&&name.equals(n.getLocalName()==null?n.getNodeName():n.getLocalName());}
 private static Element child(Element e,String name){for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(tag(n,name))return (Element)n;return null;}
 private static Element target(Element root,String key,String token){ObjectTree.selection(root,Collections.singletonList(key),token);Element e=ObjectTree.resolve(root,key);if(!tag(e,"Placemark"))throw new IllegalArgumentException("Выберите один объект, а не папку");return e;}
 public static String read(Element root,String key,String token,String op){String part=part(op),leaf=leaf(op),result="";Element e=target(root,key,token);for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(tag(n,"Style")){Element p=child((Element)n,part),v=p==null?null:child(p,leaf);if(v!=null)result=v.getTextContent().trim();}if(flag(op)){if(result.equals("true"))return "1";if(result.equals("false"))return "0";}return result;}
 private static String[] order(Element parent){if(tag(parent,"Style"))return new String[]{"IconStyle","LabelStyle","LineStyle","PolyStyle","BalloonStyle","ListStyle","StyleSimpleExtensionGroup","StyleObjectExtensionGroup"};String[] tail=tag(parent,"IconStyle")?new String[]{"scale","heading","Icon","hotSpot","IconStyleSimpleExtensionGroup","IconStyleObjectExtensionGroup"}:tag(parent,"LineStyle")?new String[]{"width","LineStyleSimpleExtensionGroup","LineStyleObjectExtensionGroup"}:tag(parent,"PolyStyle")?new String[]{"fill","outline","PolyStyleSimpleExtensionGroup","PolyStyleObjectExtensionGroup"}:tag(parent,"LabelStyle")?new String[]{"scale","LabelStyleSimpleExtensionGroup","LabelStyleObjectExtensionGroup"}:new String[0];String[] result=new String[4+tail.length];result[0]="color";result[1]="colorMode";result[2]="AbstractColorStyleSimpleExtensionGroup";result[3]="AbstractColorStyleObjectExtensionGroup";System.arraycopy(tail,0,result,4,tail.length);return result;}
 private static Element add(Element parent,String name){Element e=parent.getOwnerDocument().createElementNS(parent.getNamespaceURI(),name);String[] order=order(parent);int wanted=-1;for(int i=0;i<order.length;i++)if(order[i].equals(name))wanted=i;Node before=null;if(wanted>=0)for(Node n=parent.getFirstChild();n!=null;n=n.getNextSibling()){boolean later=false;for(int i=wanted+1;i<order.length;i++)if(tag(n,order[i])){later=true;break;}if(later){before=n;break;}}parent.insertBefore(e,before);return e;}
 private static void remove(Element parent,String name){for(Node n=parent.getFirstChild();n!=null;){Node next=n.getNextSibling();if(tag(n,name))parent.removeChild(n);n=next;}}
 public static void apply(Element root,String key,String token,String op,String raw){String v=value(op,raw),part=part(op),leaf=leaf(op);Element e=target(root,key,token),last=null;for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(tag(n,"Style")){last=(Element)n;for(Node p=n.getFirstChild();p!=null;p=p.getNextSibling())if(tag(p,part)){remove((Element)p,leaf);if(!flag(op)&&!metric(op))remove((Element)p,"colorMode");}}
  if(v.isEmpty())return;
  if(last==null)last=addInlineStyle(e);
  Element p=child(last,part);if(p==null)p=add(last,part);add(p,leaf).setTextContent(v);if(!flag(op)&&!metric(op))add(p,"colorMode").setTextContent("normal");
 }

 private static Element addInlineStyle(Element feature) {
  Element style=feature.getOwnerDocument().createElementNS(feature.getNamespaceURI(),"Style");Node before=null;for(Node n=feature.getFirstChild();n!=null;n=n.getNextSibling())if(tag(n,"Region")||tag(n,"Metadata")||tag(n,"ExtendedData")||tag(n,"AbstractFeatureSimpleExtensionGroup")||tag(n,"AbstractFeatureObjectExtensionGroup")||tag(n,"Point")||tag(n,"LineString")||tag(n,"LinearRing")||tag(n,"Polygon")||tag(n,"MultiGeometry")||tag(n,"Model")||tag(n,"PlacemarkSimpleExtensionGroup")||tag(n,"PlacemarkObjectExtensionGroup")){before=n;break;}feature.insertBefore(style,before);
  return style;
 }

 public static Element marker(Element root, String key, String token) {
  Element feature = target(root, key, token);
  NodeList points = feature.getElementsByTagNameNS("*", "Point");
  for (int i = 0; i < points.getLength(); i++) {
   Node point = points.item(i);
   if (!tag(point, "Point")) continue;
   Node parent = point.getParentNode();
   while (tag(parent, "MultiGeometry")) parent = parent.getParentNode();
   if (parent == feature) return feature;
  }
  throw new IllegalArgumentException("Выберите объект с точкой на карте");
 }

 static void assignIcon(Element feature, String href) {
  Element style = null;
  for (Node node = feature.getFirstChild(); node != null; node = node.getNextSibling()) {
   if (tag(node, "Style")) style = (Element) node;
  }
  // An imported inline Style with an id may also be shared by other placemarks.
  if (style == null || style.hasAttribute("id")) style = addInlineStyle(feature);
  Element iconStyle = child(style, "IconStyle");
  if (iconStyle == null) iconStyle = add(style, "IconStyle");
  Element icon = child(iconStyle, "Icon");
  if (icon == null) icon = add(iconStyle, "Icon");
  Element link = child(icon, "href");
  if (link == null) {
   link = icon.getOwnerDocument().createElementNS(icon.getNamespaceURI(), "href");
   icon.insertBefore(link, icon.getFirstChild());
  }
  link.setTextContent(href);
 }
}
