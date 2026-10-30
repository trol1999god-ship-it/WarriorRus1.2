package org.rabochaya.projects;
import java.util.*;import java.text.Collator;import java.text.Normalizer;import org.w3c.dom.*;
/** Immutable read-only view of the KML object tree. Keys always refer to source order. */
public final class ObjectListing {
 public static final String[] KINDS={"Все типы","Папки и группы","Метки","Линии и маршруты","Области","Треки gx","Смешанная геометрия","Прочее"};
 public static final String[] VISIBILITY={"Любая видимость","Видимые по KML","Скрытые по KML"};
 public static final String[] SEARCH_FIELDS={"Название","Описание","Название или описание"};
 public static final String[] SORTS={"Исходный порядок","Название А–Я","Название Я–А","Тип и название"};
 public static final class Options {
  public final KmlTimeFilter.Query dates;public final String query;public final int kind,visibility,sort,searchField;public final boolean recursive,foldersFirst;
  public Options(String query,int kind,int visibility,int sort,boolean recursive,boolean foldersFirst){this(query,kind,visibility,sort,recursive,foldersFirst,0);}
  public Options(String query,int kind,int visibility,int sort,boolean recursive,boolean foldersFirst,int searchField){this(query,kind,visibility,sort,recursive,foldersFirst,searchField,0,"","");}
  public Options(String query,int kind,int visibility,int sort,boolean recursive,boolean foldersFirst,int searchField,int dateMode,String dateFrom,String dateTo){dates=new KmlTimeFilter.Query(dateMode,dateFrom,dateTo);if(searchField<0||searchField>=SEARCH_FIELDS.length||query==null||query.length()>256||kind<0||kind>=KINDS.length||visibility<0||visibility>=VISIBILITY.length||sort<0||sort>=SORTS.length)throw new IllegalArgumentException("Недопустимые настройки списка");this.searchField=searchField;this.query=query.trim();this.kind=kind;this.visibility=visibility;this.sort=sort;this.recursive=recursive;this.foldersFirst=foldersFirst;}
  public static Options defaults(){return new Options("",0,0,0,false,false);}
  public boolean filtered(){return !query.isEmpty()||kind!=0||visibility!=0||recursive||dates.mode!=0;}
 }
 public static final class Item {
  public final ObjectTree.Row row;public final String path;public final int kind,order;public final boolean visible;
  private final String search,description;public final KmlTimeFilter.Entry time;
  Item(ObjectTree.Row row,String path,int kind,boolean visible,int order){time=KmlTimeFilter.read(row.element);this.row=row;this.path=path;this.kind=kind;this.visible=visible;this.order=order;search=searchable(row.name);StringBuilder notes=new StringBuilder();for(Element c:children(row.element))if(is(c,"description")){notes.append(descriptionText(c.getTextContent())).append(" ");}description=searchable(notes.toString());}
 }
 private final List<Item> items;private final Map<String,Item> byKey;
 private ObjectListing(List<Item> items,Map<String,Item> byKey){this.items=Collections.unmodifiableList(items);this.byKey=Collections.unmodifiableMap(byKey);}
 public static ObjectListing build(Element root,List<ObjectTree.Row> rows){
  List<Item> items=new ArrayList<>();Map<String,Item> map=new HashMap<>();boolean rootVisible=true;for(Node n=root;n instanceof Element;n=n.getParentNode())rootVisible&=ownVisible((Element)n);
  for(ObjectTree.Row row:rows){Item parent=map.get(row.parent);if(!row.parent.isEmpty()&&parent==null)throw new IllegalArgumentException("Нарушен порядок дерева");String path=breadcrumb(parent);boolean visible=(parent==null?rootVisible:parent.visible)&&ownVisible(row.element);Item item=new Item(row,path,classify(row.element),visible,items.size());items.add(item);map.put(row.key,item);}
  return new ObjectListing(items,map);
 }
 private static String breadcrumb(Item parent){if(parent==null)return "Корень проекта";String name=parent.row.name;if(name.length()>64){int end=63;if(Character.isHighSurrogate(name.charAt(end-1)))end--;name=name.substring(0,end)+"…";}String path=parent.path+" / "+name;if(path.length()>256){int start=path.length()-252;if(Character.isLowSurrogate(path.charAt(start)))start++;path="… / "+path.substring(start);}return path;}
 public Item get(String key){return byKey.get(key);}
 public List<Item> select(String folder,Options options){
  if(folder==null||(!folder.isEmpty()&&(get(folder)==null||!get(folder).row.folder)))throw new IllegalArgumentException("Папка не найдена");List<Item> out=new ArrayList<>();String query=searchable(options.query);
  for(Item item:items){boolean in=options.recursive?(folder.isEmpty()||item.row.key.startsWith(folder+"/")):item.row.parent.equals(folder);if(!in||!options.dates.matches(item.time)||(!query.isEmpty()&&!matches(item,query,options.searchField))||(options.kind!=0&&item.kind!=options.kind)||(options.visibility==1&&!item.visible)||(options.visibility==2&&item.visible))continue;out.add(item);}
  final Collator collator=Collator.getInstance(new Locale("ru","RU"));collator.setStrength(Collator.PRIMARY);
  Collections.sort(out,new Comparator<Item>(){public int compare(Item a,Item b){if(options.foldersFirst&&a.row.folder!=b.row.folder)return a.row.folder?-1:1;int compared=0;if(options.sort==3)compared=Integer.compare(a.kind,b.kind);if(compared==0&&options.sort!=0){compared=collator.compare(a.row.name,b.row.name);if(options.sort==2)compared=-compared;}return compared==0?Integer.compare(a.order,b.order):compared;}});return Collections.unmodifiableList(out);
 }
 private static boolean matches(Item item,String query,int field){return (field!=1&&item.search.contains(query))||(field!=0&&item.description.contains(query));}
 private static String searchable(String text){StringBuilder out=new StringBuilder();boolean space=false;for(int i=0;i<text.length();){int cp=text.codePointAt(i);i+=Character.charCount(cp);if(Character.isWhitespace(cp)||Character.isSpaceChar(cp)){space=out.length()>0;}else{if(space)out.append(' ');out.appendCodePoint(cp);space=false;}}return normalize(out.toString());}
 /** Text-only HTML projection. Never resolves links, loads images or executes markup.
  * Common entities and numeric references are decoded once; unknown entities remain literal.
  * This is a search projection, not a browser DOM or a general HTML renderer. */
 public static String descriptionText(String text){
  StringBuilder out=new StringBuilder();String suppressed=null;int templateDepth=0;
  for(int i=0;i<text.length();){
   if(text.startsWith("<!--",i)){int end=text.indexOf("-->",i+4);i=end<0?text.length():end+3;continue;}
   char c=text.charAt(i);
   if(c=='<'&&i+1<text.length()){
    int start=i+1;boolean closing=text.charAt(start)=='/';if(closing)start++;
    int n=start;while(n<text.length()&&asciiLetter(text.charAt(n)))n++;
    if(n>start&&(n==text.length()||Character.isWhitespace(text.charAt(n))||text.charAt(n)=='>'||text.charAt(n)=='/')){
     String tag=text.substring(start,n).toLowerCase(Locale.ROOT);int end=tagEnd(text,n);
     if(end<0){if(suppressed==null)out.append(text.substring(i));break;}
     if(suppressed!=null){if(tag.equals(suppressed)){if(!closing&&tag.equals("template"))templateDepth++;else if(closing){if(templateDepth>0)templateDepth--;else suppressed=null;}}}
     else if(!closing&&(tag.equals("script")||tag.equals("style")||tag.equals("template")))suppressed=tag;
     else if(blockTag(tag))out.append(' ');
     i=end+1;continue;
    }
   }
   if(suppressed!=null){i++;continue;}
   if(c=='&'){int end=i+1;while(end<text.length()&&end-i<=32&&text.charAt(end)!=';')end++;if(end<text.length()&&text.charAt(end)==';'&&end-i<=32){String decoded=entity(text.substring(i+1,end));if(decoded!=null){out.append(decoded);i=end+1;continue;}}}
   out.append(c);i++;
  }
  return out.toString();
 }
 private static boolean asciiLetter(char c){return c>='a'&&c<='z'||c>='A'&&c<='Z';}
 private static int tagEnd(String text,int start){char quote=0;for(int i=start;i<text.length();i++){char c=text.charAt(i);if(quote!=0){if(c==quote)quote=0;}else if(c=='\''||c=='"')quote=c;else if(c=='>')return i;}return -1;}
 private static boolean blockTag(String tag){return Arrays.asList("br","p","div","li","ul","ol","table","tr","td","th","hr","h1","h2","h3","h4","h5","h6","blockquote","pre").contains(tag);}
 private static String entity(String name){
  if(name.startsWith("#")){try{boolean hex=name.length()>1&&(name.charAt(1)=='x'||name.charAt(1)=='X');String digits=name.substring(hex?2:1);if(digits.isEmpty())return null;for(int i=0;i<digits.length();i++){char c=digits.charAt(i);if(!(c>='0'&&c<='9'||hex&&(c>='a'&&c<='f'||c>='A'&&c<='F')))return null;}int cp=Integer.parseInt(digits,hex?16:10);if(cp<=0||cp>0x10ffff||cp>=0xd800&&cp<=0xdfff)return null;return new String(Character.toChars(cp));}catch(IllegalArgumentException invalid){return null;}}
  switch(name){case "amp":return "&";case "lt":return "<";case "gt":return ">";case "quot":return "\"";case "apos":return "'";case "nbsp":return " ";case "ndash":return "–";case "mdash":return "—";case "laquo":return "«";case "raquo":return "»";case "hellip":return "…";case "copy":return "©";case "reg":return "®";default:return null;}
 }
 public static String normalize(String text){return Normalizer.normalize(text,Normalizer.Form.NFC).toLowerCase(Locale.ROOT).replace('ё','е');}
 private static boolean ownVisible(Element e){return ObjectVisibility.own(e);}

 private static int classify(Element e){if(is(e,"Folder")||is(e,"Document"))return 1;if(!is(e,"Placemark"))return 7;Set<Integer> types=new HashSet<>();shapes(e,types,0);return types.size()==1?types.iterator().next():types.isEmpty()?7:6;}
 private static void shapes(Element parent,Set<Integer> types,int depth){if(depth>32){types.add(7);return;}for(Element c:children(parent)){if(is(c,"Point"))types.add(2);else if(is(c,"LineString")||is(c,"LinearRing"))types.add(3);else if(is(c,"Polygon"))types.add(4);else if(is(c,"MultiGeometry"))shapes(c,types,depth+1);else if(is(c,"Model"))types.add(7);else if("http://www.google.com/kml/ext/2.2".equals(c.getNamespaceURI())&&(local(c).equals("Track")||local(c).equals("MultiTrack")))types.add(5);}}
 private static boolean is(Element e,String tag){String ns=e.getNamespaceURI();return local(e).equals(tag)&&(ns==null||ns.isEmpty()||ns.equals("http://www.opengis.net/kml/2.2")||ns.matches("http://earth\\.google\\.com/kml/2\\.[012]"));}
 private static String local(Element e){return e.getLocalName()==null?e.getTagName():e.getLocalName();}
 private static List<Element> children(Element e){List<Element> out=new ArrayList<>();for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element)out.add((Element)n);return out;}
}
