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
  public java.util.function.Consumer<MapItem> onPointClick;
  public final CoordinateGrid grid = new CoordinateGrid();
  private final Activity activity;
  public boolean labelsVisible = true;
  public int markerSize = 24, lineWidth = 3;
  public java.util.function.Consumer<GeoPoint> onMapTap;
  private final java.util.List<org.osmdroid.views.overlay.Overlay> geometryOverlays = new java.util.ArrayList<>();
  private ru.warriorrus.app.icons.IconLibrary icons;
  public ru.warriorrus.app.geometry.TimelineModel timeline;
  private final java.util.List<MapItem> snapshot=new java.util.ArrayList<>();
  private final java.util.Map<Long,Float> opacities=new java.util.HashMap<>();
  private final java.util.Map<String,android.graphics.drawable.Drawable.ConstantState> renderedCache=new java.util.HashMap<>();

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
    view.setBuiltInZoomControls(false);
    view.getController().setZoom(5.0);
    view.getController().setCenter(new GeoPoint(55.75, 37.62));
    view.getOverlays()
        .add(
            new MapEventsOverlay(
                new MapEventsReceiver() {
                  public boolean singleTapConfirmedHelper(GeoPoint p) {
                    if (onMapTap != null) { onMapTap.accept(p); return true; }
                    return false;
                  }

                  public boolean longPressHelper(GeoPoint p) {
                    create.accept(p);
                    return true;
                  }
                }));
  }

  public void refresh(ObjectStore store) {
    snapshot.clear();snapshot.addAll(store.renderItems());opacities.clear();for(MapItem i:snapshot)opacities.put(i.id,store.effectiveOpacity(i));renderedCache.clear();redraw();
  }
  public void redraw() {
    // Android's desugared removeIf may use iterator.remove(), which is unsupported
    // by the CopyOnWriteArrayList returned by osmdroid. Remove by value instead.
    for (org.osmdroid.views.overlay.Overlay overlay : new java.util.ArrayList<>(view.getOverlays()))
      if (overlay instanceof Marker) {
        ((Marker) overlay).closeInfoWindow();
        view.getOverlays().remove(overlay);
      }
    for (org.osmdroid.views.overlay.Overlay overlay : geometryOverlays) view.getOverlays().remove(overlay);
    geometryOverlays.clear();
    for (MapItem original : snapshot) {
      MapItem i=timeline==null?original:timeline.view(original);if(i==null)continue;
      if (!i.isFolder()) {
        float opacity = opacities.getOrDefault(i.id,1f);
        if (opacity == 0) continue;
        if (i.isGeometry()) { drawGeometry(i, opacity,original); if(timeline!=null&&timeline.active&&timeline.showHeads){Vertex head=timeline.head(original);if(head!=null)drawTimeHead(original,head,opacity);}continue; }
        Marker m = new NamedMarker(view, opacity, labelsVisible);
        m.setOnMarkerClickListener(
            (marker, mapView) -> {
              if (onPointClick != null) {
                onPointClick.accept(original);
                return true;
              }
              return false;
            });
        m.setPosition(new GeoPoint(i.latitude, i.longitude));
        m.setTitle(i.name);
        m.setSnippet(i.latitude + ", " + i.longitude);
        m.setAnchor(Marker.ANCHOR_CENTER, Marker.ANCHOR_CENTER);
        GradientDrawable icon = new GradientDrawable();
        icon.setShape(GradientDrawable.OVAL);
        icon.setColor(i.color);
        icon.setStroke(3, Color.WHITE);
        int size = (int) (markerSize * activity.getResources().getDisplayMetrics().density);
        icon.setSize(size, size);
        icon.setAlpha(Math.round(255 * opacity));
        android.graphics.drawable.Drawable rendered = icon;
        try {
          String iconKey = i.icon == null || i.icon.isEmpty() ? "builtin:pin" : i.icon;
          String cacheKey = iconKey + ":" + i.color;
          android.graphics.drawable.Drawable.ConstantState cached = renderedCache.get(cacheKey);
          if (cached != null) rendered = cached.newDrawable(activity.getResources()).mutate();
          else {
            String svg;
            if (iconKey.startsWith("builtin:"))
              svg = ru.warriorrus.app.icons.IconLibrary.builtinText(iconKey);
            else {
              if (icons == null) icons = ru.warriorrus.app.icons.IconLibrary.open(activity);
              svg = icons.text(iconKey);
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
    }
    view.invalidate();
  }

  private java.util.List<GeoPoint> points(java.util.List<Vertex> vertices) {
    java.util.List<GeoPoint> result=new java.util.ArrayList<>();
    for (Vertex v:vertices)result.add(new GeoPoint(v.latitude,v.longitude));return result;
  }
  private void drawGeometry(MapItem item,float opacity,MapItem original) {
    if(item.segments.isEmpty())return;
    int color=(item.color&0x00ffffff)|(Math.round(android.graphics.Color.alpha(item.color)*opacity)<<24);
    if("area".equals(item.kind)) {
      org.osmdroid.views.overlay.Polygon polygon=new org.osmdroid.views.overlay.Polygon(view);
      polygon.setPoints(points(item.segments.get(0)));
      java.util.List<java.util.List<GeoPoint>> holes=new java.util.ArrayList<>();
      for(int n=1;n<item.segments.size();n++)holes.add(points(item.segments.get(n)));polygon.setHoles(holes);
      polygon.getOutlinePaint().setColor(color);polygon.getOutlinePaint().setStrokeWidth(lineWidth*activity.getResources().getDisplayMetrics().density);
      polygon.getFillPaint().setColor((color&0x00ffffff)|(Math.round(android.graphics.Color.alpha(color)*0.2f)<<24));
      polygon.setOnClickListener((shape,mapView,p)->{if(onPointClick!=null)onPointClick.accept(original);return true;});
      geometryOverlays.add(polygon);view.getOverlays().add(polygon);
    } else for(java.util.List<Vertex> segment:item.segments) {
      org.osmdroid.views.overlay.Polyline line=new org.osmdroid.views.overlay.Polyline(view);
      line.setPoints(points(segment));line.getOutlinePaint().setColor(color);
      line.getOutlinePaint().setStrokeWidth(lineWidth*activity.getResources().getDisplayMetrics().density);
      line.setOnClickListener((shape,mapView,p)->{if(onPointClick!=null)onPointClick.accept(original);return true;});
      geometryOverlays.add(line);view.getOverlays().add(line);
    }
    if(labelsVisible) {
      NamedMarker name=new NamedMarker(view,opacity,true);
      name.setPosition(new GeoPoint(item.latitude,item.longitude));name.setTitle(item.name);
      android.graphics.drawable.ColorDrawable transparent=new android.graphics.drawable.ColorDrawable(android.graphics.Color.TRANSPARENT);
      name.setIcon(transparent);name.setOnMarkerClickListener((m,v)->{if(onPointClick!=null)onPointClick.accept(original);return true;});
      geometryOverlays.add(name);view.getOverlays().add(name);
    }
  }

  private void drawTimeHead(MapItem original,Vertex vertex,float opacity){
    Marker marker=new NamedMarker(view,opacity,false);marker.setPosition(new GeoPoint(vertex.latitude,vertex.longitude));marker.setTitle("По времени файла · "+original.name);marker.setSnippet(vertex.time);marker.setAnchor(.5f,.5f);
    GradientDrawable dot=new GradientDrawable();dot.setShape(GradientDrawable.OVAL);dot.setColor(0xffffb84d);dot.setStroke(2,Color.WHITE);int size=Math.round(14*activity.getResources().getDisplayMetrics().density);dot.setSize(size,size);dot.setAlpha(Math.round(opacity*255));marker.setIcon(dot);marker.setOnMarkerClickListener((m,v)->{if(onPointClick!=null)onPointClick.accept(original);return true;});geometryOverlays.add(marker);view.getOverlays().add(marker);
  }

  public void showGrid(boolean enabled) {
    grid.setEnabled(enabled);
    if (enabled && !view.getOverlays().contains(grid)) view.getOverlays().add(grid);
    if (!enabled) view.getOverlays().remove(grid);
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
    if(i.isGeometry()) {
      java.util.List<GeoPoint> all=new java.util.ArrayList<>();for(java.util.List<Vertex> s:i.segments)all.addAll(points(s));
      if(!all.isEmpty())view.post(()->view.zoomToBoundingBox(org.osmdroid.util.BoundingBox.fromGeoPoints(all),true,48));
    } else view.getController().setZoom(15.0);
  }
}
