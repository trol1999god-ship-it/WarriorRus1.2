package org.rabochaya.projects;

import org.w3c.dom.*;
import java.util.*;
import java.security.MessageDigest;
import java.nio.charset.Charset;

/** In-project DOM operations. No geometry reconstruction, asset or network access. */
public final class ObjectTree {
 private ObjectTree(){}
 public static final class Row {
  final Element element;
  public final String key,parent,name,type;public final int depth;public final boolean folder;
  Row(String key,String parent,Element e,int depth){this.element=e;this.key=key;this.parent=parent;this.depth=depth;type=local(e);folder=container(e);String title=text(e,"name").trim();name=title.isEmpty()?"Без названия":title;}
 }
 public static List<Row> rows(Element root){requireRoot(root);List<Row> out=new ArrayList<>();walk(root,"",0,out);return Collections.unmodifiableList(out);}
 private static void walk(Element parent,String path,int depth,List<Row> out){
  if(depth>32)throw new IllegalArgumentException("Слишком много уровней папок");int index=0;
  for(Element e:children(parent)){if(!managed(e))continue;String key=path.isEmpty()?""+index:path+"/"+index;index++;
   out.add(new Row(key,path,e,depth));if(out.size()>10000)throw new IllegalArgumentException("Слишком много объектов");if(container(e))walk(e,key,depth+1,out);
  }
 }
 public static Element resolve(Element root,String key){
  requireRoot(root);if("".equals(key))return root;
  if(key==null||!key.matches("(0|[1-9][0-9]*)(/(0|[1-9][0-9]*))*")||key.split("/").length>33)throw new IllegalArgumentException("Недопустимый адрес объекта");
  Element at=root;for(String part:key.split("/")){if(!container(at))throw new IllegalStateException("Папка больше не существует");int wanted;try{wanted=Integer.parseInt(part);}catch(NumberFormatException e){throw new IllegalArgumentException("Недопустимый адрес объекта");}int i=0;Element found=null;for(Element child:children(at))if(managed(child)){if(i++==wanted){found=child;break;}}if(found==null)throw new IllegalStateException("Объект больше не существует");at=found;}return at;
 }
 public static void createFolder(Element root,String parent,String expected,String name){
  checked(root,expected);String title=title(name);Element target=resolve(root,parent);if(!container(target))throw new IllegalArgumentException("Выберите папку");
  // Validate the resulting tree limits before touching the live DOM.
  Element copy=(Element)root.cloneNode(true),cp=resolve(copy,parent);appendFolder(cp,title);rows(copy);appendFolder(target,title);
 }
 private static void appendFolder(Element target,String title){Element folder=element(target,"Folder"),name=element(target,"name");folder.setAttribute("id","rk_"+UUID.randomUUID().toString());name.setTextContent(title);folder.appendChild(name);target.appendChild(folder);}
 public static void rename(Element root,String key,String expected,String name){checked(root,expected);String title=title(name);if("".equals(key))throw new IllegalArgumentException("Выберите объект");Element e=resolve(root,key),n=child(e,"name");if(n==null){n=element(e,"name");e.insertBefore(n,e.getFirstChild());}n.setTextContent(title);}
 public static int move(Element root,Collection<String> keys,String destination,String expected){
  checked(root,expected);List<String> selected=top(keys);Element target=resolve(root,destination);if(!container(target))throw new IllegalArgumentException("Выберите папку назначения");
  List<Element> nodes=new ArrayList<>();for(String key:selected){if(destination.equals(key)||destination.startsWith(key+"/"))throw new IllegalArgumentException("Нельзя перенести папку в себя или её потомка");nodes.add(resolve(root,key));}
  // Moving an ancestor can exceed the destination depth even for a small selection.
  Element copy=(Element)root.cloneNode(true),ct=resolve(copy,destination);List<Element> cn=new ArrayList<>();for(String key:selected)cn.add(resolve(copy,key));for(Element e:cn)if(e.getParentNode()!=ct)ct.appendChild(e);rows(copy);
  int moved=0;for(Element e:nodes)if(e.getParentNode()!=target){target.appendChild(e);moved++;}return moved;
 }
 public static int delete(Element root,Collection<String> keys,String expected){
  checked(root,expected);List<String> selected=top(keys);List<Element> nodes=new ArrayList<>();for(String key:selected)nodes.add(resolve(root,key));
  // Do not orphan styles, schemas or other #id references used outside this selection.
  Set<String> ids=new HashSet<>();for(Element e:nodes)collectIds(e,ids,0);checkReferences(root.getOwnerDocument().getDocumentElement(),nodes,ids,0);
  for(Element e:nodes)e.getParentNode().removeChild(e);return nodes.size();
 }
 public static List<String> selection(Element root,Collection<String> keys,String expected){checked(root,expected);List<String> out=top(keys);for(String key:out)resolve(root,key);return Collections.unmodifiableList(out);}
 /** Duplicate detached subtrees, then validate the entire result before attaching them. */
 public static int copy(Element root,Collection<String> keys,String destination,String expected){
  List<String> selected=selection(root,keys,expected);Element target=resolve(root,destination);if(!container(target))throw new IllegalArgumentException("Выберите папку назначения");
  List<Element> clones=new ArrayList<>();for(String key:selected){if(destination.equals(key)||destination.startsWith(key+"/"))throw new IllegalArgumentException("Нельзя копировать папку в себя или её потомка");clones.add((Element)resolve(root,key).cloneNode(true));}
  Map<String,Integer> counts=new HashMap<>();countIds(root.getOwnerDocument().getDocumentElement(),counts,0);Set<String> used=new HashSet<>(counts.keySet());Map<String,String> ids=new HashMap<>();
  for(Element e:clones)newIds(e,counts,used,ids,0);for(Element e:clones)rewrite(e,ids,0);
  Element probe=(Element)root.cloneNode(true),pt=resolve(probe,destination);for(Element e:clones)pt.appendChild(e);rows(probe);
  for(Element e:clones)target.appendChild(e);return clones.size();
 }
 private static void countIds(Element e,Map<String,Integer> counts,int depth){if(depth>128)throw new IllegalArgumentException("Слишком глубоко вложен XML");String id=e.getAttribute("id");if(!id.isEmpty())counts.put(id,counts.containsKey(id)?counts.get(id)+1:1);for(Element c:children(e))countIds(c,counts,depth+1);}
 private static String fresh(Set<String> used){String id;do{id="rk_"+UUID.randomUUID().toString();}while(!used.add(id));return id;}
 private static void newIds(Element e,Map<String,Integer> counts,Set<String> used,Map<String,String> ids,int depth){
  if(depth>128)throw new IllegalArgumentException("Слишком глубоко вложен XML");String ns=e.getNamespaceURI();boolean kml=ns==null||ns.isEmpty()||ns.equals("http://www.opengis.net/kml/2.2")||ns.matches("http://earth\\.google\\.com/kml/2\\.[012]");if(e.hasAttributeNS("http://www.w3.org/XML/1998/namespace","id")||(!kml&&e.hasAttribute("id")))throw new IllegalArgumentException("Копирование идентификаторов расширений пока не поддерживается");String old=e.getAttribute("id");
  if(!old.isEmpty()){if(counts.get(old)!=1||ids.containsKey(old))throw new IllegalArgumentException("Неоднозначные идентификаторы: копирование отменено");String id=fresh(used);ids.put(old,id);e.setAttribute("id",id);}else if(managed(e))e.setAttribute("id",fresh(used));
  for(Element c:children(e))newIds(c,counts,used,ids,depth+1);
 }
 private static String fragment(String text,Map<String,String> ids){String t=text.trim();if(t.startsWith("#")&&ids.containsKey(t.substring(1))){int at=text.indexOf(t);return text.substring(0,at)+"#"+ids.get(t.substring(1))+text.substring(at+t.length());}return text;}
 private static void rewrite(Element e,Map<String,String> ids,int depth){
  if(depth>128)throw new IllegalArgumentException("Слишком глубоко вложен XML");NamedNodeMap attrs=e.getAttributes();for(int i=0;i<attrs.getLength();i++){Node a=attrs.item(i);String name=a.getLocalName()==null?a.getNodeName():a.getLocalName(),v=a.getNodeValue();if(name.equals("href")||name.equals("schemaUrl"))a.setNodeValue(fragment(v,ids));else if(name.equals("targetId")&&ids.containsKey(v))a.setNodeValue(ids.get(v));}
  if(is(e,"styleUrl")||is(e,"href")){String before=e.getTextContent(),after=fragment(before,ids);if(!before.equals(after))e.setTextContent(after);}
  if(is(e,"description")){String before=e.getTextContent();java.util.regex.Pattern p=java.util.regex.Pattern.compile("(?i)(\\b(?:href|src)\\s*=\\s*)([\"'])#([^\"']+)\\2");java.util.regex.Matcher m=p.matcher(before);StringBuffer out=new StringBuffer();while(m.find()){String replacement=ids.get(m.group(3));m.appendReplacement(out,java.util.regex.Matcher.quoteReplacement(replacement==null?m.group():m.group(1)+m.group(2)+"#"+replacement+m.group(2)));}m.appendTail(out);if(!before.equals(out.toString()))e.setTextContent(out.toString());}
  for(Element c:children(e))rewrite(c,ids,depth+1);
 }
 public static int selectedCount(Element root,Collection<String> keys){int count=0;for(String key:top(keys)){Element e=resolve(root,key);count+=1+descendants(e);}return count;}
 private static int descendants(Element e){int n=0;for(Element c:children(e))if(managed(c)){n++;if(container(c))n+=descendants(c);}return n;}
 private static List<String> top(Collection<String> keys){
  if(keys==null||keys.isEmpty())throw new IllegalArgumentException("Выберите объекты");if(keys.size()>10000)throw new IllegalArgumentException("Слишком много выбранных объектов");
  TreeSet<String> all=new TreeSet<>(new Comparator<String>(){public int compare(String a,String b){String[] aa=a.split("/"),bb=b.split("/");for(int i=0;i<Math.min(aa.length,bb.length);i++){int c=Integer.compare(Integer.parseInt(aa[i]),Integer.parseInt(bb[i]));if(c!=0)return c;}return Integer.compare(aa.length,bb.length);}});
  for(String key:keys){if(key==null||!key.matches("(0|[1-9][0-9]*)(/(0|[1-9][0-9]*))*")||key.split("/").length>33)throw new IllegalArgumentException("Выберите объект, а не корень проекта");try{for(String p:key.split("/"))Integer.parseInt(p);}catch(NumberFormatException e){throw new IllegalArgumentException("Недопустимый адрес объекта");}all.add(key);}
  List<String> out=new ArrayList<>();for(String key:all){boolean nested=false;for(String ancestor:out)if(key.startsWith(ancestor+"/")){nested=true;break;}if(!nested)out.add(key);}return out;
 }
 private static void collectIds(Element e,Set<String> ids,int depth){if(depth>128)throw new IllegalArgumentException("Слишком глубоко вложен XML");if(e.hasAttribute("id"))ids.add(e.getAttribute("id"));for(Element c:children(e))collectIds(c,ids,depth+1);}
 private static void checkReferences(Node n,List<Element> removed,Set<String> ids,int depth){
  if(depth>128)throw new IllegalArgumentException("Слишком глубоко вложен XML");if(removed.contains(n))return;
  String value=n.getNodeValue();if(value!=null)for(String id:ids)if(!id.isEmpty()&&value.contains("#"+id))throw new IllegalArgumentException("На содержимое выбранной папки ссылаются другие объекты. Сначала перенесите их стили или отмените удаление");
  NamedNodeMap attrs=n.getAttributes();if(attrs!=null)for(int i=0;i<attrs.getLength();i++)checkReferences(attrs.item(i),removed,ids,depth+1);
  for(Node c=n.getFirstChild();c!=null;c=c.getNextSibling())checkReferences(c,removed,ids,depth+1);
 }
 public static String token(Element root){
  requireRoot(root);try{MessageDigest md=MessageDigest.getInstance("SHA-256");hash(root,md,0);StringBuilder b=new StringBuilder();for(byte x:md.digest())b.append(String.format(Locale.US,"%02x",x&255));return b.toString();}catch(java.security.NoSuchAlgorithmException e){throw new IllegalStateException(e);}
 }
 private static void hash(Node n,MessageDigest md,int depth){if(depth>128)throw new IllegalArgumentException("Слишком глубоко вложен XML");part(md,""+n.getNodeType());part(md,n.getNamespaceURI());part(md,n.getNodeName());part(md,n.getNodeValue());NamedNodeMap attrs=n.getAttributes();TreeMap<String,String> sorted=new TreeMap<>();if(attrs!=null)for(int i=0;i<attrs.getLength();i++){Node a=attrs.item(i);sorted.put(a.getNodeName(),a.getNodeValue());}for(Map.Entry<String,String> a:sorted.entrySet()){part(md,a.getKey());part(md,a.getValue());}part(md,"children");for(Node c=n.getFirstChild();c!=null;c=c.getNextSibling())hash(c,md,depth+1);part(md,"end");}
 private static void part(MessageDigest md,String text){byte[] b=(text==null?"":text).getBytes(Charset.forName("UTF-8"));int n=b.length;md.update((byte)(n>>>24));md.update((byte)(n>>>16));md.update((byte)(n>>>8));md.update((byte)n);md.update(b);}
 private static void checked(Element root,String expected){if(expected==null||!expected.equals(token(root)))throw new IllegalStateException("Проект изменился. Перечитайте список и повторите выбор");rows(root);}
 private static String title(String s){if(s==null||s.trim().isEmpty()||s.trim().length()>1000)throw new IllegalArgumentException("Название: от 1 до 1000 символов");for(int i=0;i<s.length();i++)if(Character.isISOControl(s.charAt(i)))throw new IllegalArgumentException("Название содержит управляющие символы");return s.trim();}
 private static void requireRoot(Element e){if(e==null||!container(e))throw new IllegalArgumentException("Нужен контейнер проекта KML");}
 private static boolean managed(Element e){return is(e,"Folder")||is(e,"Document")||is(e,"Placemark")||is(e,"GroundOverlay")||is(e,"ScreenOverlay")||is(e,"PhotoOverlay")||is(e,"NetworkLink");}
 /** Imports may have a single feature directly under kml. Wrap only on explicit save. */
 static void normalizeRoot(Element root){if(!is(root,"kml"))return;Element document=element(root,"Document");document.setAttribute("id","rk_"+UUID.randomUUID().toString());List<Element> features=new ArrayList<>();for(Element e:children(root))if(managed(e))features.add(e);if(features.isEmpty()){root.appendChild(document);return;}root.insertBefore(document,features.get(0));for(Element e:features)document.appendChild(e);}
 private static boolean container(Element e){return is(e,"Folder")||is(e,"Document")||is(e,"kml");}
 private static boolean is(Element e,String tag){String ns=e.getNamespaceURI();return local(e).equals(tag)&&(ns==null||ns.isEmpty()||ns.equals("http://www.opengis.net/kml/2.2")||ns.matches("http://earth\\.google\\.com/kml/2\\.[012]"));}
 private static String local(Element e){return e.getLocalName()==null?e.getTagName():e.getLocalName();}
 private static List<Element> children(Element e){List<Element> out=new ArrayList<>();for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element)out.add((Element)n);return out;}
 private static Element child(Element e,String tag){for(Element c:children(e))if(is(c,tag))return c;return null;}
 private static String text(Element e,String tag){Element c=child(e,tag);return c==null?"":c.getTextContent();}
 private static Element element(Element e,String tag){String ns=e.getNamespaceURI(),prefix=e.getPrefix();return e.getOwnerDocument().createElementNS(ns,prefix==null||prefix.isEmpty()?tag:prefix+":"+tag);}
}
