package org.rabochaya.projects;
import java.util.*;
/** Bounded static SVG path grammar; emits absolute M/L/C/Q/Z, no Android or IO. */
public final class SvgPath {
 public static final int MAX_SEGMENTS=4096,MAX_TEXT=65536;private static final double LIMIT=1000000;
 public static final class Segment {public final char command;public final double[] values;private Segment(char c,double... v){command=c;values=v;}}
 private final String text;private int at;private double x,y,startX,startY,controlX,controlY;private char previous;private final ArrayList<Segment> result=new ArrayList<>();
 private SvgPath(String text){if(text==null||text.length()>MAX_TEXT)throw invalid();this.text=text;}
 public static List<Segment> parse(String text){return new SvgPath(text).read();}
 private static IllegalArgumentException invalid(){return new IllegalArgumentException("Неподдержанный или некорректный SVG path");}
 private void space(){while(at<text.length()&&(text.charAt(at)==' '||text.charAt(at)=='\t'||text.charAt(at)=='\r'||text.charAt(at)=='\n'))at++;}
 private boolean letter(){return at<text.length()&&Character.isLetter(text.charAt(at));}
 private void separator(boolean first){space();if(at<text.length()&&text.charAt(at)==','){if(first)throw invalid();at++;space();if(at==text.length()||text.charAt(at)==','||letter())throw invalid();}}
 private double number(boolean first){separator(first);int begin=at;if(at<text.length()&&(text.charAt(at)=='+'||text.charAt(at)=='-'))at++;int digits=0;while(at<text.length()&&text.charAt(at)>='0'&&text.charAt(at)<='9'){at++;digits++;}if(at<text.length()&&text.charAt(at)=='.'){at++;while(at<text.length()&&text.charAt(at)>='0'&&text.charAt(at)<='9'){at++;digits++;}}if(digits==0)throw invalid();if(at<text.length()&&(text.charAt(at)=='e'||text.charAt(at)=='E')){at++;if(at<text.length()&&(text.charAt(at)=='+'||text.charAt(at)=='-'))at++;int exp=at;while(at<text.length()&&text.charAt(at)>='0'&&text.charAt(at)<='9')at++;if(exp==at)throw invalid();}if(at-begin>64)throw invalid();try{return bounded(Double.parseDouble(text.substring(begin,at)));}catch(NumberFormatException bad){throw invalid();}}
 private int flag(){separator(false);if(at>=text.length()||(text.charAt(at)!='0'&&text.charAt(at)!='1'))throw invalid();return text.charAt(at++)-'0';}
 private static double bounded(double n){if(Double.isNaN(n)||Double.isInfinite(n)||Math.abs(n)>LIMIT)throw invalid();return n;}
 private void emit(char c,double... v){if(result.size()>=MAX_SEGMENTS)throw invalid();for(double n:v)bounded(n);result.add(new Segment(c,v));}
 private List<Segment> read(){space();if(at==text.length()||(text.charAt(at)!='M'&&text.charAt(at)!='m'))throw invalid();char command=0;boolean explicit=false;
  while(true){space();if(at==text.length())break;if(letter()){command=text.charAt(at++);explicit=true;}else explicit=false;
   boolean relative=command>='a'&&command<='z';char c=Character.toUpperCase(command);if("MLHVCSQTAZ".indexOf(c)<0)throw invalid();
   if(c=='Z'){if(!explicit)throw invalid();emit('Z');x=startX;y=startY;previous=c;command=0;continue;}
   double ox=relative?x:0,oy=relative?y:0;double a=number(explicit),b=0,d=0,e=0,f=0,g=0;
   switch(c){
    case 'M':case 'L':b=number(false);x=bounded(a+ox);y=bounded(b+oy);emit(c,x,y);if(c=='M'){startX=x;startY=y;command=relative?'l':'L';}break;
    case 'H':x=bounded(a+ox);emit('L',x,y);break;
    case 'V':y=bounded(a+oy);emit('L',x,y);break;
    case 'C':b=number(false);d=number(false);e=number(false);f=number(false);g=number(false);emit('C',a+ox,b+oy,d+ox,e+oy,f+ox,g+oy);controlX=d+ox;controlY=e+oy;x=f+ox;y=g+oy;break;
    case 'S':b=number(false);d=number(false);e=number(false);emit('C',previous=='C'||previous=='S'?2*x-controlX:x,previous=='C'||previous=='S'?2*y-controlY:y,a+ox,b+oy,d+ox,e+oy);controlX=a+ox;controlY=b+oy;x=d+ox;y=e+oy;break;
    case 'Q':b=number(false);d=number(false);e=number(false);emit('Q',a+ox,b+oy,d+ox,e+oy);controlX=a+ox;controlY=b+oy;x=d+ox;y=e+oy;break;
    case 'T':b=number(false);double qx=previous=='Q'||previous=='T'?2*x-controlX:x,qy=previous=='Q'||previous=='T'?2*y-controlY:y;emit('Q',qx,qy,a+ox,b+oy);controlX=qx;controlY=qy;x=a+ox;y=b+oy;break;
    case 'A':b=number(false);d=number(false);int large=flag(),sweep=flag();e=number(false);f=number(false);arc(Math.abs(a),Math.abs(b),d,large,sweep,e+ox,f+oy);x=bounded(e+ox);y=bounded(f+oy);break;
    default:throw invalid();
   }previous=c;
  }
  return Collections.unmodifiableList(result);
 }
 /** SVG endpoint-to-center conversion, non-recursive radius correction, <=4 cubic pieces. */
 private void arc(double rx,double ry,double rotation,int large,int sweep,double nx,double ny){bounded(nx);bounded(ny);if(x==nx&&y==ny)return;if(rx==0||ry==0){emit('L',nx,ny);return;}
  double angle=Math.toRadians(rotation%360),cs=Math.cos(angle),sn=Math.sin(angle),dx=(x-nx)/2,dy=(y-ny)/2,px=cs*dx+sn*dy,py=-sn*dx+cs*dy;
  double ux=px/rx,uy=py/ry,scale=Math.hypot(ux,uy);if((Double.isNaN(scale)||Double.isInfinite(scale)))throw invalid();if(scale>1){rx*=scale;ry*=scale;}
  double rx2=rx*rx,ry2=ry*ry,p2=px*px,q2=py*py,den=rx2*q2+ry2*p2;if(!(den>0)||(Double.isNaN(den)||Double.isInfinite(den)))throw invalid();double factor=Math.sqrt(Math.max(0,(rx2*ry2-den)/den))*(large==sweep?-1:1);double ccx=factor*rx*py/ry,ccy=-factor*ry*px/rx;
  double cx=cs*ccx-sn*ccy+(x+nx)/2,cy=sn*ccx+cs*ccy+(y+ny)/2;
  double from=Math.atan2((py-ccy)/ry,(px-ccx)/rx),to=Math.atan2((-py-ccy)/ry,(-px-ccx)/rx),delta=to-from;if(sweep==1&&delta<0)delta+=Math.PI*2;if(sweep==0&&delta>0)delta-=Math.PI*2;
  int count=(int)Math.ceil(Math.abs(delta)/(Math.PI/2));if(count<1||count>4)throw invalid();double step=delta/count;
  for(int i=0;i<count;i++){double t=from+i*step,u=t+step,k=4.0/3*Math.tan(step/4),ct=Math.cos(t),st=Math.sin(t),cu=Math.cos(u),su=Math.sin(u);double p0x=cx+cs*rx*ct-sn*ry*st,p0y=cy+sn*rx*ct+cs*ry*st,p1x=cx+cs*rx*cu-sn*ry*su,p1y=cy+sn*rx*cu+cs*ry*su;
   emit('C',p0x+k*(-cs*rx*st-sn*ry*ct),p0y+k*(-sn*rx*st+cs*ry*ct),p1x-k*(-cs*rx*su-sn*ry*cu),p1y-k*(-sn*rx*su+cs*ry*cu),i==count-1?nx:p1x,i==count-1?ny:p1y);
  }
 }
}
