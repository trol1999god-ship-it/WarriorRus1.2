package ru.warriorrus.app.map;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import java.util.function.Consumer;
import org.osmdroid.events.MapEventsReceiver;
import org.osmdroid.tileprovider.tilesource.XYTileSource;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.MapEventsOverlay;
import org.osmdroid.views.overlay.Marker;
import ru.warriorrus.app.data.*;

public final class MapWorkspace {
  public final MapView view;
  private final Activity activity;
  private ru.warriorrus.app.icons.IconLibrary icons;

  public MapWorkspace(Activity activity, Consumer<GeoPoint> create) {
    this.activity = activity;
    try {
      icons = ru.warriorrus.app.icons.IconLibrary.open(activity);
    } catch (java.io.IOException unavailable) {
    }
    org.osmdroid.config.Configuration.getInstance()
        .setUserAgentValue(activity.getPackageName() + "/2.0");
    org.osmdroid.config.Configuration.getInstance()
        .setOsmdroidBasePath(new java.io.File(activity.getCacheDir(), "maps"));
    org.osmdroid.config.Configuration.getInstance()
        .setOsmdroidTileCache(new java.io.File(activity.getCacheDir(), "maps/tiles"));
    view = new MapView(activity);
    view.setTileSource(
        new XYTileSource(
            "OpenStreetMap",
            0,
            19,
            256,
            ".png",
            new String[] {"https://tile.openstreetmap.org/"},
            "© OpenStreetMap contributors"));
    view.setMultiTouchControls(true);
    view.getController().setZoom(5.0);
    view.getController().setCenter(new GeoPoint(55.75, 37.62));
    view.getOverlays()
        .add(
            new MapEventsOverlay(
                new MapEventsReceiver() {
                  public boolean singleTapConfirmedHelper(GeoPoint p) {
                    return false;
                  }

                  public boolean longPressHelper(GeoPoint p) {
                    create.accept(p);
                    return true;
                  }
                }));
  }

  public void refresh(ObjectStore store) {
    view.getOverlays().removeIf(o -> o instanceof Marker);
    java.util.Map<String, android.graphics.drawable.Drawable.ConstantState> renderedCache =
        new java.util.HashMap<>();
    for (MapItem i : store.renderItems())
      if (!i.isFolder()) {
        float opacity = store.effectiveOpacity(i);
        if (opacity == 0) continue;
        Marker m = new Marker(view);
        m.setPosition(new GeoPoint(i.latitude, i.longitude));
        m.setTitle(i.name);
        m.setSnippet(i.latitude + ", " + i.longitude);
        m.setAnchor(Marker.ANCHOR_CENTER, Marker.ANCHOR_CENTER);
        GradientDrawable icon = new GradientDrawable();
        icon.setShape(GradientDrawable.OVAL);
        icon.setColor(i.color);
        icon.setStroke(3, Color.WHITE);
        int size = (int) (24 * activity.getResources().getDisplayMetrics().density);
        icon.setSize(size, size);
        icon.setAlpha(Math.round(255 * opacity));
        android.graphics.drawable.Drawable rendered = icon;
        try {
          String cacheKey = i.icon + ":" + i.color;
          android.graphics.drawable.Drawable.ConstantState cached = renderedCache.get(cacheKey);
          if (cached != null) rendered = cached.newDrawable(activity.getResources()).mutate();
          else {
            String svg;
            if (i.icon.startsWith("builtin:"))
              svg = ru.warriorrus.app.icons.IconLibrary.builtinText(i.icon);
            else {
              if (icons == null) icons = ru.warriorrus.app.icons.IconLibrary.open(activity);
              svg = icons.text(i.icon);
            }
            rendered =
                ru.warriorrus.app.icons.SvgPreview.render(
                        activity.getResources(), svg, i.color, size)
                    .mutate();
            if (rendered.getConstantState() != null)
              renderedCache.put(cacheKey, rendered.getConstantState());
          }
          rendered.setAlpha(Math.round(255 * opacity));
        } catch (Exception missingOrInvalid) {
          /* Keep the point visible with its fallback. */
        }
        m.setIcon(rendered);
        view.getOverlays().add(m);
      }
    view.invalidate();
  }

  public long iconRevision() {
    try {
      if (icons == null) icons = ru.warriorrus.app.icons.IconLibrary.open(activity);
      return icons.fingerprint();
    } catch (java.io.IOException unavailable) {
      return Long.MIN_VALUE;
    }
  }

  public void center(MapItem i) {
    view.getController().setCenter(new GeoPoint(i.latitude, i.longitude));
    view.getController().setZoom(15.0);
  }
}
