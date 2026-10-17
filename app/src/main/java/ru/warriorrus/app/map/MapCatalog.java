package ru.warriorrus.app.map;

import android.app.Activity;
import android.content.SharedPreferences;
import android.graphics.*;
import java.io.*;
import java.net.URI;
import java.util.*;
import org.json.*;
import org.osmdroid.tileprovider.*;
import org.osmdroid.tileprovider.modules.*;
import org.osmdroid.tileprovider.tilesource.*;
import org.osmdroid.tileprovider.util.SimpleRegisterReceiver;
import org.osmdroid.util.MapTileIndex;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.TilesOverlay;

/** Persistent, ordered raster layers. Only tile requests use the network. */
public final class MapCatalog {
  public static final class Layer {
    public String id,name,path="",url="",credit="";
    public boolean visible=true,downloadAllowed;
    public int opacity=100,min=0,max=19;
    public float contrast=1,brightness=0,saturation=1,hue=0;public boolean inverted;
    public boolean offline(){return !path.isEmpty();}
  }
  public final List<Layer> layers=new ArrayList<>();
  private final Activity activity;private final MapView map;private final SharedPreferences prefs;
  private final List<TilesOverlay> overlays=new ArrayList<>();private final List<MapTileProviderBase> ownedProviders=new ArrayList<>();
  public MapCatalog(Activity activity,MapView map) {
    this.activity=activity;this.map=map;prefs=activity.getPreferences(Activity.MODE_PRIVATE);
    try{JSONArray saved=new JSONArray(prefs.getString("rasterLayers","[]"));for(int n=0;n<saved.length();n++){JSONObject o=saved.getJSONObject(n);Layer l=new Layer();l.id=o.getString("id");l.name=o.getString("name");l.path=o.optString("path");l.url=o.optString("url");l.credit=o.optString("credit");l.visible=o.optBoolean("visible",true);l.opacity=Math.max(0,Math.min(100,o.optInt("opacity",100)));l.min=o.optInt("min",0);l.max=o.optInt("max",19);l.downloadAllowed=o.optBoolean("download",false);readAppearance(l,o);layers.add(l);}}
    catch(JSONException invalid){layers.clear();}
    if(find("osm")==null){Layer osm=new Layer();osm.id="osm";osm.name="OpenStreetMap";osm.credit="© OpenStreetMap contributors · https://www.openstreetmap.org/copyright";osm.visible=prefs.getBoolean("mapLayerVisible",true);osm.opacity=prefs.getInt("mapLayerOpacity",100);layers.add(0,osm);}
    rebuild();
  }
  public Layer find(String id){for(Layer l:layers)if(l.id.equals(id))return l;return null;}
  public static void validateUrl(String template) {
    if(!template.contains("{z}")||!template.contains("{x}")||!(template.contains("{y}")||template.contains("{-y}")))throw new IllegalArgumentException("Нужен шаблон HTTPS с {z}, {x}, {y} или {-y}");
    URI uri=URI.create(template.replace("{z}","0").replace("{x}","0").replace("{y}","0").replace("{-y}","0"));
    if(!"https".equalsIgnoreCase(uri.getScheme())||uri.getHost()==null||uri.getUserInfo()!=null)throw new IllegalArgumentException("Источник должен использовать HTTPS");
  }
  public static String tileUrl(String template,int z,int x,int y){return template.replace("{z}",""+z).replace("{x}",""+x).replace("{y}",""+y).replace("{-y}",""+((1L<<z)-1-y));}
  public Layer addOnline(String name,String template,String credit,boolean offlineAllowed) {
    validateUrl(template);if(name.trim().isEmpty()||credit.trim().isEmpty())throw new IllegalArgumentException("Введите название и сведения об источнике");
    Layer l=new Layer();l.id=UUID.randomUUID().toString();l.name=name.trim();l.url=template.trim();l.credit=credit.trim();l.downloadAllowed=offlineAllowed;l.max=22;layers.add(l);save();rebuild();return l;
  }
  public Layer addOffline(File file,String name,int min,int max) {
    Layer l=new Layer();l.id=UUID.randomUUID().toString();l.name=name;l.path=file.getName();l.min=min;l.max=max;l.credit="Локальный архив: "+name;
    if(file.getName().endsWith(".mbtiles"))try(android.database.sqlite.SQLiteDatabase db=android.database.sqlite.SQLiteDatabase.openDatabase(file.getPath(),null,android.database.sqlite.SQLiteDatabase.OPEN_READONLY);android.database.Cursor c=db.rawQuery("SELECT value FROM metadata WHERE name='attribution' LIMIT 1",null)){if(c.moveToFirst()&&!c.getString(0).isEmpty())l.credit=c.getString(0);}catch(Exception ignored){}
    layers.add(l);save();rebuild();return l;
  }
  public File file(Layer l)throws IOException {File root=new File(activity.getFilesDir(),"maps").getCanonicalFile(),file=new File(root,l.path).getCanonicalFile();if(!root.equals(file.getParentFile()))throw new IOException("Неверный архив карты");return file;}
  public void reorder(Layer l,int delta){int p=layers.indexOf(l),next=p+delta;if(next>=0&&next<layers.size()){Collections.swap(layers,p,next);save();rebuild();}}
  public void remove(Layer l){l.visible=false;save();updateAppearance();}
  public void save() {
    JSONArray all=new JSONArray();try{for(Layer l:layers)all.put(encode(l));}
    catch(JSONException e){throw new IllegalArgumentException(e);}
    Layer osm=find("osm");prefs.edit().putString("rasterLayers",all.toString()).putBoolean("mapLayerVisible",osm.visible).putInt("mapLayerOpacity",osm.opacity).apply();
  }
  private static void readAppearance(Layer l,JSONObject o){l.contrast=(float)Math.max(0,Math.min(3,o.optDouble("contrast",1)));l.brightness=(float)Math.max(-1,Math.min(1,o.optDouble("brightness",0)));l.saturation=(float)Math.max(0,Math.min(3,o.optDouble("saturation",1)));l.hue=(float)Math.max(-180,Math.min(180,o.optDouble("hue",0)));l.inverted=o.optBoolean("inverted",false);}
  private static JSONObject encode(Layer l)throws JSONException{return new JSONObject().put("id",l.id).put("name",l.name).put("path",l.path).put("url",l.url).put("credit",l.credit).put("visible",l.visible).put("opacity",l.opacity).put("min",l.min).put("max",l.max).put("download",l.downloadAllowed).put("contrast",l.contrast).put("brightness",l.brightness).put("saturation",l.saturation).put("hue",l.hue).put("inverted",l.inverted);}
  public JSONArray favoriteSets(){try{return new JSONArray(prefs.getString("favoriteMaps","[]"));}catch(JSONException e){return new JSONArray();}}
  public void saveFavorite(String name){if(name.trim().isEmpty())throw new IllegalArgumentException("Введите название");try{JSONArray selected=new JSONArray();for(Layer l:layers)if(l.visible)selected.put(encode(l));if(selected.length()==0)throw new IllegalArgumentException("Нет карт на экране");JSONArray all=favoriteSets();all.put(new JSONObject().put("id",UUID.randomUUID().toString()).put("name",name.trim()).put("layers",selected));prefs.edit().putString("favoriteMaps",all.toString()).apply();}catch(JSONException e){throw new IllegalArgumentException(e);}}
  public void editFavorite(String id,String name){try{JSONArray result=new JSONArray(),all=favoriteSets();for(int n=0;n<all.length();n++){JSONObject set=all.getJSONObject(n);if(id.equals(set.getString("id"))){if(name==null)continue;if(name.trim().isEmpty())throw new IllegalArgumentException("Введите название");set.put("name",name.trim());}result.put(set);}prefs.edit().putString("favoriteMaps",result.toString()).apply();}catch(JSONException e){throw new IllegalArgumentException(e);}}
  public void applyFavorite(JSONObject favorite,boolean add){try{JSONArray a=favorite.getJSONArray("layers");List<Layer> selected=new ArrayList<>();for(int n=0;n<a.length();n++){JSONObject o=a.getJSONObject(n);Layer l=find(o.getString("id"));if(l==null)throw new IllegalArgumentException("Карта набора больше не установлена: "+o.optString("name"));selected.add(l);}if(!add)for(Layer l:layers)l.visible=false;for(int n=0;n<a.length();n++){Layer l=selected.get(n);JSONObject o=a.getJSONObject(n);l.visible=true;l.opacity=Math.max(0,Math.min(100,o.optInt("opacity",100)));readAppearance(l,o);}layers.removeAll(selected);layers.addAll(selected);save();rebuild();}catch(JSONException e){throw new IllegalArgumentException(e);}}
  public void updateAppearance() {
    for(int n=0;n<overlays.size();n++) {
      Layer l=layers.get(n);TilesOverlay overlay=overlays.get(n);overlay.setEnabled(l.visible);boolean indicators=prefs.getBoolean("mapLoadingIndicators",false);overlay.setLoadingBackgroundColor(indicators?0x2273b9e9:Color.TRANSPARENT);overlay.setLoadingLineColor(indicators?0x5584b9dd:Color.TRANSPARENT);
      ColorMatrix matrix=MapAppearance.matrix(l.contrast,l.brightness,l.saturation,l.hue,l.inverted,prefs.getBoolean("nightMode",false),l.opacity/100f);overlay.setColorFilter(new ColorMatrixColorFilter(matrix));
    }
    // The actual base is rendered as an ordered overlay, so it can move above other maps.
    TilesOverlay base=map.getOverlayManager().getTilesOverlay();Layer osm=find("osm");base.setEnabled(osm.visible);
    ColorMatrix transparent=new ColorMatrix();transparent.setScale(1,1,1,0);base.setColorFilter(new ColorMatrixColorFilter(transparent));base.setLoadingBackgroundColor(Color.TRANSPARENT);base.setLoadingLineColor(Color.TRANSPARENT);map.invalidate();
  }
  public void setOnline(boolean enabled){for(MapTileProviderBase provider:ownedProviders)provider.setUseDataConnection(enabled && !(provider instanceof OfflineTileProvider));}
  public void rebuild() {
    for(TilesOverlay overlay:overlays)map.getOverlays().remove(overlay);overlays.clear();for(MapTileProviderBase provider:ownedProviders)provider.detach();ownedProviders.clear();
    int index=0;
    for(Layer l:layers) {
      MapTileProviderBase provider;
      try {
        if("osm".equals(l.id))provider=map.getTileProvider();
        else if(l.offline()) {
          OfflineTileProvider offline=new OfflineTileProvider(new SimpleRegisterReceiver(activity),new File[]{file(l)});
          if(offline.getArchives().length==0)throw new IOException("Архив недоступен");
          String sourceName=file(l).getName();for(IArchiveFile archive:offline.getArchives())if(!archive.getTileSources().isEmpty()){sourceName=archive.getTileSources().iterator().next();break;}
          offline.setTileSource(new FileBasedTileSource(sourceName,l.min,l.max,256,".png",new String[]{""}));offline.setUseDataConnection(false);provider=offline;ownedProviders.add(provider);
        } else {
          validateUrl(l.url);final String template=l.url;
          XYTileSource source=new XYTileSource(l.id,l.min,l.max,256,".png",new String[]{"https://unused.invalid/"},l.credit){
            @Override public String getTileURLString(long tile){return tileUrl(template,MapTileIndex.getZoom(tile),MapTileIndex.getX(tile),MapTileIndex.getY(tile));}
          };
          provider=new MapTileProviderBasic(activity,source);provider.setUseDataConnection(map.useDataConnection());ownedProviders.add(provider);
        }
      }catch(Exception invalid){provider=new OfflineTileProvider(new SimpleRegisterReceiver(activity),new File[]{new File(activity.getFilesDir(),"missing.mbtiles")});ownedProviders.add(provider);l.visible=false;}
      if(provider!=map.getTileProvider())provider.getTileRequestCompleteHandlers().add(map.getTileRequestCompleteHandler());
      TilesOverlay overlay=new TilesOverlay(provider,activity);overlay.setLoadingBackgroundColor(Color.TRANSPARENT);overlay.setLoadingLineColor(Color.TRANSPARENT);overlays.add(overlay);map.getOverlays().add(index++,overlay);
    }updateAppearance();
  }
  public void close(){for(TilesOverlay overlay:overlays)map.getOverlays().remove(overlay);for(MapTileProviderBase provider:ownedProviders)provider.detach();overlays.clear();ownedProviders.clear();}
}
