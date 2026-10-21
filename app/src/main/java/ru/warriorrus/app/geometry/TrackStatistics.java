package ru.warriorrus.app.geometry;

import java.time.Instant;
import java.util.*;
import ru.warriorrus.app.data.*;

/** Statistics from imported/manual vertices only. No device sensors or remote elevation requests. */
public final class TrackStatistics {
  public double ascent,descent,min=Double.POSITIVE_INFINITY,max=Double.NEGATIVE_INFINITY;
  public long first=Long.MAX_VALUE,last=Long.MIN_VALUE,movingMillis;
  public double timedDistance,maxSpeed;
  public double maxUphill,maxDownhill;
  public static TrackStatistics of(MapItem item) {
    TrackStatistics stats=new TrackStatistics();
    for(List<Vertex> segment:item.segments){Vertex previous=null;
      for(Vertex v:segment){
        if(v.elevation!=null){stats.min=Math.min(stats.min,v.elevation);stats.max=Math.max(stats.max,v.elevation);if(previous!=null&&previous.elevation!=null){double delta=v.elevation-previous.elevation;if(delta>0)stats.ascent+=delta;else stats.descent-=delta;double distance=Geometry.distance(previous,v);if(distance>0){double slope=Math.toDegrees(Math.atan2(delta,distance));stats.maxUphill=Math.max(stats.maxUphill,slope);stats.maxDownhill=Math.min(stats.maxDownhill,slope);}}}
        Long time=time(v.time);if(time!=null){stats.first=Math.min(stats.first,time);stats.last=Math.max(stats.last,time);}
        if(previous!=null&&time!=null){Long before=time(previous.time);if(before!=null&&time>before){stats.movingMillis+=time-before;double step=Geometry.distance(previous,v);stats.timedDistance+=step;stats.maxSpeed=Math.max(stats.maxSpeed,step/(((double)time-before)/1000));}}
        previous=v;
      }
    }return stats;
  }
  public static Long time(String value){try{return value==null?null:Instant.parse(value).toEpochMilli();}catch(Exception ignored){return null;}}
  public String summary(){return summary(new ru.warriorrus.app.settings.DisplayUnits());}
  public String summary(ru.warriorrus.app.settings.DisplayUnits units){StringBuilder b=new StringBuilder();
    if(min!=Double.POSITIVE_INFINITY)b.append("Высота из файла: ").append(units.height(min)).append("…").append(units.height(max)).append("\nНабор: ").append(units.height(ascent)).append(" · Сброс: ").append(units.height(descent)).append("\nМаксимальный уклон: ").append(units.slope(maxUphill)).append(" / ").append(units.slope(maxDownhill));
    if(first!=Long.MAX_VALUE&&last>=first){long seconds=(last-first)/1000;b.append(String.format(Locale.ROOT,"\nВремя по отметкам: %d:%02d:%02d",seconds/3600,seconds/60%60,seconds%60));}
    if(movingMillis>0)b.append("\nСредняя скорость по сегментам: ").append(units.speed(timedDistance/movingMillis*1000));
    if(b.length()==0)b.append("В объекте нет высот и временных отметок");return b.toString();
  }
}
