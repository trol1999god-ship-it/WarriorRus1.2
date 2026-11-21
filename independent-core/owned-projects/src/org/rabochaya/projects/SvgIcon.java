package org.rabochaya.projects;
import java.io.*;import java.nio.*;import java.nio.charset.*;import java.util.*;import javax.xml.parsers.*;import org.xml.sax.*;import org.xml.sax.helpers.DefaultHandler;
/** Conservative static SVG profile. Unsupported rendering features reject the whole icon. */
public final class SvgIcon {
 public final double left,top,width,height,pixelWidth,pixelHeight;public final List<Shape> shapes;
 public static final class Shape {public final List<SvgPath.Segment> path;public final Integer fill,stroke;public final double strokeWidth;public final boolean evenOdd;private Shape(List<SvgPath.Segment> p,Paint paint){path=p;fill=paint.fill;stroke=paint.stroke;strokeWidth=paint.width;evenOdd=paint.evenOdd;}}
 private SvgIcon(Reader r){left=r.view[0];top=r.view[1];width=r.view[2];height=r.view[3];pixelWidth=r.pixelWidth;pixelHeight=r.pixelHeight;shapes=Collections.unmodifiableList(r.shapes);}
 private static IllegalArgumentException bad(){return new IllegalArgumentException("SVG: неподдержанная функция или некорректные данные");}
 public static SvgIcon parse(byte[] bytes){if(bytes==null||bytes.length==0||bytes.length>65536)throw bad();try{
  String xml=StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT).onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString();
  SAXParserFactory f=SAXParserFactory.newInstance();f.setNamespaceAware(true);f.setFeature("http://xml.org/sax/features/external-general-entities",false);f.setFeature("http://xml.org/sax/features/external-parameter-entities",false);
  XMLReader parser=f.newSAXParser().getXMLReader();Reader reader=new Reader();parser.setProperty("http://xml.org/sax/properties/lexical-handler",reader);parser.setContentHandler(reader);parser.setErrorHandler(reader);parser.setEntityResolver(new EntityResolver(){public InputSource resolveEntity(String publicId,String systemId)throws SAXException{throw new SAXException("External resource forbidden");}});parser.parse(new InputSource(new StringReader(xml)));if(reader.view==null||reader.depth!=0||reader.shapes.isEmpty())throw bad();return new SvgIcon(reader);
 }catch(Exception invalid){throw bad();}}
 private static double number(String v){if(v==null||v.length()>64||!v.matches("[+-]?(?:[0-9]+(?:\\.[0-9]*)?|\\.[0-9]+)(?:[eE][+-]?[0-9]+)?"))throw bad();double n=Double.parseDouble(v);if(Double.isNaN(n)||Double.isInfinite(n)||Math.abs(n)>1000000)throw bad();return n;}
 private static double value(Map<String,String> a,String key,double fallback){String v=a.get(key);return v==null?fallback:number(v);}
 private static double length(String s){if(s==null)throw bad();if(s.endsWith("px"))s=s.substring(0,s.length()-2);double n=number(s);if(n<=0||n>4096)throw bad();return n;}
 private static double positive(double n){if(n<0)throw bad();return n;}
 private static Integer color(String s){if(s.equals("none"))return null;if(s.matches("#[0-9a-fA-F]{3}")){String h=s.substring(1);s="#"+h.charAt(0)+h.charAt(0)+h.charAt(1)+h.charAt(1)+h.charAt(2)+h.charAt(2);}if(!s.matches("#[0-9a-fA-F]{6}"))throw bad();return 0xff000000|Integer.parseInt(s.substring(1),16);}
 private static double opacity(Map<String,String> a,String key){double n=value(a,key,1);if(n<0||n>1)throw bad();return n;}
 private static Integer alpha(Integer c,double n){return c==null?null:(c&0xffffff)|((int)Math.round(((c>>>24)&255)*n)<<24);}
 private static final class Paint {Integer fill=0xff000000,stroke=null;double width=1;boolean evenOdd;Paint(){}Paint(Paint p){fill=p.fill;stroke=p.stroke;width=p.width;evenOdd=p.evenOdd;}}
 private static final class Reader extends DefaultHandler implements org.xml.sax.ext.LexicalHandler {
  int depth,nodes,segments;double[] view;double pixelWidth,pixelHeight;final ArrayList<Shape> shapes=new ArrayList<>();final ArrayDeque<Paint> stack=new ArrayDeque<>();final ArrayDeque<Boolean> containers=new ArrayDeque<>();
  public void startElement(String uri,String local,String qName,Attributes attrs){if(++depth>16||++nodes>256||(!uri.isEmpty()&&!uri.equals("http://www.w3.org/2000/svg"))||(!containers.isEmpty()&&!containers.peek()))throw bad();
   Map<String,String> a=new HashMap<>();for(int i=0;i<attrs.getLength();i++){if(!attrs.getURI(i).isEmpty())throw bad();String key=attrs.getLocalName(i);if(a.put(key,attrs.getValue(i).trim())!=null)throw bad();}
   boolean container=local.equals("svg")||local.equals("g");if(depth==1&&!local.equals("svg")||depth>1&&local.equals("svg"))throw bad();String allowed="fill stroke stroke-width fill-rule";
   if(local.equals("svg"))allowed+=" viewBox width height";else if(local.equals("g")){}else if(local.equals("path"))allowed+=" d opacity fill-opacity stroke-opacity";else if(local.equals("rect"))allowed+=" x y width height opacity fill-opacity stroke-opacity";else if(local.equals("circle"))allowed+=" cx cy r opacity fill-opacity stroke-opacity";else if(local.equals("ellipse"))allowed+=" cx cy rx ry opacity fill-opacity stroke-opacity";else if(local.equals("line"))allowed+=" x1 y1 x2 y2 opacity fill-opacity stroke-opacity";else if(local.equals("polygon")||local.equals("polyline"))allowed+=" points opacity fill-opacity stroke-opacity";else throw bad();
   String inline=a.remove("style");if(inline!=null){if(container)throw bad();Set<String> seen=new HashSet<>();for(String declaration:inline.split(";",-1)){if(declaration.trim().isEmpty())continue;String[] pair=declaration.split(":",-1);if(pair.length!=2)throw bad();String key=pair[0].trim(),value=pair[1].trim();if(!Arrays.asList("fill","stroke","stroke-width","fill-rule","opacity","fill-opacity","stroke-opacity").contains(key)||!seen.add(key))throw bad();a.put(key,value);}}
   Set<String> keys=new HashSet<>(Arrays.asList(allowed.split(" ")));for(String key:a.keySet())if(!keys.contains(key))throw bad();
   Paint p=stack.isEmpty()?new Paint():new Paint(stack.peek());if(a.containsKey("fill"))p.fill=color(a.get("fill"));if(a.containsKey("stroke"))p.stroke=color(a.get("stroke"));p.width=positive(value(a,"stroke-width",p.width));if(a.containsKey("fill-rule")){String rule=a.get("fill-rule");if(!rule.equals("evenodd")&&!rule.equals("nonzero"))throw bad();p.evenOdd=rule.equals("evenodd");}
   if(depth==1){String box=a.get("viewBox");if(box==null){pixelWidth=length(a.get("width"));pixelHeight=length(a.get("height"));view=new double[]{0,0,pixelWidth,pixelHeight};}else{view=points(box,4);if(view.length!=4||view[2]<=0||view[3]<=0)throw bad();pixelWidth=a.containsKey("width")?length(a.get("width")):view[2];pixelHeight=a.containsKey("height")?length(a.get("height")):view[3];}}
   if(!container){double op=opacity(a,"opacity");p.fill=alpha(p.fill,op*opacity(a,"fill-opacity"));p.stroke=alpha(p.stroke,op*opacity(a,"stroke-opacity"));String path;
    if(local.equals("path")){path=a.get("d");if(path==null)throw bad();}
    else if(local.equals("rect")){double x=value(a,"x",0),y=value(a,"y",0),w=positive(value(a,"width",0)),h=positive(value(a,"height",0));if(w==0||h==0)throw bad();path="M"+x+" "+y+"h"+w+"v"+h+"h"+(-w)+"z";}
    else if(local.equals("circle")||local.equals("ellipse")){double x=value(a,"cx",0),y=value(a,"cy",0),rx=positive(value(a,local.equals("circle")?"r":"rx",0)),ry=local.equals("circle")?rx:positive(value(a,"ry",0));if(rx==0||ry==0)throw bad();path="M"+(x-rx)+" "+y+"a"+rx+" "+ry+" 0 1 0 "+(2*rx)+" 0a"+rx+" "+ry+" 0 1 0 "+(-2*rx)+" 0z";}
    else if(local.equals("line"))path="M"+value(a,"x1",0)+" "+value(a,"y1",0)+"L"+value(a,"x2",0)+" "+value(a,"y2",0);
    else{double[] pts=points(a.get("points"),8192);if(pts.length<4||pts.length%2!=0)throw bad();StringBuilder b=new StringBuilder("M");for(int i=0;i<pts.length;i+=2){if(i>0)b.append('L');b.append(pts[i]).append(' ').append(pts[i+1]);}if(local.equals("polygon"))b.append('z');path=b.toString();}
    List<SvgPath.Segment> parsed=path.trim().isEmpty()?Collections.<SvgPath.Segment>emptyList():SvgPath.parse(path);segments+=parsed.size();if(segments>4096)throw bad();shapes.add(new Shape(parsed,p));
   }stack.push(p);containers.push(container);
  }
  public void endElement(String uri,String name,String qName){stack.pop();containers.pop();depth--;}
  public void characters(char[] chars,int start,int length){for(int i=start;i<start+length;i++)if(!Character.isWhitespace(chars[i]))throw bad();}
  public void processingInstruction(String target,String data){throw bad();}
  public void startDTD(String name,String publicId,String systemId)throws SAXException{throw new SAXException("DTD forbidden");}public void endDTD(){}public void startEntity(String name){}public void endEntity(String name){}public void startCDATA(){}public void endCDATA(){}public void comment(char[] chars,int start,int length){}
  public void error(SAXParseException e)throws SAXException{throw e;}public void fatalError(SAXParseException e)throws SAXException{throw e;}
 }
 private static double[] points(String s,int limit){if(s==null||s.length()>65536||s.trim().isEmpty()||s.trim().startsWith(",")||s.trim().endsWith(",")||s.matches("(?s).*,\\s*,.*"))throw bad();String[] parts=s.trim().split("[ \\t\\r\\n,]+");if(parts.length>limit)throw bad();double[] values=new double[parts.length];for(int i=0;i<parts.length;i++)values[i]=number(parts[i]);return values;}
}
