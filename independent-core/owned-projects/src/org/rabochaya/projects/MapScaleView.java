package org.rabochaya.projects;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;

/** Distance represented in the horizontal Web Mercator scale at the map centre. */
final class MapScaleView extends View {
 private static final double EARTH_RADIUS_METRES = 6378137;
 private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
 private final int inset, barLimit;
 private float barLength;
 private String caption = "";

 MapScaleView(Activity activity) {
  super(activity);
  inset = WorkspaceUi.dp(activity, 4);
  barLimit = WorkspaceUi.dp(activity, 96);
  paint.setColor(MapHud.INK);
  paint.setTypeface(WorkspaceUi.font(activity));
  paint.setTextSize(10 * getResources().getDisplayMetrics().scaledDensity);
  setBackground(MapHud.panel(activity));
  setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
 }

 static double metresPerPixel(double latitude,double zoom) {
  return 2 * Math.PI * EARTH_RADIUS_METRES
    * Math.cos(Math.toRadians(latitude)) / (256 * Math.pow(2, zoom));
 }

 void update(double latitude, double zoom) {
  double metresPerPixel = metresPerPixel(latitude,zoom);
  double limit = barLimit * metresPerPixel;
  if (!(limit > 0) || Double.isInfinite(limit)) return;
  int mode=DisplayUnits.distanceMode(getContext());
  double unit=DisplayUnits.scaleUnit(limit,mode);
  double magnitude = Math.pow(10, Math.floor(Math.log10(limit/unit)));
  double factor = limit / (unit*magnitude);
  double distance = unit*magnitude*(factor >= 5 ? 5 : factor >= 2 ? 2 : 1);
  barLength = (float)(distance / metresPerPixel);
  String label=DisplayUnits.scaleLabel(distance,unit);
  if (!label.equals(caption)) {
   caption = label;
   setContentDescription("Масштаб карты: " + caption);
  }
  invalidate();
 }

 @Override protected void onMeasure(int widthSpec, int heightSpec) {
  Paint.FontMetrics font = paint.getFontMetrics();
  setMeasuredDimension(resolveSize(barLimit + inset * 2, widthSpec),
    resolveSize((int)Math.ceil(font.bottom - font.top) + inset * 2 + 2, heightSpec));
 }

 @Override protected void onDraw(Canvas canvas) {
  if (caption.isEmpty()) return;
  float y = getHeight() - inset;
  float end = inset + Math.max(0, Math.min(barLength, getWidth() - inset * 2));
  paint.setStrokeWidth(Math.max(1, inset / 4f));
  canvas.drawLine(inset, y, end, y, paint);
  canvas.drawLine(inset, y - inset / 2f, inset, y, paint);
  canvas.drawLine(end, y - inset / 2f, end, y, paint);
  canvas.drawText(caption, inset, inset - paint.ascent(), paint);
 }
}
