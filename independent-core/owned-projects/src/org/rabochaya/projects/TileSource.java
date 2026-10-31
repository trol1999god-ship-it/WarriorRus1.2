package org.rabochaya.projects;
import java.net.*;import java.security.*;import java.util.*;
/** User-selected raster XYZ endpoint. Only z/x/y are substituted; project data never enters URLs. */
public final class TileSource {
 public final String name,template,attribution,id;public final int minZoom,maxZoom;public final boolean downloads;public final boolean ellipsoid;public final TileSource[] layers;private final String[] levelTemplates;private final boolean declaredDownloads;
 public TileSource(String name,String template,String attribution,int min,int max,boolean downloads){
  ellipsoid=false;layers=null;levelTemplates=null;declaredDownloads=downloads;this.name=clean(name,100);this.template=clean(template,2048);this.attribution=clean(attribution,500);
  if(min<0||max>23||min>max)throw new IllegalArgumentException("Масштабы: 0–23, минимум не больше максимума");minZoom=min;maxZoom=max;
  if(!template.contains("{z}")||!template.contains("{x}")||!template.contains("{y}"))throw new IllegalArgumentException("В адресе нужны {z}, {x} и {y}");
  String example=template.replace("{z}","0").replace("{x}","0").replace("{y}","0");
  try{URI u=new URI(example);String host=u.getHost();if(!"https".equals(u.getScheme())||host==null||u.getRawUserInfo()!=null||u.getRawFragment()!=null||(u.getPort()!=-1&&u.getPort()!=443)||example.contains("{")||example.contains("}"))throw new Exception();
   host=host.toLowerCase(Locale.US);if(host.equals("localhost")||host.endsWith(".localhost")||host.endsWith(".local")||host.indexOf(':')>=0||host.matches("[0-9.]+"))throw new Exception();
   this.downloads=downloads&&!host.equals("openstreetmap.org")&&!host.endsWith(".openstreetmap.org");
   byte[] hash=MessageDigest.getInstance("SHA-256").digest(template.getBytes("UTF-8"));StringBuilder h=new StringBuilder();for(byte b:hash)h.append(String.format(Locale.US,"%02x",b&255));id=h.toString();
  }catch(Exception e){throw new IllegalArgumentException("Нужен HTTPS XYZ-адрес без логина, фрагмента и нестандартного порта");}
 }
 private static String clean(String value,int max){if(value==null||value.trim().isEmpty()||value.length()>max)throw new IllegalArgumentException("Заполните название, адрес и подпись карты");for(int i=0;i<value.length();i++)if(Character.isWhitespace(value.charAt(i))&&value.charAt(i)!=' ')throw new IllegalArgumentException("Недопустимый символ в настройках");return value.trim();}
 public String url(int z,int x,int y){int n=1<<z;if(z<minZoom||z>maxZoom||x<0||y<0||x>=n||y>=n)throw new IllegalArgumentException("Тайл вне диапазона");String value=(levelTemplates==null?template:levelTemplates[z]);if(value==null)throw new IllegalArgumentException("Масштаб отсутствует в источнике");return value.replace("{z}",Integer.toString(z)).replace("{x}",Integer.toString(x)).replace("{y}",Integer.toString(y)).replace("{q}",TileProjection.quadkey(z,x,y)).replace("{s}","Galileo".substring(0,(3*x+y)%8)).replace("{bbox}",TileProjection.bbox(z,x,y));}
 public boolean hasZoom(int z){return z>=minZoom&&z<=maxZoom&&(levelTemplates==null||levelTemplates[z]!=null);}
 public boolean canDownload(int z){if(!declaredDownloads||!hasZoom(z))return false;try{String host=new URI(url(z,0,0)).getHost();return !host.equals("openstreetmap.org")&&!host.endsWith(".openstreetmap.org");}catch(Exception e){return false;}}
 public int zoomFor(int z){z=Math.max(minZoom,Math.min(maxZoom,z));for(int i=z;i>=minZoom;i--)if(hasZoom(i))return i;for(int i=z+1;i<=maxZoom;i++)if(hasZoom(i))return i;return minZoom;}
 public TileSource[] leafs(){return layers==null?new TileSource[]{this}:layers.clone();}
 /** Constructed solely from the bundled, audited catalogue, never from untrusted imports. */
 static TileSource builtin(String name,String attribution,String[] templates,boolean ellipsoid,boolean downloads){return new TileSource(name,attribution,templates,ellipsoid,downloads,null);}
 static TileSource composite(String name,TileSource[] layers){StringBuilder a=new StringBuilder();for(TileSource s:layers){if(a.length()>0)a.append(" · ");a.append(s.attribution);}return new TileSource(name,a.toString(),null,false,true,layers);}
 private TileSource(String name,String attribution,String[] templates,boolean ellipsoid,boolean download,TileSource[] children){this.name=name;this.attribution=attribution;this.ellipsoid=ellipsoid;declaredDownloads=download;layers=children;levelTemplates=templates;StringBuilder identity=new StringBuilder();int min=23,max=0;boolean allowed=children!=null;boolean someAllowed=false;
  if(children!=null){for(TileSource child:children){identity.append(child.id).append('\n');min=Math.min(min,child.minZoom);max=Math.max(max,child.maxZoom);allowed&=child.downloads;}template="";}
  else{String first="";for(int z=0;z<templates.length;z++)if(templates[z]!=null){String value=templates[z];try{URI uri=new URI(value.replace("{z}","1").replace("{x}","0").replace("{y}","0").replace("{q}","0").replace("{s}","Gal").replace("{bbox}","0,0,1,1"));if(!"https".equals(uri.getScheme())||uri.getHost()==null||uri.getRawUserInfo()!=null||uri.getRawFragment()!=null)throw new Exception();if(!uri.getHost().equals("tile.openstreetmap.org"))someAllowed|=download;}catch(Exception e){throw new IllegalArgumentException("Некорректный встроенный источник: "+name,e);}min=Math.min(min,z);max=Math.max(max,z);if(first.isEmpty())first=value;identity.append(z).append(':').append(value).append('\n');}template=first;identity.append(ellipsoid);}
  minZoom=min;maxZoom=max;downloads=children==null?someAllowed:allowed;try{byte[] hash=MessageDigest.getInstance("SHA-256").digest(identity.toString().getBytes("UTF-8"));StringBuilder h=new StringBuilder();for(byte b:hash)h.append(String.format(Locale.US,"%02x",b&255));id=h.toString();}catch(Exception e){throw new IllegalStateException(e);}
 }
 public static TileSource osm(){return new TileSource("OpenStreetMap","https://tile.openstreetmap.org/{z}/{x}/{y}.png","© OpenStreetMap contributors · openstreetmap.org/copyright",0,19,false);}
}
