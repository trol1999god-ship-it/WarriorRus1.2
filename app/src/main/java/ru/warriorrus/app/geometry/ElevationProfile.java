package ru.warriorrus.app.geometry;

import android.content.Context;
import android.graphics.*;
import android.view.View;
import java.util.*;
import ru.warriorrus.app.data.*;

public final class ElevationProfile extends View {
  private final MapItem item;private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
  public ElevationProfile(Context context,MapItem item){super(context);this.item=item;setContentDescription("Профиль высот объекта "+item.name);}
  @Override protected void onDraw(Canvas canvas){super.onDraw(canvas);canvas.drawColor(0xff102c40);TrackStatistics stats=TrackStatistics.of(item);float density=getResources().getDisplayMetrics().density;
    paint.setColor(0xffd9edf7);paint.setTextSize(12*density);
    if(stats.min==Double.POSITIVE_INFINITY){canvas.drawText("Нет высот в исходном файле",12*density,24*density,paint);return;}
    double length=Geometry.length(item),range=Math.max(1,stats.max-stats.min),distance=0;float left=40*density,top=18*density,w=Math.max(1,getWidth()-left-10*density),h=Math.max(1,getHeight()-top-32*density);
    canvas.drawText(String.format(java.util.Locale.ROOT,"%.0f м",stats.max),2*density,top+10*density,paint);canvas.drawText(String.format(java.util.Locale.ROOT,"%.0f м",stats.min),2*density,top+h,paint);
    paint.setColor(0xff48c7ff);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(2*density);Path path=new Path();
    for(List<Vertex> segment:item.segments){Vertex previous=null;boolean started=false;for(Vertex v:segment){if(previous!=null)distance+=Geometry.distance(previous,v);if(v.elevation!=null){float x=left+(float)(distance/Math.max(1,length)*w),y=top+h-(float)((v.elevation-stats.min)/range*h);if(started)path.lineTo(x,y);else{path.moveTo(x,y);started=true;}}else started=false;previous=v;}}
    canvas.drawPath(path,paint);paint.setStyle(Paint.Style.FILL);
  }
}
