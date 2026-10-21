package ru.warriorrus.app.map;

import android.graphics.*;
import java.util.*;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.Overlay;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.geometry.*;

/** Colors file/manual geometry from its recorded values, without reading device position. */
public final class DynamicLineOverlay extends Overlay {
  private final MapItem item;
  private final float opacity,defaultWidth;
  private final List<double[]> values=new ArrayList<>();
  private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
  private final Point first=new Point(),second=new Point();
  private double min=Double.POSITIVE_INFINITY,max=Double.NEGATIVE_INFINITY;

  public DynamicLineOverlay(MapItem item,float opacity,float defaultWidth) {
    this.item=item;this.opacity=opacity;this.defaultWidth=defaultWidth;
    for(List<Vertex> segment:item.segments){
      double[] data=new double[Math.max(0,segment.size()-1)];
      for(int n=0;n<data.length;n++){
        data[n]=value(segment.get(n),segment.get(n+1),item.appearance.colorMode);
        if(!Double.isNaN(data[n])&&!Double.isInfinite(data[n])){min=Math.min(min,data[n]);max=Math.max(max,data[n]);}
      }values.add(data);
    }
  }
  private static double value(Vertex a,Vertex b,String mode) {
    if("elevation".equals(mode))return a.elevation==null||b.elevation==null?Double.NaN:(a.elevation+b.elevation)/2;
    double meters=Geometry.distance(a,b);
    if("speed".equals(mode)){
      Long ta=TrackStatistics.time(a.time),tb=TrackStatistics.time(b.time);
      return ta==null||tb==null||tb<=ta?Double.NaN:meters*1000/(tb-ta);
    }
    if("slope".equals(mode))return a.elevation==null||b.elevation==null||meters<.01?Double.NaN:100*(b.elevation-a.elevation)/meters;
    return Double.NaN;
  }
  public String range(ru.warriorrus.app.settings.DisplayUnits units) {
    if(min==Double.POSITIVE_INFINITY)return "Нет данных для динамической окраски";
    if("elevation".equals(item.appearance.colorMode))return "Высота: "+units.height(min)+" — "+units.height(max);
    if("speed".equals(item.appearance.colorMode))return "Скорость: "+units.speed(min)+" — "+units.speed(max);
    return "Уклон: "+units.slope(Math.toDegrees(Math.atan(min/100)))+" — "+units.slope(Math.toDegrees(Math.atan(max/100)));
  }
  @Override public void draw(Canvas canvas,MapView map,boolean shadow) {
    if(shadow||!item.appearance.outline)return;
    ObjectStyleRenderer.stroke(paint,item,opacity,defaultWidth,map.getResources().getDisplayMetrics().density);
    paint.setStyle(Paint.Style.STROKE);float[] hsv={0,.88f,.95f};
    for(int s=0;s<item.segments.size();s++){
      List<Vertex> line=item.segments.get(s);double[] data=values.get(s);
      for(int n=0;n<data.length;n++){
        Vertex a=line.get(n),b=line.get(n+1);
        map.getProjection().toPixels(new GeoPoint(a.latitude,a.longitude),first);
        map.getProjection().toPixels(new GeoPoint(b.latitude,b.longitude),second);
        if((first.x<0&&second.x<0)||(first.y<0&&second.y<0)||
            (first.x>map.getWidth()&&second.x>map.getWidth())||(first.y>map.getHeight()&&second.y>map.getHeight()))continue;
        int color=item.color;
        if(!Double.isNaN(data[n])&&!Double.isInfinite(data[n])){
          double fraction=max>min?(data[n]-min)/(max-min):.5;
          hsv[0]=(float)(240*(1-Math.max(0,Math.min(1,fraction))));color=Color.HSVToColor(Color.alpha(item.color),hsv);
        }
        paint.setColor(ObjectStyleRenderer.alpha(color,opacity));canvas.drawLine(first.x,first.y,second.x,second.y,paint);
      }
    }
  }
}
