package ru.warriorrus.app.map;

import android.content.SharedPreferences;
import android.os.Bundle;
import org.json.JSONObject;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;

/** Local view preferences, separate from objects and independent of device positioning. */
public final class MapViewport {
  private MapViewport() {}

  public static void restore(MapView map,SharedPreferences preferences,Bundle state){
    try{
      JSONObject saved=new JSONObject(preferences.getString("mapViewport","{}"));
      double latitude=state!=null?state.getDouble("mapLat",55.75):saved.optDouble("latitude",55.75);
      double longitude=state!=null?state.getDouble("mapLon",37.62):saved.optDouble("longitude",37.62);
      double zoom=state!=null?state.getDouble("mapZoom",5):saved.optDouble("zoom",5);
      double angle=state!=null?state.getFloat("mapAngle",0):(float)saved.optDouble("angle",0);
      new ru.warriorrus.app.data.Vertex(latitude,longitude);
      if(Double.isNaN(zoom)||Double.isInfinite(zoom)||Double.isNaN(angle)||Double.isInfinite(angle))return;
      map.setMaxZoomLevel(22.0);
      map.getController().setZoom(Math.max(0,Math.min(22,zoom)));
      map.getController().setCenter(new GeoPoint(latitude,longitude));
      map.setMapOrientation((float)((angle%360+360)%360));
    }catch(Exception invalid){/* Keep the default view if a preference is corrupt. */}
  }

  public static void save(MapView map,SharedPreferences preferences){
    try{
      JSONObject saved=new JSONObject().put("latitude",map.getMapCenter().getLatitude())
          .put("longitude",map.getMapCenter().getLongitude()).put("zoom",map.getZoomLevelDouble())
          .put("angle",map.getMapOrientation());
      preferences.edit().putString("mapViewport",saved.toString()).apply();
    }catch(Exception invalid){/* Do not replace a valid view with an invalid snapshot. */}
  }
}
