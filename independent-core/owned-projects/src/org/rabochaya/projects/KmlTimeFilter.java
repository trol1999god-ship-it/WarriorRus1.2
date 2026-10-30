package org.rabochaya.projects;

import java.math.BigDecimal;
import java.util.*;
import java.util.regex.*;
import org.w3c.dom.*;

/** Read-only search of a feature's own KML TimeStamp/TimeSpan, independent of device time zone. */
public final class KmlTimeFilter {
 public static final int ABSENT=0,VALID=1,UNRECOGNIZED=2;
 public static final String[] MODES={"Любые даты","Есть дата KML","Пересекается с периодом","Без даты KML","Дата KML не распознана"};
 private static final Pattern VALUE=Pattern.compile("([0-9]{4})(?:-([0-9]{2})(?:-([0-9]{2})(?:T([0-9]{2}):([0-9]{2}):([0-9]{2})(\\.[0-9]+)?)?)?)?(Z|[+-][0-9]{2}:[0-9]{2})?");
 public static final class Query {
  public final int mode;public final String from,to;private final BigDecimal begin,end;
  public Query(int mode,String from,String to){
   if(mode<0||mode>=MODES.length||from==null||to==null)throw new IllegalArgumentException("Недопустимый фильтр дат");
   this.mode=mode;this.from=mode==2?from.trim():"";this.to=mode==2?to.trim():"";
   begin=this.from.isEmpty()?null:day(this.from).begin;end=this.to.isEmpty()?null:day(this.to).end;
   if(mode==2&&(begin==null&&end==null))throw new IllegalArgumentException("Укажите хотя бы одну границу периода");
   if(begin!=null&&end!=null&&begin.compareTo(end)>=0)throw new IllegalArgumentException("Начало периода позже конца");
  }
  public static Query defaults(){return new Query(0,"","");}
  public boolean matches(Entry entry){
   if(mode==0)return true;if(mode==1)return entry.status==VALID;if(mode==3)return entry.status==ABSENT;if(mode==4)return entry.status==UNRECOGNIZED;
   if(entry.status!=VALID)return false;
   if(begin!=null&&entry.end!=null){int c=entry.end.compareTo(begin);if(c<0||c==0&&!entry.endInclusive)return false;}
   return end==null||entry.begin==null||entry.begin.compareTo(end)<0;
  }
 }
 public static final class Entry {
  public final int status;private final BigDecimal begin,end;private final boolean endInclusive;
  private Entry(int status,BigDecimal begin,BigDecimal end,boolean inclusive){this.status=status;this.begin=begin;this.end=end;endInclusive=inclusive;}
 }
 private static final class Value {
  final BigDecimal begin,end;final boolean point;
  Value(BigDecimal begin,BigDecimal end,boolean point){this.begin=begin;this.end=end;this.point=point;}
 }
 public static Entry read(Element feature){
  Element primitive=null;
  for(Node n=feature.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element&&(is((Element)n,"TimeStamp")||is((Element)n,"TimeSpan"))){if(primitive!=null)return unknown();primitive=(Element)n;}
  if(primitive==null)return new Entry(ABSENT,null,null,false);
  try{
   if(is(primitive,"TimeStamp")){String text=scalar(primitive,"when");if(text==null)throw new IllegalArgumentException();Value v=parse(text);return new Entry(VALID,v.begin,v.end,v.point);}
   String a=scalar(primitive,"begin"),b=scalar(primitive,"end");if(a==null&&b==null)throw new IllegalArgumentException();
   Value start=a==null?null:parse(a),stop=b==null?null:parse(b);BigDecimal begin=start==null?null:start.begin,end=stop==null?null:stop.end;boolean inclusive=stop!=null&&stop.point;
   if(begin!=null&&end!=null){int c=begin.compareTo(end);if(c>0||c==0&&!inclusive)throw new IllegalArgumentException();}
   return new Entry(VALID,begin,end,inclusive);
  }catch(IllegalArgumentException invalid){return unknown();}
 }
 private static Entry unknown(){return new Entry(UNRECOGNIZED,null,null,false);}
 private static String scalar(Element parent,String tag){String value=null;for(Node n=parent.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element&&is((Element)n,tag)){if(value!=null)throw new IllegalArgumentException();for(Node child=n.getFirstChild();child!=null;child=child.getNextSibling())if(child instanceof Element)throw new IllegalArgumentException();value=n.getTextContent();}return value;}
 private static Value day(String text){if(!text.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}"))throw new IllegalArgumentException("Дата: ГГГГ-ММ-ДД, например 2026-10-28");try{return parse(text);}catch(IllegalArgumentException invalid){throw new IllegalArgumentException("Несуществующая дата: "+text);}}
 private static Value parse(String text){
  if(text.length()>256)throw new IllegalArgumentException();Matcher m=VALUE.matcher(text.trim());if(!m.matches())throw new IllegalArgumentException();
  int year=number(m,1,0),month=number(m,2,1),day=number(m,3,1),hour=number(m,4,0),minute=number(m,5,0),second=number(m,6,0);
  boolean point=m.group(4)!=null;BigDecimal fraction=m.group(7)==null?BigDecimal.ZERO:new BigDecimal(m.group(7));
  if(year<1||month<1||month>12||day<1||day>31||hour>24||minute>59||second>59||hour==24&&(minute!=0||second!=0||fraction.signum()!=0))throw new IllegalArgumentException();
  GregorianCalendar calendar=new GregorianCalendar(TimeZone.getTimeZone("UTC"),Locale.ROOT);calendar.setGregorianChange(new Date(Long.MIN_VALUE));calendar.setLenient(false);calendar.clear();
  calendar.set(year,month-1,day,hour==24?0:hour,minute,second);long millis=calendar.getTimeInMillis();if(hour==24){calendar.add(Calendar.DAY_OF_MONTH,1);millis=calendar.getTimeInMillis();}
  int offset=0;String zone=m.group(8);if(zone!=null&&!zone.equals("Z")){int h=Integer.parseInt(zone.substring(1,3)),min=Integer.parseInt(zone.substring(4,6));if(h>14||min>59||h==14&&min!=0)throw new IllegalArgumentException();offset=(h*3600+min*60)*(zone.charAt(0)=='-'?-1:1);}
  BigDecimal begin=BigDecimal.valueOf(millis,3).subtract(BigDecimal.valueOf(offset)).add(fraction);
  if(point)return new Value(begin,begin,true);
  calendar.add(m.group(3)!=null?Calendar.DAY_OF_MONTH:m.group(2)!=null?Calendar.MONTH:Calendar.YEAR,1);
  BigDecimal end=BigDecimal.valueOf(calendar.getTimeInMillis(),3).subtract(BigDecimal.valueOf(offset));return new Value(begin,end,false);
 }
 private static int number(Matcher m,int group,int fallback){return m.group(group)==null?fallback:Integer.parseInt(m.group(group));}
 private static boolean is(Element e,String tag){String ns=e.getNamespaceURI(),name=e.getLocalName()==null?e.getTagName():e.getLocalName();return name.equals(tag)&&(ns==null||ns.isEmpty()||ns.equals("http://www.opengis.net/kml/2.2")||ns.matches("http://earth\\.google\\.com/kml/2\\.[012]"));}
}
