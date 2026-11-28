package org.rabochaya.maptests;
import android.content.*;import android.graphics.*;import android.view.*;import java.io.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;
/** Actual main renderer, owner isolation and exact KMZ/data checks in existing offlineformats. */
final class SvgChecks {
 final MapAndroidChecks m;final ManagerRotationChecks raw;SvgChecks(MapAndroidChecks m){this.m=m;raw=new ManagerRotationChecks(m);}
 Object source(Object doc)throws Exception{return m.owned("KmlSymbolAssets").getConstructor(org.w3c.dom.Document.class,String.class,Map.class).newInstance(((org.w3c.dom.Element)m.call(doc,"root",new Class[]{})).getOwnerDocument(),m.codec.getField("entry").get(doc),m.assets(doc));}
 Bitmap draw(Object doc,Object source,List<String> errors)throws Exception{Object[] map={null};Throwable[] failure={null};Bitmap[] image={null};try{
  m.runOnMainSync(()->{try{Class<?> listener=m.owned("LocalMapView$Listener");Object callback=Proxy.newProxyInstance(listener.getClassLoader(),new Class[]{listener},(o,method,args)->{if(method.getName().equals("error"))errors.add((String)args[0]);return null;});map[0]=m.owned("LocalMapView").getConstructor(Context.class,List.class,File.class,listener).newInstance(m.getTargetContext(),m.call(doc,"features",new Class[]{boolean.class},false),null,callback);((View)map[0]).layout(0,0,800,600);m.call(map[0],"restore",new Class[]{double.class,double.class,double.class},.5,.5,3.0);m.call(map[0],"setSymbols",new Class[]{m.owned("KmlSymbolAssets")},source);}catch(Throwable t){failure[0]=t;}});if(failure[0]!=null)throw new AssertionError(failure[0]);
  Field worker=map[0].getClass().getDeclaredField("worker");worker.setAccessible(true);((ExecutorService)worker.get(map[0])).submit(()->{}).get(15,TimeUnit.SECONDS);m.waitForIdleSync();
  m.runOnMainSync(()->{try{Field ready=map[0].getClass().getDeclaredField("mapReady");ready.setAccessible(true);ready.setBoolean(map[0],false);image[0]=Bitmap.createBitmap(800,600,Bitmap.Config.ARGB_8888);((View)map[0]).draw(new Canvas(image[0]));}catch(Throwable t){failure[0]=t;}});if(failure[0]!=null)throw new AssertionError(failure[0]);return image[0];
 }catch(Exception|AssertionError t){if(image[0]!=null)image[0].recycle();throw t;}finally{if(map[0]!=null)m.runOnMainSync(()->{try{m.call(map[0],"close",new Class[]{});}catch(Exception e){throw new RuntimeException(e);}});}}
 void pixel(Bitmap image,int x,int y,int color,String why){int c=image.getPixel(x,y);m.check(Math.abs(Color.red(c)-Color.red(color))<=1&&Math.abs(Color.green(c)-Color.green(color))<=1&&Math.abs(Color.blue(c)-Color.blue(color))<=1,why+" actual="+Integer.toHexString(c));}
 Object variant(String xml,String svg)throws Exception{Object doc=m.codec.getMethod("parse",byte[].class).invoke(null,(Object)xml.getBytes("UTF-8"));m.assets(doc).put("icons/shape.svg",svg.getBytes("UTF-8"));return doc;}
 void assignment(String svg) throws Exception {
  Object store = m.storeClass.getConstructor(Context.class).newInstance(m.getTargetContext());
  long project = -1;
  try {
   String xml = "<kml xmlns='http://www.opengis.net/kml/2.2'><Document>"
     + "<Placemark id='target'><Point><coordinates>-20,10</coordinates></Point></Placemark>"
     + "<Placemark id='other'><Point><coordinates>20,10</coordinates></Point></Placemark>"
     + "<Placemark id='line'><LineString><coordinates>0,5 0,7</coordinates></LineString></Placemark>"
     + "</Document></kml>";
   Object doc = m.codec.getMethod("parse", byte[].class).invoke(null, (Object) xml.getBytes("UTF-8"));
   m.codec.getField("entry").set(doc, "nested/map.kml");
   byte[] attachment = {7, 5, 3};
   m.assets(doc).put("nested/keep.bin", attachment);
   project = (Long) m.call(store, "insert", new Class[]{m.codec, String.class}, doc, "QA_SVG_ASSIGN");
   doc = raw.load(store, project);
   String originalToken = m.treeToken(doc);
   byte[] original = raw.xml(doc);
   byte[] bytes = svg.getBytes("UTF-8");
   Class<?>[] signature = {m.storeClass, long.class, String.class, String.class, InputStream.class};
   try {
    m.staticCall("ObjectTreeWrites", "assignSvg", signature, store, project, "2", originalToken, new ByteArrayInputStream(bytes));
    throw new AssertionError("Route accepted a point icon");
   } catch (InvocationTargetException rejected) {
    m.check(rejected.getCause() instanceof IllegalArgumentException, "route is rejected");
   }
   try {
    m.staticCall("ObjectTreeWrites", "assignSvg", signature, store, project, "0", originalToken, new ByteArrayInputStream(new byte[65537]));
    throw new AssertionError("Oversize icon accepted");
   } catch (InvocationTargetException rejected) {
    m.check(rejected.getCause() instanceof IOException, "oversize SVG is rejected before write");
   }
   Object unchanged = raw.load(store, project);
   m.check(Arrays.equals(original, raw.xml(unchanged)) && m.assets(unchanged).size() == 1, "refused assignments leave the project intact");
   m.staticCall("ObjectTreeWrites", "assignSvg", signature, store, project, "0", originalToken, new ByteArrayInputStream(bytes));
   Object saved = raw.load(store, project);
   String href = m.element(saved, "target").getElementsByTagNameNS("*", "href").item(0).getTextContent();
   m.check(href.matches("icons/rk-[0-9a-f]{64}\\.svg"), "assigned icon uses project-relative path");
   m.check(Arrays.equals(bytes, m.assets(saved).get("nested/" + href)), "assignment stores exact bytes beside nested KML");
   m.check(Arrays.equals(attachment, m.assets(saved).get("nested/keep.bin")), "assignment preserves original attachment bytes");
   m.check(m.element(doc,"other").isEqualNode(m.element(saved,"other")), "another placemark remains unchanged");
   try {
    m.staticCall("ObjectTreeWrites", "assignSvg", signature, store, project, "1", originalToken, new ByteArrayInputStream(bytes));
    throw new AssertionError("Stale choice accepted");
   } catch (InvocationTargetException rejected) {
    m.check(rejected.getCause() instanceof IllegalStateException, "stale selection is rejected");
   }
   m.staticCall("ObjectTreeWrites", "assignSvg", signature, store, project, "1", m.treeToken(saved), new ByteArrayInputStream(bytes));
   saved = raw.load(store, project);
   m.check(m.assets(saved).size() == 2, "identical icons are stored once");
   ByteArrayOutputStream out = new ByteArrayOutputStream();
   m.call(saved, "kmz", new Class[]{OutputStream.class}, out);
   Object round = m.codec.getMethod("read", InputStream.class, boolean.class).invoke(null, new ByteArrayInputStream(out.toByteArray()), true);
   raw.sameAssets(round, m.assets(saved));
   List<String> errors = new ArrayList<>();
   Bitmap image = draw(round, source(round), errors);
   try {
    int x = (int) Math.round(400 - 20.0 / 360 * 2048);
    int y = (int) Math.round(300 - Math.log(Math.tan(Math.PI / 4 + Math.toRadians(10) / 2)) / (2 * Math.PI) * 2048);
    pixel(image, x - 10, y - 10, 0xffff0000, "assigned SVG renders after database and KMZ reopen");
    m.check(errors.isEmpty(), "assigned SVG resolves without warnings");
   } finally {
    image.recycle();
   }
  } finally {
   if (project > 0) m.call(store, "remove", new Class[]{long.class}, project);
   m.call(store, "close", new Class[]{});
  }
 }

 void run()throws Exception{
  String svg="<svg width='36' height='36'><path fill='#ff0000' fill-rule='evenodd' d='M0 0H36V36H0Z M14 14H22V22H14Z'/></svg>";
  assignment(svg);
  String xml="<kml xmlns='http://www.opengis.net/kml/2.2'><Document><Style id='s'><IconStyle><scale>1</scale><heading>0</heading><Icon><href>icons/shape.svg</href></Icon><hotSpot x='0.5' y='0.5' xunits='fraction' yunits='fraction'/></IconStyle><LabelStyle><scale>0</scale></LabelStyle></Style><StyleMap id='m'><Pair><key>normal</key><styleUrl>#s</styleUrl></Pair></StyleMap><Placemark id='svg'><name>QA_SVG</name><styleUrl>#m</styleUrl><Point><coordinates>-20,10</coordinates></Point></Placemark></Document></kml>";
  Object doc=m.codec.getMethod("parse",byte[].class).invoke(null,(Object)xml.getBytes("UTF-8"));m.assets(doc).put("icons/shape.svg",svg.getBytes("UTF-8"));m.assets(doc).put("attachments/keep.bin",new byte[]{1,2,3});byte[] before=raw.xml(doc);Map<String,byte[]> assets=new HashMap<>(m.assets(doc));List<String> errors=new ArrayList<>();int x=(int)Math.round(400-20.0/360*2048),y=(int)Math.round(300-Math.log(Math.tan(Math.PI/4+Math.toRadians(10)/2))/(2*Math.PI)*2048);int requests=m.requests.get();
  Bitmap image=draw(doc,source(doc),errors);try{pixel(image,x-10,y-10,0xffff0000,"actual SVG shape replaces circle through normal StyleMap");pixel(image,x,y,0xff253020,"SVG evenodd hole remains transparent, no fallback circle");pixel(image,x+20,y,0xff253020,"SVG stays within native36px bounds");m.check(errors.isEmpty(),"valid owner SVG has no unsupported warning");}finally{image.recycle();}
  for(String bad:new String[]{"<!DOCTYPE svg [<!ENTITY x SYSTEM 'https://example.invalid/entity'>]><svg width='36' height='36'>&x;</svg>","<svg width='36' height='36'><image href='https://example.invalid/image'/></svg>","<svg width='36' height='36'><script>bad</script></svg>","<svg width='36' height='36'><path d='MNaN 0'/></svg>"}){boolean refused=false;try{m.staticCall("SvgIcon","parse",new Class[]{byte[].class},(Object)bad.getBytes("UTF-8"));}catch(InvocationTargetException expected){refused=expected.getCause() instanceof IllegalArgumentException;}m.check(refused,"runtime SVG DTD/external/script/invalid refuses, no network");}
  StringBuilder duplicatePoints=new StringBuilder();
  for(int n=0;n<33;n++){
   duplicatePoints.append("<Placemark id='same_icon_").append(n)
    .append("'><styleUrl>#m</styleUrl><Point><coordinates>")
    .append(n==32?"20,10":"-20,10").append("</coordinates></Point></Placemark>");
  }
  Object shared=variant(xml.replace("</Document>",duplicatePoints+"</Document>"),svg);
  image=draw(shared,source(shared),errors);
  try{
   int lastPointX=(int)Math.round(400+20.0/360*2048);
   pixel(image,lastPointX-10,y-10,0xffff0000,"shared SVG renders on a point beyond the first 32");
   m.check(errors.isEmpty(),"points sharing one icon stay within the bitmap budget");
  }finally{image.recycle();}
  Object scaled=variant(xml.replace("<scale>1</scale>","<scale>2</scale>"),svg);image=draw(scaled,source(scaled),errors);try{pixel(image,x-25,y-25,0xffff0000,"KML scale2 expands real SVG pixels");pixel(image,x+40,y,0xff253020,"scaled SVG remains bounded");}finally{image.recycle();}
  Object hidden=variant(xml.replace("<scale>1</scale>","<scale>0</scale>"),svg);image=draw(hidden,source(hidden),errors);try{pixel(image,x-10,y-10,0xff253020,"explicit icon scale0 hides SVG without fallback circle");}finally{image.recycle();}
  String corner="<svg width='36' height='36'><path fill='#ff0000' d='M0 0H18V18H0Z'/></svg>";Object rotated=variant(xml.replace("<heading>0</heading>","<heading>90</heading>"),corner);image=draw(rotated,source(rotated),errors);try{pixel(image,x+10,y-10,0xffff0000,"KML heading90 rotates asymmetrical SVG clockwise");pixel(image,x-10,y-10,0xff253020,"heading does not leave old unrotated shape");}finally{image.recycle();}
  Object anchored=variant(xml.replace("x='0.5' y='0.5'","x='0' y='0'"),svg);image=draw(anchored,source(anchored),errors);try{pixel(image,x+10,y-10,0xffff0000,"fraction0 hotSpot anchors SVG lower left");pixel(image,x-5,y-10,0xff253020,"hotSpot does not silently use center");}finally{image.recycle();}
  Object tinted=variant(xml.replace("<IconStyle>","<IconStyle><color>8000ff00</color>").replace("</Document>","<Placemark><Point><coordinates>20,10</coordinates></Point></Placemark></Document>"),svg.replace("#ff0000","#ffffff"));image=draw(tinted,source(tinted),errors);try{pixel(image,x-10,y-10,0xff129810,"KML IconStyle multiplies SVG RGB and alpha");pixel(image,(int)Math.round(400+20.0/360*2048),y,0xffe6c45a,"SVG filter/alpha never leaks to adjacent default point");}finally{image.recycle();}
  m.check(Arrays.equals(before,raw.xml(doc)),"SVG render exact original KML");raw.sameAssets(doc,assets);ByteArrayOutputStream out=new ByteArrayOutputStream();m.call(doc,"kmz",new Class[]{OutputStream.class},out);Object round=m.codec.getMethod("read",InputStream.class,boolean.class).invoke(null,new ByteArrayInputStream(out.toByteArray()),true);m.check(Arrays.equals(before,raw.xml(round)),"SVG KML exact through KMZ import/export");raw.sameAssets(round,assets);image=draw(round,source(round),errors);try{pixel(image,x-10,y-10,0xffff0000,"SVG shape survives KMZ reopen");}finally{image.recycle();}
  Object foreign=m.codec.getMethod("parse",byte[].class).invoke(null,(Object)xml.getBytes("UTF-8"));m.assets(foreign).put("icons/shape.svg",svg.replace("#ff0000","#0000ff").getBytes("UTF-8"));image=draw(foreign,source(foreign),errors);try{pixel(image,x-10,y-10,0xff0000ff,"same XML/href another owner uses own bytes");}finally{image.recycle();}
  errors.clear();image=draw(foreign,source(doc),errors);try{m.check(!errors.isEmpty(),"foreign Document source explicitly refuses and warns");m.check(image.getPixel(x-10,y-10)!=0xffff0000,"foreign icon bytes never appear");}finally{image.recycle();}
  Object external=m.codec.getMethod("parse",byte[].class).invoke(null,(Object)xml.replace("icons/shape.svg","https://example.invalid/private.svg").getBytes("UTF-8"));errors.clear();image=draw(external,source(external),errors);try{m.check(!errors.isEmpty(),"external SVG refused visibly, not silently rendered");}finally{image.recycle();}m.check(m.requests.get()==requests,"SVG source/render/import/export/foreign refusal never requests network");raw.sameAssets(doc,assets);m.check(Arrays.equals(before,raw.xml(doc)),"all SVG checks preserve original DOM");new ManagerVisualChecks(m).emit("KML_SVG actual main renderer shape/hole/StyleMap/native-size/KMZ/owner/external/data PASS");
 }
}
