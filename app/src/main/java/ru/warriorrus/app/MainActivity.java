package ru.warriorrus.app;

import android.app.*;
import android.os.Bundle;
import android.content.*;
import android.graphics.Color;
import android.net.Uri;
import android.view.*;
import android.widget.*;
import android.text.InputType;
import org.json.JSONArray;
import org.json.JSONObject;
import org.osmdroid.config.Configuration;
import org.osmdroid.tileprovider.tilesource.TileSourceFactory;
import org.osmdroid.tileprovider.tilesource.XYTileSource;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.Marker;
import org.osmdroid.views.overlay.MapEventsOverlay;
import org.osmdroid.events.MapEventsReceiver;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.util.UUID;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.CipherOutputStream;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.database.Cursor;
import android.provider.OpenableColumns;

public class MainActivity extends Activity {
  private LinearLayout root, list;
  private MapView map;
  private TextView mapCredit;
  private String selectedMap="OpenStreetMap";
  private EditText name, lat, lon, note, folder;
  private android.content.SharedPreferences prefs;
  private JSONArray points;
  private static final String KEY_ALIAS="WarriorRusLocalObjectsKey";
  private static final String OBJECTS_FILE="objects.enc";
  private static final String MEDIA_DIR="private_media";
  private int bg=Color.rgb(22,25,27), panel=Color.rgb(39,45,48), white=Color.WHITE, muted=Color.rgb(184,193,195), accent=Color.rgb(191,155,76);
  private int pendingMediaIndex=-1;
  private String pendingExport="";
  private static final int REQ_IMPORT=11, REQ_EXPORT=12, REQ_MEDIA=13;

  @Override public void onCreate(Bundle b) {
    super.onCreate(b);
    getWindow().setStatusBarColor(bg); getWindow().setNavigationBarColor(bg);
    Configuration.getInstance().load(this, getSharedPreferences("osmdroid", MODE_PRIVATE));
    Configuration.getInstance().setUserAgentValue(getPackageName());
    prefs=getSharedPreferences("local_objects", MODE_PRIVATE);
    try {
      points=loadEncryptedObjects();
    } catch(Exception e) {
      new AlertDialog.Builder(this).setTitle("Ошибка защищённого хранилища")
        .setMessage("Не удалось прочитать локальные объекты. Приложение не будет открывать редактор, чтобы случайно не перезаписать данные. Подробности: "+e.getClass().getSimpleName())
        .setPositiveButton("Закрыть",(d,w)->finish()).setCancelable(false).show();
      return;
    }
    render();
  }
  private TextView text(String s,int size) { TextView t=new TextView(this); t.setText(s); t.setTextColor(white); t.setTextSize(size); t.setPadding(0,7,0,7); return t; }
  private EditText edit(String hint) { EditText e=new EditText(this); e.setSingleLine(true); e.setHint(hint); e.setHintTextColor(muted); e.setTextColor(white); e.setPadding(12,5,12,5); e.setBackgroundTintList(android.content.res.ColorStateList.valueOf(muted)); return e; }
  private Button button(String s) { Button b=new Button(this); b.setText(s); b.setTextColor(white); b.setBackgroundTintList(android.content.res.ColorStateList.valueOf(panel)); return b; }
  private void render() {
    root=new LinearLayout(this); root.setOrientation(LinearLayout.VERTICAL); root.setPadding(12,8,12,8); root.setBackgroundColor(bg);
    LinearLayout head=new LinearLayout(this); head.setOrientation(LinearLayout.VERTICAL);
    TextView title=text("WARRIOR RUS",24); title.setGravity(Gravity.CENTER); title.setTypeface(null,1); head.addView(title);
    TextView sub=text("TACTICAL MAP WORKSPACE · NO GPS",11); sub.setGravity(Gravity.CENTER); sub.setTextColor(muted); head.addView(sub); root.addView(head);
    map=new MapView(this); map.setTileSource(TileSourceFactory.MAPNIK); map.setMultiTouchControls(true); map.setBuiltInZoomControls(true); map.getController().setZoom(5.0); map.getController().setCenter(new GeoPoint(50.0,10.0));
    map.getOverlays().add(new MapEventsOverlay(new MapEventsReceiver() {
      @Override public boolean singleTapConfirmedHelper(GeoPoint p) { return false; }
      @Override public boolean longPressHelper(GeoPoint p) { createPointAt(p); return true; }
    }));
    root.addView(map,new LinearLayout.LayoutParams(-1,0,1));
    Button layers=button("СЛОИ КАРТ / MAP LAYERS"); layers.setOnClickListener(v->chooseMapLayer()); root.addView(layers);
    mapCredit=text("© OpenStreetMap contributors",11); mapCredit.setTextColor(muted); root.addView(mapCredit);
    applySavedMapLayer();
    LinearLayout actions=new LinearLayout(this); actions.setOrientation(LinearLayout.HORIZONTAL);
    Button add=button("+ ТОЧКА"); add.setOnClickListener(v->manualPointDialog()); actions.addView(add,new LinearLayout.LayoutParams(0,-2,1));
    Button imp=button("ИМПОРТ"); imp.setOnClickListener(v->pickImport()); actions.addView(imp,new LinearLayout.LayoutParams(0,-2,1));
    Button exp=button("ЭКСПОРТ GPX"); exp.setOnClickListener(v->exportGpx()); actions.addView(exp,new LinearLayout.LayoutParams(0,-2,1)); root.addView(actions);
    Button objects=button("ОБЪЕКТЫ / ПАПКИ / ВЛОЖЕНИЯ"); objects.setOnClickListener(v->showObjects()); root.addView(objects);
    TextView privacy=text("GPS не используется. Онлайн-карта запрашивает только картографические тайлы; пользовательские точки и вложения не отправляются поставщику карты. Для полной автономности заранее кэшируйте карту.",11); privacy.setTextColor(muted); root.addView(privacy);
    setContentView(root); refreshMarkers();
  }
  // Only map tiles are requested from providers. Private objects are never added to tile URLs.
  // Provider terms may restrict caching, redistribution, and commercial usage.
  private ITileSource esri(String name,String service) {
    return new XYTileSource(name,0,19,256,".jpg",new String[]{
      "https://server.arcgisonline.com/ArcGIS/rest/services/"+service+"/MapServer/tile/"}) {
      @Override public String getTileURLString(long tileIndex) {
        return getBaseUrl()+org.osmdroid.util.MapTileIndex.getZoom(tileIndex)+"/"+
          org.osmdroid.util.MapTileIndex.getY(tileIndex)+"/"+
          org.osmdroid.util.MapTileIndex.getX(tileIndex);
      }
    };
  }
  private void setLayer(String layer) {
    ITileSource source;
    String credit;
    if("Esri World Imagery".equals(layer)) {
      source=esri("EsriWorldImagery","World_Imagery");
      credit="Esri World Imagery — imagery credits: Esri and imagery partners (see Esri attribution)";
    } else if("Esri World Topo".equals(layer)) {
      source=esri("EsriWorldTopo","World_Topo_Map");
      credit="Esri World Topographic Map — © Esri and data providers";
    } else if("Custom XYZ".equals(layer)) {
      String url=prefs.getString("xyz_template","");
      if(!validXYZ(url)) { toast("Сначала задайте HTTPS XYZ-адрес"); return; }
      source=customXYZ(url);
      credit="Пользовательский XYZ: соблюдайте лицензию и правила кеширования источника";
    } else {
      layer="OpenStreetMap"; source=TileSourceFactory.MAPNIK;
      credit="© OpenStreetMap contributors";
    }
    map.setTileSource(source);
    selectedMap=layer;
    prefs.edit().putString("map_layer",layer).apply();
    if(mapCredit!=null)mapCredit.setText(credit);
    map.invalidate();
  }
  private boolean validXYZ(String url) {
    return url!=null && url.startsWith("https://") &&
      url.contains("{z}") && url.contains("{x}") && url.contains("{y}") &&
      !url.contains("@") && !url.contains("\n") && !url.contains("\r");
  }
  private ITileSource customXYZ(String template) {
    return new XYTileSource("CustomXYZ",0,19,256,".png",new String[]{"https://example.invalid/"}) {
      @Override public String getTileURLString(long tileIndex) {
        return template.replace("{z}",String.valueOf(org.osmdroid.util.MapTileIndex.getZoom(tileIndex)))
          .replace("{x}",String.valueOf(org.osmdroid.util.MapTileIndex.getX(tileIndex)))
          .replace("{y}",String.valueOf(org.osmdroid.util.MapTileIndex.getY(tileIndex)));
      }
    };
  }
  private void applySavedMapLayer() { setLayer(prefs.getString("map_layer","OpenStreetMap")); }
  private void chooseMapLayer() {
    String[] layers={"OpenStreetMap","Esri World Imagery","Esri World Topo","Custom XYZ (HTTPS)","Другие источники — информация"};
    new AlertDialog.Builder(this).setTitle("Картографические слои")
      .setItems(layers,(d,which)->{
        if(which==3)configureXYZ();
        else if(which==4) new AlertDialog.Builder(this).setTitle("Дополнительные карты")
          .setMessage("Google и Яндекс требуют официальной интеграции SDK/API и соблюдения условий лицензий. Советские топокарты требуют легальных геопривязанных файлов. Maxar/Vantor — лицензированного доступа к снимкам. Эти источники пока не подключены.")
          .setPositiveButton("Понятно",null).show();
        else setLayer(layers[which]);
      }).show();
  }
  private void configureXYZ() {
    EditText input=edit("https://example.org/{z}/{x}/{y}.png");
    input.setSingleLine(false); input.setText(prefs.getString("xyz_template",""));
    LinearLayout layout=new LinearLayout(this); layout.setPadding(22,10,22,0); layout.addView(input);
    new AlertDialog.Builder(this).setTitle("Свой XYZ HTTPS")
      .setMessage("Только для источников, разрешающих такое подключение. Сервер увидит запросы тайлов и область просмотра карты. Не вводите приватные ключи в URL.")
      .setView(layout).setNegativeButton("Отмена",null)
      .setPositiveButton("Подключить",(d,w)->{
        String url=input.getText().toString().trim();
        if(!validXYZ(url)){toast("Нужен HTTPS URL с {z}, {x}, {y}");return;}
        prefs.edit().putString("xyz_template",url).apply();setLayer("Custom XYZ");
      }).show();
  }
  private void refreshMarkers() {
    if(map==null)return;
    for(int i=map.getOverlays().size()-1;i>=0;i--) if(map.getOverlays().get(i) instanceof Marker) map.getOverlays().remove(i);
    for(int i=0;i<points.length();i++) try {
      JSONObject p=points.getJSONObject(i); Marker m=new Marker(map); m.setPosition(new GeoPoint(p.getDouble("lat"),p.getDouble("lon"))); m.setTitle(p.optString("name","Точка"));
      String desc=p.optString("folder","Без папки"); if(!p.optString("note").isEmpty())desc+="\n"+p.optString("note"); m.setSnippet(desc); m.setAnchor(Marker.ANCHOR_CENTER,Marker.ANCHOR_BOTTOM); map.getOverlays().add(m);
    } catch(Exception ignored){} map.invalidate();
  }
  private void createPointAt(GeoPoint gp) {
    LinearLayout form=new LinearLayout(this); form.setOrientation(1); form.setPadding(24,8,24,0);
    EditText n=edit("Название ориентира"); EditText f=edit("Папка / группа"); EditText d=edit("Описание / заметка"); form.addView(n);form.addView(f);form.addView(d);
    new AlertDialog.Builder(this).setTitle("Новая точка на карте").setMessage(String.format(java.util.Locale.US,"%.6f, %.6f",gp.getLatitude(),gp.getLongitude())).setView(form).setNegativeButton("Отмена",null).setPositiveButton("Сохранить",(di,w)->{addObject(n.getText().toString(),gp.getLatitude(),gp.getLongitude(),d.getText().toString(),f.getText().toString());}).show();
  }
  private void manualPointDialog() {
    LinearLayout form=new LinearLayout(this); form.setOrientation(1); form.setPadding(24,0,24,0);
    EditText n=edit("Название"); EditText a=edit("Широта"); EditText o=edit("Долгота"); EditText f=edit("Папка / группа"); EditText d=edit("Описание");
    a.setInputType(InputType.TYPE_CLASS_NUMBER|InputType.TYPE_NUMBER_FLAG_DECIMAL|InputType.TYPE_NUMBER_FLAG_SIGNED); o.setInputType(InputType.TYPE_CLASS_NUMBER|InputType.TYPE_NUMBER_FLAG_DECIMAL|InputType.TYPE_NUMBER_FLAG_SIGNED);
    form.addView(n);form.addView(a);form.addView(o);form.addView(f);form.addView(d);
    new AlertDialog.Builder(this).setTitle("Добавить точку вручную").setView(form).setNegativeButton("Отмена",null).setPositiveButton("Сохранить",(di,w)->{try{double la=Double.parseDouble(a.getText().toString()),lo=Double.parseDouble(o.getText().toString()); if(la < -90||la>90||lo < -180||lo>180)throw new Exception(); addObject(n.getText().toString(),la,lo,d.getText().toString(),f.getText().toString()); map.getController().setCenter(new GeoPoint(la,lo));map.getController().setZoom(14.0);}catch(Exception ex){toast("Проверьте широту и долготу");}}).show();
  }
  private void addObject(String n,double la,double lo,String d,String f) {
    try { JSONObject p=new JSONObject(); p.put("id",java.util.UUID.randomUUID().toString()); p.put("type","point");p.put("name",n.trim().isEmpty()?"Точка "+(points.length()+1):n.trim());p.put("lat",la);p.put("lon",lo);p.put("note",d);p.put("folder",f.trim().isEmpty()?"Без папки":f.trim());p.put("media",new JSONArray());points.put(p);if(!save()){JSONArray prior=new JSONArray();for(int i=0;i<points.length()-1;i++)prior.put(points.optJSONObject(i));points=prior;return;}refreshMarkers();toast("Точка сохранена в зашифрованном локальном хранилище"); }catch(Exception e){toast("Не удалось сохранить точку");}
  }
  // User-created map objects are encrypted at rest with an Android Keystore AES-GCM key.
  // They are never sent to the tile provider or any application server.
  private SecretKey getOrCreateStorageKey() throws Exception {
    KeyStore ks=KeyStore.getInstance("AndroidKeyStore"); ks.load(null);
    java.security.Key existing=ks.getKey(KEY_ALIAS,null);
    if(existing instanceof SecretKey) return (SecretKey)existing;
    KeyGenerator kg=KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES,"AndroidKeyStore");
    kg.init(new KeyGenParameterSpec.Builder(KEY_ALIAS,KeyProperties.PURPOSE_ENCRYPT|KeyProperties.PURPOSE_DECRYPT)
      .setBlockModes(KeyProperties.BLOCK_MODE_GCM).setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE).setKeySize(256).build());
    return kg.generateKey();
  }
  private File objectsFile(){return new File(getFilesDir(),OBJECTS_FILE);}
  private JSONArray loadEncryptedObjects() throws Exception {
    File f=objectsFile();
    if(f.exists()) {
      byte[] all=readAll(new FileInputStream(f));
      if(all.length<13) throw new IOException("Повреждён файл объектов");
      byte[] iv=java.util.Arrays.copyOfRange(all,0,12), cipherText=java.util.Arrays.copyOfRange(all,12,all.length);
      Cipher c=Cipher.getInstance("AES/GCM/NoPadding"); c.init(Cipher.DECRYPT_MODE,getOrCreateStorageKey(),new GCMParameterSpec(128,iv));
      return new JSONArray(new String(c.doFinal(cipherText),StandardCharsets.UTF_8));
    }
    // One-time migration from the previous prototype's private SharedPreferences storage.
    String legacy=prefs.getString("points",null);
    JSONArray migrated=new JSONArray(legacy==null?"[]":legacy);
    if(legacy!=null && !saveEncryptedObjects(migrated)) throw new IOException("Не удалось перенести старые объекты в защищённое хранилище");
    if(legacy!=null) prefs.edit().remove("points").apply();
    return migrated;
  }
  private byte[] readAll(InputStream in) throws IOException {
    try(InputStream source=in; ByteArrayOutputStream out=new ByteArrayOutputStream()) { byte[] buf=new byte[8192]; int n; while((n=source.read(buf))!=-1) out.write(buf,0,n); return out.toByteArray(); }
  }
  private boolean saveEncryptedObjects(JSONArray value) {
    File tmp=new File(getFilesDir(),OBJECTS_FILE+".tmp");
    try {
      byte[] iv=new byte[12]; new java.security.SecureRandom().nextBytes(iv);
      Cipher c=Cipher.getInstance("AES/GCM/NoPadding"); c.init(Cipher.ENCRYPT_MODE,getOrCreateStorageKey(),new GCMParameterSpec(128,iv));
      byte[] encrypted=c.doFinal(value.toString().getBytes(StandardCharsets.UTF_8));
      try(FileOutputStream out=new FileOutputStream(tmp)) { out.write(iv); out.write(encrypted); out.getFD().sync(); }
      File dest=objectsFile(); File backup=new File(getFilesDir(),OBJECTS_FILE+".bak");
      if(backup.exists())backup.delete();
      boolean hadOld=dest.exists();
      if(hadOld&&!dest.renameTo(backup))throw new IOException("Не удалось подготовить замену хранилища");
      if(!tmp.renameTo(dest)) { if(hadOld)backup.renameTo(dest); throw new IOException("Не удалось сохранить зашифрованный файл"); }
      if(backup.exists())backup.delete();
      return true;
    } catch(Exception e) { tmp.delete(); return false; }
  }
  private boolean save(){boolean ok=saveEncryptedObjects(points);if(!ok)toast("Не удалось сохранить объекты в защищённом хранилище");return ok;}
  private void showObjects(){
    ScrollView sv=new ScrollView(this); LinearLayout box=new LinearLayout(this);box.setOrientation(1);box.setPadding(20,8,20,8);sv.addView(box);
    if(points.length()==0)box.addView(text("Пока нет объектов. Долгое нажатие на карту создаёт точку.",14));
    for(int i=0;i<points.length();i++)try{final int ix=i;JSONObject p=points.getJSONObject(i);String label=(i+1)+". "+p.optString("name")+"\nПапка: "+p.optString("folder","Без папки")+"\n"+p.optDouble("lat")+", "+p.optDouble("lon")+(p.optString("note").isEmpty()?"":"\n"+p.optString("note"));TextView t=text(label,14);box.addView(t);
      LinearLayout row=new LinearLayout(this);row.setOrientation(LinearLayout.HORIZONTAL);
      Button go=button("ПОКАЗАТЬ");go.setOnClickListener(v->{try{JSONObject q=points.getJSONObject(ix);map.getController().setCenter(new GeoPoint(q.getDouble("lat"),q.getDouble("lon")));map.getController().setZoom(15.0);}catch(Exception ignored){} });row.addView(go,new LinearLayout.LayoutParams(0,-2,1));
      Button media=button("+ МЕДИА");media.setOnClickListener(v->{pendingMediaIndex=ix;Intent in=new Intent(Intent.ACTION_OPEN_DOCUMENT);in.setType("*/*");in.putExtra(Intent.EXTRA_MIME_TYPES,new String[]{"image/*","video/*","audio/*"});in.addCategory(Intent.CATEGORY_OPENABLE);in.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);startActivityForResult(in,REQ_MEDIA);});row.addView(media,new LinearLayout.LayoutParams(0,-2,1));
      Button del=button("УДАЛИТЬ");del.setOnClickListener(v->new AlertDialog.Builder(this).setMessage("Удалить объект и его вложения из закрытого хранилища?").setNegativeButton("Отмена",null).setPositiveButton("Удалить",(a,b)->{JSONArray previous=points;JSONObject removed=points.optJSONObject(ix);JSONArray next=new JSONArray();for(int j=0;j<points.length();j++)if(j!=ix)next.put(points.optJSONObject(j));points=next;if(save())removePrivateMedia(removed);else points=previous;refreshMarkers();showObjects();}).show());row.addView(del,new LinearLayout.LayoutParams(0,-2,1));box.addView(row);
      JSONArray mediaFiles=p.optJSONArray("media"); if(media!=null)for(int j=0;j<media.length();j++)box.addView(text("Вложение: "+media.optJSONObject(j).optString("name","файл"),12));
    }catch(Exception ignored){}
    new AlertDialog.Builder(this).setTitle("Объекты и вложения").setView(sv).setPositiveButton("Готово",null).show();
  }
  private void pickImport(){Intent i=new Intent(Intent.ACTION_OPEN_DOCUMENT);i.setType("*/*");i.putExtra(Intent.EXTRA_MIME_TYPES,new String[]{"application/gpx+xml","application/xml","text/xml","application/vnd.google-earth.kml+xml"});i.addCategory(Intent.CATEGORY_OPENABLE);startActivityForResult(i,REQ_IMPORT);}
  private void exportGpx(){
    try{StringBuilder s=new StringBuilder("<?xml version=\"1.0\" encoding=\"UTF-8\"?><gpx version=\"1.1\" creator=\"Warrior rus\" xmlns=\"http://www.topografix.com/GPX/1/1\">");for(int i=0;i<points.length();i++){JSONObject p=points.getJSONObject(i);s.append("<wpt lat=\"").append(p.getDouble("lat")).append("\" lon=\"").append(p.getDouble("lon")).append("\"><name>").append(xml(p.optString("name"))).append("</name><desc>").append(xml(p.optString("note"))).append("</desc></wpt>");}s.append("</gpx>");pendingExport=s.toString();Intent in=new Intent(Intent.ACTION_CREATE_DOCUMENT);in.setType("application/gpx+xml");in.putExtra(Intent.EXTRA_TITLE,"warrior-rus-points.gpx");startActivityForResult(in,REQ_EXPORT);}catch(Exception e){toast("Не удалось подготовить GPX");}
  }
  private String xml(String x){return x.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;").replace("'","&apos;");}
  @Override protected void onActivityResult(int req,int res,Intent data){super.onActivityResult(req,res,data);if(res!=RESULT_OK||data==null)return;try{
    if(req==REQ_EXPORT){OutputStream out=getContentResolver().openOutputStream(data.getData());out.write(pendingExport.getBytes(StandardCharsets.UTF_8));out.close();pendingExport="";toast("GPX сохранён");}
    else if(req==REQ_MEDIA&&pendingMediaIndex>=0){
      Uri u=data.getData(); String mime=getContentResolver().getType(u); String originalName=fileName(u);
      String privateName=copyMediaIntoPrivateStorage(u,originalName);
      JSONObject p=points.getJSONObject(pendingMediaIndex);JSONArray a=p.optJSONArray("media");if(a==null)a=new JSONArray();
      JSONObject m=new JSONObject();m.put("path",MEDIA_DIR+"/"+privateName);m.put("name",originalName);m.put("mime",mime==null?"application/octet-stream":mime);a.put(m);p.put("media",a);if(save())toast("Вложение зашифровано и сохранено в закрытом хранилище");else{a.remove(a.length()-1);new File(new File(getFilesDir(),MEDIA_DIR),privateName).delete();}pendingMediaIndex=-1;
    }
    else if(req==REQ_IMPORT){InputStream in=getContentResolver().openInputStream(data.getData());ByteArrayOutputStream b=new ByteArrayOutputStream();byte[] buf=new byte[4096];int n;while((n=in.read(buf))>0)b.write(buf,0,n);in.close();String raw=b.toString("UTF-8");int count=0;java.util.regex.Matcher m=java.util.regex.Pattern.compile("<wpt[^>]*lat=[\\\"']([^\\\"']+)[\\\"'][^>]*lon=[\\\"']([^\\\"']+)[\\\"'][^>]*>(.*?)</wpt>",java.util.regex.Pattern.CASE_INSENSITIVE|java.util.regex.Pattern.DOTALL).matcher(raw);while(m.find()){String nm="Импортированная точка";java.util.regex.Matcher q=java.util.regex.Pattern.compile("<name>(.*?)</name>",java.util.regex.Pattern.DOTALL).matcher(m.group(3));if(q.find())nm=android.text.Html.fromHtml(q.group(1)).toString();addImported(nm,Double.parseDouble(m.group(1)),Double.parseDouble(m.group(2)));count++;}refreshMarkers();toast("Импортировано точек: "+count+" (GPX waypoint)");}
  }catch(Exception e){toast("Ошибка обработки файла");}}
  private void addImported(String n,double la,double lo){try{if(Double.isNaN(la)||Double.isNaN(lo)||Double.isInfinite(la)||Double.isInfinite(lo)||la < -90||la>90||lo < -180||lo>180)return;JSONObject p=new JSONObject();p.put("id",java.util.UUID.randomUUID().toString());p.put("type","point");p.put("name",n);p.put("lat",la);p.put("lon",lo);p.put("note","Импортировано из GPX");p.put("folder","Импорт");p.put("media",new JSONArray());points.put(p);if(!save()){JSONArray prior=new JSONArray();for(int i=0;i<points.length()-1;i++)prior.put(points.optJSONObject(i));points=prior;}}catch(Exception ignored){}}
  private String fileName(Uri u){
    String name=null; Cursor c=null;
    try { c=getContentResolver().query(u,new String[]{OpenableColumns.DISPLAY_NAME},null,null,null); if(c!=null&&c.moveToFirst())name=c.getString(0); }
    catch(Exception ignored){} finally { if(c!=null)c.close(); }
    if(name==null||name.trim().isEmpty()) name="медиафайл";
    return name.replace("/","_").replace("\\","_");
  }
  private String copyMediaIntoPrivateStorage(Uri uri,String originalName) throws Exception {
    File dir=new File(getFilesDir(),MEDIA_DIR); if(!dir.exists()&&!dir.mkdirs())throw new IOException("Не удалось создать закрытую папку медиа");
    String ext=""; int dot=originalName.lastIndexOf('.'); if(dot>=0&&originalName.length()-dot<=10)ext=originalName.substring(dot).replaceAll("[^A-Za-z0-9.]","");
    String targetName=UUID.randomUUID().toString()+ext+".enc"; File dest=new File(dir,targetName);
    try(InputStream in=getContentResolver().openInputStream(uri);FileOutputStream rawOut=new FileOutputStream(dest)) {
      if(in==null)throw new IOException("Источник медиа недоступен");
      byte[] iv=new byte[12];new java.security.SecureRandom().nextBytes(iv);rawOut.write(iv);
      Cipher cipher=Cipher.getInstance("AES/GCM/NoPadding");cipher.init(Cipher.ENCRYPT_MODE,getOrCreateStorageKey(),new GCMParameterSpec(128,iv));
      try(CipherOutputStream out=new CipherOutputStream(rawOut,cipher)) {
        byte[] buf=new byte[16384];int n;long total=0;
        while((n=in.read(buf))!=-1){total+=n;if(total>500L*1024L*1024L)throw new IOException("Файл больше допустимого лимита 500 МБ");out.write(buf,0,n);}
      }
    } catch(Exception e){dest.delete();throw e;}
    return targetName;
  }
  private void removePrivateMedia(JSONObject p) {
    if(p==null)return; JSONArray a=p.optJSONArray("media");if(a==null)return;
    for(int i=0;i<a.length();i++){JSONObject m=a.optJSONObject(i);if(m==null)continue;String rel=m.optString("path","");
      if(rel.startsWith(MEDIA_DIR+"/")){File f=new File(new File(getFilesDir(),MEDIA_DIR),rel.substring((MEDIA_DIR+"/").length()));if(f.getParentFile().equals(new File(getFilesDir(),MEDIA_DIR)))f.delete();}
    }
  }
  private void toast(String s){Toast.makeText(this,s,Toast.LENGTH_LONG).show();}
  @Override protected void onResume(){super.onResume();if(map!=null)map.onResume();}
  @Override protected void onPause(){if(map!=null)map.onPause();super.onPause();}
}
