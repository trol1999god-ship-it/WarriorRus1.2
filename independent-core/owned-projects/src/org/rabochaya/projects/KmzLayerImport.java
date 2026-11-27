package org.rabochaya.projects;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Locale;
import java.util.Map;
import org.w3c.dom.Element;

import static org.rabochaya.projects.ObjectExchange.*;

/** Opens the single local layer used by LIBKML-style KMZ indexes. */
public final class KmzLayerImport {
 private KmzLayerImport(){}

 public static KmlProject openIndex(byte[] index,String entry,Map<String,byte[]> assets)throws IOException{
  if(!"doc.kml".equals(entry))return null;
  boolean hasKml=false;
  for(String path:assets.keySet())if(path.toLowerCase(Locale.ROOT).endsWith(".kml")){hasKml=true;break;}
  if(!hasKml)return null;
  final Element root;
  try{root=xml(index).getDocumentElement();}
  catch(IOException invalid){throw invalid;}
  catch(Exception invalid){throw new IOException("Не удалось прочитать индекс KMZ",invalid);}
  if(!named(root,"kml")||children(root,null).size()!=1)return null;
  Element document=child(root,"Document");
  if(!named(document,"Document"))return null;
  Element networkLink=onlyChildWithMetadata(document,"NetworkLink");
  Element link=onlyChildWithMetadata(networkLink,"Link");
  if(!named(link,"Link")||children(link,null).size()!=1)return null;
  Element href=child(link,"href");
  if(!named(href,"href")||!children(href,null).isEmpty())return null;
  String path=layerPath(href.getTextContent().trim());
  if(path==null)return null;
  byte[] bytes=assets.get(path);
  if(bytes==null)return null;

  if(bytes.length>LIMIT)throw invalid("KML-слой больше 4 МиБ");
  KmlProject layer=KmlProject.parse(bytes);
  if(features(layer.root()).isEmpty())return null;
  layer.entry=path;
  layer.assets.putAll(assets);
  layer.assets.remove(path);
  layer.assets.put(entry,index);
  return layer;
 }

 private static boolean named(Element element,String name){
  return element!=null&&KML.equals(element.getNamespaceURI())&&name.equals(tag(element));
 }

 private static Element onlyChildWithMetadata(Element parent,String name){
  if(parent==null)return null;
  Element result=null;
  for(Element element:children(parent,null)){
   if(named(element,name)){if(result!=null)return null;result=element;}
   else if(!(named(element,"name")||named(element,"open")||named(element,"visibility"))
       ||!children(element,null).isEmpty())return null;
  }
  return result;
 }

 private static String layerPath(String href)throws IOException{
  final URI uri;
  try{uri=new URI(href);}catch(URISyntaxException invalid){return null;}
  String path=uri.getPath();
  if(uri.isAbsolute()||uri.getRawAuthority()!=null||uri.getRawQuery()!=null||uri.getRawFragment()!=null
      ||path==null||path.startsWith("/")||path.indexOf('\\')>=0
      ||!path.toLowerCase(Locale.ROOT).endsWith(".kml")||"doc.kml".equals(path))return null;
  for(String part:path.split("/",-1))if(part.isEmpty()||".".equals(part)||"..".equals(part))return null;
  return KmlProject.safePath(path);
 }
}
