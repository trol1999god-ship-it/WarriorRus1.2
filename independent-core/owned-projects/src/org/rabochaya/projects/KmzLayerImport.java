package org.rabochaya.projects;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Locale;
import org.w3c.dom.Element;

import static org.rabochaya.projects.ObjectExchange.*;

/** Opens the single local layer used by LIBKML-style KMZ indexes. */
final class KmzLayerImport {
 private KmzLayerImport(){}

 static KmlProject open(KmlProject index)throws IOException{
  if(!"doc.kml".equals(index.entry))return index;
  Element root=index.root();
  Element document="Document".equals(tag(root))?root:child(root,"Document");
  if(document==null||children(document,"NetworkLink").size()!=1)return index;
  for(Element element:children(document,null)){
   String name=tag(element);
   if("Placemark".equals(name)||"Document".equals(name)||"Folder".equals(name)
       ||"GroundOverlay".equals(name)||"ScreenOverlay".equals(name)||"PhotoOverlay".equals(name))return index;
  }
  Element networkLink=child(document,"NetworkLink");
  Element link=child(networkLink,"Link");
  if(link==null)return index;
  String path=layerPath(text(link,"href").trim());
  if(path==null)return index;
  byte[] bytes=index.assets.get(path);
  if(bytes==null)return index;

  if(bytes.length>LIMIT)throw invalid("KML-слой больше 4 МиБ");
  KmlProject layer=KmlProject.parse(bytes);
  if(features(layer.root()).isEmpty())return index;
  layer.entry=path;
  layer.assets.putAll(index.assets);
  layer.assets.remove(path);
  layer.assets.put(index.entry,index.xml());
  return layer;
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
