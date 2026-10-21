package ru.warriorrus.app.map;

import android.graphics.*;
import ru.warriorrus.app.data.MapItem;

/** Shared styling for saved objects and drawing previews. */
public final class ObjectStyleRenderer {
  private ObjectStyleRenderer() {}
  public static int alpha(int color,float opacity) {
    return (color&0x00ffffff)|(Math.round(Color.alpha(color)*Math.max(0,Math.min(1,opacity)))<<24);
  }
  public static void stroke(Paint paint,MapItem item,float opacity,float defaultWidth,float density) {
    float width=(item.appearance.lineWidth>0?item.appearance.lineWidth:defaultWidth)*density;
    paint.setColor(item.appearance.outline?alpha(item.color,opacity):Color.TRANSPARENT);
    paint.setStrokeWidth(width);paint.setStrokeCap(Paint.Cap.ROUND);
    float unit=Math.max(density,width);
    float[] intervals=null;
    switch(item.appearance.dash){
      case "dash":intervals=new float[]{4*unit,3*unit};break;
      case "dot":intervals=new float[]{unit,2*unit};break;
      case "dashdot":intervals=new float[]{4*unit,2*unit,unit,2*unit};break;
    }
    paint.setPathEffect(intervals==null?null:new DashPathEffect(intervals,0));
  }
  public static int fill(MapItem item,float opacity) {
    if(!item.appearance.fill)return Color.TRANSPARENT;
    return alpha(item.appearance.fillColor==null?item.color:item.appearance.fillColor,
        opacity*item.appearance.fillOpacity);
  }
}
