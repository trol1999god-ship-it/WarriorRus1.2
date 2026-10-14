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

  public MapWorkspace(Activity activity, Consumer<GeoPoint> create) {
    this.activity = activity;
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
        m.setIcon(icon);
        view.getOverlays().add(m);
      }
    view.invalidate();
  }

  public void center(MapItem i) {
    view.getController().setCenter(new GeoPoint(i.latitude, i.longitude));
    view.getController().setZoom(15.0);
  }
}
