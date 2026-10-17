package ru.warriorrus.app.geometry;

import java.util.*;
import ru.warriorrus.app.data.*;

/** A read-only temporal view of file vertices. The persisted objects are never changed. */
public final class TimelineModel {
  public boolean active,showHeads=true;
  public long first,last,cursor,windowMillis;
  private final Map<String,Long> times=new HashMap<>();
  private Long time(Vertex v){if(v.time==null)return null;if(!times.containsKey(v.time)){if(times.size()>250000)times.clear();times.put(v.time,TrackStatistics.time(v.time));}return times.get(v.time);}
  public boolean bounds(List<MapItem> items){times.clear();long min=Long.MAX_VALUE,max=Long.MIN_VALUE;for(MapItem i:items)if(!i.isFolder()&&!"area".equals(i.kind))for(List<Vertex> s:i.segments)for(Vertex v:s){Long t=time(v);if(t!=null){min=Math.min(min,t);max=Math.max(max,t);}}
    if(min==Long.MAX_VALUE){first=last=cursor=0;return false;}first=min;last=max;cursor=Math.max(first,Math.min(last,cursor));return true;}
  public void seek(int progress){cursor=(long)(first+((double)last-first)*Math.max(0,Math.min(10000,progress))/10000);}
  public int progress(){return first==last?0:(int)Math.max(0,Math.min(10000,Math.round((cursor-(double)first)/((double)last-first)*10000)));}
  public long lower(){return windowMillis<=0?first:Math.max(first,cursor<Long.MIN_VALUE+windowMillis?Long.MIN_VALUE:cursor-windowMillis);}
  public boolean timed(MapItem item){for(List<Vertex> s:item.segments)for(Vertex v:s)if(time(v)!=null)return true;return false;}
  public MapItem view(MapItem item){if(!active||item.isFolder()||"area".equals(item.kind)||!timed(item))return item;
    long lower=lower();
    if(!item.isGeometry()){Long t=item.segments.isEmpty()||item.segments.get(0).isEmpty()?null:time(item.segments.get(0).get(0));return t==null||t>=lower&&t<=cursor?item:null;}
    MapItem copy=metadata(item);for(List<Vertex> segment:item.segments){boolean any=false;for(Vertex v:segment)if(time(v)!=null){any=true;break;}if(!any){copy.segments.add(new ArrayList<>(segment));continue;}
      List<Vertex> current=new ArrayList<>();
      for(int n=0;n<segment.size();n++){
        Vertex a=segment.get(n);Long ta=time(a);
        if(n+1<segment.size()){Vertex b=segment.get(n+1);Long tb=time(b);
          if(ta!=null&&tb!=null&&tb>=ta&&tb>=lower&&ta<=cursor){long start=Math.max(lower,ta),end=Math.min(cursor,tb);
            if(start<=end){Vertex startPoint=interpolate(a,b,tb.equals(ta)?0:(start-(double)ta)/(tb-(double)ta),start),endPoint=interpolate(a,b,tb.equals(ta)?1:(end-(double)ta)/(tb-(double)ta),end);append(current,startPoint);append(current,endPoint);continue;}
          }
        }
        if(ta!=null&&ta>=lower&&ta<=cursor)append(current,a);if(!current.isEmpty()){copy.segments.add(current);current=new ArrayList<>();}
      }if(!current.isEmpty())copy.segments.add(current);
    }
    if(copy.segments.isEmpty())return null;Vertex head=head(item);if(head!=null){copy.latitude=head.latitude;copy.longitude=head.longitude;}return copy;
  }
  private static void append(List<Vertex> line,Vertex vertex){if(line.isEmpty()||line.get(line.size()-1).latitude!=vertex.latitude||line.get(line.size()-1).longitude!=vertex.longitude)line.add(vertex);}
  public Vertex head(MapItem item){if(!active||!item.isGeometry()||"area".equals(item.kind))return null;Vertex found=null;long latest=Long.MIN_VALUE;
    for(List<Vertex> segment:item.segments)for(int n=0;n<segment.size();n++){Vertex a=segment.get(n);Long ta=time(a);if(ta!=null&&ta>=lower()&&ta<=cursor&&ta>=latest){found=a;latest=ta;}
      if(n+1<segment.size()){Vertex b=segment.get(n+1);Long tb=time(b);if(ta!=null&&tb!=null&&tb>ta&&ta<=cursor&&tb>=cursor){found=interpolate(a,b,(cursor-(double)ta)/(tb-(double)ta),cursor);latest=cursor;}}
    }return found;
  }
  public static Vertex interpolate(Vertex a,Vertex b,double fraction,long time){double t=Math.max(0,Math.min(1,fraction));if(t==0)return a;if(t==1)return b;double delta=((b.longitude-a.longitude+540)%360)-180,lon=((a.longitude+delta*t+540)%360)-180;Double height=a.elevation!=null&&b.elevation!=null?a.elevation+(b.elevation-a.elevation)*t:null;return new Vertex(a.latitude+(b.latitude-a.latitude)*t,lon,height,java.time.Instant.ofEpochMilli(time).toString());}
  private static MapItem metadata(MapItem i){MapItem c=new MapItem();c.id=i.id;c.parent=i.parent;c.name=i.name;c.kind=i.kind;c.icon=i.icon;c.latitude=i.latitude;c.longitude=i.longitude;c.visible=i.visible;c.position=i.position;c.color=i.color;c.opacity=i.opacity;c.description=i.description;c.created=i.created;c.updated=i.updated;c.trashed=i.trashed;c.attachments.addAll(i.attachments);return c;}
}
