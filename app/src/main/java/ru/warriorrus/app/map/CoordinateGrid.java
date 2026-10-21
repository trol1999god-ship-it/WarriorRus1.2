package ru.warriorrus.app.map;

import android.graphics.*;
import java.util.*;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.Overlay;

/** Geographic grid adapts to viewport, including views crossing the date line. */
public final class CoordinateGrid extends Overlay {
  public int coordinateMode;
  public String custom="EPSG:32637";
  public static List<Double> lines(double start, double end) {
    List<Double> result = new ArrayList<>();
    double span = end - start;
    if (!(span > 0) || Double.isInfinite(span) || Double.isNaN(span)) return result;
    double base = Math.pow(10, Math.floor(Math.log10(span / 5)));
    double ratio = span / 5 / base;
    double step = base * (ratio <= 1 ? 1 : ratio <= 2 ? 2 : ratio <= 5 ? 5 : 10);
    for (double v = Math.ceil(start / step) * step; v <= end && result.size() < 32; v += step)
      result.add(v);
    return result;
  }

  public static boolean contains(
      double south, double north, double west, double east, double lat, double lon) {
    return lat >= south
        && lat <= north
        && (east < west ? (lon >= west || lon <= east) : (lon >= west && lon <= east));
  }

  public static double east(double west, double east) {
    return east < west ? east + 360 : east;
  }

  @Override
  public void draw(Canvas c, MapView map, boolean shadow) {
    if (shadow || !isEnabled()) return;
    org.osmdroid.util.BoundingBox box = map.getBoundingBox();
    Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
    p.setColor(0x99566f85);
    p.setStrokeWidth(map.getResources().getDisplayMetrics().density);
    p.setTextSize(11 * map.getResources().getDisplayMetrics().scaledDensity);
    if(coordinateMode>=3){drawProjected(c,map,p);return;}
    Point pixel = new Point();
    for (double lat : lines(box.getLatSouth(), box.getLatNorth())) {
      map.getProjection().toPixels(new GeoPoint(lat, map.getMapCenter().getLongitude()), pixel);
      c.drawLine(0, pixel.y, map.getWidth(), pixel.y, p);
      c.drawText(String.format(Locale.ROOT, "%.4f°", lat), 4, pixel.y - 4, p);
    }
    for (double lon : lines(box.getLonWest(), east(box.getLonWest(), box.getLonEast()))) {
      double normalized = lon > 180 ? lon - 360 : lon;
      map.getProjection()
          .toPixels(new GeoPoint(map.getMapCenter().getLatitude(), normalized), pixel);
      c.drawLine(pixel.x, 0, pixel.x, map.getHeight(), p);
      c.drawText(
          String.format(Locale.ROOT, "%.4f°", normalized), pixel.x + 4, map.getHeight() / 2f, p);
    }
  }

  private void drawProjected(Canvas canvas,MapView map,Paint paint){
    if(map.getZoomLevelDouble()<4)return;
    try{
      String code=ru.warriorrus.app.settings.Coordinates.system(coordinateMode,map.getMapCenter().getLatitude(),map.getMapCenter().getLongitude(),custom);
      boolean geographic=ru.warriorrus.app.settings.ProjectionMath.geographic(code);
      double minX=Double.POSITIVE_INFINITY,maxX=Double.NEGATIVE_INFINITY,minY=Double.POSITIVE_INFINITY,maxY=Double.NEGATIVE_INFINITY;
      for(int x=0;x<3;x++)for(int y=0;y<3;y++){
        org.osmdroid.api.IGeoPoint v=map.getProjection().fromPixels(x*map.getWidth()/2,y*map.getHeight()/2);
        double[] p=ru.warriorrus.app.settings.ProjectionMath.project(code,v.getLatitude(),v.getLongitude());minX=Math.min(minX,p[0]);maxX=Math.max(maxX,p[0]);minY=Math.min(minY,p[1]);maxY=Math.max(maxY,p[1]);
      }
      if(!geographic&&(maxX-minX>10000000||maxY-minY>10000000))return;
      for(double x:lines(minX,maxX))gridLine(canvas,map,paint,code,true,x,minY,maxY,geographic);
      for(double y:lines(minY,maxY))gridLine(canvas,map,paint,code,false,y,minX,maxX,geographic);
    }catch(RuntimeException outside){/* No projected grid outside the selected CRS. */}
  }
  private void gridLine(Canvas canvas,MapView map,Paint paint,String code,boolean east,double value,double from,double to,boolean geographic){
    Path path=new Path();Point pixel=new Point();boolean started=false,labelled=false;
    for(int n=0;n<=24;n++)try{
      double moving=from+(to-from)*n/24;ru.warriorrus.app.data.Vertex v=ru.warriorrus.app.settings.ProjectionMath.inverse(code,east?value:moving,east?moving:value);
      map.getProjection().toPixels(new GeoPoint(v.latitude,v.longitude),pixel);if(started)path.lineTo(pixel.x,pixel.y);else{path.moveTo(pixel.x,pixel.y);started=true;}
      if(!labelled&&pixel.x>=4&&pixel.x<map.getWidth()-70&&pixel.y>=18&&pixel.y<map.getHeight()-12){String axis=coordinateMode==5?(east?"Y ":"X "):(east?"E ":"N ");canvas.drawText(axis+String.format(Locale.ROOT,geographic?"%.4f°":"%.0f",value),pixel.x+3,pixel.y-3,paint);labelled=true;}
    }catch(RuntimeException outside){started=false;}
    paint.setStyle(Paint.Style.STROKE);canvas.drawPath(path,paint);paint.setStyle(Paint.Style.FILL);
  }
}
