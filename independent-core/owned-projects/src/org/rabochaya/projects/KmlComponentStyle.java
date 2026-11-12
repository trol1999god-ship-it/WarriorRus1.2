package org.rabochaya.projects;
import org.w3c.dom.*;import java.util.*;
/** Read-only explicit KML component colours/flags. Existing renderer supplies absent-property defaults. */
public final class KmlComponentStyle {
 private static final String NS="http://www.opengis.net/kml/2.2";
 public static final KmlComponentStyle EMPTY=new KmlComponentStyle(null,null,null,null,null,null);
 public final Integer icon,line,polygon,label;public final Boolean fill,outline;
 private KmlComponentStyle(Integer icon,Integer line,Integer polygon,Integer label,Boolean fill,Boolean outline){this.icon=icon;this.line=line;this.polygon=polygon;this.label=label;this.fill=fill;this.outline=outline;}
 private KmlComponentStyle over(KmlComponentStyle base){return new KmlComponentStyle(icon!=null?icon:base.icon,line!=null?line:base.line,polygon!=null?polygon:base.polygon,label!=null?label:base.label,fill!=null?fill:base.fill,outline!=null?outline:base.outline);}
 private static boolean tag(Node node,String name){if(!(node instanceof Element))return false;String ns=node.getNamespaceURI(),local=node.getLocalName();return (ns==null||ns.isEmpty()||NS.equals(ns))&&name.equals(local==null?node.getNodeName():local);}
 private static Element child(Element parent,String name){for(Node n=parent.getFirstChild();n!=null;n=n.getNextSibling())if(tag(n,name))return (Element)n;return null;}
 private static String text(Element parent,String name){Element e=child(parent,name);return e==null?"":e.getTextContent().trim();}
 /** KML is aabbggrr, not Android aarrggbb. No CSS names or alternate formats are guessed. */
 public static Integer color(String value){if(value==null||!value.trim().matches("[a-fA-F0-9]{8}"))return null;long c=Long.parseLong(value.trim(),16);return (int)((c&0xff000000L)|((c&255)<<16)|(c&0xff00)|((c>>>16)&255));}
 private static Integer component(Element style,String name){Element part=child(style,name);if(part==null)return null;String mode=text(part,"colorMode");return mode.isEmpty()||mode.equals("normal")?color(text(part,"color")):null;}
 private static Boolean flag(Element parent,String name){String value=text(parent,name);return value.equals("1")||value.equals("true")?Boolean.TRUE:value.equals("0")||value.equals("false")?Boolean.FALSE:null;}
 private static KmlComponentStyle inline(Element style){Element poly=child(style,"PolyStyle");return new KmlComponentStyle(component(style,"IconStyle"),component(style,"LineStyle"),component(style,"PolyStyle"),component(style,"LabelStyle"),poly==null?null:flag(poly,"fill"),poly==null?null:flag(poly,"outline"));}
 public static final class Resolver {
  public static final int MAX_NODES=200000,MAX_STYLES=4096,MAX_DEPTH=8;
  private final Document document;private final HashMap<String,Element> styles=new HashMap<>();private final HashSet<String> duplicates=new HashSet<>();public final boolean complete;
  public Resolver(Document document){this.document=document;Node root=document==null?null:document.getDocumentElement(),node=root;int count=0,definitions=0;boolean valid=true;
   while(node!=null){if(++count>MAX_NODES){valid=false;break;}if(tag(node,"Style")||tag(node,"StyleMap")){Element e=(Element)node;String id=e.getAttribute("id");if(!id.isEmpty()&&id.length()<=256){if(++definitions>MAX_STYLES){valid=false;break;}if(styles.containsKey(id)||duplicates.contains(id)){styles.remove(id);duplicates.add(id);}else styles.put(id,e);}}
    if(node.getFirstChild()!=null)node=node.getFirstChild();else{while(node!=root&&node.getNextSibling()==null)node=node.getParentNode();node=node==root?null:node.getNextSibling();}
   }if(!valid){styles.clear();duplicates.clear();}complete=valid;
  }
  public KmlComponentStyle resolve(Element feature){if(feature==null||feature.getOwnerDocument()!=document)return EMPTY;KmlComponentStyle result=reference(text(feature,"styleUrl"),0,new HashSet<String>());for(Node n=feature.getFirstChild();n!=null;n=n.getNextSibling())if(tag(n,"Style"))result=inline((Element)n).over(result);return result;}
  private KmlComponentStyle reference(String url,int depth,Set<String> visited){if(depth>=MAX_DEPTH||url.length()<2||url.length()>257||url.charAt(0)!='#')return EMPTY;String key=url.substring(1);if(!visited.add(key))return EMPTY;Element style=styles.get(key);return style==null?EMPTY:selector(style,depth+1,visited);}
  private KmlComponentStyle selector(Element style,int depth,Set<String> visited){if(tag(style,"Style"))return inline(style);if(!tag(style,"StyleMap")||depth>MAX_DEPTH)return EMPTY;Element normal=null;for(Node n=style.getFirstChild();n!=null;n=n.getNextSibling())if(tag(n,"Pair")&&text((Element)n,"key").equals("normal")){if(normal!=null)return EMPTY;normal=(Element)n;}if(normal==null)return EMPTY;KmlComponentStyle base=reference(text(normal,"styleUrl"),depth,visited);Element own=child(normal,"Style");return own==null?base:inline(own).over(base);}
 }
}
