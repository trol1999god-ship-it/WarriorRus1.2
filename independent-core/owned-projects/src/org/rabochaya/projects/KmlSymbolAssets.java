package org.rabochaya.projects;
import java.util.*;import org.w3c.dom.*;
/** Private bounded SVG snapshot; never interprets an href as a filesystem or network operation. */
public final class KmlSymbolAssets {
 private final Document owner;private final String directory;private final Map<String,byte[]> svg=new HashMap<>();
 public KmlSymbolAssets(Document owner,String entry,Map<String,byte[]> assets){if(owner==null||assets==null)throw bad();String path=path(entry,false);this.owner=owner;int slash=path.lastIndexOf('/');directory=slash<0?"":path.substring(0,slash+1);int total=0;
  for(Map.Entry<String,byte[]> item:assets.entrySet()){String key=item.getKey();if(key==null||!key.toLowerCase(Locale.ROOT).endsWith(".svg"))continue;byte[] bytes=item.getValue();if(bytes==null||bytes.length>65536)continue;String safe;try{safe=path(key,false);}catch(IllegalArgumentException invalid){continue;}if(svg.size()>=256||bytes.length>16*1024*1024-total)throw bad();total+=bytes.length;if(svg.put(safe,bytes.clone())!=null)throw bad();}
 }
 String key(Element feature,String href){
  if(feature==null||feature.getOwnerDocument()!=owner)throw bad();
  String relative=path(href,true);
  if(!relative.toLowerCase(Locale.ROOT).endsWith(".svg"))throw bad();
  return directory+relative;
 }
 public SvgIcon read(Element feature,String href){
  byte[] bytes=svg.get(key(feature,href));
  if(bytes==null)throw bad();
  return SvgIcon.parse(bytes);
 }
 private static String path(String value,boolean leadingDot){if(value==null||value.length()>1024||value.isEmpty())throw bad();if(leadingDot)while(value.startsWith("./"))value=value.substring(2);if(value.isEmpty()||value.startsWith("/")||value.endsWith("/")||value.indexOf('\\')>=0||value.indexOf(':')>=0||value.indexOf('%')>=0||value.indexOf('?')>=0||value.indexOf('#')>=0)throw bad();for(int i=0;i<value.length();i++)if(value.charAt(i)<32||value.charAt(i)==127)throw bad();for(String segment:value.split("/",-1))if(segment.isEmpty()||segment.equals(".")||segment.equals(".."))throw bad();return value;}
 private static IllegalArgumentException bad(){return new IllegalArgumentException("SVG: нет локального значка исходного проекта или превышен безопасный предел");}
}
