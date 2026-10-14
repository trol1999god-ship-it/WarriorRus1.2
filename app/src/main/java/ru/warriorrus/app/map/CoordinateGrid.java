package ru.warriorrus.app.map;

import android.graphics.*;
import java.util.*;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.Overlay;

/** Geographic grid adapts to viewport, including views crossing the date line. */
public final class CoordinateGrid extends Overlay {
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
}
