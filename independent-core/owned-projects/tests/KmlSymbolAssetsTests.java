import org.rabochaya.projects.*;import org.w3c.dom.*;import javax.xml.parsers.*;import java.util.*;import java.nio.charset.StandardCharsets;
public final class KmlSymbolAssetsTests {
 static int n;static void ck(boolean b){if(!b)throw new AssertionError("symbol assets "+n);n++;}
 static Document document()throws Exception{Document d=DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();d.appendChild(d.createElement("Placemark"));return d;}
 public static void main(String[] args)throws Exception{
  Document owner=document(),foreign=document();Map<String,byte[]> assets=new LinkedHashMap<>();byte[] original="<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 10 10'><rect width='10' height='10' fill='#ff0000'/></svg>".getBytes(StandardCharsets.UTF_8);assets.put("maps/icons/a.svg",original);
  KmlSymbolAssets source=new KmlSymbolAssets(owner,"maps/doc.kml",assets);SvgIcon icon=source.read(owner.getDocumentElement(),"icons/a.svg");ck(icon.shapes.get(0).fill==0xffff0000);ck(Arrays.equals(original,assets.get("maps/icons/a.svg")));
  ck(source.read(owner.getDocumentElement(),"./icons/a.svg").width==10);
  for(String path:new String[]{"../maps/icons/a.svg","/maps/icons/a.svg","file:///maps/icons/a.svg","https://example.invalid/x.svg","content://x","icons\\a.svg","icons/%61.svg","icons/a.svg#x","icons/a.svg?q=x","icons//a.svg","icons/missing.svg"}){try{source.read(owner.getDocumentElement(),path);throw new AssertionError(path);}catch(IllegalArgumentException expected){n++;}}
  try{source.read(foreign.getDocumentElement(),"icons/a.svg");throw new AssertionError("foreign");}catch(IllegalArgumentException expected){n++;}
  assets.put("maps/icons/a.svg","<svg/>".getBytes(StandardCharsets.UTF_8));ck(source.read(owner.getDocumentElement(),"icons/a.svg").width==10); // snapshot owns a private bounded copy.
  Map<String,byte[]> other=new LinkedHashMap<>();other.put("maps/icons/a.svg",new String(original,StandardCharsets.UTF_8).replace("#ff0000","#00ff00").getBytes(StandardCharsets.UTF_8));KmlSymbolAssets second=new KmlSymbolAssets(foreign,"maps/doc.kml",other);ck(second.read(foreign.getDocumentElement(),"icons/a.svg").shapes.get(0).fill==0xff00ff00);
  System.out.println("PASS KmlSymbolAssets: "+n+" checks");
 }
}
