package org.rabochaya.projects;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Accumulates only within saved segments. Times are optional for every vertex. */
final class TrackStatistics {
 private static final Pattern TIMESTAMP=Pattern.compile(
     "([0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2})(?:\\.([0-9]+))?(Z|[+-][0-9]{2}:[0-9]{2})");
 private final SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ",Locale.US);
 int segments,points,legs,timedLegs,elevationLegs;
 long timedMillis,movingMillis;
 double distance,gain,loss;

 TrackStatistics(){format.setLenient(false);}

 void addSegment(List<double[]> vertices,List<String> times){
  segments++;
  double[] previous=null;
  Long previousTime=null;
  for(int i=0;i<vertices.size();i++){
   double[] point=vertices.get(i);
   if(point==null){
    previous=null;
    previousTime=null;
    continue;
   }
   points++;
   Long time=times==null?null:parseTime(times.get(i));
   if(previous!=null){
    legs++;
    double length=DemProfile.metres(previous[0],previous[1],point[0],point[1]);
    distance+=length;
    if(previous.length>2&&point.length>2){
     elevationLegs++;
     double delta=point[2]-previous[2];
     gain+=Math.max(0,delta);
     loss+=Math.max(0,-delta);
    }
    if(time!=null&&previousTime!=null&&time>previousTime){
     long interval=time-previousTime;
     timedLegs++;
     timedMillis+=interval;
     if(length>0)movingMillis+=interval;
    }
   }
   previous=point;
   previousTime=time;
  }
 }

 private Long parseTime(String text){
  if(text==null)return null;
  Matcher parts=TIMESTAMP.matcher(text.trim());
  if(!parts.matches())return null;
  String fraction=parts.group(2);
  String zone=parts.group(3);
  String normalized=parts.group(1)+"."+((fraction==null?"":fraction)+"000").substring(0,3)
      +("Z".equals(zone)?"+0000":zone.replace(":",""));
  ParsePosition position=new ParsePosition(0);
  Date time=format.parse(normalized,position);
  return time!=null&&position.getIndex()==normalized.length()?time.getTime():null;
 }
}
