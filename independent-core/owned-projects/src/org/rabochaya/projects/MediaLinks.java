package org.rabochaya.projects;
import org.w3c.dom.*;import java.util.*;import java.io.IOException;
/** KML ExtendedData metadata plus standard relative HTML links for KMZ consumers. */
public final class MediaLinks {
 private static final String NS="http://www.opengis.net/kml/2.2",PREFIX="rk-media-";
 private MediaLinks(){}
 public static String note(Element feature){String s=KmlProject.text(feature,"description");for(Item item:list(feature)){String block=block(s,item.id);if(!block.isEmpty())s=s.replace(block,"");}return s.trim();}
 public static void setNote(Element feature,String note){String old=KmlProject.text(feature,"description");StringBuilder content=new StringBuilder(note);for(Item item:list(feature)){String value=block(old,item.id);if(!value.isEmpty())content.append('\n').append(value);}Element e=KmlProject.child(feature,"description");if(e==null)e=child(feature,"description");e.setTextContent(content.toString());}
 private static String block(String description,String id){String start="<!--"+id+"-->",end="<!--/"+id+"-->";int a=description.indexOf(start),b=a<0?-1:description.indexOf(end,a+start.length());return b<0?"":description.substring(a,b+end.length());}
 public static final class Item {public final String id,name,href,mime;Item(String id,String name,String href,String mime){this.id=id;this.name=name;this.href=href;this.mime=mime;}}
 public static List<Item> list(Element feature){
  ArrayList<Item> items=new ArrayList<>();Element ext=KmlProject.child(feature,"ExtendedData");if(ext==null)return items;
  for(Node n=ext.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element){Element e=(Element)n;String id=e.getAttribute("name");if(id.matches("rk-media-[a-f0-9-]{36}")){String name=KmlProject.text(e,"displayName"),href=KmlProject.text(e,"value");items.add(new Item(id,name,href,mime(href)));}}
  return items;
 }
 public static String path(KmlProject project,String href)throws IOException{
  if(!href.matches("attachments/rk-[a-f0-9-]{36}\\.(jpg|png|webp|gif|mp4|m4v|webm|3gp|mp3|wav|ogg|m4a|aac|bin)"))throw new IOException("Недопустимый путь вложения");
  String entry=KmlProject.safePath(project.entry);int slash=entry.lastIndexOf('/');return KmlProject.safePath((slash<0?"":entry.substring(0,slash+1))+href);
 }
 public static Item add(KmlProject project,Element feature,String originalName,String type,byte[] bytes)throws IOException{
  if(bytes==null||bytes.length==0||bytes.length>ProjectWrites.MAX_FILE)throw new IOException("Размер вложения: от 1 байта до 8 МиБ");
  if(list(feature).size()>=128)throw new IOException("Предел — 128 вложений на объект");
  String ext=extension(type,originalName),id=PREFIX+UUID.randomUUID().toString(),href="attachments/rk-"+UUID.randomUUID().toString()+"."+ext;
  String name=originalName==null?"Вложение":originalName.replaceAll("[\\p{Cntrl}]","").trim();if(name.isEmpty())name="Вложение";if(name.length()>200)name=name.substring(0,200);
  Element data=KmlProject.child(feature,"ExtendedData");if(data==null)data=child(feature,"ExtendedData");Element e=child(data,"Data");e.setAttribute("name",id);child(e,"displayName").setTextContent(name);child(e,"value").setTextContent(href);
  String html="<!--"+id+"--><div><a href=\""+href+"\">"+escape(name)+"</a>"+(mime(href).startsWith("image/")?"<br/><img src=\""+href+"\" width=\"640\"/>":"")+"</div><!--/"+id+"-->";
  Element description=KmlProject.child(feature,"description");if(description==null)description=child(feature,"description");description.setTextContent(description.getTextContent()+"\n"+html);
  project.assets.put(path(project,href),bytes);return new Item(id,name,href,mime(href));
 }
 public static void remove(KmlProject project,Element feature,String id)throws IOException{
  Item found=null;for(Item item:list(feature))if(item.id.equals(id))found=item;if(found==null)throw new IOException("Вложение больше не существует");
  Element ext=KmlProject.child(feature,"ExtendedData");for(Node n=ext.getFirstChild();n!=null;){Node next=n.getNextSibling();if(n instanceof Element&&id.equals(((Element)n).getAttribute("name")))ext.removeChild(n);n=next;}
  Element description=KmlProject.child(feature,"description");if(description!=null){String s=description.getTextContent(),begin="<!--"+id+"-->",end="<!--/"+id+"-->";int a=s.indexOf(begin),b=a<0?-1:s.indexOf(end,a+begin.length());if(b>=0)description.setTextContent(s.substring(0,a)+s.substring(b+end.length()));}
  // Keep a shared file while any other object/style/description still references it.
  collectUnused(project);
 }
 public static void collectUnused(KmlProject project)throws IOException{
  // Imported auxiliary files can contain their own references; keep them conservatively.
  String entry=KmlProject.safePath(project.entry);int slash=entry.lastIndexOf('/');String base=slash<0?"":entry.substring(0,slash+1);ArrayList<String> candidates=new ArrayList<>();
  for(String key:project.assets.keySet()){if(!key.startsWith(base))return;String href=key.substring(base.length());try{path(project,href);}catch(IOException unsupported){return;}if("application/octet-stream".equals(mime(href)))return;candidates.add(key);}
  String xml=new String(project.xml(),"UTF-8");
  for(String key:candidates){String href=key.substring(base.length());if(xml.contains(href))continue;boolean referenced=false;byte[] needle=href.getBytes("UTF-8");for(Map.Entry<String,byte[]> other:project.assets.entrySet())if(!key.equals(other.getKey())&&contains(other.getValue(),needle)){referenced=true;break;}if(!referenced)project.assets.remove(key);}
 }
 private static boolean contains(byte[] data,byte[] pattern){for(int i=0;i<=data.length-pattern.length;i++){int j=0;while(j<pattern.length&&data[i+j]==pattern[j])j++;if(j==pattern.length)return true;}return false;}
 public static String mime(String path){String s=path.toLowerCase(Locale.US);if(s.endsWith(".jpg")||s.endsWith(".jpeg"))return "image/jpeg";if(s.endsWith(".png"))return "image/png";if(s.endsWith(".gif"))return "image/gif";if(s.endsWith(".webp"))return "image/webp";if(s.endsWith(".mp4")||s.endsWith(".m4v"))return "video/mp4";if(s.endsWith(".webm"))return "video/webm";if(s.endsWith(".3gp"))return "video/3gpp";if(s.endsWith(".mp3"))return "audio/mpeg";if(s.endsWith(".wav"))return "audio/wav";if(s.endsWith(".ogg"))return "audio/ogg";if(s.endsWith(".m4a"))return "audio/mp4";if(s.endsWith(".aac"))return "audio/aac";return "application/octet-stream";}
 private static String extension(String type,String name){String[] extensions={"jpg","png","webp","gif","mp4","webm","3gp","mp3","wav","ogg","m4a","aac"};for(String ext:extensions)if(mime("x."+ext).equals(type))return ext;String s=name==null?"":name.toLowerCase(Locale.US);for(String ext:extensions)if(s.endsWith("."+ext))return ext;if(s.endsWith(".jpeg"))return "jpg";return "bin";}
 private static String escape(String s){return s.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;");}
 private static Element child(Element parent,String name){Element e=parent.getOwnerDocument().createElementNS(NS,name);parent.appendChild(e);return e;}
}
