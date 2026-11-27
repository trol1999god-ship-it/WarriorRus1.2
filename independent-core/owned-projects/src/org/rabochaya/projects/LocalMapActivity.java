package org.rabochaya.projects;
import android.app.*;import android.content.*;import android.net.Uri;import android.os.*;import android.widget.*;import android.view.*;import java.io.*;import java.util.*;import java.util.concurrent.*;
/** Own raster map viewer with local MBTiles or explicit online sources. */
public final class LocalMapActivity extends Activity implements LocalMapView.Listener {
 private static final int IMPORT_MAP=4301,IMPORT_TIFF=4302,IMPORT_OZI=4303,EXPORT_MAP_SNAPSHOT=4304,DEM=4602,CATALOG=4502,LAYERS=4503;private PopupWindow popup;private boolean mapInputLocked;private String pendingMapSnapshot;
 private MagneticHeading mapCompass;
 private BarometerDialog barometer;
 private TextView compassArrow,compassCourse;
 private LinearLayout compassPanel;
 private boolean mapForeground;
 private double compassHeading=Double.NaN;
 private String compassReason="ожидаются данные датчиков";
 private int headingAccuracy;
 private final NorthReference northReference=new NorthReference();private double[] creationPoint;private LinearLayout zoomButtons;private SeekBar zoomSlider;private boolean draggingZoomSlider;private MapDock mapDock;private long projectId;private LinearLayout root;private TextView coordinates,targetStatus;private double[] localTarget;private TextView status,tileNotice,scaleValue;private String tileIssue;private MapScaleView mapScale;private LocalMapView map;private HgtRaster dem;private List<KmlProject.Feature> features;private KmlSymbolAssets symbolAssets;
 private boolean busy,refreshOnResume,refreshMapOnResume;private volatile boolean disposed;private final ExecutorService worker=Executors.newSingleThreadExecutor();private String warning="";private long lastError;private LinearLayout drawingRow;private String pendingDrawType;private ArrayList<double[]> pendingDrawPoints;
 private Bundle pendingEdit;
 private EditForm activeEdit;
 private static final class EditForm {
  final AlertDialog dialog;final String id,type,token;final EditText name,note,coords;
  EditForm(AlertDialog dialog,String id,String type,String token,EditText name,EditText note,EditText coords){
   this.dialog=dialog;this.id=id;this.type=type;this.token=token;this.name=name;this.note=note;this.coords=coords;
  }
  Bundle snapshot(long project){
   String title=name.getText().toString(),description=note.getText().toString();
   String positions=coords==null?null:coords.getText().toString();
   // Keep the activity state comfortably below the Binder transaction limit.
   if((long)title.length()+description.length()+(positions==null?0:positions.length())>200000)return null;
   Bundle state=new Bundle();
   state.putLong("project",project);state.putString("id",id);state.putString("type",type);state.putString("token",token);
   state.putString("name",title);state.putString("note",description);state.putString("coords",positions);
   return state;
  }
 }
 public static void open(Activity parent,long project){Intent i=new Intent(parent,LocalMapActivity.class);i.putExtra("project",project);parent.startActivity(i);}
 protected void onCreate(Bundle state){super.onCreate(state);mapCompass=new MagneticHeading(this,this::displayCompassReading);projectId=getIntent().getLongExtra("project",-1);root=new LinearLayout(this);root.setOrientation(LinearLayout.VERTICAL);root.setBackgroundColor(MapHud.BAR);setContentView(root);WorkspaceUi.systemBars(this);applyMapScreenOptions(false);if(state!=null){pendingMapSnapshot=state.getString("pending_map_snapshot");mapInputLocked=state.getBoolean("map_input_locked");pendingEdit=state.getBundle("map_edit");pendingDrawType=state.getString("drawing_type");Object saved=state.getSerializable("drawing_points");if(saved instanceof ArrayList)pendingDrawPoints=(ArrayList<double[]>)saved;}load();}
 private TextView label(String s,int size){TextView t=new TextView(this);t.setText(s);t.setTypeface(WorkspaceUi.font(this));t.setTextColor(0xffffffff);t.setTextSize(size);t.setPadding(14,10,14,10);return t;}
 private void button(LinearLayout row,String name,final Runnable action){Button b=WorkspaceUi.button(this,name,()->{if(!busy)action.run();});b.setTextSize(12);LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,(int)(50*getResources().getDisplayMetrics().density),1);p.setMargins(2,2,2,2);row.addView(b,p);}
 private File mapFile(){return new File(getFilesDir(),"local_basemap_"+projectId+".mbtiles");}
 private void message(String s){root.removeAllViews();root.addView(label(s,17));}
 private void load(){busy=true;message("Открытие локальной карты…");worker.execute(()->{ProjectStore store=new ProjectStore(this);try{final KmlProject snapshot=store.load(projectId);final List<KmlProject.Feature> f=snapshot.features(true);final KmlSymbolAssets icons=new KmlSymbolAssets(snapshot.root().getOwnerDocument(),snapshot.entry,snapshot.assets);runOnUiThread(()->{if(!disposed){features=f;symbolAssets=icons;busy=false;ProjectSession.remember(this,projectId);show(true);restoreEditForm();}});}catch(final Exception e){runOnUiThread(()->{if(!disposed){busy=false;message("Не удалось открыть проект: "+e.getMessage());LinearLayout row=new LinearLayout(this);root.addView(row);button(row,"К списку",()->finish());}});}finally{store.close();}});}
 private void show(boolean restore){
  if(disposed)return;if(map!=null){saveView();map.close();map=null;}closeDem();try{File terrain=DemActivity.file(this,projectId);if(terrain.isFile())dem=HgtRaster.owned(terrain,projectId);}catch(IOException e){warning="DEM недоступен: "+e.getMessage();}root.removeAllViews();
  boolean onlineMode=OnlineMapSettings.active(this,projectId);TileSource source=onlineMode?OnlineMapSettings.source(this):null;
  MapComposition composition=null;String compositionError="";try{if(MapCompositionSettings.active(this,projectId))composition=MapCompositionSettings.load(this,projectId).composition;}catch(Exception e){compositionError="Состав карт не прочитан: "+e.getMessage();}
  FrameLayout scene=new FrameLayout(this);root.addView(scene,new LinearLayout.LayoutParams(-1,0,1));
  map=new LocalMapView(this,features,mapFile(),this,source,OnlineMapSettings.network(this),composition);scene.addView(map,new FrameLayout.LayoutParams(-1,-1));if(symbolAssets!=null)map.setSymbols(symbolAssets);
  map.restoreManualBearing(getPreferences(0).getFloat("view_"+projectId+"_bearing",0));
  map.setManualRotation(getPreferences(0).getBoolean("rotate_map_touch",false));
  applyZoomGestureSettings();
  map.restorePitch(getPreferences(0).getFloat("view_"+projectId+"_pitch",0));
  map.setPitchEnabled(getPreferences(0).getBoolean("map_pitch",false));
  map.setTrackPreprocessing(getPreferences(0).getBoolean("preprocess_gpx_tracks",false));
  map.setTileDetail(getPreferences(0).getInt("map_tile_detail",0));
  int control=WorkspaceUi.dp(this,MapHud.TOUCH_DP),edge=WorkspaceUi.dp(this,4),dockHeight=control;
  LinearLayout mapReadout=new LinearLayout(this);
  mapReadout.setOrientation(LinearLayout.VERTICAL);
  LinearLayout coordinateBar=new LinearLayout(this);
  FrameLayout.LayoutParams cp=new FrameLayout.LayoutParams(-2,-2,Gravity.TOP|Gravity.LEFT);
  cp.setMargins(edge,edge,edge,0);scene.addView(mapReadout,cp);
  mapReadout.addView(coordinateBar,new LinearLayout.LayoutParams(-2,-2));
  createCompassPanel(scene,edge);
  coordinates=label("Координаты центра · WGS 84",11);coordinates.setBackground(MapHud.panel(this));coordinates.setTextColor(MapHud.INK);coordinates.setContentDescription("Настройки координат центра");coordinates.setOnClickListener(v->coordinateOptions());coordinates.setVisibility(getPreferences(0).getBoolean("show_coordinates",true)?View.VISIBLE:View.GONE);
  coordinates.setIncludeFontPadding(false);
  coordinates.setPadding(edge,WorkspaceUi.dp(this,2),edge,WorkspaceUi.dp(this,2));
  coordinateBar.addView(coordinates,new LinearLayout.LayoutParams(-2,-2,1));
  targetStatus=label("",11);
  targetStatus.setBackground(MapHud.panel(this));
  targetStatus.setTextColor(MapHud.INK);
  targetStatus.setVisibility(View.GONE);
  targetStatus.setOnClickListener(view->targetMenu());
  mapReadout.addView(targetStatus,new LinearLayout.LayoutParams(-2,-2));
  applyTarget();
  ImageButton collapse=MapHud.button(this,"collapse","Свернуть / развернуть координаты",()->{boolean visible=coordinates.getVisibility()!=View.VISIBLE;coordinates.setVisibility(visible?View.VISIBLE:View.GONE);getPreferences(0).edit().putBoolean("show_coordinates",visible).commit();});
  MapHud.insetButton(this,collapse,8,15);
  coordinateBar.addView(collapse,new LinearLayout.LayoutParams(control,control));
  mapScale=new MapScaleView(this);
  mapScale.setVisibility(getPreferences(0).getBoolean("show_scale_bar",true)?View.VISIBLE:View.GONE);
  map.setLabelsVisible(getPreferences(0).getBoolean("show_labels",true));
  map.setGeographicGridVisible(getPreferences(0).getBoolean("show_geographic_grid",false));
  map.setGridFormats(CoordinateSettings.primary(this),CoordinateSettings.secondary(this));
  applyGridAppearance();
  map.setSecondaryGridVisible(getPreferences(0).getBoolean("show_secondary_grid",false));
  map.setRadiusRulerVisible(getPreferences(0).getBoolean("show_radius_ruler",false));
  map.setNightRaster(getPreferences(0).getBoolean("map_night_raster",false));
  LinearLayout.LayoutParams scaleLayout=new LinearLayout.LayoutParams(-2,-2);
  scaleLayout.topMargin=edge;mapReadout.addView(mapScale,scaleLayout);
  scaleValue=label("",11);
  scaleValue.setTextColor(MapHud.INK);
  scaleValue.setBackground(MapHud.panel(this));
  scaleValue.setPadding(edge,WorkspaceUi.dp(this,2),edge,WorkspaceUi.dp(this,2));
  scaleValue.setVisibility(getPreferences(0).getBoolean("show_scale_value",false)?View.VISIBLE:View.GONE);
  mapReadout.addView(scaleValue,new LinearLayout.LayoutParams(-2,-2));
  setupMapStatus(source,composition,compositionError,edge);
  int bottom=WorkspaceUi.dp(this,2);
  FrameLayout.LayoutParams statusLayout=new FrameLayout.LayoutParams(-2,-2,Gravity.BOTTOM|Gravity.RIGHT);
  statusLayout.setMargins(edge,0,control+2*edge,dockHeight+edge);
  scene.addView(status,statusLayout);
  zoomButtons=new LinearLayout(this);
  zoomButtons.setOrientation(LinearLayout.VERTICAL);
  zoomButtons.setVisibility(getPreferences(0).getBoolean("show_zoom",true)?View.VISIBLE:View.GONE);
  FrameLayout.LayoutParams zoomLayout=new FrameLayout.LayoutParams(control,-2,Gravity.BOTTOM|Gravity.RIGHT);
  zoomLayout.setMargins(0,0,edge,bottom);
  scene.addView(zoomButtons,zoomLayout);
  rebuildZoomControls();
  tileIssue=null;
  tileNotice=label("!",14);
  tileNotice.setTextColor(MapHud.INK);
  tileNotice.setGravity(Gravity.CENTER);
  tileNotice.setPadding(0,0,0,0);
  tileNotice.setContentDescription("Ошибка загрузки карты");
  tileNotice.setBackground(new android.graphics.drawable.InsetDrawable(MapHud.panel(this),WorkspaceUi.dp(this,9)));
  tileNotice.setVisibility(View.GONE);
  tileNotice.setOnClickListener(v->new AlertDialog.Builder(this).setTitle("Загрузка карты")
    .setMessage(tileIssue).setNegativeButton("Закрыть",null)
    .setPositiveButton("Повторить",(d,w)->{tileNotice.setVisibility(View.GONE);map.retryTiles();}).show());
  FrameLayout.LayoutParams noticeLayout=new FrameLayout.LayoutParams(control,control,Gravity.BOTTOM|Gravity.RIGHT);
  noticeLayout.setMargins(0,0,edge,bottom+2*dockHeight);
  scene.addView(tileNotice,noticeLayout);
  zoomButtons.addOnLayoutChangeListener((view,left,top,right,edgeBottom,oldLeft,oldTop,oldRight,oldBottom)->{
   int height=edgeBottom-top;
   if(noticeLayout.bottomMargin!=bottom+height){
    noticeLayout.bottomMargin=bottom+height;
    tileNotice.setLayoutParams(noticeLayout);
   }
  });
  mapDock=new MapDock(this,scene,status,zoomButtons,
    dockAction("Меню",this::mainMenu),dockAction("Карты",this::mapsMenu),dockAction("Метки",this::marksMenu),
    dockAction("Файловый менеджер",()->manager(false)),dockAction("Ориентирование",this::orientationMenu));
  updateMapInputLock();
  applyMapAppearance();
  drawingRow=null;if(pendingDrawType!=null&&pendingDrawPoints!=null){String type=pendingDrawType;ArrayList<double[]> points=pendingDrawPoints;pendingDrawType=null;pendingDrawPoints=null;if(("LineString".equals(type)||"Polygon".equals(type))&&points.size()<=2000){startDrawing(type);for(double[] c:points)if(c!=null&&c.length>=2)map.addDrawingPoint(c[0],c[1]);}}
  if(restore){SharedPreferences p=getPreferences(0);String key="view_"+projectId+"_";if(p.contains(key+"x"))try{map.restore(Double.parseDouble(p.getString(key+"x",".5")),Double.parseDouble(p.getString(key+"y",".5")),p.getFloat(key+"z",2));}catch(RuntimeException ignored){}}
 }
 public void longPressed(double lat,double lon){if(busy)return;menu(String.format(Locale.US,"%.6f, %.6f",lat,lon),item("Задать цель здесь",()->setTarget(lat,lon)),item("Создать метку здесь",()->{creationPoint=new double[]{lon,lat};editObject(null,"Point");}),item("Начать маршрут здесь",()->{startDrawing("LineString");map.addDrawingPoint(lon,lat);}),item("Начать область здесь",()->{startDrawing("Polygon");map.addDrawingPoint(lon,lat);}),item("В центр карты",()->{double[] v=map.viewport();map.restore(MapMath.x(lon),MapMath.y(lat),v[2]);}));}
 private void rebuildZoomControls(){
  zoomButtons.removeAllViews();
  zoomSlider=null;
  draggingZoomSlider=false;
  int width=WorkspaceUi.dp(this,MapHud.TOUCH_DP);
  if(getPreferences(0).getBoolean("zoom_slider",false)){
   int length=width*4;
   FrameLayout sliderFrame=new FrameLayout(this);
   SeekBar slider=new SeekBar(this);
   zoomSlider=slider;
   slider.setMax(230);
   slider.setContentDescription("Слайдер масштаба карты");
   slider.setProgress((int)Math.round(map.viewport()[2]*10));
   slider.setRotation(-90);
   slider.setEnabled(!mapInputLocked);
   sliderFrame.addView(slider,new FrameLayout.LayoutParams(length,width,Gravity.CENTER));
   zoomButtons.addView(sliderFrame,new LinearLayout.LayoutParams(width,length));
   slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
    public void onProgressChanged(SeekBar bar,int level,boolean fromUser){
     if(fromUser)map.zoomFromSlider(level/10d,!draggingZoomSlider);
    }
    public void onStartTrackingTouch(SeekBar bar){draggingZoomSlider=true;}
    public void onStopTrackingTouch(SeekBar bar){
     draggingZoomSlider=false;
     map.zoomFromSlider(bar.getProgress()/10d,true);
    }
   });
  }else{
   zoomButtons.addView(zoomButton("plus","+",1),new LinearLayout.LayoutParams(width,width));
   zoomButtons.addView(zoomButton("minus","−",-1),new LinearLayout.LayoutParams(width,width));
  }
 }

 private ImageButton zoomButton(String icon, String label, int step) {
  ImageButton button=MapHud.button(this,icon,label,()->map.step(step));
  button.setEnabled(!mapInputLocked);
  button.setOnLongClickListener(view->{
   if(mapInputLocked||!getPreferences(0).getBoolean("zoom_hold_detail",false))return false;
   changeTileDetail(getPreferences(0).getInt("map_tile_detail",0)+step);
   return true;
  });
  MapHud.insetButton(this,button,6,11);
  return button;
 }
 private WorkspaceUi.Item dockAction(String title,Runnable action){return item(title,()->{if(!busy)action.run();});}
 private WorkspaceUi.Item item(String title,Runnable action){return new WorkspaceUi.Item(title,action);}
 private void menu(String title,WorkspaceUi.Item...items){if(popup!=null)popup.dismiss();popup=WorkspaceUi.menu(this,(View)mapDock.getParent(),mapDock,title,items);}
 private boolean canLeave(){if(map!=null&&map.drawingType()!=null){error("Завершите или отмените рисунок");return false;}return true;}
 private void mainMenu() {
  if (popup != null) popup.dismiss();
  applyMapScreenOptions(true);
  popup = WorkspaceUi.menu(this, (View) mapDock.getParent(), mapDock, "Меню",
    () -> applyMapScreenOptions(false),
    item("Проекты и файлы KML/KMZ", () -> manager(true)), item("Новый проект", this::newProject),
    item("Информеры", this::display), item("Опции", this::optionsMenu),
    item(mapInputLocked ? "Разблокировать экран" : "Блокировать экран", this::toggleMapInputLock),
    WorkspaceUi.Item.toggle("Ночной режим",getPreferences(0).getBoolean("map_night_raster",false),()->{
     boolean enabled=!getPreferences(0).getBoolean("map_night_raster",false);
     getPreferences(0).edit().putBoolean("map_night_raster",enabled).apply();
     map.setNightRaster(enabled);
    }),
    item("Снимок экрана",this::exportMapSnapshot),item("Закрыть карту", this::onBackPressed));
 }
 private void toggleMapInputLock() {
  if (!canLeave()) return;
  mapInputLocked = !mapInputLocked;
  updateMapInputLock();
  Toast.makeText(this, mapInputLocked ? "Жесты карты заблокированы" : "Жесты карты разблокированы",
    Toast.LENGTH_SHORT).show();
 }
 private boolean canMoveMap() {
  if (!mapInputLocked) return true;
  error("Разблокируйте экран в меню карты");
  return false;
 }
 private void updateMapInputLock() {
  map.setInputLocked(mapInputLocked);
  for(int i=0;i<zoomButtons.getChildCount();i++)zoomButtons.getChildAt(i).setEnabled(!mapInputLocked);
  if(zoomSlider!=null)zoomSlider.setEnabled(!mapInputLocked);
 }
 private void optionsMenu(){
  menu("Опции",item("Координаты центра экрана",this::coordinateOptions),
    item("Кеш / онлайн",this::onlineSettings),item("Информеры",this::display),
    item("Экран карты",this::screenOptions),item("Управление масштабом",this::zoomOptions),item("Вид координатных сеток",this::gridAppearance),
    item("Единицы измерения",this::displayUnits),item("Стиль статус-панелей",this::mapAppearance),
    item("Уровень детализации",this::tileDetail),item("Цель на карте",this::targetMenu),
    WorkspaceUi.Item.toggle("Предварительная обработка треков",
        getPreferences(0).getBoolean("preprocess_gpx_tracks",false),this::toggleTrackPreprocessing));
 }
 private void zoomOptions(){
  SharedPreferences prefs=getPreferences(0);
  menu("Управление масштабом",item("Инструмент масштабирования",this::chooseZoomControl),
      WorkspaceUi.Item.toggle("Масштабирование жестом",prefs.getBoolean("zoom_pinch",true),
          ()->toggleZoomGesture("zoom_pinch",true)),
      WorkspaceUi.Item.toggle("Подгонять масштаб к ближайшему уровню",prefs.getBoolean("zoom_snap",false),
          ()->toggleZoomGesture("zoom_snap",false)),
      WorkspaceUi.Item.toggle("Масштабировать кнопками громкости",prefs.getBoolean("zoom_volume",false),
          ()->toggleZoomGesture("zoom_volume",false)),
      WorkspaceUi.Item.toggle("Удерживание +/- меняет детализацию",prefs.getBoolean("zoom_hold_detail",false),
          ()->toggleZoomGesture("zoom_hold_detail",false)));
 }

 private void chooseZoomControl(){
  SharedPreferences prefs=getPreferences(0);
  WorkspaceUi.showDialog(this,new AlertDialog.Builder(this).setTitle("Управление масштабом")
      .setSingleChoiceItems(new String[]{"Кнопки","Слайдер"},prefs.getBoolean("zoom_slider",false)?1:0,
          (dialog,index)->{
           prefs.edit().putBoolean("zoom_slider",index==1).apply();
           rebuildZoomControls();
           if(mapDock!=null)mapDock.layoutControls();
           dialog.dismiss();
          }).setNegativeButton("Отмена",null));
 }

 private void toggleZoomGesture(String key,boolean initial){
  SharedPreferences prefs=getPreferences(0);
  prefs.edit().putBoolean(key,!prefs.getBoolean(key,initial)).apply();
  applyZoomGestureSettings();
 }

 private void applyZoomGestureSettings(){
  SharedPreferences prefs=getPreferences(0);
  map.setZoomGestures(prefs.getBoolean("zoom_pinch",true),prefs.getBoolean("zoom_snap",false));
 }

 private void toggleTrackPreprocessing(){
  SharedPreferences prefs=getPreferences(0);
  boolean enabled=!prefs.getBoolean("preprocess_gpx_tracks",false);
  prefs.edit().putBoolean("preprocess_gpx_tracks",enabled).apply();
  map.setTrackPreprocessing(enabled);
 }

 private static final String[] MAP_SCREEN_KEYS={"map_hide_status", "map_immersive", "map_keep_screen_on", "map_confirm_exit", "map_show_locked"};

 private void applyGridAppearance() {
  SharedPreferences prefs=getPreferences(0);
  map.setGridAppearance(prefs.getInt("grid_density",1),prefs.getInt("grid_pattern",0),
    prefs.getBoolean("grid_minor_labels",false));
 }
 private void gridAppearance() {
  SharedPreferences prefs=getPreferences(0);
  LinearLayout form=coordinateForm();
  form.addView(coordinateCaption("Плотность линий"));
  Spinner density=gridChoice(form,"Плотность линий",new String[]{"Редкая","Обычная","Плотная"},prefs.getInt("grid_density",1));
  form.addView(coordinateCaption("Стиль линий"));
  Spinner pattern=gridChoice(form,"Стиль линий",new String[]{"По типу сетки","Сплошные","Штриховые"},prefs.getInt("grid_pattern",0));
  CheckBox labels=new CheckBox(this);
  labels.setText("Отобразить надписи на вспомогательных линиях");
  labels.setChecked(prefs.getBoolean("grid_minor_labels",false));
  form.addView(labels);
  ScrollView viewport=new ScrollView(this);
  viewport.addView(form);
  WorkspaceUi.showDialog(this,new AlertDialog.Builder(this).setTitle("Вид координатных сеток")
   .setView(viewport).setPositiveButton("Сохранить",(dialog,which)->{
     prefs.edit().putInt("grid_density",density.getSelectedItemPosition())
       .putInt("grid_pattern",pattern.getSelectedItemPosition())
       .putBoolean("grid_minor_labels",labels.isChecked()).apply();
     applyGridAppearance();
   }).setNegativeButton("Отмена",null));
 }
 private Spinner gridChoice(LinearLayout form,String label,String[] choices,int selected) {
  Spinner spinner=new Spinner(this);
  spinner.setContentDescription(label);
  ArrayAdapter<String> adapter=new ArrayAdapter<>(this,android.R.layout.simple_spinner_item,choices);
  adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
  spinner.setAdapter(adapter);
  spinner.setSelection(Math.max(0,Math.min(choices.length-1,selected)));
  form.addView(spinner);
  return spinner;
 }

 private void displayUnits() {
  LinearLayout form=coordinateForm();
  form.addView(coordinateCaption("Формат расстояния"));
  Spinner distances=gridChoice(form,"Формат расстояния",DisplayUnits.DISTANCE,DisplayUnits.distanceMode(this));
  form.addView(coordinateCaption("Азимут"));
  Spinner bearings=gridChoice(form,"Азимут",DisplayUnits.BEARING,DisplayUnits.bearingMode(this));
  form.addView(coordinateCaption("Формат площади"));
  Spinner areas=gridChoice(form,"Формат площади",DisplayUnits.AREA,DisplayUnits.areaMode(this));
  form.addView(coordinateCaption("Уклон"));
  Spinner slopes=gridChoice(form,"Уклон",DisplayUnits.SLOPE,DisplayUnits.slopeMode(this));
  form.addView(coordinateCaption("Направление на север"));
  Spinner north=gridChoice(form,"Направление на север",NorthReference.NAMES,DisplayUnits.northMode(this));
  ScrollView scroll=new ScrollView(this);
  scroll.addView(form);
  WorkspaceUi.showDialog(this,new AlertDialog.Builder(this).setTitle("Единицы измерения")
    .setView(scroll).setPositiveButton("Сохранить",(dialog,which)->{
     DisplayUnits.prefs(this).edit().putInt("distance",distances.getSelectedItemPosition())
       .putInt("bearing",bearings.getSelectedItemPosition()).putInt("area",areas.getSelectedItemPosition())
       .putInt("slope",slopes.getSelectedItemPosition()).putInt("north",north.getSelectedItemPosition()).apply();
     refreshCoordinates();
     map.invalidate();
     refreshCompassPanel();
    }).setNegativeButton("Отмена",null));
 }
 private void tileDetail(){
  SharedPreferences prefs=getPreferences(0);
  int selected=Math.max(0,Math.min(2,prefs.getInt("map_tile_detail",0)+1));
  WorkspaceUi.showDialog(this,new AlertDialog.Builder(this).setTitle("Уровень детализации")
   .setSingleChoiceItems(new String[]{"Уменьшенная детализация","Стандартная детализация","Повышенная детализация"},selected,(dialog,index)->{
     changeTileDetail(index-1);
     dialog.dismiss();
   }).setNegativeButton("Отмена",null));
 }
 private void changeTileDetail(int detail){
  int normalized=Math.max(-1,Math.min(1,detail));
  getPreferences(0).edit().putInt("map_tile_detail",normalized).apply();
  map.setTileDetail(normalized);
 }

 @Override public boolean dispatchKeyEvent(KeyEvent event){
  int key=event.getKeyCode();
  if((key==KeyEvent.KEYCODE_VOLUME_UP||key==KeyEvent.KEYCODE_VOLUME_DOWN)
      &&map!=null&&!busy&&!mapInputLocked&&getPreferences(0).getBoolean("zoom_volume",false)){
   if(event.getAction()==KeyEvent.ACTION_DOWN)map.step(key==KeyEvent.KEYCODE_VOLUME_UP?1:-1);
   return true;
  }
  return super.dispatchKeyEvent(event);
 }

 private void mapAppearance(){
  SharedPreferences prefs=getPreferences(0);
  LinearLayout form=coordinateForm();
  form.addView(coordinateCaption("Размер статус-панелей"));
  Spinner size=gridChoice(form,"Размер статус-панелей",new String[]{"Обычный","Средний","Крупный"},prefs.getInt("map_panel_size",0));
  form.addView(coordinateCaption("Цвет фона"));
  Spinner color=gridChoice(form,"Цвет фона",new String[]{"Синий","Светлый","Тёмный"},prefs.getInt("map_panel_color",0));
  CheckBox borders=new CheckBox(this),shadows=new CheckBox(this);
  borders.setText("Контуры меток");borders.setChecked(prefs.getBoolean("map_marker_borders",true));form.addView(borders);
  shadows.setText("Тени от меток");shadows.setChecked(prefs.getBoolean("map_marker_shadows",false));form.addView(shadows);
  ScrollView scroll=new ScrollView(this);scroll.addView(form);
  WorkspaceUi.showDialog(this,new AlertDialog.Builder(this).setTitle("Стиль статус-панелей")
   .setView(scroll).setPositiveButton("Сохранить",(dialog,which)->{
    prefs.edit().putInt("map_panel_size",size.getSelectedItemPosition()).putInt("map_panel_color",color.getSelectedItemPosition())
       .putBoolean("map_marker_borders",borders.isChecked()).putBoolean("map_marker_shadows",shadows.isChecked()).apply();
    applyMapAppearance();
   }).setNegativeButton("Отмена",null));
 }
 private android.graphics.drawable.Drawable statusBackground(int theme){
  if(theme==0)return MapHud.panel(this);
  return WorkspaceUi.panel(this,theme==1?0xf2eaf5ff:0xf2151b22,theme==1?0xff5b86a7:0xff708497,6);
 }
 private void applyMapAppearance(){
  SharedPreferences prefs=getPreferences(0);
  int theme=prefs.getInt("map_panel_color",0);
  int size=11+2*Math.max(0,Math.min(2,prefs.getInt("map_panel_size",0)));
  int ink=theme==1?WorkspaceUi.TEXT:MapHud.INK;
  for(TextView view:new TextView[]{coordinates,scaleValue,status}){
   view.setBackground(statusBackground(theme));
   view.setTextColor(ink);
   view.setTextSize(size);
  }
  mapScale.setAppearance(size-1,ink,statusBackground(theme));
  compassPanel.setBackground(statusBackground(theme));
  compassArrow.setTextColor(ink);
  compassCourse.setTextColor(ink);
  compassCourse.setTextSize(size+1);
  map.setMarkerAppearance(prefs.getBoolean("map_marker_borders",true),prefs.getBoolean("map_marker_shadows",false));
 }
 private void screenOptions() {
  SharedPreferences preferences = getPreferences(0);
  String[] titles = {"Скрыть строку состояния", "Режим погружения", "Экран всегда включён", "Подтверждать выход", "На заблокированном экране"};
  boolean[] selected = new boolean[titles.length];
  for (int i=0; i<selected.length; i++) selected[i] = preferences.getBoolean(MAP_SCREEN_KEYS[i], false);
  AlertDialog settings = new AlertDialog.Builder(this).setTitle("Экран карты")
    .setMultiChoiceItems(titles, selected, (dialog, index, enabled) ->
      preferences.edit().putBoolean(MAP_SCREEN_KEYS[index], enabled).apply())
    .setPositiveButton("Закрыть", null).create();
  settings.setOnDismissListener(dialog -> applyMapScreenOptions(false));
  WorkspaceUi.showDialog(this, settings);
 }

 private void applyMapScreenOptions(boolean mainMenuOpen) {
  SharedPreferences preferences = getPreferences(0);
  Window window = getWindow();
  boolean showLocked=preferences.getBoolean(MAP_SCREEN_KEYS[4],false);
  if(showLocked)window.addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);
  else window.clearFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);
  int keepAwake = WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON;
  if (preferences.getBoolean(MAP_SCREEN_KEYS[2], false)) window.addFlags(keepAwake);
  else window.clearFlags(keepAwake);

  int mask = View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
    | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
  int flags = window.getDecorView().getSystemUiVisibility() & ~mask;
  if (!mainMenuOpen && preferences.getBoolean(MAP_SCREEN_KEYS[0], false)) {
   flags |= View.SYSTEM_UI_FLAG_FULLSCREEN;
   if (preferences.getBoolean(MAP_SCREEN_KEYS[1], false))
    flags |= View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
  }
  window.getDecorView().setSystemUiVisibility(flags);
 }
 private void compositionFont(View view){WorkspaceUi.applyFont(this,view);}
 private void mapsMenu(){
  boolean cacheOnly=!OnlineMapSettings.network(this);
  menu("Карты",item("Доступные карты",this::openMapCatalog),item("Карты на экране",()->openMapLayers(false)),
    item("Избранные карты и наборы карт",()->openMapLayers(true)),
    item("Подложка",this::chooseMap),
    WorkspaceUi.Item.toggle("Масштаб карты",scaleValue.getVisibility()==View.VISIBLE,
      ()->showScaleValue(scaleValue.getVisibility()!=View.VISIBLE)),
    WorkspaceUi.Item.toggle("Использовать только сохранённый кэш карты",cacheOnly,()->setCacheOnly(!cacheOnly)),
    item("Сохранить участок карты",this::saveMapArea),
    item("Кеш / онлайн",this::onlineSettings),
    item("Экспорт кеша MBTiles",()->{if(canLeave()){refreshMapOnResume=true;startActivity(new Intent(this,CacheExportActivity.class).putExtra("project",projectId));}}));
 }
 private void openMapCatalog(){
  if(!canLeave())return;
  refreshMapOnResume=true;
  startActivityForResult(new Intent(this,MapCatalogActivity.class).putExtra("project",projectId),CATALOG);
 }
 private void openMapLayers(boolean favorites){
  if(!canLeave())return;
  refreshMapOnResume=true;
  Intent intent=new Intent(this,MapLayersActivity.class).putExtra("project",projectId);
  if(favorites)intent.putExtra(MapLayersActivity.OPEN_PRESETS,true);
  startActivityForResult(intent,LAYERS);
 }
 private void setCacheOnly(boolean cacheOnly){
  if(!canLeave())return;
  OnlineMapSettings.setNetwork(this,!cacheOnly);
  show(true);
 }
 private void showScaleValue(boolean visible){
  getPreferences(0).edit().putBoolean("show_scale_value",visible).apply();
  scaleValue.setVisibility(visible?View.VISIBLE:View.GONE);
  if(visible)refreshCoordinates();
 }
 private void marksMenu(){
  menu("Метки",item("Все метки",()->manager(false)),item("Новая метка",()->{
   if(canLeave())editObject(null,"Point");
  }),item("Метки на экране",()->{
   if(canLeave())featureList("Метки на экране",features);
  }),item("Создать",this::newObject),item("Поиск на карте",this::search),item("Все объекты",()->map.fit()));
 }
 private void createCompassPanel(FrameLayout scene,int edge) {
  compassPanel=new LinearLayout(this);
  compassPanel.setOrientation(LinearLayout.VERTICAL);
  compassPanel.setGravity(Gravity.CENTER);
  compassPanel.setBackground(MapHud.panel(this));
  compassArrow=label("↑",20);
  compassCourse=label("—",12);
  for(TextView readout:new TextView[]{compassArrow,compassCourse}){
   readout.setPadding(edge,0,edge,0);
   readout.setTextColor(MapHud.INK);
   compassPanel.addView(readout);
  }
  FrameLayout.LayoutParams position=new FrameLayout.LayoutParams(-2,-2,Gravity.TOP|Gravity.RIGHT);
  position.setMargins(0,edge,edge,0);
  scene.addView(compassPanel,position);
  refreshCompassPanel();
  syncCompass();
 }
 private void toggleMapCompass(){
  SharedPreferences prefs=getPreferences(0);
  prefs.edit().putBoolean("show_map_compass",!prefs.getBoolean("show_map_compass",false)).apply();
  syncCompass();
 }
 private void syncCompass(){
  boolean show=getPreferences(0).getBoolean("show_map_compass",false);
  if(compassPanel!=null)compassPanel.setVisibility(show?View.VISIBLE:View.GONE);
  boolean rotate=getPreferences(0).getBoolean("rotate_map_compass",false);
  if(map!=null)map.setCompassRotation(rotate,compassHeading);
  if(mapForeground&&(show||rotate))mapCompass.start();
  else{
   mapCompass.stop();
   displayCompassReading(Double.NaN,0,"компас на карте выключен");
  }
 }
 private void displayCompassReading(double heading,int accuracy,String reason){
  compassHeading=heading;
  if(map!=null&&getPreferences(0).getBoolean("rotate_map_compass",false)&&!Double.isNaN(heading))
   map.setBearing(heading);
  compassReason=reason;
  headingAccuracy=accuracy;
  refreshCompassPanel();
 }
 private NorthReference.Reading selectedHeading(){
  double[] viewport=map==null?null:map.viewport();
  return northReference.at(compassHeading,DisplayUnits.northMode(this),
    viewport==null?Double.NaN:MapMath.lat(viewport[1]),viewport==null?Double.NaN:MapMath.lon(viewport[0]));
 }
 private String compassStatus(){
  if(Double.isNaN(compassHeading))return compassReason;
  NorthReference.Reading reading=selectedHeading();
  return reading.label+": "+DisplayUnits.bearing(reading.degrees,DisplayUnits.bearingMode(this))
    +(headingAccuracy==android.hardware.SensorManager.SENSOR_STATUS_UNRELIABLE?" · нужна калибровка":"");
 }
 private void openCompass(){
  Intent intent=new Intent(this,CompassActivity.class);
  if(map!=null){
   double[] viewport=map.viewport();
   intent.putExtra("map_lat",MapMath.lat(viewport[1])).putExtra("map_lon",MapMath.lon(viewport[0]));
  }
  startActivity(intent);
 }
 private void refreshCompassPanel(){
  if(compassPanel==null)return;
  boolean available=!Double.isNaN(compassHeading);
  int format=getPreferences(0).getInt("map_compass_course",0);
  compassArrow.setVisibility(available&&format!=2?View.VISIBLE:View.GONE);
  double selected=available?selectedHeading().degrees:0;
  compassArrow.setRotation((float)-selected);
  compassCourse.setVisibility(!available||format!=1?View.VISIBLE:View.GONE);
  compassCourse.setText(available?DisplayUnits.bearing(selected,DisplayUnits.bearingMode(this)):"—");
  compassPanel.setContentDescription("Компас на карте · "+compassStatus());
 }
 private void showCompassStatus(){
  WorkspaceUi.showDialog(this,new AlertDialog.Builder(this).setTitle("Статус компаса")
    .setMessage(compassStatus()).setPositiveButton("Закрыть",null));
 }
 private void selectCompassDisplay(){
  SharedPreferences prefs=getPreferences(0);
  WorkspaceUi.showDialog(this,new AlertDialog.Builder(this).setTitle("Курс по компасу")
    .setSingleChoiceItems(new String[]{"Стрелка и азимут","Только стрелка","Только азимут"},prefs.getInt("map_compass_course",0),(dialog,index)->{
     prefs.edit().putInt("map_compass_course",index).apply();
     refreshCompassPanel();
     dialog.dismiss();
    }).setNegativeButton("Отмена",null));
 }
 private void togglePitch(){
  SharedPreferences prefs=getPreferences(0);
  boolean enabled=!prefs.getBoolean("map_pitch",false);
  prefs.edit().putBoolean("map_pitch",enabled).apply();
  map.setPitchEnabled(enabled);
 }
 private void toggleTouchRotation(){
  SharedPreferences prefs=getPreferences(0);
  boolean enabled=!prefs.getBoolean("rotate_map_touch",false);
  prefs.edit().putBoolean("rotate_map_touch",enabled).apply();
  map.setManualRotation(enabled);
 }
 private void toggleCompassRotation() {
  SharedPreferences prefs=getPreferences(0);
  prefs.edit().putBoolean("rotate_map_compass",!prefs.getBoolean("rotate_map_compass",false)).apply();
  syncCompass();
 }
 private void showBarometer(){
  barometer=new BarometerDialog(this);
  barometer.show();
 }
 private void orientationMenu(){menu("Ориентирование",item("Компас",this::openCompass),
    WorkspaceUi.Item.toggle("Показать компас",getPreferences(0).getBoolean("show_map_compass",false),this::toggleMapCompass),
    WorkspaceUi.Item.toggle("Вращать карту по компасу",getPreferences(0).getBoolean("rotate_map_compass",false),this::toggleCompassRotation),
    WorkspaceUi.Item.toggle("Поворот карты жестом",getPreferences(0).getBoolean("rotate_map_touch",false),this::toggleTouchRotation),
    WorkspaceUi.Item.toggle("Перспективный вид карты",getPreferences(0).getBoolean("map_pitch",false),this::togglePitch),
    item("Статус компаса",this::showCompassStatus),item("Курс по компасу",this::selectCompassDisplay),item("Барометр",this::showBarometer),item("Перейти к координатам",()->goToCoordinates()),item("Форматы координат",()->coordinateOptions()),item("DEM / высота центра",()->{if(canLeave())startActivityForResult(new Intent(this,DemActivity.class).putExtra("project",projectId),DEM);}),item("Показать область DEM",()->showDemCoverage()));}
 private void showDemCoverage(){if(!canLeave()||map==null||!canMoveMap())return;try{double[] view;synchronized(LocalRasterStore.class){ProjectStore store=new ProjectStore(this);try{if(!store.exists(projectId))throw new IOException("Проект удалён");}finally{store.close();}try(HgtRaster owned=HgtRaster.owned(DemActivity.file(this,projectId),projectId)){view=owned.mapViewport(map.getWidth(),map.getHeight());}}map.restore(view[0],view[1],view[2]);saveView();}catch(IOException e){error("Область DEM недоступна: "+e.getMessage());}}
 private void manager(boolean all){if(!canLeave())return;refreshOnResume=true;if(!all){ObjectManagerActivity.open(this,projectId);return;}getSharedPreferences("org.rabochaya.projects.ProjectsActivity",0).edit().putLong("project",all?-1:projectId).putString("folder","").commit();startActivity(new Intent().setClassName(this,"org.rabochaya.projects.ProjectsActivity"));}
 private String namedMapStatus, anonymousMapStatus;
 private String normalMapStatus(){
  return getPreferences(0).getBoolean("show_map_name",true)?namedMapStatus:anonymousMapStatus;
 }
 private void setupMapStatus(TileSource source,MapComposition composition,String compositionError,int edge){
  String objects=features.size()+" видимых объектов";
  String title, detail;
  LinkedHashSet<String> credits=new LinkedHashSet<>();
  if(composition!=null){
   ArrayList<String> names=new ArrayList<>();
   for(MapComposition.Layer layer:composition.layers){
    if(!layer.visible||layer.opacity<=0)continue;
    names.add(layer.name);
    TileSource raster=layer.source();
    if(raster!=null&&!raster.attribution.isEmpty())credits.add(raster.attribution);
   }
   detail="Композиция: "+names.size()+" слоёв · "+objects;
   title=names.isEmpty()?detail+" · без подложки":detail+"\n"+android.text.TextUtils.join(" · ",names);
  }else {
   detail=objects;
   if(source==null)title=(mapFile().isFile()?"Локальная карта MBTiles":"Обзорная карта")+" · "+detail;
   else {
    String connection=OnlineMapSettings.network(this)&&!source.cacheOnly()?"онлайн + кеш":"только кеш";
    detail=connection+" · "+detail;
    title=source.name+" · "+detail;
    if(!source.attribution.isEmpty())credits.add(source.attribution);
   }
  }
  String suffix=compositionError.isEmpty()?"":"\n"+compositionError;
  for(String credit:credits)suffix+="\n"+credit;
  namedMapStatus=title+suffix;
  anonymousMapStatus=detail+suffix;
  status=label(normalMapStatus(),11);
  status.setBackground(MapHud.panel(this));
  status.setTextColor(MapHud.INK);
  status.setPadding(edge*2,edge,edge*2,edge);
  status.setIncludeFontPadding(false);
  if(composition!=null){
   status.setMaxLines(3);
   status.setEllipsize(android.text.TextUtils.TruncateAt.END);
   status.setContentDescription("Состав и подписи карт");
   status.setOnClickListener(view->{
    AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Состав и подписи карт")
      .setMessage(namedMapStatus).setPositiveButton("Закрыть",null).create();
    dialog.setOnShowListener(shown->compositionFont(dialog.getWindow().getDecorView()));
    dialog.show();
   });
  }
 }
 private static final int[] TARGET_COLORS={0xffffb438,0xff7edbff,0xffff7180,0xffb4e88b};

 private String targetKey(){return "target_"+projectId;}

 private void setTarget(double lat,double lon){
  getPreferences(0).edit().putLong(targetKey()+"_lat",Double.doubleToLongBits(lat))
      .putLong(targetKey()+"_lon",Double.doubleToLongBits(lon)).apply();
  applyTarget();
 }

 private void targetMenu(){
  SharedPreferences prefs=getPreferences(0);
  List<WorkspaceUi.Item> options=new ArrayList<>();
  options.add(WorkspaceUi.Item.toggle("Статус цели",prefs.getBoolean("show_target_status",true),
      ()->toggleTargetOption("show_target_status",true)));
  options.add(WorkspaceUi.Item.toggle("Линия до цели",prefs.getBoolean("show_target_line",true),
      ()->toggleTargetOption("show_target_line",true)));
  options.add(item("Цвет цели",this::targetColor));
  if(localTarget!=null)options.add(item("Убрать цель",()->{
   prefs.edit().remove(targetKey()+"_lat").remove(targetKey()+"_lon").apply();
   applyTarget();
  }));
  menu("Цель на карте",options.toArray(new WorkspaceUi.Item[0]));
 }

 private void toggleTargetOption(String key,boolean defaultValue){
  SharedPreferences prefs=getPreferences(0);
  prefs.edit().putBoolean(key,!prefs.getBoolean(key,defaultValue)).apply();
  applyTarget();
 }

 private void targetColor(){
  SharedPreferences prefs=getPreferences(0);
  WorkspaceUi.showDialog(this,new AlertDialog.Builder(this).setTitle("Цвет цели")
      .setSingleChoiceItems(new String[]{"Янтарный","Голубой","Коралловый","Салатовый"},
          targetColorIndex(prefs),(dialog,index)->{
           prefs.edit().putInt("target_color",index).apply();
           dialog.dismiss();
           applyTarget();
          }).setNegativeButton("Отмена",null));
 }

 private int targetColorIndex(SharedPreferences prefs){
  return Math.max(0,Math.min(TARGET_COLORS.length-1,prefs.getInt("target_color",0)));
 }

 private void applyTarget(){
  SharedPreferences prefs=getPreferences(0);
  String key=targetKey();
  localTarget=null;
  if(prefs.contains(key+"_lat")&&prefs.contains(key+"_lon")){
   double lat=Double.longBitsToDouble(prefs.getLong(key+"_lat",0));
   double lon=Double.longBitsToDouble(prefs.getLong(key+"_lon",0));
   if(Math.abs(lat)<=90&&Math.abs(lon)<=180)localTarget=new double[]{lon,lat};
  }
  map.setLocalTarget(localTarget,prefs.getBoolean("show_target_line",true),TARGET_COLORS[targetColorIndex(prefs)]);
  targetStatus.setVisibility(localTarget!=null&&prefs.getBoolean("show_target_status",true)?View.VISIBLE:View.GONE);
  double[] viewport=map.viewport();
  refreshTargetDistance(MapMath.lat(viewport[1]),MapMath.lon(viewport[0]));
 }

 private void refreshTargetDistance(double lat,double lon){
  if(localTarget==null||targetStatus==null||targetStatus.getVisibility()!=View.VISIBLE)return;
  String text="До цели от центра: "+DisplayUnits.distance(
      DemProfile.metres(lon,lat,localTarget[0],localTarget[1]),DisplayUnits.distanceMode(this));
  if(!text.contentEquals(targetStatus.getText()))targetStatus.setText(text);
 }

 private void display(){
  SharedPreferences preferences = getPreferences(0);
  String[] options = {"Координаты центра", "Кнопки масштаба", "Масштабная линейка", "Названия меток", "Название карты", "Координатная сетка", "Доп. координатная сетка", "Круговая масштабная линейка"};
  String[] keys = {"show_coordinates", "show_zoom", "show_scale_bar", "show_labels", "show_map_name", "show_geographic_grid", "show_secondary_grid", "show_radius_ruler"};
  boolean[] checked = new boolean[options.length];
  for (int i = 0; i < keys.length; i++) checked[i] = preferences.getBoolean(keys[i], i < 5);
  AlertDialog.Builder displayDialog=new AlertDialog.Builder(this).setTitle("Информеры")
    .setMultiChoiceItems(options, checked, (dialog, item, visible) -> {
     int visibility = visible ? View.VISIBLE : View.GONE;
     String previousStatus=normalMapStatus();
     preferences.edit().putBoolean(keys[item], visible).apply();
     switch (item) {
      case 0:
       coordinates.setVisibility(visibility);
       break;
      case 1:
       zoomButtons.setVisibility(visibility);
       mapDock.layoutControls();
       break;
      case 2:
       mapScale.setVisibility(visibility);
       break;
      case 3:
       map.setLabelsVisible(visible);
       break;
      case 4:
       if(previousStatus.contentEquals(status.getText()))status.setText(normalMapStatus());
       break;
      case 5:
       map.setGeographicGridVisible(visible);
       break;
      case 6:
       map.setSecondaryGridVisible(visible);
       break;
      case 7:
       map.setRadiusRulerVisible(visible);
       break;
      default:
       throw new IllegalArgumentException("Unknown map display option " + item);
     }
    })
    .setNeutralButton("Координаты",(dialog, item)->coordinateOptions())
    .setPositiveButton("Закрыть",null);
  WorkspaceUi.showDialog(this,displayDialog);
 }
 private void newProject(){if(!canLeave())return;final EditText name=new EditText(this);name.setTextColor(0xff202020);name.setBackgroundColor(-1);final AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Новый проект").setView(name).setPositiveButton("Создать",null).setNegativeButton("Отмена",null).create();dialog.setOnShowListener(d->dialog.getButton(-1).setOnClickListener(v->{String title=name.getText().toString().trim();if(title.isEmpty()||title.length()>1000){name.setError("Название: от 1 до 1000 символов");return;}busy=true;dialog.dismiss();worker.execute(()->{try{final long id=ProjectSession.create(this,title);runOnUiThread(()->{if(!disposed){LocalMapActivity.open(this,id);finish();}});}catch(final Exception e){runOnUiThread(()->{if(!disposed){busy=false;error("Не удалось создать проект: "+e.getMessage());}});}});}));dialog.show();}
 private TextView coordinateCaption(String text){TextView label=new TextView(this);label.setText(text);label.setTextColor(0xff202020);label.setTypeface(WorkspaceUi.font(this));return label;}
 private Spinner coordinateSpinner(LinearLayout form,int selected,String description){
  Spinner spinner=new Spinner(this);spinner.setContentDescription(description);
  ArrayAdapter<String> adapter=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item,Coordinates.names());adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);spinner.setAdapter(adapter);spinner.setSelection(selected);form.addView(spinner,new LinearLayout.LayoutParams(-1,-2));return spinner;
 }
 private LinearLayout coordinateForm(){LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);int pad=WorkspaceUi.dp(this,16);form.setPadding(pad,pad,pad,pad);form.setBackgroundColor(-1);return form;}
 private void refreshCoordinates(){if(map!=null){double[] v=map.viewport();center(MapMath.lat(v[1]),MapMath.lon(v[0]),v[2]);}}
 private void coordinateOptions(){
  LinearLayout form=coordinateForm();form.addView(coordinateCaption("Основной формат"));final Spinner primary=coordinateSpinner(form,CoordinateSettings.primary(this),"Основной формат координат");form.addView(coordinateCaption("Дополнительный формат"));final Spinner secondary=coordinateSpinner(form,CoordinateSettings.secondary(this),"Дополнительный формат координат");final CheckBox enabled=new CheckBox(this);enabled.setText("Показывать дополнительные координаты");enabled.setTextColor(0xff202020);enabled.setTypeface(WorkspaceUi.font(this));enabled.setChecked(CoordinateSettings.prefs(this).getBoolean("show_secondary",true));form.addView(enabled);
  ScrollView scroll=new ScrollView(this);scroll.addView(form);new AlertDialog.Builder(this).setTitle("Координаты центра карты").setView(scroll).setPositiveButton("Сохранить",(d,w)->{CoordinateSettings.prefs(this).edit().putInt("primary",primary.getSelectedItemPosition()).putInt("secondary",secondary.getSelectedItemPosition()).putBoolean("show_secondary",enabled.isChecked()).commit();map.setGridFormats(CoordinateSettings.primary(this),CoordinateSettings.secondary(this));refreshCoordinates();}).setNegativeButton("Отмена",null).setNeutralButton("Копировать",(d,w)->{if(map!=null){double[] v=map.viewport();android.content.ClipboardManager clipboard=(android.content.ClipboardManager)getSystemService(CLIPBOARD_SERVICE);if(clipboard!=null){int selected=primary.getSelectedItemPosition();double lat=MapMath.lat(v[1]),lon=MapMath.lon(v[0]);String text=Coordinates.name(selected)+": "+CoordinateSettings.display(lat,lon,selected);if(enabled.isChecked()){int second=secondary.getSelectedItemPosition();text+="\n"+Coordinates.name(second)+": "+CoordinateSettings.display(lat,lon,second);}clipboard.setPrimaryClip(ClipData.newPlainText("Координаты центра карты",text));Toast.makeText(this,"Координаты скопированы",Toast.LENGTH_SHORT).show();}}}).show();
 }
 private void goToCoordinates(){
  if(!canLeave()||!canMoveMap())return;LinearLayout form=coordinateForm();form.addView(coordinateCaption("Формат ввода"));final Spinner format=coordinateSpinner(form,CoordinateSettings.primary(this),"Формат ввода координат");final EditText input=new EditText(this);input.setTextColor(0xff202020);input.setBackgroundColor(-1);input.setTypeface(WorkspaceUi.font(this));input.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE);input.setMinLines(2);form.addView(input,new LinearLayout.LayoutParams(-1,-2));final TextView hint=coordinateCaption("");form.addView(hint);
  format.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> parent){}public void onItemSelected(AdapterView<?> parent,View view,int position,long id){input.setText("");input.setError(null);if(position==Coordinates.DD)hint.setText("Широта долгота: 55.75 37.6");else if(position==Coordinates.DM)hint.setText("Широта; долгота: 55°45′ N; 37°36′ E");else if(position==Coordinates.DMS)hint.setText("Широта; долгота: 55°45′00″ N; 37°36′00″ E");else if(position==Coordinates.UTM)hint.setText("Зона, полушарие N/S, Easting, Northing (метры): 37 N 410000 6170000");else hint.setText("MGRS WGS 84: зона, широтный пояс, квадрат и уточнение E/N. Пример: 15S WC 80817 51205. Переход к центру ячейки.");}});
  ScrollView scroll=new ScrollView(this);scroll.addView(form);final AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Перейти к координатам").setView(scroll).setPositiveButton("Перейти",null).setNegativeButton("Отмена",null).create();dialog.setOnShowListener(d->dialog.getButton(-1).setOnClickListener(v->{try{Coordinates.Position position=Coordinates.parse(input.getText().toString(),format.getSelectedItemPosition());if(Math.abs(position.lat)>85.05112878)throw new IllegalArgumentException("Эта карта отображает широты до ±85.05112878°");double[] viewport=map.viewport();map.restore(MapMath.x(position.lon),MapMath.y(position.lat),viewport[2]);dialog.dismiss();}catch(IllegalArgumentException e){input.setError(e.getMessage());}}));dialog.show();
 }
 private void search(){if(!canLeave())return;final EditText query=new EditText(this);query.setTextColor(0xff202020);query.setBackgroundColor(-1);final AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Поиск на карте").setMessage("Название среди видимых объектов проекта").setView(query).setPositiveButton("Найти",null).setNegativeButton("Отмена",null).create();dialog.setOnShowListener(d->dialog.getButton(-1).setOnClickListener(v->{String text=query.getText().toString().trim().toLowerCase(Locale.ROOT);if(text.isEmpty()){query.setError("Введите название");return;}ArrayList<KmlProject.Feature> found=new ArrayList<>();for(KmlProject.Feature f:features)if(f.name.toLowerCase(Locale.ROOT).contains(text))found.add(f);if(found.isEmpty()){query.setError("Объекты не найдены");return;}dialog.dismiss();featureList("Найденные объекты",found);}));dialog.show();}
 private void featureList(String title,List<KmlProject.Feature> objects){
  AlertDialog.Builder dialog=new AlertDialog.Builder(this).setTitle(title).setNegativeButton("Закрыть",null);
  if(objects.isEmpty())dialog.setMessage("На карте нет видимых объектов");
  else {
   String[] names=new String[objects.size()];
   for(int index=0;index<names.length;index++)names[index]=objects.get(index).name;
   dialog.setItems(names,(window,index)->{
    KmlProject.Feature feature=objects.get(index);
    if(!mapInputLocked)map.focus(feature);
    picked(feature);
   });
  }
  WorkspaceUi.showDialog(this,dialog);
 }
 private void saveView(){if(map!=null){double[] v=map.viewport();settled(v[0],v[1],v[2]);}}
 public void settled(double x,double y,double zoom){String key="view_"+projectId+"_";getPreferences(0).edit().putString(key+"x",Double.toString(x)).putString(key+"y",Double.toString(y)).putFloat(key+"z",(float)zoom).putFloat(key+"bearing",map==null?0:map.manualBearing()).putFloat(key+"pitch",map==null?0:map.manualPitch()).commit();}
 protected void onResume(){super.onResume();mapForeground=true;syncCompass();if(refreshOnResume&&!busy){refreshOnResume=false;refreshMapOnResume=false;load();}else if(refreshMapOnResume&&!busy){refreshMapOnResume=false;show(true);}if(map!=null)map.suspend(false);}
 protected void onPause(){if(barometer!=null){barometer.dismiss();barometer=null;}mapForeground=false;mapCompass.stop();if(popup!=null)popup.dismiss();saveView();if(map!=null)map.suspend(true);super.onPause();}
 protected void onDestroy(){disposed=true;if(activeEdit!=null)activeEdit.dialog.dismiss();closeDem();if(map!=null)map.close();worker.shutdown();super.onDestroy();}
 private void chooseMap(){if(map!=null&&map.drawingType()!=null){error("Завершите или отмените рисунок");return;}AlertDialog chooser=new AlertDialog.Builder(this).setTitle("Подложка карты").setItems(new String[]{"Онлайн-карта и кеш","Открыть MBTiles","Показать сохранённый MBTiles","Убрать MBTiles","Импорт GeoTIFF","Импорт Ozi (.map + изображение)","Создать рельеф из DEM"},(d,w)->{if(w==0)onlineSettings();else if(w==1)pick();else if(w==2){OnlineMapSettings.use(this,projectId,false);show(true);}else if(w==3)removeMap();else if(w==4)pickTiff();else if(w==5)pickOzi();else confirmHillshade();}).setNegativeButton("Отмена",null).create();chooser.setOnShowListener(dlg->compositionFont(chooser.getWindow().getDecorView()));chooser.show();}
 private void saveMapArea(){
  if(!canLeave())return;
  if(MapCompositionSettings.active(this,projectId)){
   refreshMapOnResume=true;
   Intent intent=new Intent(this,CompositionDownloadActivity.class).putExtra("project",projectId);
   if(map!=null)intent.putExtra("bounds",map.bounds()).putExtra("zoom",map.viewport()[2]);
   startActivity(intent);
  }else if(OnlineMapSettings.active(this,projectId))openOnlineSettings(true);
  else error("Для сохранения участка выберите онлайн-карту или включите состав карт");
 }
 private void onlineSettings(){openOnlineSettings(false);}
 private void openOnlineSettings(boolean area){
  if(!canLeave())return;
  refreshMapOnResume=true;
  Intent intent=new Intent(this,OnlineMapActivity.class).putExtra("project",projectId);
  if(area)intent.putExtra(OnlineMapActivity.OPEN_AREA,true);
  if(map!=null)intent.putExtra("bounds",map.bounds()).putExtra("zoom",map.viewport()[2]);
  startActivity(intent);
 }
 private void pick(){if(map!=null&&map.drawingType()!=null){error("Завершите или отмените рисунок");return;}Intent intent=new Intent(Intent.ACTION_OPEN_DOCUMENT);intent.setType("*/*");intent.addCategory(Intent.CATEGORY_OPENABLE);intent.putExtra(Intent.EXTRA_LOCAL_ONLY,true);startActivityForResult(intent,IMPORT_MAP);}
 private void pickTiff(){if(!canLeave())return;Intent i=new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("*/*").addCategory(Intent.CATEGORY_OPENABLE).putExtra(Intent.EXTRA_LOCAL_ONLY,true);startActivityForResult(i,IMPORT_TIFF);}
 private void pickOzi(){if(!canLeave())return;Intent i=new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("*/*").addCategory(Intent.CATEGORY_OPENABLE).putExtra(Intent.EXTRA_LOCAL_ONLY,true).putExtra(Intent.EXTRA_ALLOW_MULTIPLE,true);startActivityForResult(i,IMPORT_OZI);}
 private String selectedName(Uri uri)throws IOException{if(!"content".equals(uri.getScheme())&&!"file".equals(uri.getScheme()))throw new IOException("Выберите локальные файлы");String name=null;if("content".equals(uri.getScheme()))try(android.database.Cursor cursor=getContentResolver().query(uri,new String[]{android.provider.OpenableColumns.DISPLAY_NAME},null,null,null)){if(cursor!=null&&cursor.moveToFirst())name=cursor.getString(0);}if(name==null&&"file".equals(uri.getScheme()))name=new File(uri.getPath()).getName();if(name==null||name.isEmpty()||name.length()>255||name.indexOf('/')>=0||name.indexOf('\\')>=0)throw new IOException("Не удалось определить имя выбранного файла");return name;}
 private void selectedOzi(Intent intent){if(!canLeave())return;try{ClipData clip=intent.getClipData();if(clip==null||clip.getItemCount()!=2)throw new IOException("Выберите одновременно два файла: .map и его PNG/JPEG/BMP/GIF/OZF2");Uri first=clip.getItemAt(0).getUri(),second=clip.getItemAt(1).getUri();if(first==null||second==null||first.equals(second))throw new IOException("Нужны два разных локальных файла");String firstName=selectedName(first),secondName=selectedName(second);boolean firstMap=firstName.toLowerCase(Locale.ROOT).endsWith(".map"),secondMap=secondName.toLowerCase(Locale.ROOT).endsWith(".map");if(firstMap==secondMap)throw new IOException("Нужны один .map и одно изображение");final Uri calibration=firstMap?first:second,image=firstMap?second:first;final String imageName=firstMap?secondName:firstName;final CheckBox legacy=new CheckBox(this);legacy.setText("Кодировка .map: Windows-1251 (явно)");legacy.setTextColor(0xff202020);legacy.setMinHeight((int)(48*getResources().getDisplayMetrics().density));legacy.setChecked(false);AlertDialog confirm=new AlertDialog.Builder(this).setTitle("Импорт Ozi").setView(legacy).setMessage("Явно выбраны .map и "+imageName+". По умолчанию UTF-8/ASCII; Windows-1251 только по явному выбору ниже. WGS 84 / Latitude–Longitude, affine по минимум 3 точкам, MSF=1, полный PNG/JPEG, raw BMP24/32 (INFO40, без alpha), один полный статический GIF или незашифрованный OZF2. .map до 128 КиБ; GIF до 16 МиБ / 4 млн пикселей, декодирование до 15 секунд, остальные изображения до 512 МиБ. Результат до 512 МиБ / 20 000 тайлов. Только после успешной проверки будет заменён приватный MBTiles этого проекта. Исходные файлы и объекты сохранятся.").setPositiveButton("Импортировать",(d,w)->importOzi(calibration,image,imageName,legacy.isChecked()?OziCalibration.Encoding.WINDOWS1251:OziCalibration.Encoding.UTF8)).setNegativeButton("Отмена",null).create();confirm.setOnShowListener(d->compositionFont(confirm.getWindow().getDecorView()));confirm.show();}catch(Exception e){error(e.getMessage());}}
 private void copyRasterInput(Uri uri,File destination,long limit)throws IOException{try(InputStream in=getContentResolver().openInputStream(uri);FileOutputStream out=new FileOutputStream(destination)){if(in==null)throw new IOException("Не удалось открыть выбранный файл");byte[] buffer=new byte[65536];long count=0;int n;while((n=in.read(buffer))!=-1){if(disposed)throw new IOException("Импорт отменён");if(n>limit-count)throw new IOException("Выбранный файл превышает предел импорта");count+=n;out.write(buffer,0,n);}out.getFD().sync();}}
 private void importOzi(final Uri calibration,final Uri image,final String imageName,final OziCalibration.Encoding encoding){final String expected;try{expected=LocalRasterStore.stamp(mapFile());}catch(IOException e){error(e.getMessage());return;}busy=true;status.setText("Проверка и преобразование Ozi…");worker.execute(()->{File mapSource=null,imageSource=null,prepared=null;String failure=null;double[] bounds=null;try{mapSource=File.createTempFile("ozi-calibration-",".map",getFilesDir());imageSource=File.createTempFile("ozi-image-",".tmp",getFilesDir());copyRasterInput(calibration,mapSource,OziCalibration.MAX_BYTES);copyRasterInput(image,imageSource,OziRaster.MAX_IMAGE);try(OziRaster raster=new OziRaster(mapSource,imageSource,imageName,encoding)){GeoRasterTransform t=raster.transform();bounds=new double[]{t.west,t.south,t.east,t.north};}prepared=File.createTempFile("ozi-map-",".mbtiles",getFilesDir());OziImport.write(mapSource,imageSource,imageName,prepared,(done,total)->{if(disposed)throw new IOException("Импорт отменён");},encoding);try(OfflineTiles checked=new OfflineTiles(prepared)){}synchronized(LocalRasterStore.class){if(disposed)throw new IOException("Импорт отменён");ProjectStore store=new ProjectStore(this);try{store.load(projectId);}finally{store.close();}LocalRasterStore.replace(prepared,mapFile(),expected);prepared=null;}}catch(Exception e){failure=e.getMessage();}finally{if(mapSource!=null)mapSource.delete();if(imageSource!=null)imageSource.delete();if(prepared!=null)prepared.delete();}importFinished(failure,bounds);});}
 private void confirmHillshade(){if(!canLeave())return;final long owner=projectId;try{final String sourceStamp,targetStamp;synchronized(LocalRasterStore.class){if(!DemActivity.file(this,owner).isFile())throw new IOException("Сначала установите DEM этого проекта");try(HgtRaster source=HgtRaster.owned(DemActivity.file(this,owner),owner)){}sourceStamp=LocalRasterStore.stamp(DemActivity.file(this,owner));targetStamp=LocalRasterStore.stamp(mapFile());}AlertDialog confirm=new AlertDialog.Builder(this).setTitle("Создать рельеф DEM").setMessage("Из установленного HGT будет создана серая отмывка: свет с азимута 315°, высота света 45°, без увеличения высот. WGS84, метры SRTM; прозрачные ячейки при NoData. \n\n«Создать» заменит сохранённую локальную карту этого проекта. Исходный DEM, объекты, вложения и кеш сохранятся. До 512 МиБ / 20 000 тайлов. В составе карт локальный слой добавляется явно.").setPositiveButton("Создать",(d,w)->buildHillshade(owner,sourceStamp,targetStamp)).setNegativeButton("Отмена",null).create();confirm.setOnShowListener(d->compositionFont(confirm.getWindow().getDecorView()));confirm.show();}catch(Exception e){error("Рельеф не создан: "+e.getMessage());}}
 private void buildHillshade(final long owner,final String sourceStamp,final String targetStamp){if(busy||disposed||projectId!=owner)return;busy=true;status.setText("Построение рельефа HGT…");worker.execute(()->{File prepared=null;String failure=null;double[] bounds=null;File source=DemActivity.file(this,owner),target=new File(getFilesDir(),"local_basemap_"+owner+".mbtiles");try{synchronized(LocalRasterStore.class){if(disposed||projectId!=owner)throw new IOException("Построение отменено");if(!LocalRasterStore.stamp(source).equals(sourceStamp))throw new IOException("DEM изменён после подтверждения");if(!LocalRasterStore.stamp(target).equals(targetStamp))throw new IOException("Карта изменена после подтверждения");try(HgtRaster dem=HgtRaster.owned(source,owner)){bounds=new double[]{dem.west,dem.south,dem.west+1,dem.south+1};}}prepared=File.createTempFile("hgt-shade-",".mbtiles",getFilesDir());HgtHillshadeImport.write(source,owner,prepared,(done,total)->{if(disposed)throw new IOException("Построение отменено");});try(OfflineTiles checked=new OfflineTiles(prepared)){}synchronized(LocalRasterStore.class){if(disposed||projectId!=owner)throw new IOException("Построение отменено");if(!LocalRasterStore.stamp(source).equals(sourceStamp))throw new IOException("DEM изменён при построении");try(HgtRaster dem=HgtRaster.owned(source,owner)){}ProjectStore store=new ProjectStore(this);try{if(!store.exists(owner))throw new IOException("Проект удалён");}finally{store.close();}LocalRasterStore.replace(prepared,target,targetStamp);prepared=null;}}catch(Exception e){failure=e.getMessage();}finally{if(prepared!=null)prepared.delete();}importFinished(failure,bounds);});}
 private void exportMapSnapshot() {
  if(busy||map==null||pendingMapSnapshot!=null)return;
  View scene=(View)map.getParent();
  int width=scene.getWidth(),height=scene.getHeight();
  if(width<1||height<1){error("Карта ещё открывается");return;}
  double scale=Math.min(1,Math.sqrt(8_000_000d/(width*(double)height)));
  final android.graphics.Bitmap image;
  try{
   image=android.graphics.Bitmap.createBitmap(Math.max(1,(int)(width*scale)),
     Math.max(1,(int)(height*scale)),android.graphics.Bitmap.Config.ARGB_8888);
   android.graphics.Canvas canvas=new android.graphics.Canvas(image);
   canvas.scale((float)scale,(float)scale);
   scene.draw(canvas);
  }catch(RuntimeException|OutOfMemoryError failure){error("Не удалось создать снимок карты");return;}
  busy=true;
  worker.execute(()->{
   File file=null;
   try{
    file=File.createTempFile("map-snapshot-",".png",getCacheDir());
    try(OutputStream output=new FileOutputStream(file)){
     if(!image.compress(android.graphics.Bitmap.CompressFormat.PNG,100,output))
      throw new IOException("Не удалось записать PNG");
    }
    final File ready=file;
    runOnUiThread(()->{
     if(disposed){ready.delete();return;}
     busy=false;
     pendingMapSnapshot=ready.getName();
     Intent intent=new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
       .setType("image/png").putExtra(Intent.EXTRA_TITLE,"Рабочая карта.png");
     try{startActivityForResult(intent,EXPORT_MAP_SNAPSHOT);}
     catch(ActivityNotFoundException failure){pendingMapSnapshot=null;ready.delete();error("Не найден выбор места сохранения");}
    });
   }catch(IOException failure){
    if(file!=null)file.delete();
    runOnUiThread(()->{if(!disposed){busy=false;error(failure.getMessage());}});
   }finally{image.recycle();}
  });
 }

 private void finishMapSnapshot(int result,Intent intent) {
  String name=pendingMapSnapshot;
  pendingMapSnapshot=null;
  if(name==null||!name.matches("map-snapshot-[-0-9]+[.]png"))return;
  File source=new File(getCacheDir(),name);
  if(result!=RESULT_OK||intent==null||intent.getData()==null){source.delete();return;}
  Uri destination=intent.getData();
  if(!"content".equals(destination.getScheme())&&!"file".equals(destination.getScheme())){
   source.delete();error("Выберите файл для снимка");return;
  }
  worker.execute(()->{
   try(InputStream input=new FileInputStream(source);OutputStream output=getContentResolver().openOutputStream(destination,"w")){
    if(output==null)throw new IOException("Не удалось открыть файл снимка");
    byte[] buffer=new byte[65536];
    for(int count;(count=input.read(buffer))!=-1;)output.write(buffer,0,count);
   }catch(IOException|SecurityException failure){
    runOnUiThread(()->{if(!disposed)error("Снимок не сохранён: "+failure.getMessage());});
    return;
   }finally{source.delete();}
   runOnUiThread(()->{if(!disposed)Toast.makeText(this,"Снимок карты сохранён",Toast.LENGTH_SHORT).show();});
  });
 }
 protected void onActivityResult(int request,int result,Intent intent){super.onActivityResult(request,result,intent);if(request==EXPORT_MAP_SNAPSHOT){finishMapSnapshot(result,intent);return;}if(request==DEM){if(result==RESULT_OK)show(true);return;}if(request==LAYERS){refreshMapOnResume=false;if(result==RESULT_OK)show(true);return;}if(request==CATALOG){if(result==RESULT_OK){int action=intent==null?0:intent.getIntExtra(MapCatalogActivity.RESULT_ACTION,0);if(action==MapCatalogActivity.ACTION_SETTINGS)onlineSettings();else if(action==MapCatalogActivity.ACTION_EXPORT){refreshMapOnResume=true;startActivity(new Intent(this,CacheExportActivity.class).putExtra("project",projectId));}else show(true);}return;}if(request==IMPORT_OZI&&result==RESULT_OK&&intent!=null&&!busy){selectedOzi(intent);return;}if(request==IMPORT_TIFF&&result==RESULT_OK&&intent!=null&&intent.getData()!=null&&!busy){final Uri selected=intent.getData();AlertDialog confirm=new AlertDialog.Builder(this).setTitle("Импорт GeoTIFF").setMessage("Локальная копия заменит сохранённый MBTiles этого проекта после успешной проверки. Поддержаны RGB/gray8 strips/tiles: raw или Deflate, EPSG:4326/3857, без DEM. Поворот/скос: raw strips или TIFF tiles. До 512 МиБ/20 000 тайлов. Исходный файл и объекты сохраняются.").setPositiveButton("Импортировать",(d,w)->importMap(selected,true)).setNegativeButton("Отмена",null).create();confirm.setOnShowListener(d->compositionFont(confirm.getWindow().getDecorView()));confirm.show();return;}if(request!=IMPORT_MAP||result!=RESULT_OK||intent==null||intent.getData()==null||busy)return;importMap(intent.getData());}
 private void importMap(final Uri uri){importMap(uri,false);}
 private void importMap(final Uri uri,final boolean tiff){
  if(!"content".equals(uri.getScheme())&&!"file".equals(uri.getScheme())){error("Выберите локальный файл");return;}
  final String expected;try{expected=LocalRasterStore.stamp(mapFile());}catch(IOException e){error(e.getMessage());return;}busy=true;status.setText(tiff?"Преобразование GeoTIFF…":"Копирование и проверка MBTiles…");worker.execute(()->{
   File temp=null,inputTiff=null;String failure=null;double[] rasterBounds=null;
   try {
    temp=File.createTempFile("local-map-import-",".tmp",getFilesDir());
    try(InputStream in=getContentResolver().openInputStream(uri);FileOutputStream out=new FileOutputStream(temp)){
     if(in==null)throw new IOException("Не удалось открыть файл");byte[] buffer=new byte[65536];long count=0;int n;
     while((n=in.read(buffer))!=-1){if(disposed)throw new IOException("Импорт отменён");count+=n;if(count>(tiff?GeoTiffRaster.MAX_FILE:OfflineTiles.MAX_FILE))throw new IOException(tiff?"Предел GeoTIFF — 512 МиБ":"Предел MBTiles — 2 ГиБ");out.write(buffer,0,n);}out.getFD().sync();
    }
    if(tiff){inputTiff=temp;try(GeoTiffRaster bounds=new GeoTiffRaster(inputTiff)){GeoRasterTransform t=bounds.transform;rasterBounds=new double[]{t.west,t.south,t.east,t.north};}temp=File.createTempFile("geotiff-map-",".mbtiles",getFilesDir());GeoTiffImport.write(inputTiff,temp,(done,total)->{if(disposed)throw new IOException("Импорт отменён");});}
    try(OfflineTiles checked=new OfflineTiles(temp)){}
    if(disposed)throw new IOException("Импорт отменён");
    synchronized(LocalRasterStore.class){if(disposed)throw new IOException("Импорт отменён");ProjectStore check=new ProjectStore(this);try{check.load(projectId);}finally{check.close();}LocalRasterStore.replace(temp,mapFile(),expected);temp=null;}
   }catch(Exception e){failure=e.getMessage();}finally{if(temp!=null)temp.delete();if(inputTiff!=null)inputTiff.delete();}
   importFinished(failure,rasterBounds);
  });
 }
 private void importFinished(final String failed,final double[] importedBounds){runOnUiThread(()->{if(disposed)return;busy=false;if(failed!=null){error(failed);status.setText("Карта не заменена: "+failed);}else {warning="";OnlineMapSettings.use(this,projectId,false);show(true);if(importedBounds!=null&&map!=null){final LocalMapView importedView=map;importedView.post(()->{if(!disposed&&map==importedView){double[] fit=GeoRasterTransform.viewport(importedBounds[0],importedBounds[1],importedBounds[2],importedBounds[3],importedView.getWidth(),importedView.getHeight());importedView.restore(fit[0],fit[1],fit[2]);saveView();}});}Toast.makeText(this,importedBounds!=null&&MapCompositionSettings.active(this,projectId)?"Карта сохранена. При необходимости добавьте локальный слой в «Слои карты».":"Локальная карта сохранена",Toast.LENGTH_LONG).show();}});}
 public static void cleanupDeletedProject(final Context context,long project){context.getSharedPreferences("org.rabochaya.projects.LocalMapActivity",0).edit().remove("view_"+project+"_bearing").remove("view_"+project+"_pitch").apply();DemActivity.cleanup(context,project);MapCompositionSettings.removeDeletedProject(context,project);CompositionDownloadSettings.removeDeletedProject(context,project);File file=new File(context.getFilesDir(),"local_basemap_"+project+".mbtiles");if(!LocalRasterStore.remove(file)&&context instanceof Activity)((Activity)context).runOnUiThread(()->Toast.makeText(context,"Проект удалён, но приватную копию карты удалить не удалось",Toast.LENGTH_LONG).show());OnlineMapSettings.prefs(context).edit().remove("project_"+project).commit();String key="view_"+project+"_";context.getSharedPreferences(LocalMapActivity.class.getName(),0).edit().remove(key+"x").remove(key+"y").remove(key+"z").commit();}
 private void removeMap(){if(map!=null&&map.drawingType()!=null){error("Завершите или отмените рисунок");return;}if(!mapFile().isFile()){error("Локальная подложка не выбрана");return;}final String original;try{original=LocalRasterStore.stamp(mapFile());}catch(IOException e){error(e.getMessage());return;}new AlertDialog.Builder(this).setMessage("Удалить приватную копию подложки? Объекты проекта и исходный MBTiles сохранятся.").setPositiveButton("Убрать",(d,w)->{saveView();if(map!=null){map.close();map=null;}try{LocalRasterStore.remove(mapFile(),original);}catch(IOException e){error(e.getMessage());}show(true);}).setNegativeButton("Отмена",null).show();}
 private void closeDem(){if(dem!=null){try{dem.close();}catch(IOException ignored){}dem=null;}}
 public void center(double lat,double lon,double zoom) {
  refreshTargetDistance(lat,lon);
  if(zoomSlider!=null&&!draggingZoomSlider)zoomSlider.setProgress((int)Math.round(zoom*10));
  TextView panel = coordinates;
  if (panel == null) return;
  if (mapScale != null) mapScale.update(lat, zoom);
  if (scaleValue != null && scaleValue.getVisibility()==View.VISIBLE){
   // Use the physical x-axis density, with Android's logical density as fallback.
   android.util.DisplayMetrics metrics=getResources().getDisplayMetrics();
   double dpi=metrics.xdpi>0 && !Float.isInfinite(metrics.xdpi)?metrics.xdpi:metrics.densityDpi;
   double ratio=MapScaleView.metresPerPixel(lat,zoom)*dpi/0.0254;
   String scale=String.format(Locale.US,"1 : %,.0f",Math.max(1,ratio)).replace(',', '\u00a0');
   if(!scale.contentEquals(scaleValue.getText())){
    scaleValue.setText(scale);
    scaleValue.setContentDescription("Масштаб карты: "+scale);
    if(scaleValue.isInLayout())scaleValue.post(scaleValue::requestLayout);
   }
  }
  String text = CoordinateSettings.panel(this, lat, lon, zoom);
  if (dem != null) {
   try {
    double height = dem.height(lon, lat);
    text += Double.isNaN(height) ? "\nDEM: нет данных"
      : "\nDEM: " + String.format(Locale.US, "%.1f", Math.abs(height) < .05 ? 0 : height) + " м · HGT";
   } catch (IOException e) {
    text += "\nDEM недоступен";
   }
  } else {
   text += "\nВысота: —";
  }
  if (text.contentEquals(panel.getText())) return;
  panel.setText(text);
  // The initial viewport is calculated during layout, after the panel was measured.
  if (panel.isInLayout()) panel.post(panel::requestLayout);
 }
 private String cardText(KmlProject.Feature feature){
  StringBuilder text=new StringBuilder();
  String note=android.text.Html.fromHtml(MediaLinks.note(feature.element)).toString();
  if(!note.isEmpty())text.append(note).append("\n\n");
  TrackStatistics track=GpxExchange.statistics(feature.element);
  if(track!=null)appendTrackStatistics(text,track);
  else for(KmlProject.Geometry geometry:feature.shapes){
   if("Point".equals(geometry.type)){
    double[] point=geometry.rings.get(0).get(0);
    text.append("Путевая точка\nШирота: ").append(point[1])
      .append("\nДолгота: ").append(point[0]).append("\nВысота: ").append(point[2]).append(" м\n");
   }else{
    int points=0;
    for(List<double[]> ring:geometry.rings)points+=ring.size();
    String type="Polygon".equals(geometry.type)?"Область":"Путь";
    text.append(type).append("\nТочек: ").append(points).append("\n");
    if("Polygon".equals(geometry.type))text.append("Площадь: ")
      .append(DisplayUnits.area(SurfaceMeasurement.area(geometry.rings),DisplayUnits.areaMode(this))).append("\n");
   }
  }
  if(track==null){
   TrackStatistics kmlTrack=KmlTrackStatistics.read(feature.element);
   if(kmlTrack!=null)appendTrackStatistics(text,kmlTrack);
  }
  return text.append("\nВложения: ").append(MediaLinks.list(feature.element).size()).toString();
 }
 private void appendTrackStatistics(StringBuilder text,TrackStatistics track){
  int mode=DisplayUnits.distanceMode(this);
  text.append("Трек\nСегментов: ").append(track.segments)
      .append("\nТочек: ").append(track.points)
      .append("\nДлина: ").append(DisplayUnits.distance(track.distance,mode)).append('\n');
  if(track.elevationLegs>0)text.append("Набор: ").append(DisplayUnits.elevation(track.gain,mode))
      .append("\nСпуск: ").append(DisplayUnits.elevation(track.loss,mode)).append('\n');
  if(track.timedLegs==0)text.append("Нет последовательных меток времени\n");
  else{
   text.append("Время по меткам: ").append(trackDuration(track.timedMillis))
       .append("\nВремя движения по изменению координат: ").append(trackDuration(track.movingMillis))
       .append("\nИнтервалы с временем: ").append(track.timedLegs).append('/').append(track.legs).append('\n');
  }
 }
 private static String trackDuration(long millis){
  long seconds=millis/1000;
  return String.format(Locale.US,"%d:%02d:%02d",seconds/3600,seconds/60%60,seconds%60);
 }
 public void picked(KmlProject.Feature feature){
  if(busy)return;
  TextView message=label(cardText(feature),16);
  message.setBackgroundColor(MapHud.BAR);
  message.setTextColor(MapHud.INK);
  message.setTextIsSelectable(true);
  LinearLayout content=new LinearLayout(this);
  content.setOrientation(LinearLayout.VERTICAL);
  content.addView(message);
  ScrollView scroll=new ScrollView(this);
  scroll.addView(content);
  String id=feature.element.getAttribute("id");
  AlertDialog card=new AlertDialog.Builder(this).setTitle(feature.name).setView(scroll)
    .setPositiveButton("Закрыть",null).setNeutralButton("Изменить",(dialog,which)->editObject(feature,null))
    .setNegativeButton("Вложения",(dialog,which)->{
     if(!canLeave())return;
     refreshOnResume=true;
     startActivity(new Intent(this,AttachmentsActivity.class).putExtra("project",projectId).putExtra("feature",id));
    }).create();
  content.addView(WorkspaceUi.button(this,"Координаты и контуры",()->{
   if(!canLeave())return;
   card.dismiss();
   refreshOnResume=true;
   GeometryEditorActivity.open(this,projectId,id);
  }));
  WorkspaceUi.showDialog(this,card);
 }
 private void newObject(){if(map!=null&&map.drawingType()!=null){error("Завершите или отмените рисунок");return;}new AlertDialog.Builder(this).setTitle("Создать объект").setItems(new String[]{"Метка","Маршрут","Область","Нарисовать маршрут","Нарисовать область"},(d,w)->{if(w<3)editObject(null,new String[]{"Point","LineString","Polygon"}[w]);else startDrawing(w==3?"LineString":"Polygon");}).setNegativeButton("Отмена",null).show();}
 private void startDrawing(String type){if(map==null)return;if(!canMoveMap())return;map.beginDrawing(type);if(drawingRow!=null)root.removeView(drawingRow);drawingRow=new LinearLayout(this);root.addView(drawingRow,1);button(drawingRow,"В центре",()->map.addDrawingCenter());button(drawingRow,"Шаг назад",()->map.undoDrawing());button(drawingRow,"Записать",()->{try{FeatureEdits.coordinates(drawingCoordinates(),map.drawingType());editObject(null,map.drawingType());}catch(IllegalArgumentException invalid){error(invalid.getMessage());}});button(drawingRow,"Отмена",()->discardDrawing(false));}
 private String drawingCoordinates(){StringBuilder text=new StringBuilder();for(double[] c:map.drawingPoints()){if(text.length()>0)text.append('\n');text.append(c[1]).append(' ').append(c[0]).append(' ').append(c[2]);}return text.toString();}
 public void draftChanged(int count){if(status!=null&&count>=0)status.setText("Рисование: вершин "+count+" · касайтесь карты или добавляйте в центре");}
 private void discardDrawing(boolean leave){new AlertDialog.Builder(this).setMessage("Отменить несохранённый рисунок?").setPositiveButton("Отменить рисунок",(d,w)->{map.cancelDrawing();if(drawingRow!=null){root.removeView(drawingRow);drawingRow=null;}status.setText(normalMapStatus());if(leave)requestMapExit();}).setNegativeButton("Продолжить рисование",null).show();}
 private void requestMapExit() {
  if (!getPreferences(0).getBoolean(MAP_SCREEN_KEYS[3],false)) {
   finish();
   return;
  }
  WorkspaceUi.showDialog(this,new AlertDialog.Builder(this).setMessage("Выйти из приложения?")
    .setPositiveButton("Выйти",(dialog,which)->finish()).setNegativeButton("Отмена",null));
 }
 public void onBackPressed(){if(map!=null&&map.drawingType()!=null)discardDrawing(true);else requestMapExit();}
 protected void onSaveInstanceState(Bundle state){
  state.putBoolean("map_input_locked",mapInputLocked);
  state.putString("pending_map_snapshot",pendingMapSnapshot);
  if(activeEdit!=null&&!busy&&activeEdit.dialog.isShowing())state.putBundle("map_edit",activeEdit.snapshot(projectId));
  else if(pendingEdit!=null)state.putBundle("map_edit",pendingEdit);
  if(map!=null&&map.drawingType()!=null){state.putString("drawing_type",map.drawingType());state.putSerializable("drawing_points",new ArrayList<double[]>(map.drawingPoints()));}super.onSaveInstanceState(state);}

 private EditText field(LinearLayout form,String hint,String value,boolean multiline){
  TextView caption=new TextView(this);caption.setText(hint);caption.setTypeface(WorkspaceUi.font(this));caption.setTextColor(WorkspaceUi.TEXT);form.addView(caption);
  EditText input=new EditText(this);input.setText(value);input.setTextColor(0xff202020);input.setHintTextColor(0xff606060);input.setBackgroundColor(0xffffffff);input.setSingleLine(!multiline);input.setInputType(android.text.InputType.TYPE_CLASS_TEXT|(multiline?android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE:0));input.setTypeface(WorkspaceUi.font(this));form.addView(input,new LinearLayout.LayoutParams(-1,-2));return input;
 }
 private void restoreEditForm(){
  Bundle state=pendingEdit;
  pendingEdit=null;
  if(state==null||state.getLong("project",-1)!=projectId)return;
  String type=state.getString("type"),id=state.getString("id");
  if(id==null){
   if("Point".equals(type)||"LineString".equals(type)||"Polygon".equals(type))editObject(null,type,state);
   return;
  }
  for(KmlProject.Feature feature:features){
   if(id.equals(feature.element.getAttribute("id"))&&ObjectTree.nodeToken(feature.element).equals(state.getString("token"))){
    editObject(feature,null,state);
    return;
   }
  }
  Toast.makeText(this,"Объект изменился. Откройте его заново",Toast.LENGTH_SHORT).show();
 }
 private void editObject(KmlProject.Feature feature,String createType){editObject(feature,createType,null);}
 private void editObject(final KmlProject.Feature feature,final String createType,Bundle state){
  if(busy||map==null)return;
  final boolean point=feature!=null&&feature.shapes.size()==1&&"Point".equals(feature.shapes.get(0).type)&&KmlProject.child(feature.element,"Point")!=null;
  LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);form.setPadding(18,12,18,12);form.setBackgroundColor(0xffedf5fb);
  final EditText name=field(form,"Название",state!=null?state.getString("name",""):feature==null?"":feature.name,false);
  final EditText note=field(form,"Описание",state!=null?state.getString("note",""):feature==null?"":MediaLinks.note(feature.element),true);
  String initial="";
  if(point){double[] c=feature.shapes.get(0).rings.get(0).get(0);initial=c[1]+" "+c[0]+" "+c[2];}
  else if("Point".equals(createType)){double[] v=map.viewport();initial=String.format(Locale.US,"%.8f %.8f",MapMath.lat(v[1]),MapMath.lon(v[0]));}
  if(feature==null&&"Point".equals(createType)&&creationPoint!=null){initial=String.format(Locale.US,"%.8f %.8f",creationPoint[1],creationPoint[0]);creationPoint=null;}
  if(feature==null&&map.drawingType()!=null&&map.drawingType().equals(createType))initial=drawingCoordinates();
  if(state!=null)initial=state.getString("coords","");
  final EditText coords=point||feature==null?field(form,"WGS 84: широта долгота [высота], одна вершина в строке",initial,true):null;
  if(coords!=null)coords.setMinLines(feature==null&&!"Point".equals(createType)?4:2);
  ScrollView scroll=new ScrollView(this);scroll.addView(form);
  final AlertDialog dialog=new AlertDialog.Builder(this).setTitle(feature==null?"Новый объект":"Изменить объект").setView(scroll).setPositiveButton("Сохранить",null).setNegativeButton("Отмена",null).create();
  activeEdit=new EditForm(dialog,feature==null?null:feature.element.getAttribute("id"),createType,
    feature==null?null:ObjectTree.nodeToken(feature.element),name,note,coords);
  dialog.setOnDismissListener(d->{if(activeEdit!=null&&activeEdit.dialog==dialog)activeEdit=null;});
  dialog.setOnShowListener(d->dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v->{
   if(busy)return;
   final String title=name.getText().toString().trim(),description=note.getText().toString();
   if(title.isEmpty()||title.length()>1000){name.setError("Название: от 1 до 1000 символов");return;}
   if(description.length()>100000){note.setError("Описание: до 100 000 символов");return;}
   final List<double[]> points;
   try{points=coords==null?null:FeatureEdits.coordinates(coords.getText().toString(),feature==null?createType:"Point");}
   catch(IllegalArgumentException invalid){coords.setError(invalid.getMessage());return;}
   busy=true;status.setText("Сохранение объекта…");
   dialog.setCancelable(false);
   dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
   dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setEnabled(false);
   worker.execute(()->{ProjectStore store=new ProjectStore(this);try{
    final KmlProject snapshot=ObjectTreeWrites.saveMapFeature(
      store,projectId,feature==null?null:feature.element,createType,title,description,points);
    final List<KmlProject.Feature> updated=snapshot.features(true);
    final KmlSymbolAssets icons=new KmlSymbolAssets(snapshot.root().getOwnerDocument(),snapshot.entry,snapshot.assets);
    runOnUiThread(()->{if(!disposed){dialog.dismiss();if(map!=null&&map.drawingType()!=null)map.cancelDrawing();features=updated;symbolAssets=icons;busy=false;show(true);Toast.makeText(this,"Объект сохранён",Toast.LENGTH_SHORT).show();}});
   }catch(final Exception failure){runOnUiThread(()->{if(!disposed){
    busy=false;
    dialog.setCancelable(true);
    dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(true);
    dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setEnabled(true);
    name.setError("Не удалось сохранить: "+failure.getMessage());
    error("Не удалось сохранить: "+failure.getMessage());
   }});}finally{store.close();}});
  }));dialog.show();
 }
 @Override public void tileError(String message){
  tileIssue=message;
  if(tileNotice!=null)tileNotice.setVisibility(View.VISIBLE);
 }
 public void error(String text){warning=text==null?"Ошибка локальной карты":text;if(status!=null)status.setText(warning);long now=System.currentTimeMillis();if(now-lastError>5000){Toast.makeText(this,warning,Toast.LENGTH_LONG).show();lastError=now;}}
}
