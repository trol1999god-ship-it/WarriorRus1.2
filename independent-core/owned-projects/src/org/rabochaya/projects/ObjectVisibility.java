package org.rabochaya.projects;
import org.w3c.dom.*;import java.util.*;
/** KML visibility only. Does not rebuild geometry, styles or attachment records. */
public final class ObjectVisibility {
 private ObjectVisibility(){}
 public static final class Preview {
  public final int selected,changed,shown,hidden,selectedStillHidden;
  Preview(int selected,int changed,int shown,int hidden,int remaining){this.selected=selected;this.changed=changed;this.shown=shown;this.hidden=hidden;selectedStillHidden=remaining;}
 }
 public static boolean own(Element e){for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element&&is((Element)n,"visibility")){String value=n.getTextContent().trim();if(value.equals("0")||value.equals("false"))return false;}return true;}
 public static boolean effective(Element e){for(Node n=e;n instanceof Element;n=n.getParentNode())if(!own((Element)n))return false;return true;}
 private static final class Plan {
  final List<Element> changes;final Preview preview;
  Plan(List<Element> changes,Preview preview){this.changes=changes;this.preview=preview;}
 }
 private static Plan plan(Element root,Collection<String> keys,boolean visible,String expected){
  if(expected==null||!expected.equals(ObjectTree.token(root)))throw new IllegalStateException("Проект изменился. Перечитайте список и повторите выбор");
  List<ObjectTree.Row> rows=ObjectTree.rows(root);Map<String,ObjectTree.Row> byKey=new HashMap<>();for(ObjectTree.Row r:rows)byKey.put(r.key,r);
  if(keys==null||keys.isEmpty()||keys.size()>10000)throw new IllegalArgumentException("Выберите от 1 до 10 000 элементов");Set<String> chosen=new HashSet<>();for(String key:keys){if(key==null||key.isEmpty()||!byKey.containsKey(key))throw new IllegalArgumentException("Выбранный элемент не найден");chosen.add(key);}
  List<Element> changes=new ArrayList<>();for(String key:chosen){Element e=byKey.get(key).element;int count=0;for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element&&is((Element)n,"visibility"))count++;if(count>1)throw new IllegalArgumentException("У выбранного элемента несколько свойств visibility; запись отменена");if(own(e)!=visible)changes.add(e);}
  Map<String,Integer> states=new HashMap<>();int rootState=effective(root)?3:0;states.put("",rootState);int shown=0,hidden=0,remaining=0;
  for(ObjectTree.Row row:rows){int parent=states.get(row.parent);boolean before=(parent&1)!=0&&own(row.element),after=(parent&2)!=0&&(chosen.contains(row.key)?visible:own(row.element));states.put(row.key,(before?1:0)|(after?2:0));if(!before&&after)shown++;if(before&&!after)hidden++;if(chosen.contains(row.key)&&!after)remaining++;}
  return new Plan(changes,new Preview(chosen.size(),changes.size(),shown,hidden,remaining));
 }
 public static Preview preview(Element root,Collection<String> keys,boolean visible,String expected){return plan(root,keys,visible,expected).preview;}
 public static Preview apply(Element root,Collection<String> keys,boolean visible,String expected){Plan plan=plan(root,keys,visible,expected);for(Element e:plan.changes)set(e,visible);return plan.preview;}
 private static void set(Element e,boolean visible){Element property=null,name=null;for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element){Element c=(Element)n;if(is(c,"visibility"))property=c;if(is(c,"name"))name=c;}
  if(property==null){String prefix=e.getPrefix(),ns=e.getNamespaceURI();property=e.getOwnerDocument().createElementNS(ns,prefix==null||prefix.isEmpty()?"visibility":prefix+":visibility");e.insertBefore(property,name==null?e.getFirstChild():name.getNextSibling());}property.setTextContent(visible?"1":"0");
 }
 private static boolean is(Element e,String tag){String ns=e.getNamespaceURI();return (e.getLocalName()==null?e.getTagName():e.getLocalName()).equals(tag)&&(ns==null||ns.isEmpty()||ns.equals("http://www.opengis.net/kml/2.2")||ns.matches("http://earth\\.google\\.com/kml/2\\.[012]"));}
}
