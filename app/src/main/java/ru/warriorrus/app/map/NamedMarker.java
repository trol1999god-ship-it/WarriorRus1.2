package ru.warriorrus.app.map;

import android.graphics.*;
import android.view.MotionEvent;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.Marker;

/** Persistent object label, independent of the transient info window. */
public final class NamedMarker extends Marker {
  private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG),
      outline = new Paint(Paint.ANTI_ALIAS_FLAG);
  private final Point pixel = new Point();
  private final float gap;
  private final MapView map;
  private final boolean showLabel;
  private final float opacity;

  public NamedMarker(MapView map, float alpha) {
    this(map, alpha, true);
  }

  public NamedMarker(MapView map, float alpha, boolean showLabel) {
    super(map);
    this.opacity=alpha;
    this.showLabel = showLabel;
    this.map = map;
    gap = 18 * map.getResources().getDisplayMetrics().density;
    text.setTextSize(13 * map.getResources().getDisplayMetrics().scaledDensity);
    text.setColor(Color.BLACK);
    text.setAlpha(Math.round(alpha * 255));
    outline.set(text);
    outline.setColor(Color.WHITE);
    outline.setAlpha(Math.round(alpha * 255));
    outline.setStyle(Paint.Style.STROKE);
    outline.setStrokeWidth(3 * map.getResources().getDisplayMetrics().density);
  }

  public void labelStyle(ru.warriorrus.app.data.ObjectAppearance appearance) {
    float size=appearance.labelSize*map.getResources().getDisplayMetrics().scaledDensity;
    text.setTextSize(size);outline.setTextSize(size);
    Typeface font=Typeface.create(Typeface.DEFAULT,(appearance.labelBold?Typeface.BOLD:0)|(appearance.labelItalic?Typeface.ITALIC:0));text.setTypeface(font);outline.setTypeface(font);
    text.setColor(ObjectStyleRenderer.alpha(appearance.labelColor==null?Color.BLACK:appearance.labelColor,opacity));
  }

  @Override
  public void draw(Canvas c, MapView map, boolean shadow) {
    super.draw(c, map, shadow);
    if (shadow || !showLabel) return;
    map.getProjection().toPixels(getPosition(), pixel);
    c.drawText(getTitle(), pixel.x + gap, pixel.y + text.getTextSize() / 3, outline);
    c.drawText(getTitle(), pixel.x + gap, pixel.y + text.getTextSize() / 3, text);
  }

  @Override
  public boolean hitTest(MotionEvent event, MapView map) {
    if (super.hitTest(event, map)) return true;
    if (!showLabel) return false;
    map.getProjection().toPixels(getPosition(), pixel);
    return event.getX() >= pixel.x + gap
        && event.getX() <= pixel.x + gap + text.measureText(getTitle())
        && Math.abs(event.getY() - pixel.y) <= text.getTextSize();
  }
}
