package ru.warriorrus.app.geometry;

import java.util.*;
import ru.warriorrus.app.data.*;

/** File-only profile samples; segment gaps and missing/invalid metadata remain gaps. */
public final class ProfileSeries {
  public enum Value { ELEVATION, SPEED, SLOPE }
  public enum Axis { DISTANCE, TIME }
  public static final class Sample {
    public final int segment,index;public final Vertex vertex;public final double distance;
    public final Long time;public final Double speed,slope;
    private Sample(int segment,int index,Vertex v,double distance,Long time,Double speed,Double slope){this.segment=segment;this.index=index;vertex=v;this.distance=distance;this.time=time;this.speed=speed;this.slope=slope;}
    public Double value(Value kind){return kind==Value.ELEVATION?vertex.elevation:kind==Value.SPEED?speed:slope;}
  }
  public final List<Sample> samples;
  public final Long firstTime;
  public final double length;
  public ProfileSeries(MapItem item){
    List<Sample> result=new ArrayList<>();Long earliest=null;double distance=0;
    for(int s=0;s<item.segments.size();s++){
      Vertex previous=null;Long before=null;List<Vertex> line=item.segments.get(s);
      for(int n=0;n<line.size();n++){
        Vertex v=line.get(n);Long time=TrackStatistics.time(v.time);Double speed=null,slope=null;
        if(time!=null)earliest=earliest==null?time:Math.min(earliest,time);
        if(previous!=null){double step=Geometry.distance(previous,v);distance+=step;
          if(time!=null&&before!=null&&time>before)speed=step/(((double)time-before)/1000);
          if(step>1e-6&&previous.elevation!=null&&v.elevation!=null)slope=Math.toDegrees(Math.atan2(v.elevation-previous.elevation,step));
        }
        result.add(new Sample(s,n,v,distance,time,speed,slope));previous=v;before=time;
      }
    }
    samples=Collections.unmodifiableList(result);firstTime=earliest;length=distance;
  }
  public Double x(Sample sample,Axis axis){if(axis==Axis.DISTANCE)return sample.distance;if(sample.time==null||firstTime==null)return null;return ((double)sample.time-firstTime)/1000;}
  public boolean valid(Sample sample,Value value,Axis axis){Double x=x(sample,axis),y=sample.value(value);return x!=null&&y!=null&&!Double.isNaN(x)&&!Double.isInfinite(x)&&!Double.isNaN(y)&&!Double.isInfinite(y);}
  public boolean connected(Sample a,Sample b,Value value,Axis axis){return a.segment==b.segment&&b.index==a.index+1&&valid(a,value,axis)&&valid(b,value,axis)&&x(b,axis)>=x(a,axis);}
  public int nearest(double x,Value value,Axis axis){int best=-1;double distance=Double.POSITIVE_INFINITY;for(int n=0;n<samples.size();n++){Sample s=samples.get(n);if(!valid(s,value,axis))continue;double d=Math.abs(x(s,axis)-x);if(d<distance){distance=d;best=n;}}return best;}
  public double[] bounds(Value value,Axis axis){double minX=Double.POSITIVE_INFINITY,maxX=Double.NEGATIVE_INFINITY,minY=minX,maxY=maxX;
    for(Sample s:samples)if(valid(s,value,axis)){double x=x(s,axis),y=s.value(value);minX=Math.min(minX,x);maxX=Math.max(maxX,x);minY=Math.min(minY,y);maxY=Math.max(maxY,y);}
    return new double[]{minX,maxX,minY,maxY};
  }
}
