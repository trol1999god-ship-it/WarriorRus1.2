import org.rabochaya.projects.*;import java.nio.charset.StandardCharsets;
public final class SvgIconTests {
 static int n;static void ck(boolean v){if(!v)throw new AssertionError("SVG icon "+n);n++;}
 static SvgIcon parse(String body){return SvgIcon.parse(("<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 10'>"+body+"</svg>").getBytes(StandardCharsets.UTF_8));}
 static void bad(String body){try{parse(body);throw new AssertionError("accepted "+body);}catch(IllegalArgumentException e){n++;}}
 public static void main(String[] args){
  SvgIcon s=parse("<g fill='#ff0000'><path d='M0 0 L20 0 L10 10z'/><circle cx='3' cy='4' r='2' fill='none' stroke='#00ff00' stroke-width='2'/></g>");ck(s.shapes.size()==2);ck(s.width==20&&s.height==10);ck(s.shapes.get(0).fill==0xffff0000);ck(s.shapes.get(1).fill==null&&s.shapes.get(1).stroke==0xff00ff00);ck(s.shapes.get(1).strokeWidth==2);
  s=parse("<rect x='1' y='2' width='3' height='4'/><ellipse cx='8' cy='4' rx='3' ry='2'/><polygon points='0,0 5,0 5,5'/><polyline points='1 1 4 5'/><line x1='0' y1='0' x2='20' y2='10' stroke='#123'/>");ck(s.shapes.size()==5);ck(s.shapes.get(4).stroke==0xff112233);
  s=parse("<path d='M0 0 L10 10' fill='none' fill-rule='evenodd' opacity='.5' stroke-opacity='.5' stroke='#000'/>");ck(s.shapes.get(0).stroke==0x40000000);ck(s.shapes.get(0).evenOdd);
  for(String body:new String[]{"<script/>","<image href='x'/>","<use href='#x'/>","<foreignObject/>","<text>Hi</text>","<style/>","<path d='M0 0' style='fill:red'/>","<path d='M0 0' onclick='x'/>","<path d='M0 0' fill='url(x)'/>","<path d='M0 0' transform='translate(1)'/>","<g opacity='.5'><rect width='3' height='3'/></g>","<rect width='-1' height='1'/>","<rect width='1' height='1' rx='1'/>","<circle r='NaN'/>","<circle r='0'/>","<rect width='0' height='2'/>","<path d='M0 0' foo='x'/>","<polygon points='0 0 1'/>","<x:path xmlns:x='urn:evil' d='M0 0'/>","<path d='M0 0' fill='red'/>","bad"})bad(body);
  try{SvgIcon.parse("<!DOCTYPE svg [<!ENTITY x SYSTEM 'file:///etc/passwd'>]><svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1 1'>&x;</svg>".getBytes(StandardCharsets.UTF_8));throw new AssertionError("DTD");}catch(IllegalArgumentException e){n++;}
  try{SvgIcon.parse(new byte[65537]);throw new AssertionError("size");}catch(IllegalArgumentException e){n++;}
  StringBuilder deep=new StringBuilder();for(int i=0;i<17;i++)deep.append("<g>");for(int i=0;i<17;i++)deep.append("</g>");bad(deep.toString());
  StringBuilder many=new StringBuilder();for(int i=0;i<257;i++)many.append("<path d='M0 0'/>");bad(many.toString());
  SvgIcon original=SvgIcon.parse("<svg width='36' height='36'><path style='fill-opacity:0.25' d='M0 0L36 0L18 36z'/></svg>".getBytes(StandardCharsets.UTF_8));ck(original.width==36&&original.height==36&&original.pixelWidth==36&&original.pixelHeight==36);ck(original.shapes.get(0).fill==0x40000000);
  SvgIcon sized=SvgIcon.parse("<svg xmlns='http://www.w3.org/2000/svg' width='48px' height='24px' viewBox='-5 -2 20 10'><circle r='1'/></svg>".getBytes(StandardCharsets.UTF_8));ck(sized.pixelWidth==48&&sized.pixelHeight==24&&sized.left==-5&&sized.top==-2);
  for(String body:new String[]{"<path d='M0 0' style='fill:url(https://evil.invalid)'/>","<path d='M0 0' style='fill-opacity:.5;fill-opacity:.2'/>","<path d='M0 0' style='unknown:1'/>","<path d='M0 0' style='fill-opacity:.5!important'/>","<path d='M0 0' style='fill-opacity:.5;@import:x'/>","<g style='opacity:.5'><circle r='2'/></g>"})bad(body);
  ck(parse("<path d=''/><path d='M0 0L1 1'/>").shapes.get(0).path.isEmpty());
  System.out.println("PASS SvgIcon: "+n+" checks");
 }
}
