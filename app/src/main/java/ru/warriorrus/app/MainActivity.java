package ru.warriorrus.app;

import android.app.*;
import android.content.ClipData;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.text.*;
import android.view.*;
import android.widget.*;
import java.util.*;
import org.osmdroid.util.GeoPoint;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.explorer.*;
import ru.warriorrus.app.map.*;
import ru.warriorrus.app.geometry.*;
import ru.warriorrus.app.settings.Coordinates;
import ru.warriorrus.app.settings.DisplayUnits;
import ru.warriorrus.app.settings.ProjectionMath;
import ru.warriorrus.app.settings.MainCommands;
import ru.warriorrus.app.settings.SettingsScreen;
import ru.warriorrus.app.exchange.PlacemarkFiles;
import ru.warriorrus.app.exchange.BundleExchange;
import android.content.Intent;
import java.io.*;

/** Touch workspace: persistent map plus Explorer drawer; all mutations go through ObjectStore. */
public final class MainActivity extends Activity {
  private ObjectStore store;
  private ReferenceMenu referenceUi;
  private MainCommands mainCommands;
  private ScreenController screen;
  private MapInfoPanel mapInfo;
  private FrameLayout mapRoot;
  private Dialog categoryDialog;
  private int shownCategory=-1,lastCategory=-1;
  private long lastCategoryTap;
  private String screenshotPath="";
  private ExplorerController explorer;
  private MapWorkspace map;
  private LinearLayout drawer,rows;
  private TextView explorerSubtitle;private Button explorerClipboard,explorerMore,explorerAdd;
  private boolean selectionMode;
  private TextView status;
  private EditText search;
  private boolean refreshing;
  private long dragged;
  private Dialog explorerDialog;
  private TextView coordinates, coordinateSystem, coordinateAdditional;
  private DrawingController drawing;
  private TimelineController timeline;
  private MapTools mapTools;
  private Dialog settingsDialog;
  private static final int IMPORT_FILE = 701, EXPORT_FILE = 702, ATTACH_FILE = 703, IMPORT_MAP = 704, EXPORT_MAP = 705, EXPORT_SCREENSHOT=706;
  private MapCatalog catalog;
  private String exportRasterPath="";
  private Dialog downloadDialog, attachmentsDialog;
  private long attachmentObject;
  private String exportFormat = "kmz";
  private long importParent;
  private ArrayList<Long> exportSelection = new ArrayList<>();
  private boolean cards, displayedOnly, gridEnabled;
  private long selectedPoint;
  private boolean coordinatesCollapsed, mapLayerVisible, rightCollapsed;
  private int mapLayerOpacity;
  private final List<Dialog> openPanels=new ArrayList<>();
  private Dialog menuDialog, layersDialog, mapsDialog, marksDialog, orientationDialog, compassDialog;
  private CompassController compassController;
  private CompassDial compassDial, mapCompass;
  private TextView headingInfo, compassReadout;
  private String objectFilter = "all";


  private final android.os.Handler iconHandler =
      new android.os.Handler(android.os.Looper.getMainLooper());
  private long iconRevision = Long.MIN_VALUE;
  private final Runnable iconPoll =
      new Runnable() {
        public void run() {
          if (map != null) {
            long next = map.iconRevision();
            if (next != iconRevision) {
              iconRevision = next;
              map.refresh(store);
            }
            iconHandler.postDelayed(this, 3000);
          }
        }
      };

  private int dp(int n) {
    return (int) (n * getResources().getDisplayMetrics().density);
  }

  private TextView label(String value, int size) {
    TextView v = new TextView(this);
    v.setText(value);
    v.setTextSize(size);
    v.setTextColor(ReferenceMenu.TEXT);
    v.setPadding(dp(12), dp(10), dp(12), dp(10));
    return v;
  }

  private Button button(String text, Runnable action) {
    Button b = new Button(this);
    b.setText(text);
    b.setTextSize(12);
    b.setMinHeight(dp(48));
    b.setOnClickListener(v -> action.run());
    return b;
  }

  private void run(Runnable action) {
    try {
      action.run();
      refresh();
    } catch (Exception e) {
      new AlertDialog.Builder(this)
          .setTitle("Операция не выполнена")
          .setMessage(e.getMessage())
          .setPositiveButton("ОК", null)
          .show();
    }
  }

  @Override
  public void onCreate(Bundle state) {
    super.onCreate(state);
    referenceUi=new ReferenceMenu(this);mainCommands=new MainCommands(getPreferences(MODE_PRIVATE));
    store = new ObjectStore(this);
    explorer = new ExplorerController(store);
    if(state!=null){explorer.folder=state.getLong("folder");selectionMode=state.getBoolean("explorerSelectionMode");long[] selected=state.getLongArray("explorerSelected");if(selected!=null)for(long id:selected)explorer.selected.add(id);List<Long> clipboard=new ArrayList<>();long[] copied=state.getLongArray("explorerClipboard");if(copied!=null)for(long id:copied)clipboard.add(id);explorer.restoreClipboard(clipboard,state.getBoolean("explorerCut"));}
    map = new MapWorkspace(this, this::longPressMap);
    MapViewport.restore(map.view,getPreferences(MODE_PRIVATE),state);
    FrameLayout root = new FrameLayout(this);mapRoot=root;root.setTag("mapRoot");map.view.setTag("mapCanvas");
    root.setBackgroundColor(0xffd6ecff);
    root.addView(map.view, new FrameLayout.LayoutParams(-1, -1));
    coordinatesCollapsed = getPreferences(MODE_PRIVATE).getBoolean("coordinatesCollapsed", false);
    mapLayerVisible = getPreferences(MODE_PRIVATE).getBoolean("mapLayerVisible", true);
    mapLayerOpacity = getPreferences(MODE_PRIVATE).getInt("mapLayerOpacity", 100);
    map.view.setUseDataConnection(getPreferences(MODE_PRIVATE).getBoolean("mapOnline", true));
    applyMapLayer();

    MapFocusTarget focusTarget=new MapFocusTarget(this,map.view,()->{selectedPoint=0;mapContextMenu((GeoPoint)map.view.getMapCenter());});focusTarget.setTag("mapFocus");root.addView(focusTarget,new FrameLayout.LayoutParams(dp(44),dp(44),Gravity.CENTER));

    LinearLayout coordinatePanel = new LinearLayout(this);
    coordinatePanel.setOrientation(LinearLayout.HORIZONTAL);
    coordinatePanel.setGravity(Gravity.CENTER_VERTICAL);
    coordinatePanel.setBackground(plate());
    coordinatePanel.setTag("coordinatePanel");
    LinearLayout coordinateDetails = new LinearLayout(this);
    coordinateDetails.setOrientation(LinearLayout.VERTICAL);
    coordinateDetails.setTag("coordinateDetails");
    TextView system = hudText("WGS84", 10);
    coordinateSystem = system;
    system.setPadding(dp(8), dp(3), dp(4), 0);
    coordinateDetails.addView(system);
    coordinates = hudText("", 11);
    coordinates.setPadding(dp(8), dp(2), 0, dp(2));
    coordinateDetails.addView(coordinates);
    TextView additional = hudText("", 10);
    coordinateAdditional = additional;
    additional.setPadding(dp(8), 0, 0, dp(3));
    coordinateDetails.addView(additional);
    coordinatePanel.addView(coordinateDetails,new LinearLayout.LayoutParams(-2,-2));
    coordinateSystem.setVisibility(View.GONE);
    coordinates.setSingleLine(true);coordinateAdditional.setSingleLine(true);coordinates.setMaxWidth(Math.max(dp(48),getResources().getDisplayMetrics().widthPixels-dp(64)));coordinateAdditional.setMaxWidth(Math.max(dp(48),getResources().getDisplayMetrics().widthPixels-dp(64)));
    coordinates.setTextSize(12);coordinateAdditional.setTextSize(11);coordinateAdditional.setTextColor(0xff086db3);
    FrameLayout.LayoutParams hud=new FrameLayout.LayoutParams(-2,-2,Gravity.TOP|Gravity.START);hud.setMargins(dp(4),dp(4),dp(56),0);root.addView(coordinatePanel,hud);
    coordinateDetails.setOnClickListener(v->coordinateFormats());
    mapInfo=new MapInfoPanel(this,map.view);FrameLayout.LayoutParams infoPosition=new FrameLayout.LayoutParams(-2,-2,Gravity.TOP|Gravity.START);infoPosition.setMargins(dp(4),dp(55),0,0);root.addView(mapInfo,infoPosition);coordinatePanel.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->positionMapInfo());

    LinearLayout bottomContainer = new LinearLayout(this);
    bottomContainer.setOrientation(LinearLayout.HORIZONTAL);
    bottomContainer.setGravity(Gravity.CENTER_VERTICAL);
    bottomContainer.setTag("bottomPanel");
    bottomContainer.setBackground(plate());
    LinearLayout toolbar = new LinearLayout(this);
    toolbar.setOrientation(LinearLayout.HORIZONTAL);
    toolbar.setTag("bottomToolbar");
    String[] tabNames = {"Меню", "Карты", "Объекты", "Ориентирование"};
    int[] tabIcons = {R.drawable.ui_menu, R.drawable.ui_map, R.drawable.ui_pin, R.drawable.ui_compass};
    for (int i = 0; i < tabNames.length; i++) {
      final int index=i;
      Button tab = iconButton(tabNames[i], tabIcons[i], ()->openCategory(index));
      tab.setTag(tabNames[i]);
      if(i==1)tab.setContentDescription("Карты и слои");
      if(i==2)tab.setContentDescription("Метки");
      final int category=i;
      tab.setOnLongClickListener(v->{if(category==0)runFirstCommand();else if(category==1)catalogMenu();else if(category==2)openExplorer(false);else toggleCompass();return true;});
      tab.setText("");
      ReferenceAssets.apply(tab,tabIcons[i],48);
      tab.setCompoundDrawablePadding(0);
      tab.setPadding(0,0,0,0);
      toolbar.addView(tab, new LinearLayout.LayoutParams(dp(48), dp(48)));
    }
    bottomContainer.addView(toolbar, new LinearLayout.LayoutParams(0, -2, 1));
    FrameLayout.LayoutParams bottom = new FrameLayout.LayoutParams(dp(192), dp(48), Gravity.BOTTOM | Gravity.START);
    bottom.setMargins(dp(3), 0, dp(3), dp(3));
    root.addView(bottomContainer, bottom);
    headingInfo=hudText("",11);headingInfo.setVisibility(View.GONE);coordinateDetails.addView(headingInfo);
    mapCompass=new CompassDial(this);mapCompass.setVisibility(View.GONE);
    FrameLayout.LayoutParams compassPosition=new FrameLayout.LayoutParams(dp(96),dp(96),Gravity.BOTTOM|Gravity.END);compassPosition.setMargins(0,0,dp(8),dp(68));root.addView(mapCompass,compassPosition);
    mapCompass.setOnClickListener(v->showCompass());
    compassController=new CompassController(this,c->updateCompass());

    LinearLayout zoomControls=new LinearLayout(this);zoomControls.setTag("zoomControls");zoomControls.setOrientation(LinearLayout.VERTICAL);
    Button zoomIn=iconButton("Увеличить",R.drawable.ui_plus,()->map.view.getController().zoomIn()),zoomOut=iconButton("Уменьшить",R.drawable.ui_minus,()->map.view.getController().zoomOut());
    for(Button button:new Button[]{zoomIn,zoomOut}){button.setText("");ReferenceAssets.apply(button,button==zoomIn?R.drawable.ui_plus:R.drawable.ui_minus,48);button.setPadding(0,0,0,0);LinearLayout.LayoutParams zoomButton=new LinearLayout.LayoutParams(dp(48),dp(48));if(button==zoomIn)zoomButton.bottomMargin=dp(12);zoomControls.addView(button,zoomButton);}
    FrameLayout.LayoutParams zoomPosition=new FrameLayout.LayoutParams(dp(48),-2,Gravity.END|Gravity.BOTTOM);zoomPosition.setMargins(0,0,dp(3),dp(3));root.addView(zoomControls,zoomPosition);
    TextView attribution = hudText("© OpenStreetMap", 10);
    attribution.setTag("mapAttribution");
    attribution.setBackground(plate());
    FrameLayout.LayoutParams credit = new FrameLayout.LayoutParams(-2, -2, Gravity.BOTTOM | Gravity.END);
    credit.setMargins(0, 0, dp(4), dp(8));
    root.addView(attribution, credit);
    // Keep startup credit readable, then free the map. Licence remains in Maps.
    attribution.postDelayed(() -> attribution.setVisibility(View.GONE), 5000);
    cards = getPreferences(MODE_PRIVATE).getBoolean("explorerCards", false);
    gridEnabled = getPreferences(MODE_PRIVATE).getBoolean("coordinateGrid", false);
    map.showGrid(gridEnabled);
    map.view.addMapListener(
        new org.osmdroid.events.MapListener() {
          public boolean onScroll(org.osmdroid.events.ScrollEvent e) {
            selectedPoint = 0;
            if(drawing!=null)drawing.onMapMoved();
            updateCoordinates();
            return false;
          }

          public boolean onZoom(org.osmdroid.events.ZoomEvent e) {
            updateCoordinates();
            return false;
          }
        });
    map.onPointClick =
        i -> {
          if (drawing != null && drawing.active()) return;
          boolean repeat = selectedPoint == i.id;
          selectedPoint = i.id;
          updateCoordinates();
          if (repeat) pointDetails(i);
          else pointActions(i);
        };
    buildExplorer();
    SystemInsets.edgeToEdge(getWindow());
    SystemInsets.protect(root, 0);
    setContentView(root);
    root.requestApplyInsets();
    screen=new ScreenController(this,root);
    drawing = new DrawingController(this, root, map, item -> { store.save(item); refresh(); });
    mapTools=new MapTools(this,map.view,root);
    timeline=new TimelineController(this,root,map,this::timelineItems);
    timeline.restore(state);
    if (state != null) {
      drawing.restore(state);
      exportRasterPath=state.getString("exportRasterPath","");
      attachmentObject=state.getLong("attachmentObject",0);
      exportFormat = state.getString("exportFormat", "kmz");
      importParent = state.getLong("importParent", 0);
      long[] ids = state.getLongArray("exportSelection");
      if (ids != null) for (long id : ids) exportSelection.add(id);
    }
    catalog = new MapCatalog(this,map.view);
    map.view.setMaxZoomLevel(22.0);
    applySettings();
    explorerDialog = new Dialog(this);
    explorerDialog.setOnDismissListener(d -> displayedOnly = false);
    refresh();
    updateCoordinates();screen.restore(state);
    if(state!=null)screenshotPath=state.getString("screenshotPath","");
    renderMenuVisibility();
  }

  private TextView hudText(String value, int size) {
    TextView view = label(value, size);
    view.setTextColor(ReferenceMenu.TEXT);
    view.setPadding(dp(10), dp(6), dp(10), dp(6));
    return view;
  }

  private void openCategory(int category){
    if(category==0&&getPreferences(MODE_PRIVATE).getBoolean("menuHidden",false)){getPreferences(MODE_PRIVATE).edit().putBoolean("menuHidden",false).apply();renderMenuVisibility();return;}
    long now=android.os.SystemClock.uptimeMillis();boolean second=lastCategory==category&&now-lastCategoryTap<350;lastCategory=category;lastCategoryTap=now;
    if(categoryDialog!=null&&categoryDialog.isShowing()&&shownCategory==category&&!second){categoryDialog.dismiss();return;}
    if(second)getPreferences(MODE_PRIVATE).edit().putBoolean("expandedCategory"+category,true).apply();
    if(categoryDialog!=null)categoryDialog.dismiss();if(category==0)mainMenu();else if(category==1)mapsMenu();else if(category==2)marksMenu();else orientationMenu();
  }
  private void categoryOptions(int category){getPreferences(MODE_PRIVATE).edit().putBoolean("expandedCategory"+category,!getPreferences(MODE_PRIVATE).getBoolean("expandedCategory"+category,false)).apply();if(categoryDialog!=null)categoryDialog.dismiss();if(category==0)mainMenu();else if(category==1)mapsMenu();else if(category==2)marksMenu();else orientationMenu();}
  private void showSubmenu(Dialog dialog,LinearLayout panel,int category){
    if(categoryDialog!=null&&categoryDialog!=dialog)categoryDialog.dismiss();categoryDialog=dialog;shownCategory=category;
    ScrollView scroll=new ScrollView(this);scroll.setFillViewport(false);scroll.addView(panel);int width=Math.min(dp(352),getResources().getDisplayMetrics().widthPixels-dp(6));
    SafePanelHost host=new SafePanelHost(this,scroll,width,false);host.setOnClickListener(v->dialog.dismiss());LinearLayout bar=new LinearLayout(this);bar.setBackground(referenceUi.background());
    int[] icons={R.drawable.ui_menu,R.drawable.ui_map,R.drawable.ui_pin,R.drawable.ui_compass};String[] labels={"Меню","Карты и слои","Метки","Ориентирование"};
    for(int n=0;n<4;n++){final int index=n;Button tab=iconButton(labels[n],icons[n],()->openCategory(index));tab.setText("");ReferenceAssets.apply(tab,icons[n],48);tab.setPadding(0,0,0,0);if(n==category)tab.setBackground(selectedPlate());tab.setOnLongClickListener(v->{dialog.dismiss();if(index==0)runFirstCommand();else if(index==1)catalogMenu();else if(index==2)openExplorer(false);else toggleCompass();return true;});bar.addView(tab,new LinearLayout.LayoutParams(dp(48),dp(48)));}
    host.submenuToolbar(bar,dp(192),dp(48));dialog.setContentView(host);Window w=dialog.getWindow();if(w!=null){w.setBackgroundDrawableResource(android.R.color.transparent);w.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);SystemInsets.edgeToEdge(w);}dialog.show();if(w!=null){w.setLayout(-1,-1);w.setGravity(Gravity.FILL);}openPanels.add(dialog);dialog.setOnDismissListener(d->{openPanels.remove(dialog);if(categoryDialog==dialog){categoryDialog=null;shownCategory=-1;}if(screen!=null)screen.apply();});host.requestApplyInsets();if(screen!=null)screen.showStatusBar();
  }
  private void mainMenu(){
    menuDialog=new Dialog(this);LinearLayout panel=referenceUi.panel();boolean editing=getPreferences(MODE_PRIVATE).getBoolean("expandedCategory0",false);
    referenceUi.heading(panel,"Рабочая карта","?",()->about());
    List<String> commands=mainCommands.items();for(int n=0;n<commands.size();n++){final int position=n;final String id=commands.get(n);LinearLayout row=new LinearLayout(this);Button action=referenceUi.action(MainCommands.label(id),()->{menuDialog.dismiss();executeCommand(id);});int icon=mainCommandIcon(id);if(icon!=0){ReferenceAssets.apply(action,icon,24);action.setCompoundDrawablePadding(dp(10));}row.addView(action,new LinearLayout.LayoutParams(0,-2,1));if(editing){Button edit=referenceUi.action("✎",()->editMainCommand(position));edit.setContentDescription("Изменить команду "+(position+1));row.addView(edit,new LinearLayout.LayoutParams(dp(44),dp(48)));}panel.addView(row);}
    if(editing)referenceUi.row(panel,"Пользовательская кнопка",R.drawable.ui_plus,()->editMainCommand(mainCommands.items().size()));
    referenceUi.row(panel,"Настройки",R.drawable.ui_settings,()->{menuDialog.dismiss();settingsMenu();});
    referenceUi.row(panel,"Выход",R.drawable.ui_exit,()->{menuDialog.dismiss();requestExit();});
    referenceUi.row(panel,"Ещё…",0,()->{menuDialog.dismiss();moreMenu();});
    referenceUi.heading(panel,"Опции",editing?"⌃":"⌄",()->categoryOptions(0));
    if(editing){
      referenceUi.option(panel,"Координатная сетка: "+Coordinates.NAMES[Math.max(0,Math.min(Coordinates.NAMES.length-1,getPreferences(MODE_PRIVATE).getInt("primaryCoordinates",0)))],gridEnabled,on->{gridEnabled=on;map.showGrid(on);getPreferences(MODE_PRIVATE).edit().putBoolean("coordinateGrid",on).apply();});
      referenceUi.option(panel,"Ночной режим",getPreferences(MODE_PRIVATE).getBoolean("nightMode",false),on->{getPreferences(MODE_PRIVATE).edit().putBoolean("nightMode",on).apply();catalog.updateAppearance();});
      referenceUi.heading(panel,"Информеры","",null);
      referenceUi.option(panel,"Координаты центра экрана",getPreferences(MODE_PRIVATE).getBoolean("coordinateInfo",true),on->{getPreferences(MODE_PRIVATE).edit().putBoolean("coordinateInfo",on).apply();applySettings();});
    }
    showSubmenu(menuDialog,panel,0);
  }
  private void positionMapInfo(){if(mapInfo==null||mapRoot==null)return;View coordinates=mapRoot.findViewWithTag("coordinatePanel");FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)mapInfo.getLayoutParams();int top=dp(4)+(coordinates!=null&&coordinates.getVisibility()==View.VISIBLE?coordinates.getHeight()+dp(2):0);if(p.topMargin!=top){p.topMargin=top;mapInfo.setLayoutParams(p);}}
  private void coordinateFormats(){sheet("Формат местоположения",new String[]{"Основные координаты","Дополнительные координаты","Скрыть информер"},n->{if(n==2){getPreferences(MODE_PRIVATE).edit().putBoolean("coordinateInfo",false).apply();applySettings();return;}String[] names=n==0?Coordinates.NAMES:new String[Coordinates.NAMES.length+1];if(n==1){names[0]="Не показывать";System.arraycopy(Coordinates.NAMES,0,names,1,Coordinates.NAMES.length);}sheet(n==0?"Основные координаты":"Дополнительные координаты",names,index->{getPreferences(MODE_PRIVATE).edit().putInt(n==0?"primaryCoordinates":"secondaryCoordinates",n==0?index:index-1).apply();applySettings();});});}
  private void captureMap(){map.view.post(()->{try{int width=map.view.getWidth(),height=map.view.getHeight();if(width<=0||height<=0)throw new IOException("Карта ещё не отображена");double scale=Math.min(1,Math.sqrt(12000000.0/((double)width*height)));android.graphics.Bitmap bitmap=android.graphics.Bitmap.createBitmap(Math.max(1,(int)(width*scale)),Math.max(1,(int)(height*scale)),android.graphics.Bitmap.Config.ARGB_8888);try{android.graphics.Canvas canvas=new android.graphics.Canvas(bitmap);canvas.scale((float)scale,(float)scale);map.view.draw(canvas);android.graphics.Paint paint=new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);paint.setTextSize(dp(10));String credit="© OpenStreetMap contributors";if(catalog!=null){List<String> credits=new ArrayList<>();for(MapCatalog.Layer l:catalog.layers)if(l.displayed&&l.visible&&l.opacity>0&&!l.credit.isEmpty())credits.add(l.credit);if(!credits.isEmpty())credit=android.text.TextUtils.join(" · ",credits);}if(credit.length()>180)credit=credit.substring(0,180);paint.setColor(0xdc123b5e);canvas.drawRect(0,height-dp(22),width,height,paint);paint.setColor(0xffe4f2ff);canvas.drawText(credit,dp(4),height-dp(6),paint);File folder=new File(getCacheDir(),"map-images");if(!folder.isDirectory()&&!folder.mkdirs())throw new IOException("Нет места для снимка");File file=new File(folder,UUID.randomUUID()+".jpg");try(OutputStream out=new FileOutputStream(file)){if(!bitmap.compress(android.graphics.Bitmap.CompressFormat.JPEG,95,out))throw new IOException("Не удалось сохранить изображение");}screenshotPath=file.getAbsolutePath();}finally{bitmap.recycle();}
      Intent intent=new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/jpeg").putExtra(Intent.EXTRA_LOCAL_ONLY,true).putExtra(Intent.EXTRA_TITLE,"Карта-"+new java.text.SimpleDateFormat("yyyy-MM-dd-HHmmss",Locale.ROOT).format(new Date())+".jpg");startActivityForResult(intent,EXPORT_SCREENSHOT);
    }catch(Exception error){fileError(error.getMessage());}});}

  private int mainCommandIcon(String id){switch(id){case "hide":return R.drawable.ui_hide;case "lock":return R.drawable.ui_lock;case "capture":case "maps":return R.drawable.ui_map;case "point":case "quickPoint":return R.drawable.ui_pin;case "compass":case "north":return R.drawable.ui_compass;case "displayedMaps":return R.drawable.ui_layers;case "explorer":return R.drawable.ui_folder;case "settings":return R.drawable.ui_settings;default:return R.drawable.ui_info;}}
  private void editMainCommand(int position){String[] labels=new String[MainCommands.LABELS.length+1];labels[0]="Нет";System.arraycopy(MainCommands.LABELS,0,labels,1,MainCommands.LABELS.length);sheet("Пользовательская кнопка",labels,n->{mainCommands.replace(position,n==0?null:MainCommands.IDS[n-1]);if(menuDialog!=null)menuDialog.dismiss();mainMenu();});}
  private void runFirstCommand(){List<String> commands=mainCommands.items();if(!commands.isEmpty())executeCommand(commands.get(0));else mainMenu();}
  private void executeCommand(String id){GeoPoint center=(GeoPoint)map.view.getMapCenter();switch(id){
    case "hide":getPreferences(MODE_PRIVATE).edit().putBoolean("menuHidden",true).apply();renderMenuVisibility();break;
    case "lock":screen.lock(true);break;case "capture":captureMap();break;
    case "point":edit(null,center);break;case "quickPoint":run(()->store.create(explorer.folder,"Метка "+(store.all().size()+1),"point",center.getLatitude(),center.getLongitude()));break;
    case "search":searchMap();break;case "measure":if(drawing.active()){fileError("Сначала завершите рисунок");break;}timeline.close();mapTools.start(new Vertex(center.getLatitude(),center.getLongitude()));break;
    case "compass":showCompass();break;case "north":map.view.setMapOrientation(0);break;
    case "grid":gridEnabled=!gridEnabled;map.showGrid(gridEnabled);getPreferences(MODE_PRIVATE).edit().putBoolean("coordinateGrid",gridEnabled).apply();break;
    case "night":getPreferences(MODE_PRIVATE).edit().putBoolean("nightMode",!getPreferences(MODE_PRIVATE).getBoolean("nightMode",false)).apply();catalog.updateAppearance();break;
    case "coordinates":getPreferences(MODE_PRIVATE).edit().putBoolean("coordinateInfo",!getPreferences(MODE_PRIVATE).getBoolean("coordinateInfo",true)).apply();applySettings();break;
    case "maps":catalogMenu();break;case "displayedMaps":layersMenu();break;case "explorer":openExplorer(false);break;case "import":importFile();break;case "export":exportFile();break;case "settings":settingsMenu();break;case "about":about();break;
  }}
  private void renderMenuVisibility(){if(mapRoot==null)return;ViewGroup bar=mapRoot.findViewWithTag("bottomToolbar");if(bar==null)return;boolean hidden=getPreferences(MODE_PRIVATE).getBoolean("menuHidden",false);for(int n=1;n<bar.getChildCount();n++)bar.getChildAt(n).setVisibility(hidden?View.GONE:View.VISIBLE);View container=mapRoot.findViewWithTag("bottomPanel");container.getLayoutParams().width=dp(hidden?48:192);container.requestLayout();}
  private void requestExit(){if(drawing!=null&&drawing.active()){drawing.confirmCancel();return;}if(getPreferences(MODE_PRIVATE).getBoolean("confirmExit",false))new AlertDialog.Builder(this).setTitle("Выйти из приложения?").setPositiveButton("Выход",(d,w)->finish()).setNegativeButton("Отмена",null).show();else finish();}
  private void about(){new AlertDialog.Builder(this).setTitle("Рабочая карта").setMessage("Версия 2.4"+"\nЛокальная картографическая рабочая область").setPositiveButton("ОК",null).show();}
  private void moreMenu(){sheet("Ещё…",new String[]{"О программе"},n->about());}

  private void showPanel(Dialog dialog, View panel, int width, boolean fillHeight) {
    if (panel.getParent() instanceof ViewGroup) ((ViewGroup) panel.getParent()).removeView(panel);
    if(!openPanels.contains(dialog))openPanels.add(dialog);
    SafePanelHost host = new SafePanelHost(this, panel, width, fillHeight);
    host.setOnClickListener(v -> dialog.dismiss());
    dialog.setContentView(host);
    Window window = dialog.getWindow();
    if (window != null) {
      window.setBackgroundDrawableResource(android.R.color.transparent);
      SystemInsets.edgeToEdge(window);
      window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
          | WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
    }
    dialog.show();
    if (window != null) {
      window.setGravity(Gravity.FILL);
      window.setLayout(-1, -1);
      WindowManager.LayoutParams attributes = window.getAttributes();
      attributes.x = 0;
      attributes.y = 0;
      window.setAttributes(attributes);
    }
    host.requestFocus();
    host.requestApplyInsets();
  }

  private android.graphics.drawable.Drawable selectedPlate() {
    GradientDrawable background = new GradientDrawable();
    background.setColor(0xff84bff0);
    
    background.setCornerRadius(dp(4));
    return background;
  }

  private Button iconButton(String name, int icon, Runnable action) {
    Button button = compact(name, action);
    ReferenceAssets.apply(button,icon,24);
    button.setCompoundDrawablePadding(dp(4));
    button.setPadding(dp(4), dp(9), dp(4), dp(7));
    button.setGravity(Gravity.CENTER);
    return button;
  }

  private void objectsMenu() {
    openExplorer(false);
  }

  private void layersMenu(){
    layersDialog=new Dialog(this);LinearLayout panel=referenceUi.panel();LinearLayout header=new LinearLayout(this);header.setGravity(Gravity.CENTER_VERTICAL);TextView title=hudText("Карты на экране",16);header.addView(title,new LinearLayout.LayoutParams(0,dp(48),1));Button favorite=referenceUi.action("+",this::saveFavoriteMap);favorite.setContentDescription("Сохранить как избранный набор");header.addView(favorite,new LinearLayout.LayoutParams(dp(48),dp(48)));Button close=referenceUi.action("×",()->layersDialog.dismiss());close.setContentDescription("Закрыть карты на экране");header.addView(close,new LinearLayout.LayoutParams(dp(48),dp(48)));panel.addView(header);
    LinearLayout cards=new LinearLayout(this);cards.setOrientation(LinearLayout.VERTICAL);List<MapCatalog.Layer> displayed=new ArrayList<>();for(MapCatalog.Layer l:catalog.layers)if(l.displayed)displayed.add(l);Collections.reverse(displayed);
    for(MapCatalog.Layer layer:displayed){FrameLayout card=new FrameLayout(this);card.setBackgroundColor(0xffabcce8);android.graphics.drawable.Drawable preview=catalog.thumbnail(layer);if(preview!=null){ImageView image=new ImageView(this);image.setScaleType(ImageView.ScaleType.CENTER_CROP);image.setImageDrawable(preview);image.setAlpha(.32f);card.addView(image,new FrameLayout.LayoutParams(-1,-1));}
      LinearLayout row=new LinearLayout(this);row.setGravity(Gravity.CENTER_VERTICAL);Switch visible=new Switch(this);visible.setContentDescription("Видимость "+layer.name);visible.setChecked(layer.visible);visible.setOnCheckedChangeListener((v,on)->{layer.visible=on;catalog.save();catalog.updateAppearance();updateCoordinates();});row.addView(visible,new LinearLayout.LayoutParams(dp(52),dp(64)));LinearLayout labels=new LinearLayout(this);labels.setOrientation(LinearLayout.VERTICAL);TextView name=hudText(layer.name,16),opacity=hudText(layer.opacity+" % непрозрачн.",11);labels.addView(name);labels.addView(opacity);row.addView(labels,new LinearLayout.LayoutParams(0,-2,1));Button options=referenceUi.action("⋮",()->layerActions(layer));options.setContentDescription("Опции карты "+layer.name);row.addView(options,new LinearLayout.LayoutParams(dp(44),dp(64)));card.addView(row,new FrameLayout.LayoutParams(-1,-2));card.setOnClickListener(v->layerActions(layer));card.setOnLongClickListener(v->{layerActions(layer);return true;});LinearLayout.LayoutParams size=new LinearLayout.LayoutParams(-1,dp(68));size.setMargins(0,dp(4),0,dp(4));cards.addView(card,size);}
    if(displayed.isEmpty())referenceUi.note(cards,"Нет карт на экране");ScrollView scroll=new ScrollView(this);scroll.addView(cards);panel.addView(scroll,new LinearLayout.LayoutParams(-1,-2));showPanel(layersDialog,panel,getResources().getDisplayMetrics().widthPixels,false);
  }
  private void layerActions(MapCatalog.Layer layer){sheet(layer.name,new String[]{"Детали","Выше","Ниже","Убрать","Непрозрачность","Редактировать цвет","Удалить цвет","Режим смешивания слоёв",layer.inverted?"Выключить инверсию цветов":"Инверсия цветов"},n->{if(n==0)new AlertDialog.Builder(this).setTitle(layer.name).setMessage(layer.credit+"\nМасштабы: "+layer.min+"–"+layer.max).setPositiveButton("ОК",null).show();else if(n==1||n==2){catalog.reorder(layer,n==1?1:-1);layersDialog.dismiss();layersMenu();}else if(n==3){catalog.remove(layer);layersDialog.dismiss();layersMenu();}else if(n==4)layerOpacity(layer);else if(n==5)layerColor(layer);else if(n==6)eraseMapColor(layer);else if(n==7)new AlertDialog.Builder(this).setTitle("Режим смешивания слоёв").setSingleChoiceItems(RasterTilesOverlay.modes(),layer.blend,(d,index)->{layer.blend=index;catalog.save();catalog.updateAppearance();d.dismiss();}).setNegativeButton("Отмена",null).show();else{layer.inverted=!layer.inverted;catalog.save();catalog.updateAppearance();}});}
  private void layerOpacity(MapCatalog.Layer layer){Dialog dialog=new Dialog(this);LinearLayout panel=referenceUi.panel();TextView value=hudText("Непрозрачность · "+layer.opacity+" %",16);panel.addView(value);SeekBar slider=new SeekBar(this);slider.setMax(100);slider.setProgress(layer.opacity);slider.setContentDescription("Непрозрачность "+layer.name);panel.addView(slider,new LinearLayout.LayoutParams(-1,dp(48)));slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){catalog.save();}public void onProgressChanged(SeekBar s,int progress,boolean user){layer.opacity=progress;value.setText("Непрозрачность · "+progress+" %");catalog.updateAppearance();}});referenceUi.row(panel,"Закрыть",0,()->{catalog.save();dialog.dismiss();});showPanel(dialog,panel,dp(340),false);}
  private void layerColor(MapCatalog.Layer layer){Dialog dialog=new Dialog(this);LinearLayout panel=referenceUi.panel();referenceUi.heading(panel,"Редактировать цвет","",null);String[] titles={"Контраст","Яркость","Насыщенность","Оттенок"};float[] values={layer.contrast,layer.brightness,layer.saturation,layer.hue};for(int n=0;n<4;n++){final int index=n;TextView label=hudText(titles[n]+": "+values[n],13);panel.addView(label);SeekBar slider=new SeekBar(this);slider.setMax(n==3?360: n==1?200:300);slider.setProgress(Math.round(n==3?values[n]+180:n==1?values[n]*100+100:values[n]*100));panel.addView(slider,new LinearLayout.LayoutParams(-1,dp(40)));slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){catalog.save();}public void onProgressChanged(SeekBar s,int p,boolean user){float value=index==3?p-180:index==1?(p-100)/100f:p/100f;if(index==0)layer.contrast=value;else if(index==1)layer.brightness=value;else if(index==2)layer.saturation=value;else layer.hue=value;label.setText(titles[index]+": "+value);catalog.updateAppearance();}});}referenceUi.option(panel,"Инверсия цветов",layer.inverted,on->{layer.inverted=on;catalog.save();catalog.updateAppearance();});referenceUi.row(panel,"Сбросить",0,()->{layer.contrast=layer.saturation=1;layer.brightness=layer.hue=0;layer.inverted=false;catalog.save();catalog.updateAppearance();dialog.dismiss();layerColor(layer);});referenceUi.row(panel,"Закрыть",0,()->{catalog.save();dialog.dismiss();});ScrollView scroll=new ScrollView(this);scroll.addView(panel);showPanel(dialog,scroll,dp(340),false);}
  private void eraseMapColor(MapCatalog.Layer layer){LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);CheckBox enabled=new CheckBox(this);enabled.setText("Удалить цвет");enabled.setChecked(layer.erase);EditText color=new EditText(this);color.setHint("#RRGGBB");color.setText(String.format(Locale.ROOT,"#%06X",layer.eraseColor&0xffffff));TextView label=hudText("Допуск: "+layer.eraseTolerance,13);SeekBar tolerance=new SeekBar(this);tolerance.setMax(255);tolerance.setProgress(layer.eraseTolerance);tolerance.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){}public void onProgressChanged(SeekBar s,int p,boolean user){label.setText("Допуск: "+p);}});form.addView(enabled);form.addView(color);form.addView(label);form.addView(tolerance);AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Удалить цвет").setView(form).setPositiveButton("ОК",null).setNegativeButton("Отмена",null).create();dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{try{int parsed=android.graphics.Color.parseColor(color.getText().toString());layer.erase=enabled.isChecked();layer.eraseColor=parsed;layer.eraseTolerance=tolerance.getProgress();catalog.save();catalog.updateAppearance();dialog.dismiss();}catch(Exception e){color.setError("Введите цвет #RRGGBB");}}));dialog.show();}

  private void applyMapLayer() {
    if(catalog!=null){MapCatalog.Layer osm=catalog.find("osm");osm.visible=mapLayerVisible;osm.opacity=mapLayerOpacity;catalog.save();catalog.updateAppearance();return;}
    org.osmdroid.views.overlay.TilesOverlay tiles = map.view.getOverlayManager().getTilesOverlay();
    tiles.setEnabled(mapLayerVisible);
    android.graphics.ColorMatrix matrix = new android.graphics.ColorMatrix();
    matrix.setScale(1f, 1f, 1f, mapLayerOpacity / 100f);
    tiles.setColorFilter(new android.graphics.ColorMatrixColorFilter(matrix));
    map.view.invalidate();
  }

  private void saveMapLayer() {
    getPreferences(MODE_PRIVATE).edit().putBoolean("mapLayerVisible", mapLayerVisible)
        .putInt("mapLayerOpacity", mapLayerOpacity).apply();
  }

  private android.graphics.drawable.Drawable plate() {
    GradientDrawable bg = new GradientDrawable();
    bg.setColor(ReferenceMenu.PANEL);
    
    bg.setCornerRadius(dp(4));
    return bg;
  }

  private Button compact(String name, Runnable action) {
    Button b = button(name, action);
    b.setMinWidth(0);
    b.setMinimumWidth(0);
    b.setMinHeight(dp(44));
    b.setTextSize(11);
    b.setTextColor(ReferenceMenu.TEXT);
    b.setPadding(dp(9), 0, dp(9), 0);
    b.setBackgroundColor(Color.TRANSPARENT);
    b.setAllCaps(false);
    b.setContentDescription(name);
    return b;
  }

  private void sheet(String title, String[] names, java.util.function.IntConsumer action) {
    new AlertDialog.Builder(this)
        .setTitle(title)
        .setItems(names, (d, index) -> action.accept(index))
        .setNegativeButton("Закрыть", null)
        .show();
  }

  /** Long press opens map actions without creating an object until the user confirms. */
  private void longPressMap(GeoPoint point){if(drawing!=null&&drawing.active()){drawing.add(point);return;}int action=getPreferences(MODE_PRIVATE).getInt("longPressMap",0);if(action==1)edit(null,point);else if(action==2){android.content.ClipboardManager clipboard=(android.content.ClipboardManager)getSystemService(CLIPBOARD_SERVICE);clipboard.setPrimaryClip(ClipData.newPlainText("Координаты",Coordinates.format(getPreferences(MODE_PRIVATE).getInt("primaryCoordinates",0),point.getLatitude(),point.getLongitude(),getPreferences(MODE_PRIVATE).getString("primaryEPSG","EPSG:32637"))));}else if(action==0)mapContextMenu(point);}
  private void mapContextMenu(GeoPoint point){
    if(drawing!=null&&drawing.active()){drawing.add(point);return;}
    AlertDialog dialog=new AlertDialog.Builder(this).create();LinearLayout panel=referenceUi.panel();
    LinearLayout targetRow=new LinearLayout(this);
    Button targetAction=referenceUi.action(mapTools.hasTarget()?"Убрать цель":"Задать цель",()->{dialog.dismiss();mapTools.target(mapTools.hasTarget()?null:new Vertex(point.getLatitude(),point.getLongitude()));});
    ReferenceAssets.apply(targetAction,R.drawable.ui_focus,24);targetAction.setCompoundDrawablePadding(dp(10));targetRow.addView(targetAction,new LinearLayout.LayoutParams(0,dp(48),1));
    if(mapTools.hasTarget()){
      Button jump=referenceUi.action("↗",()->{dialog.dismiss();mapTools.jumpTarget();});jump.setContentDescription("Перейти к цели");targetRow.addView(jump,new LinearLayout.LayoutParams(dp(44),dp(48)));
      Button replace=referenceUi.action("⊙",()->{dialog.dismiss();mapTools.target(new Vertex(point.getLatitude(),point.getLongitude()));});replace.setContentDescription("Заменить цель центром карты");targetRow.addView(replace,new LinearLayout.LayoutParams(dp(44),dp(48)));
    }
    panel.addView(targetRow);
    LinearLayout row=new LinearLayout(this);Button create=referenceUi.action("Новая метка…",()->{dialog.dismiss();createPlacemarkAt(point);});ReferenceAssets.apply(create,R.drawable.ui_pin,24);create.setCompoundDrawablePadding(dp(10));row.addView(create,new LinearLayout.LayoutParams(0,dp(48),1));Button quick=referenceUi.action("!",()->{dialog.dismiss();edit(null,point);});quick.setContentDescription("Путевая точка");row.addView(quick,new LinearLayout.LayoutParams(dp(44),dp(48)));panel.addView(row);
    LinearLayout tools=new LinearLayout(this);tools.addView(referenceUi.action("Инструменты…",()->{dialog.dismiss();mapToolsMenu(point);}),new LinearLayout.LayoutParams(0,dp(48),1));Button info=referenceUi.action("i",()->{dialog.dismiss();new AlertDialog.Builder(this).setTitle("Местоположение").setMessage(Coordinates.format(getPreferences(MODE_PRIVATE).getInt("primaryCoordinates",0),point.getLatitude(),point.getLongitude(),getPreferences(MODE_PRIVATE).getString("primaryEPSG","EPSG:32637"))).setPositiveButton("Копировать",(d,w)->{android.content.ClipboardManager clipboard=(android.content.ClipboardManager)getSystemService(CLIPBOARD_SERVICE);clipboard.setPrimaryClip(ClipData.newPlainText("Координаты",Coordinates.format(getPreferences(MODE_PRIVATE).getInt("primaryCoordinates",0),point.getLatitude(),point.getLongitude(),getPreferences(MODE_PRIVATE).getString("primaryEPSG","EPSG:32637"))));}).setNegativeButton("Закрыть",null).show();});info.setContentDescription("Сведения о местоположении");tools.addView(info,new LinearLayout.LayoutParams(dp(44),dp(48)));panel.addView(tools);MapItem selected=store.get(selectedPoint);if(selected!=null){View gap=new View(this);panel.addView(gap,new LinearLayout.LayoutParams(-1,dp(4)));referenceUi.row(panel,selected.name,R.drawable.ui_pin,()->{dialog.dismiss();pointDetails(selected);});}MapContextBubble.show(dialog,panel,map.view,point);
  }

  private void mapToolsMenu(GeoPoint point){sheet("Инструменты",new String[]{"Измерить","Проекция точки по расстоянию и азимуту","Удалить измерения",mapTools.hasTarget()?"Убрать цель":"Задать цель","Перейти к цели"},n->{
    Vertex origin=new Vertex(point.getLatitude(),point.getLongitude());
    if(n==0){if(drawing.active()){fileError("Сначала завершите рисунок");return;}timeline.close();mapTools.start(origin);}
    else if(n==1)projectPoint(origin);else if(n==2)new AlertDialog.Builder(this).setTitle("Удалить все измерения?").setPositiveButton("Удалить",(d,w)->mapTools.clear()).setNegativeButton("Отмена",null).show();
    else if(n==3)mapTools.target(mapTools.hasTarget()?null:origin);else mapTools.jumpTarget();
  });}
  private void projectPoint(Vertex origin){
    DisplayUnits units=DisplayUnits.load(this);
    LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);EditText distance=new EditText(this),bearing=new EditText(this);distance.setHint("Расстояние");bearing.setHint("Азимут, "+units.angleUnit());distance.setInputType(8194);bearing.setInputType(12290);form.addView(distance);
    Spinner distanceUnit=new Spinner(this);String[] names={"Метры","Километры","Футы","Ярды","Мили","Морские мили"};double[] factors={1,1000,.3048,.9144,1609.344,1852};ArrayAdapter<String> adapter=new ArrayAdapter<>(this,android.R.layout.simple_spinner_item,names);adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);distanceUnit.setAdapter(adapter);distanceUnit.setSelection(units.distanceMode>=8||units.distanceMode==3?5:units.distanceMode>=2?2:0);form.addView(distanceUnit);form.addView(bearing);
    AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Проекция точки").setView(form).setPositiveButton("Новая метка",null).setNegativeButton("Отмена",null).create();dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{try{Vertex destination=Geometry.project(origin,units.degrees(Double.parseDouble(bearing.getText().toString().replace(',','.'))),Double.parseDouble(distance.getText().toString().replace(',','.'))*factors[distanceUnit.getSelectedItemPosition()]);dialog.dismiss();edit(null,new GeoPoint(destination.latitude,destination.longitude));}catch(Exception error){distance.setError("Введите расстояние и азимут числами");}}));dialog.show();
  }

  private void mapsMenu(){
    mapsDialog=new Dialog(this);LinearLayout panel=referenceUi.panel();referenceUi.heading(panel,"Карты","?",()->mapInformation());
    referenceUi.row(panel,"Доступные карты",R.drawable.ui_map,()->{mapsDialog.dismiss();catalogMenu();});
    Button displayed=referenceUi.row(panel,"Карты на экране",R.drawable.ui_layers,()->{mapsDialog.dismiss();layersMenu();});displayed.setTag("displayedMaps");
    boolean onlineVisible=false;for(MapCatalog.Layer l:catalog.layers)if(l.displayed&&l.visible&&!l.offline())onlineVisible=true;if(onlineVisible)referenceUi.row(panel,"Сохранить участок карты",R.drawable.ui_map,()->{mapsDialog.dismiss();chooseAreaDownload();});
    referenceUi.heading(panel,"Избранные карты и наборы карт","+",()->saveFavoriteMap());
    org.json.JSONArray favorites=catalog.favoriteSets();if(favorites.length()==0)referenceUi.note(panel,"Избранные карты и наборы карт не созданы");
    for(int n=0;n<favorites.length();n++){org.json.JSONObject favorite=favorites.optJSONObject(n);if(favorite==null)continue;Button select=referenceUi.row(panel,favorite.optString("name"),R.drawable.ui_map,()->{try{catalog.applyFavorite(favorite,false);mapsDialog.dismiss();updateCoordinates();}catch(Exception e){fileError(e.getMessage());}});select.setOnLongClickListener(v->{favoriteMapActions(favorite);return true;});}
    boolean expanded=getPreferences(MODE_PRIVATE).getBoolean("expandedCategory1",false);referenceUi.heading(panel,"Опции",expanded?"⌃":"⌄",()->categoryOptions(1));
    if(expanded){referenceUi.option(panel,"Использовать только сохранённый кэш карты",!map.view.useDataConnection(),on->setMapOnline(!on));referenceUi.option(panel,"Индикаторы загрузки карты",getPreferences(MODE_PRIVATE).getBoolean("mapLoadingIndicators",true),on->{getPreferences(MODE_PRIVATE).edit().putBoolean("mapLoadingIndicators",on).apply();catalog.updateAppearance();});referenceUi.heading(panel,"Информеры","",null);
      for(String key:new String[]{"mapInfoName","mapInfoScale","mapInfoRuler"})referenceUi.option(panel,key.equals("mapInfoName")?"Название карты":key.equals("mapInfoScale")?"Масштаб карты":"Масштабная линейка",getPreferences(MODE_PRIVATE).getBoolean(key,!key.equals("mapInfoName")),on->{getPreferences(MODE_PRIVATE).edit().putBoolean(key,on).apply();mapInfo.update(catalog);});}
    showSubmenu(mapsDialog,panel,1);
  }
  private void mapInformation(){new AlertDialog.Builder(this).setTitle("Карты").setMessage("© OpenStreetMap contributors\nhttps://www.openstreetmap.org/copyright").setPositiveButton("ОК",null).show();}
  private void saveFavoriteMap(){EditText name=new EditText(this);name.setHint("Название");AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Избранная карта или набор карт").setView(name).setPositiveButton("ОК",null).setNegativeButton("Отмена",null).create();dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{try{catalog.saveFavorite(name.getText().toString());dialog.dismiss();if(categoryDialog!=null)categoryDialog.dismiss();mapsMenu();}catch(Exception e){name.setError(e.getMessage());}}));dialog.show();}
  private void favoriteMapActions(org.json.JSONObject favorite){sheet(favorite.optString("name"),new String[]{"Показать","Добавить как слой","Переименовать","Удалить"},n->{if(n<2){try{catalog.applyFavorite(favorite,n==1);if(categoryDialog!=null)categoryDialog.dismiss();updateCoordinates();}catch(Exception e){fileError(e.getMessage());}}else if(n==2){EditText name=new EditText(this);name.setText(favorite.optString("name"));new AlertDialog.Builder(this).setTitle("Переименовать").setView(name).setPositiveButton("ОК",(d,w)->{try{catalog.editFavorite(favorite.optString("id"),name.getText().toString());if(categoryDialog!=null)categoryDialog.dismiss();mapsMenu();}catch(Exception e){fileError(e.getMessage());}}).setNegativeButton("Отмена",null).show();}else new AlertDialog.Builder(this).setTitle("Удалить избранный набор?").setPositiveButton("Удалить",(d,w)->{catalog.editFavorite(favorite.optString("id"),null);if(categoryDialog!=null)categoryDialog.dismiss();mapsMenu();}).setNegativeButton("Отмена",null).show();});}

  private void setMapOnline(boolean online) {
    map.view.setUseDataConnection(online);
    if(catalog!=null)catalog.setOnline(online);
    getPreferences(MODE_PRIVATE).edit().putBoolean("mapOnline", online).apply();
  }

  private void openExplorer(boolean visibleOnly) {
    displayedOnly = visibleOnly;
    objectFilter = "all";
    selectionMode=false;explorer.selected.clear();
    explorer.folder = 0;
    explorer.query = "";
    refresh();
    showPanel(explorerDialog, drawer, dp(640), true);
  }

  private void marksMenu(){
    marksDialog=new Dialog(this);LinearLayout panel=referenceUi.panel();referenceUi.heading(panel,"Метки","",null);
    referenceUi.row(panel,"Все метки",R.drawable.ui_folder,()->{marksDialog.dismiss();openExplorer(false);});
    if(!timelineItems().isEmpty())referenceUi.row(panel,"Метки на экране",R.drawable.ui_pin,()->{marksDialog.dismiss();openExplorer(true);});
    referenceUi.row(panel,"Новая метка",R.drawable.ui_pin,()->{marksDialog.dismiss();createPlacemark();});
    if(timeline.available())referenceUi.row(panel,"Время движения по треку",0,()->{marksDialog.dismiss();openTimeline();});
    referenceUi.row(panel,"Поиск на карте",R.drawable.ui_search,()->{marksDialog.dismiss();searchMap();});
    boolean expanded=getPreferences(MODE_PRIVATE).getBoolean("expandedCategory2",false);referenceUi.heading(panel,"Опции",expanded?"⌃":"⌄",()->categoryOptions(2));
    if(expanded){referenceUi.option(panel,"Названия меток",map.labelsVisible,on->{getPreferences(MODE_PRIVATE).edit().putBoolean("placemarkLabels",on).apply();applySettings();});referenceUi.option(panel,"Линия до цели",getPreferences(MODE_PRIVATE).getBoolean("targetLine",true),on->{getPreferences(MODE_PRIVATE).edit().putBoolean("targetLine",on).apply();mapTools.update();});referenceUi.heading(panel,"Информеры","",null);referenceUi.option(panel,"Статус цели",getPreferences(MODE_PRIVATE).getBoolean("targetInfo",true),on->{getPreferences(MODE_PRIVATE).edit().putBoolean("targetInfo",on).apply();mapTools.update();});}
    showSubmenu(marksDialog,panel,2);
  }
  private List<MapItem> timelineItems(){List<MapItem> items=new ArrayList<>();for(MapItem item:store.renderItems())if(!item.isFolder()&&store.effectiveOpacity(item)>0)items.add(item);return items;}
  private void openTimeline(){if(drawing.active()||mapTools.measuring){fileError("Сначала завершите рисунок или измерение");return;}if(!timeline.open())fileError("Нет отображаемых меток со временем в файле");}
  private LinearLayout featurePanel(String title,Dialog dialog) {
    LinearLayout panel=new LinearLayout(this);panel.setOrientation(LinearLayout.VERTICAL);panel.setPadding(dp(12),dp(8),dp(12),dp(8));panel.setBackground(plate());
    LinearLayout header=new LinearLayout(this);header.addView(hudText(title,18),new LinearLayout.LayoutParams(0,-2,1));header.addView(compact("×",dialog::dismiss),new LinearLayout.LayoutParams(dp(48),dp(48)));panel.addView(header);return panel;
  }
  private void showFeature(Dialog dialog,LinearLayout panel){ScrollView scroll=new ScrollView(this);scroll.addView(panel);showPanel(dialog,scroll,dp(360),false);}
  private void createPlacemark(){createPlacemarkAt((GeoPoint)map.view.getMapCenter());}
  private void createPlacemarkAt(GeoPoint point){PlacemarkCreationMenu.show(this,n->{
    if(n==1)edit(null,point);
    else if(n==2)createSpecialPlacemark(point,"audio");
    else if(n==3){EditText name=new EditText(this);new AlertDialog.Builder(this).setTitle("Набор точек").setView(name).setPositiveButton("ОК",(d,w)->run(()->store.create(explorer.folder,name.getText().toString(),"set",0,0))).setNegativeButton("Отмена",null).show();}
    else if(n>=4&&n<=6)startDrawing(n==4?"route":n==5?"path":"area",point);
    else if(n==7||n==8)createSpecialPlacemark(point,n==7?"circle":"text");
    else if(n==10)searchMap();
    else if(n==11){if(drawing.active()){fileError("Сначала завершите рисунок");return;}timeline.close();mapTools.start(new Vertex(point.getLatitude(),point.getLongitude()));}
  });}
  private void createSpecialPlacemark(GeoPoint center,String type){
    LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);EditText name=new EditText(this);name.setHint(type.equals("text")?"Текст":"Название");form.addView(name);
    EditText radius=new EditText(this);radius.setHint("Радиус");radius.setInputType(android.text.InputType.TYPE_CLASS_NUMBER|android.text.InputType.TYPE_NUMBER_FLAG_DECIMAL);Spinner units=new Spinner(this);String[] names={"м","км","ft","mi","nmi"};double[] factors={1,1000,.3048,1609.344,1852};units.setAdapter(new ArrayAdapter<String>(this,android.R.layout.simple_spinner_dropdown_item,names));
    if(type.equals("circle")){form.addView(radius);form.addView(units);}
    AlertDialog dialog=new AlertDialog.Builder(this).setTitle(type.equals("circle")?"Круг":type.equals("text")?"Текст":"Аудиоточка").setView(form).setPositiveButton("Создать",null).setNegativeButton("Отмена",null).create();
    dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{
      if(name.getText().toString().trim().isEmpty()){name.setError("Введите название");return;}
      try{
        MapItem item=new MapItem();item.kind=type.equals("circle")?"area":"point";item.parent=explorer.folder;item.name=name.getText().toString().trim();item.latitude=center.getLatitude();item.longitude=center.getLongitude();item.visible=true;item.opacity=1;item.color=0xff3f6db5;
        if(type.equals("circle")){double meters=Double.parseDouble(radius.getText().toString().replace(',','.'))*factors[units.getSelectedItemPosition()];if(Double.isNaN(meters)||Double.isInfinite(meters)||meters<=0||meters>20000000)throw new IllegalArgumentException("Радиус должен быть больше нуля и не более 20000 км");List<Vertex> ring=new ArrayList<>();Vertex origin=new Vertex(item.latitude,item.longitude);for(int n=0;n<96;n++)ring.add(Geometry.project(origin,n*360.0/96,meters));item.segments.add(ring);item.icon="builtin:circle";}
        else if(type.equals("text"))item.icon="builtin:text";
        long id=store.save(item);refresh();dialog.dismiss();
        if(type.equals("audio")){attachmentObject=id;Intent choose=new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("audio/*").putExtra(Intent.EXTRA_LOCAL_ONLY,true).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);startActivityForResult(choose,ATTACH_FILE);}
      }catch(Exception error){(type.equals("circle")?radius:name).setError(error.getMessage());}
    }));dialog.show();
  }

  private void orientationMenu(){
    orientationDialog=new Dialog(this);LinearLayout panel=referenceUi.panel();referenceUi.heading(panel,"Ориентирование","",null);
    LinearLayout row=new LinearLayout(this);Button open=referenceUi.action("Компас",()->{orientationDialog.dismiss();showCompass();});ReferenceAssets.apply(open,R.drawable.ui_compass,24);open.setCompoundDrawablePadding(dp(10));row.addView(open,new LinearLayout.LayoutParams(0,dp(48),1));Switch toggle=new Switch(this);toggle.setContentDescription("Включить компас");toggle.setChecked(getPreferences(MODE_PRIVATE).getBoolean("compassEnabled",false));toggle.setOnCheckedChangeListener((v,on)->{setCompass(on);if(on&&!compassController.enabled)toggle.setChecked(false);});row.addView(toggle,new LinearLayout.LayoutParams(dp(60),dp(48)));panel.addView(row);
    referenceUi.option(panel,"Вращать карту по компасу",getPreferences(MODE_PRIVATE).getBoolean("compassRotate",false),on->{getPreferences(MODE_PRIVATE).edit().putBoolean("compassRotate",on).apply();updateCompass();});referenceUi.option(panel,"Показать компас",getPreferences(MODE_PRIVATE).getBoolean("compassOnMap",false),on->{getPreferences(MODE_PRIVATE).edit().putBoolean("compassOnMap",on).apply();updateCompass();});
    referenceUi.heading(panel,"Информеры","",null);referenceUi.option(panel,"Статус компаса",getPreferences(MODE_PRIVATE).getBoolean("compassInfo",false),on->{getPreferences(MODE_PRIVATE).edit().putBoolean("compassInfo",on).apply();updateCompass();});showSubmenu(orientationDialog,panel,3);
  }
  private void toggleCompass(){setCompass(!getPreferences(MODE_PRIVATE).getBoolean("compassEnabled",false));}
  private void setCompass(boolean on){
    if(on){if(!compassController.start(getPreferences(MODE_PRIVATE).getString("compassSensor","rotation"))){on=false;fileError("Магнитный датчик недоступен. Компас не включён.");}}
    else compassController.stop();getPreferences(MODE_PRIVATE).edit().putBoolean("compassEnabled",on).apply();updateCompass();
  }
  private void showCompass(){
    compassDialog=new Dialog(this);LinearLayout panel=featurePanel("Компас",compassDialog);
    compassDial=new CompassDial(this);panel.addView(compassDial,new LinearLayout.LayoutParams(-1,dp(240)));compassReadout=hudText("",14);panel.addView(compassReadout);
    panel.addView(compact("Включить / выключить",this::toggleCompass));
    CheckBox rose=new CheckBox(this);rose.setText("Подвижная шкала");rose.setTextColor(ReferenceMenu.TEXT);rose.setChecked(getPreferences(MODE_PRIVATE).getBoolean("compassRose",true));rose.setOnCheckedChangeListener((v,on)->{getPreferences(MODE_PRIVATE).edit().putBoolean("compassRose",on).apply();updateCompass();});panel.addView(rose);
    panel.addView(compact("Датчик",()->sheet("Датчик компаса",new String[]{"Вектор вращения (если доступен)","Магнитометр и акселерометр"},n->{getPreferences(MODE_PRIVATE).edit().putString("compassSensor",n==0?"rotation":"magnetic").apply();if(compassController.enabled)setCompass(true);}))); 
    panel.addView(hudText("Север выбирается в настройках. Склонение рассчитывается по центру карты; местоположение телефона не запрашивается. Давление доступно при наличии барометра.",12));showFeature(compassDialog,panel);updateCompass();
  }
  private void updateCompass(){
    if(compassController==null||headingInfo==null)return;CompassController c=compassController;android.content.SharedPreferences prefs=getPreferences(MODE_PRIVATE);
    DisplayUnits units=DisplayUnits.load(this);double corrected=c.heading;int reference=prefs.getInt("northReference",2);
    if(reference!=2){double lat=map.view.getMapCenter().getLatitude(),lon=map.view.getMapCenter().getLongitude();corrected+=new android.hardware.GeomagneticField((float)lat,(float)lon,0f,System.currentTimeMillis()).getDeclination();if(reference==1)try{int mode=prefs.getInt("primaryCoordinates",0);String code=Coordinates.system(mode,lat,lon,prefs.getString("primaryEPSG","EPSG:32637"));if(!ProjectionMath.geographic(code)){Vertex toward=Geometry.project(new Vertex(lat,lon),0,100);double[] a=ProjectionMath.project(code,lat,lon),b=ProjectionMath.project(code,toward.latitude,toward.longitude);corrected+=Math.toDegrees(Math.atan2(b[0]-a[0],b[1]-a[1]));}}catch(Exception ignored){}}
    float heading=CompassController.normalize((float)corrected);
    String value=!c.enabled?"Компас выключен":!c.ready?"Ожидание показаний датчика":"Азимут: "+units.bearing(heading)+"\nНаклон: "+units.slope(c.pitch)+" · Крен: "+units.slope(c.roll)+(c.pressureHpa==null?"":"\nДавление: "+units.pressure(c.pressureHpa))+(c.accuracy<=android.hardware.SensorManager.SENSOR_STATUS_ACCURACY_LOW?"\nТребуется калибровка":"");
    if(compassReadout!=null)compassReadout.setText(value);headingInfo.setText(value);headingInfo.setVisibility(c.enabled&&prefs.getBoolean("compassInfo",false)?View.VISIBLE:View.GONE);
    for(CompassDial dial:new CompassDial[]{compassDial,mapCompass})if(dial!=null){dial.heading=heading;dial.ready=c.ready;dial.movingRose=prefs.getBoolean("compassRose",true);dial.invalidate();}
    mapCompass.setVisibility(c.enabled&&prefs.getBoolean("compassOnMap",false)?View.VISIBLE:View.GONE);
    if(c.enabled&&c.ready&&prefs.getBoolean("compassRotate",false))map.view.setMapOrientation(-heading);
  }

  private void folderMenu() {
    List<Long> ids = new ArrayList<>();
    List<String> names = new ArrayList<>();
    ids.add(0L);
    names.add("Рабочая карта");
    for (MapItem i : store.renderItems())
      if (i.isFolder()) {
        List<String> chain = new ArrayList<>();
        for (MapItem p = i; p != null; p = store.get(p.parent)) chain.add(p.name);
        Collections.reverse(chain);
        ids.add(i.id);
        names.add("Рабочая карта / " + android.text.TextUtils.join(" / ", chain));
      }
    sheet(
        "Папки",
        names.toArray(new String[0]),
        n -> {
          explorer.folder = ids.get(n);
          explorer.query = "";
          displayedOnly = false;
          refresh();
        });
  }

  private void openIcons() {
    List<Long> ids = new ArrayList<>();
    for (long id : explorer.selected) {
      MapItem i = store.get(id);
      if (i != null && "point".equals(i.kind)) ids.add(id);
    }
    long[] selectedIds = new long[ids.size()];
    for (int n = 0; n < ids.size(); n++) selectedIds[n] = ids.get(n);
    android.content.Intent intent =
        new android.content.Intent(this, ru.warriorrus.app.icons.IconsActivity.class);
    intent.putExtra(ru.warriorrus.app.icons.IconsActivity.POINT_IDS, selectedIds);
    startActivity(intent);
  }

  private void updateCoordinates() {
    if (coordinates == null) return;
    double lat = map.view.getMapCenter().getLatitude(),
        lon = map.view.getMapCenter().getLongitude();
    int primary = getPreferences(MODE_PRIVATE).getInt("primaryCoordinates", 0);
    int secondary = getPreferences(MODE_PRIVATE).getInt("secondaryCoordinates", 4);
    coordinateSystem.setText(Coordinates.NAMES[Math.max(0, Math.min(Coordinates.NAMES.length-1, primary))]);
    coordinates.setText(Coordinates.format(primary, lat, lon,getPreferences(MODE_PRIVATE).getString("primaryEPSG","EPSG:32637")));
    coordinateAdditional.setVisibility(secondary < 0 ? View.GONE : View.VISIBLE);
    coordinateAdditional.setText(secondary < 0 ? "" : Coordinates.format(secondary, lat, lon,getPreferences(MODE_PRIVATE).getString("secondaryEPSG","EPSG:32637")));
    if(mapTools!=null)mapTools.update();
    if(mapInfo!=null){mapInfo.update(catalog);positionMapInfo();}
  }

  private void searchMap() {
    EditText input = new EditText(this);
    input.setHint("Название / широта, долгота / UTM / MGRS / СК42 X Y / EPSG:код E N");
    new AlertDialog.Builder(this)
        .setTitle("Поиск на карте — локально")
        .setView(input)
        .setPositiveButton(
            "Найти",
            (d, w) -> {
              String query = input.getText().toString().trim();
              try {
                Vertex location = Coordinates.parse(query);
                map.view.getController().setCenter(new GeoPoint(location.latitude, location.longitude));
                updateCoordinates(); return;
              } catch (IllegalArgumentException invalid) { /* Search names below. */ }
              List<MapItem> results = new ArrayList<>();
              for (MapItem i : store.all()) {
                if (!i.isFolder()
                    && !query.isEmpty()
                    && i.name.toLowerCase(Locale.ROOT).contains(query.toLowerCase(Locale.ROOT))) {
                  results.add(i);
                }
              }
              if (results.isEmpty()) {
                new AlertDialog.Builder(this)
                    .setMessage("Метки не найдены. Введите название или координаты через запятую.")
                    .setPositiveButton("ОК", null)
                    .show();
                return;
              }
              String[] names = new String[results.size()];
              for (int n = 0; n < names.length; n++) names[n] = results.get(n).name;
              sheet(
                  "Найденные метки",
                  names,
                  n -> {
                    map.center(results.get(n));
                    selectedPoint = results.get(n).id;
                    updateCoordinates();
                  });
            })
        .setNegativeButton("Отмена", null)
        .show();
  }

  private void pointActions(MapItem item){mapContextMenu(new GeoPoint(item.latitude,item.longitude));}

  private void pointDetails(MapItem i) {
    new AlertDialog.Builder(this)
        .setTitle(i.name)
        .setMessage(
            String.format(
                Locale.ROOT,
                "Координаты: %.6f, %.6f\nЗначок: %s\nЦвет: #%06X\n%s\n%s",
                i.latitude,
                i.longitude,
                i.icon,
                i.color & 0xffffff, i.description, Geometry.summary(i,DisplayUnits.load(this))+(i.isGeometry()?"\n"+TrackStatistics.of(i).summary(DisplayUnits.load(this)):"")))
        .setPositiveButton(
            "Редактировать", (d, w) -> edit(i, new GeoPoint(i.latitude, i.longitude)))
        .setNeutralButton(i.isGeometry()?"Профиль / Вложения":"Вложения ("+i.attachments.size()+")", (d,w) -> {
          if(i.isGeometry())sheet(i.name,new String[]{"Профиль высот и статистика","Вложения"},n->{if(n==0)profile(i);else attachmentsMenu(i.id);});else attachmentsMenu(i.id);
        })
        .setNegativeButton("Закрыть", null)
        .show();
  }

  private List<MapItem> visibleEntries() {
    if (!displayedOnly) {
      List<MapItem> entries = new ArrayList<>(explorer.entries());
      if (!objectFilter.equals("all")) entries.removeIf(item -> !objectFilter.equals(item.kind));
      return entries;
    }
    List<MapItem> visible = new ArrayList<>();
    for (MapItem i : store.renderItems())
      if (!i.isFolder()
          && store.effectiveOpacity(i) > 0
          && i.name.toLowerCase(Locale.ROOT).contains(explorer.query.toLowerCase(Locale.ROOT))) {
        visible.add(i);
      }
    return visible;
  }

  private int folderCount(long id){int n=0;for(MapItem item:store.all())if(item.parent==id)n++;return n;}
  private void buildExplorer(){
    drawer=new LinearLayout(this);drawer.setOrientation(LinearLayout.VERTICAL);drawer.setBackgroundColor(0xffd6ecff);LinearLayout header=new LinearLayout(this);header.setGravity(Gravity.CENTER_VERTICAL);header.setBackgroundColor(0xffb2d5f2);
    Button places=referenceUi.action("☰",this::explorerPlaces);places.setContentDescription("Места хранения меток");header.addView(places,new LinearLayout.LayoutParams(dp(44),dp(52)));LinearLayout titles=new LinearLayout(this);titles.setOrientation(LinearLayout.VERTICAL);TextView name=new TextView(this);name.setText("Локальные метки");name.setTextColor(ReferenceMenu.TEXT);name.setTextSize(16);titles.addView(name);explorerSubtitle=new TextView(this);explorerSubtitle.setTextSize(11);explorerSubtitle.setTextColor(ReferenceMenu.MUTED);titles.addView(explorerSubtitle);titles.setOnClickListener(v->explorerParent());explorerSubtitle.setOnClickListener(v->explorerParent());header.addView(titles,new LinearLayout.LayoutParams(0,-2,1));
    explorerClipboard=referenceUi.action("▣",this::clipboardMenu);explorerClipboard.setContentDescription("Буфер обмена");header.addView(explorerClipboard,new LinearLayout.LayoutParams(dp(44),dp(52)));Button close=referenceUi.action("×",()->{if(selectionMode){selectionMode=false;explorer.selected.clear();refresh();}else explorerDialog.dismiss();});close.setContentDescription("Закрыть метки");header.addView(close,new LinearLayout.LayoutParams(dp(44),dp(52)));explorerMore=referenceUi.action("⋮",()->explorerHeaderMenu(visibleEntries(),"Метки"));explorerMore.setContentDescription("Меню проводника");header.addView(explorerMore,new LinearLayout.LayoutParams(dp(44),dp(52)));drawer.addView(header);
    search=new EditText(this);search.setTag("explorerSearch");search.setHint("Поиск");search.setSingleLine(true);search.setTextSize(14);search.setVisibility(View.GONE);search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int count,int after){}public void afterTextChanged(Editable e){}public void onTextChanged(CharSequence s,int start,int before,int count){if(!refreshing){explorer.query=s.toString();refresh();}}});drawer.addView(search,new LinearLayout.LayoutParams(-1,dp(48)));
    FrameLayout content=new FrameLayout(this);ScrollView scroll=new ScrollView(this);rows=new LinearLayout(this);rows.setOrientation(LinearLayout.VERTICAL);rows.setPadding(dp(4),dp(4),dp(4),dp(72));scroll.addView(rows);content.addView(scroll,new FrameLayout.LayoutParams(-1,-1));Button add=referenceUi.action("+",this::explorerCreate);explorerAdd=add;add.setTextSize(24);add.setGravity(Gravity.CENTER);add.setContentDescription("Создать объект");GradientDrawable circle=new GradientDrawable();circle.setShape(GradientDrawable.OVAL);circle.setColor(0xffb4daf7);circle.setStroke(dp(1),0xff77b1db);add.setBackground(circle);add.setElevation(dp(3));FrameLayout.LayoutParams fab=new FrameLayout.LayoutParams(dp(48),dp(48),Gravity.BOTTOM|Gravity.END);fab.setMargins(dp(12),dp(12),dp(12),dp(12));content.addView(add,fab);drawer.addView(content,new LinearLayout.LayoutParams(-1,0,1));status=new TextView(this);
  }
  private void explorerParent(){if(explorer.folder==0)return;MapItem folder=store.get(explorer.folder);explorer.folder=folder==null?0:folder.parent;explorer.query="";explorer.selected.clear();selectionMode=false;refresh();}
  private void explorerPlaces(){sheet("Локальные метки",new String[]{"Мои метки","Мои загрузки"},n->{if(n==0){explorer.folder=0;explorer.query="";objectFilter="all";displayedOnly=false;selectionMode=false;explorer.selected.clear();refresh();}else importFile();});}
  private void explorerCreate(){PopupMenu menu=new PopupMenu(this,explorerAdd);String[] names={"Метка","Набор точек","Маршрут","Линия","Область","Папка"};for(int n=0;n<names.length;n++){final int index=n;menu.getMenu().add(0,n,n,names[n]).setOnMenuItemClickListener(item->{if(index==5)newFolder();else if(index==1){EditText input=new EditText(this);new AlertDialog.Builder(this).setTitle("Набор точек").setView(input).setPositiveButton("ОК",(d,w)->run(()->store.create(explorer.folder,input.getText().toString(),"set",0,0))).setNegativeButton("Отмена",null).show();}else{explorerDialog.dismiss();if(index==0)edit(null,(GeoPoint)map.view.getMapCenter());else startDrawing(index==2?"route":index==3?"path":"area",(GeoPoint)map.view.getMapCenter());}return true;});}menu.show();}
  private void clipboardMenu(){List<Long> ids=explorer.clipboardIds();List<String> names=new ArrayList<>();names.add("Вставить все");names.add("Очистить");for(long id:ids){MapItem item=store.get(id);names.add(item==null?"Удалённая метка":item.name);}sheet("Буфер обмена",names.toArray(new String[0]),n->{if(n==0)run(explorer::paste);else if(n==1){explorer.clearClipboard();refresh();}else run(()->explorer.paste(Collections.singleton(ids.get(n-2))));});}
  private void explorerHeaderMenu(List<MapItem> group,String kind){List<Long> ids=new ArrayList<>();for(MapItem i:group)if(!selectionMode||explorer.selected.contains(i.id))ids.add(i.id);String suffix=selectionMode?"выбранные":"все";PopupMenu menu=new PopupMenu(this,explorerMore);String[] names={"Показать "+suffix,"Убрать "+suffix,"Экспортировать как…","Копировать "+suffix,"Вырезать "+suffix,"Изменить цвет","Удалить "+suffix,"Выбрать все","Снять выделение","Предпросмотр","Список","Поиск","Сортировать по имени","Импортировать метки"};for(int n=0;n<names.length;n++){final int index=n;menu.getMenu().add(0,n,n,names[n]).setOnMenuItemClickListener(item->{if(index<=6){explorer.selected.clear();explorer.selected.addAll(ids);if(index==0||index==1)run(()->store.style(ids,index==0,null,null));else if(index==2)exportFile();else if(index==3||index==4)run(()->explorer.clipboard(index==4));else if(index==5)style();else delete();}else if(index==7||index==8){selectionMode=true;explorer.selected.clear();if(index==7)for(MapItem i:group)explorer.selected.add(i.id);refresh();}else if(index==9||index==10){getPreferences(MODE_PRIVATE).edit().putBoolean("preview:"+kind,index==9).apply();cards=index==9;refresh();}else if(index==11){search.setVisibility(View.VISIBLE);search.requestFocus();}else if(index==12){explorer.alphabetical=!explorer.alphabetical;refresh();}else importFile();return true;});}menu.show();}
  private void refresh(){
    explorer.reconcile();if(timeline!=null)timeline.refreshBounds();map.refresh(store);if(rows==null)return;
    MapItem folder=store.get(explorer.folder);explorerSubtitle.setText(selectionMode?"Выбрано: "+explorer.selected.size():displayedOnly?"Метки на экране":folder==null?"Мои метки":folder.name);explorerClipboard.setVisibility(explorer.hasClipboard()?View.VISIBLE:View.GONE);refreshing=true;if(!search.getText().toString().equals(explorer.query))search.setText(explorer.query);refreshing=false;
    rows.removeAllViews();Map<String,List<MapItem>> groups=new LinkedHashMap<>();for(MapItem item:visibleEntries()){String kind=item.isFolder()?"Папки":item.kind.equals("point")?"Путевые точки":item.kind.equals("route")?"Маршруты":item.kind.equals("area")?"Области":"Линии и треки";if(!groups.containsKey(kind))groups.put(kind,new ArrayList<>());groups.get(kind).add(item);}
    for(Map.Entry<String,List<MapItem>> group:groups.entrySet()){String kind=group.getKey();referenceUi.heading(rows,kind,"⋮",()->explorerHeaderMenu(group.getValue(),kind));boolean preview=getPreferences(MODE_PRIVATE).getBoolean("preview:"+kind,false);for(MapItem item:group.getValue()){
      LinearLayout row=new LinearLayout(this);row.setGravity(Gravity.CENTER_VERTICAL);row.setMinimumHeight(dp(preview?88:48));row.setBackgroundColor(explorer.selected.contains(item.id)?0xff8bc5ef:Color.TRANSPARENT);
      if(selectionMode){CheckBox select=new CheckBox(this);select.setContentDescription("Выбрать "+item.name);select.setChecked(explorer.selected.contains(item.id));select.setOnClickListener(v->{explorer.toggle(item.id);refresh();});row.addView(select,new LinearLayout.LayoutParams(dp(40),dp(48)));}
      ImageView icon=new ImageView(this);icon.setPadding(dp(8),dp(8),dp(8),dp(8));if(item.isFolder())icon.setImageResource(R.drawable.ui_folder);else try{String svg=item.icon.startsWith("builtin:")?ru.warriorrus.app.icons.IconLibrary.builtinText(item.icon):ru.warriorrus.app.icons.IconLibrary.open(this).text(item.icon);icon.setImageDrawable(ru.warriorrus.app.icons.SvgPreview.render(getResources(),svg,item.color,dp(28)));}catch(Exception missing){icon.setImageResource(R.drawable.ui_pin);}icon.setContentDescription("Меню "+item.name);icon.setOnClickListener(v->context(item,icon));row.addView(icon,new LinearLayout.LayoutParams(dp(44),dp(44)));
      LinearLayout labels=new LinearLayout(this);labels.setOrientation(LinearLayout.VERTICAL);TextView title=hudText(item.name,15);title.setPadding(dp(3),dp(2),dp(3),dp(2));title.setContentDescription(item.typeName()+" "+item.name);labels.addView(title);TextView info=hudText(item.isFolder()?folderCount(item.id)+" объектов":item.isGeometry()?Geometry.summary(item,DisplayUnits.load(this)):Coordinates.format(getPreferences(MODE_PRIVATE).getInt("primaryCoordinates",0),item.latitude,item.longitude,getPreferences(MODE_PRIVATE).getString("primaryEPSG","EPSG:32637")),10);info.setPadding(dp(3),0,dp(3),dp(3));labels.addView(info);row.addView(labels,new LinearLayout.LayoutParams(0,-2,1));Runnable open=()->{if(selectionMode){explorer.toggle(item.id);refresh();}else if(item.isFolder()){explorer.open(item.id);refresh();}else pointDetails(item);};labels.setOnClickListener(v->open.run());title.setOnClickListener(v->open.run());row.setOnClickListener(v->open.run());row.setOnLongClickListener(v->{if(preview){selectionMode=true;explorer.selected.add(item.id);refresh();}else context(item,row);return true;});title.setOnLongClickListener(v->{context(item,title);return true;});if(preview){Button more=referenceUi.action("⋮",()->context(item,row));more.setContentDescription("Меню "+item.name);row.addView(more,new LinearLayout.LayoutParams(dp(40),dp(48)));}rows.addView(row,new LinearLayout.LayoutParams(-1,-2));
    }}if(groups.isEmpty())referenceUi.note(rows,explorer.query.isEmpty()?"Нет меток":"Ничего не найдено");updateCoordinates();
  }

  private void context(MapItem item,View anchor){
    AlertDialog dialog=new AlertDialog.Builder(this).setTitle(item.typeName()).create();LinearLayout panel=referenceUi.panel();ScrollView scroll=new ScrollView(this);scroll.addView(panel);Runnable select=()->{explorer.selected.clear();explorer.selected.add(item.id);};
    referenceUi.row(panel,item.isFolder()?"Открыть":"Подробнее",0,()->{dialog.dismiss();if(item.isFolder()){explorer.open(item.id);refresh();}else pointDetails(item);});
    referenceUi.row(panel,item.visible?"Убрать с карты":"Показать на карте",R.drawable.ui_map,()->{dialog.dismiss();run(()->store.style(Collections.singleton(item.id),!item.visible,null,null));});
    referenceUi.heading(panel,"Буфер обмена","",null);referenceUi.row(panel,"Копировать",0,()->{dialog.dismiss();select.run();run(()->explorer.clipboard(false));});referenceUi.row(panel,"Вырезать",0,()->{dialog.dismiss();select.run();run(()->explorer.clipboard(true));});
    referenceUi.heading(panel,"Множественный выбор","",null);referenceUi.row(panel,"Выбрать",0,()->{dialog.dismiss();selectionMode=true;explorer.toggle(item.id);refresh();});
    referenceUi.heading(panel,"Редактирование","",null);referenceUi.row(panel,"Изменить цвет",0,()->{dialog.dismiss();select.run();style();});referenceUi.row(panel,"Редактировать параметры",0,()->{dialog.dismiss();edit(item,new GeoPoint(item.latitude,item.longitude));});if(item.isGeometry())referenceUi.row(panel,"Редактировать профиль",0,()->{dialog.dismiss();profile(item);});referenceUi.row(panel,"Удалить",0,()->{dialog.dismiss();select.run();delete();});dialog.setView(scroll);dialog.show();
  }

  private void newFolder() {
    EditText input = new EditText(this);
    input.setHint("Название папки");
    AlertDialog d =
        new AlertDialog.Builder(this)
            .setTitle("Новая папка")
            .setView(input)
            .setPositiveButton("Создать", null)
            .setNegativeButton("Отмена", null)
            .create();
    d.setOnShowListener(
        v ->
            d.getButton(-1)
                .setOnClickListener(
                    w -> {
                      try {
                        store.create(explorer.folder, input.getText().toString(), "folder", 0, 0);
                        d.dismiss();
                        refresh();
                      } catch (Exception e) {
                        input.setError(e.getMessage());
                      }
                    }));
    d.show();
  }

  private void edit(MapItem item, GeoPoint point) {
    if (item != null && item.isGeometry()) {
      if (explorerDialog != null) explorerDialog.dismiss();
      timeline.close();drawing.start(item, item.kind, item.parent, null); return;
    }
    LinearLayout form = new LinearLayout(this);
    form.setOrientation(LinearLayout.VERTICAL);
    EditText name = new EditText(this);
    name.setHint("Название");
    if (item != null) name.setText(item.name);
    form.addView(name);
    EditText lat = new EditText(this), lon = new EditText(this);
    lat.setHint("Широта −90…90");
    lon.setHint("Долгота −180…180");
    lat.setText("" + point.getLatitude());
    lon.setText("" + point.getLongitude());
    if (item == null || !item.isFolder()) {
      form.addView(lat);
      form.addView(lon);
    }
    EditText description = new EditText(this);
    description.setHint("Описание / заметка");
    description.setMinLines(2);
    if (item != null) description.setText(item.description);
    form.addView(description);
    AlertDialog d =
        new AlertDialog.Builder(this)
            .setTitle(item == null ? "Новая точка" : "Редактор объекта")
            .setView(form)
            .setPositiveButton("Сохранить", null)
            .setNegativeButton("Отмена", null)
            .create();
    d.setOnShowListener(
        v ->
            d.getButton(-1)
                .setOnClickListener(
                    w -> {
                      try {
                        double a = Double.parseDouble(lat.getText().toString()),
                            b = Double.parseDouble(lon.getText().toString());
                        MapItem saved = item == null ? new MapItem() : item;
                        if (item == null) {
                          saved.parent = explorer.folder; saved.kind = "point"; saved.visible = true;
                          saved.opacity = 1; saved.color = 0xff3f6db5;
                        }
                        saved.name = name.getText().toString(); saved.latitude = a; saved.longitude = b;
                        saved.description = description.getText().toString();
                        store.save(saved);
                        d.dismiss();
                        refresh();
                      } catch (Exception e) {
                        name.setError(e.getMessage());
                      }
                    }));
    d.show();
  }

  private void delete() {
    if (explorer.selected.isEmpty()) return;
    new AlertDialog.Builder(this)
        .setTitle("Удалить выбранные объекты?")
        .setMessage(
            "Объекты переместятся в корзину. Восстановление доступно после перезапуска приложения.")
        .setPositiveButton(
            "Удалить",
            (d, w) ->
                run(
                    () -> {
                      store.delete(explorer.selected);
                      explorer.selected.clear();
                    }))
        .setNegativeButton("Отмена", null)
        .show();
  }

  private void style() {
    if (explorer.selected.isEmpty()) return;
    LinearLayout form = new LinearLayout(this);
    form.setOrientation(LinearLayout.VERTICAL);
    CheckBox visible = new CheckBox(this);
    visible.setText("Отображать на карте");
    visible.setChecked(true);
    form.addView(visible);
    TextView value = label("Непрозрачность 100%", 14);
    form.addView(value);
    SeekBar alpha = new SeekBar(this);
    alpha.setMax(100);
    alpha.setProgress(100);
    form.addView(alpha);
    alpha.setOnSeekBarChangeListener(
        new SeekBar.OnSeekBarChangeListener() {
          public void onProgressChanged(SeekBar b, int p, boolean user) {
            value.setText("Непрозрачность " + p + "%");
          }

          public void onStartTrackingTouch(SeekBar b) {}

          public void onStopTrackingTouch(SeekBar b) {}
        });
    Spinner colors = new Spinner(this);
    colors.setAdapter(
        new ArrayAdapter<>(
            this,
            android.R.layout.simple_spinner_dropdown_item,
            new String[] {"Синий", "Красный", "Зелёный", "Оранжевый"}));
    form.addView(colors);
    int[] palette = {0xff3f6db5, 0xffd04444, 0xff25834b, 0xffdf8c24};
    new AlertDialog.Builder(this)
        .setTitle("Групповой стиль слоя")
        .setView(form)
        .setPositiveButton(
            "Применить",
            (d, w) ->
                run(
                    () ->
                        store.style(
                            explorer.selected,
                            visible.isChecked(),
                            alpha.getProgress() / 100f,
                            palette[colors.getSelectedItemPosition()])))
        .setNegativeButton("Отмена", null)
        .show();
  }

  private long parseDate(String value,boolean end)throws Exception {
    if(value.trim().isEmpty())return 0;java.text.SimpleDateFormat format=new java.text.SimpleDateFormat("dd.MM.yyyy",Locale.ROOT);format.setLenient(false);java.text.ParsePosition position=new java.text.ParsePosition(0);java.util.Date date=format.parse(value.trim(),position);if(date==null||position.getIndex()!=value.trim().length())throw new IllegalArgumentException("Введите дату в формате дд.мм.гггг");
    Calendar calendar=Calendar.getInstance();calendar.setTime(date);if(end)calendar.add(Calendar.DAY_OF_MONTH,1);return calendar.getTimeInMillis();
  }
  private void filtersMenu() {
    LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);EditText query=new EditText(this),from=new EditText(this),to=new EditText(this);query.setHint("Часть названия");query.setText(explorer.query);from.setHint("С даты · дд.мм.гггг");to.setHint("По дату включительно · дд.мм.гггг");
    java.text.SimpleDateFormat format=new java.text.SimpleDateFormat("dd.MM.yyyy",Locale.ROOT);if(explorer.fromDate>0)from.setText(format.format(new Date(explorer.fromDate)));if(explorer.toDate>0)to.setText(format.format(new Date(explorer.toDate-1)));
    CheckBox notes=new CheckBox(this);notes.setText("Искать также в описаниях");notes.setChecked(explorer.descriptions);form.addView(query);form.addView(from);form.addView(to);form.addView(notes);
    TextView explanation=new TextView(this);explanation.setText("Диапазон применяется к дате создания. У объектов старых версий и некоторых импортированных файлов дата может отсутствовать.");form.addView(explanation);
    AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Фильтры объектов").setView(form).setPositiveButton("Применить",null).setNeutralButton("Сбросить",(d,w)->{explorer.fromDate=explorer.toDate=0;explorer.query="";explorer.descriptions=false;refresh();}).setNegativeButton("Отмена",null).create();
    dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{try{long a=parseDate(from.getText().toString(),false),b=parseDate(to.getText().toString(),true);if(a>0&&b>0&&a>=b)throw new IllegalArgumentException("Начало диапазона позже конца");explorer.query=query.getText().toString();explorer.fromDate=a;explorer.toDate=b;explorer.descriptions=notes.isChecked();refresh();dialog.dismiss();}catch(Exception error){from.setError(error.getMessage());}}));dialog.show();
  }
  private void groupSelected() {
    if(explorer.selected.isEmpty()){fileError("Выберите объекты");return;}
    EditText name=new EditText(this);name.setHint("Название набора");CheckBox move=new CheckBox(this);move.setText("Переместить выбранные (иначе создать копии)");LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);form.addView(name);form.addView(move);
    AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Собрать в набор меток").setView(form).setPositiveButton("Создать",null).setNegativeButton("Отмена",null).create();
    dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{try{store.group(explorer.selected,explorer.folder,name.getText().toString(),move.isChecked());explorer.selected.clear();refresh();dialog.dismiss();}catch(Exception e){name.setError(e.getMessage());}}));dialog.show();
  }
  private void mergeSelected() {
    List<MapItem> sources=new ArrayList<>();for(long id:explorer.selected){MapItem i=store.get(id);if(i==null||!i.isGeometry()||"area".equals(i.kind)){fileError("Выберите только маршруты, линии или треки");return;}sources.add(i);}
    if(sources.size()<2){fileError("Выберите минимум два объекта");return;}
    EditText name=new EditText(this);name.setHint("Название объединённого трека");
    AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Объединить, сохранив разрывы").setMessage("Исходные объекты сохранятся. Сегменты будут добавлены в порядке выделения.").setView(name).setPositiveButton("Объединить",null).setNegativeButton("Отмена",null).create();
    dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{try{MapItem result=new MapItem();result.kind="track";result.name=name.getText().toString();result.parent=explorer.folder;result.visible=true;result.opacity=1;result.color=sources.get(0).color;Set<String> media=new HashSet<>();StringBuilder notes=new StringBuilder();
      for(MapItem i:sources){result.segments.addAll(Geometry.decode(Geometry.encode(i.segments)));notes.append(i.name).append("\n").append(i.description).append("\n");for(Attachment a:i.attachments)if(media.add(a.key))result.attachments.add(a);}
      result.description=notes.toString();Vertex first=result.segments.get(0).get(0);result.latitude=first.latitude;result.longitude=first.longitude;store.save(result);refresh();dialog.dismiss();
    }catch(Exception e){name.setError(e.getMessage());}}));dialog.show();
  }
  private void profile(MapItem item) {
    Dialog dialog=new Dialog(this);LinearLayout panel=new LinearLayout(this);panel.setOrientation(LinearLayout.VERTICAL);panel.setBackground(plate());panel.setPadding(dp(12),dp(12),dp(12),dp(12));panel.addView(hudText(item.name,18));panel.addView(hudText(Geometry.summary(item,DisplayUnits.load(this))+"\n"+TrackStatistics.of(item).summary(DisplayUnits.load(this)),14));
    panel.addView(new ElevationProfile(this,item),new LinearLayout.LayoutParams(-1,dp(190)));panel.addView(compact("Закрыть",dialog::dismiss));ScrollView scroll=new ScrollView(this);scroll.addView(panel);showPanel(dialog,scroll,dp(520),false);
  }
  private void templatesMenu(boolean save) {
    if(save){if(explorer.selected.size()!=1){fileError("Выберите одну метку");return;}MapItem item=store.get(explorer.selected.iterator().next());if(item==null||!"point".equals(item.kind)){fileError("Шаблон создаётся из обычной метки");return;}
      EditText name=new EditText(this);name.setHint("Имя шаблона");new AlertDialog.Builder(this).setTitle("Сохранить шаблон метки").setView(name).setPositiveButton("Сохранить",(d,w)->{try{org.json.JSONObject saved=new org.json.JSONObject(getPreferences(MODE_PRIVATE).getString("templates","{}"));MapItem template=ObjectJson.decode(ObjectJson.encode(Collections.singletonList(item))).get(0);template.attachments.clear();saved.put(name.getText().toString(),new org.json.JSONArray(ObjectJson.encode(Collections.singletonList(template))));getPreferences(MODE_PRIVATE).edit().putString("templates",saved.toString()).apply();}catch(Exception e){fileError(e.getMessage());}}).setNegativeButton("Отмена",null).show();return;}
    try{org.json.JSONObject saved=new org.json.JSONObject(getPreferences(MODE_PRIVATE).getString("templates","{}"));List<String> names=new ArrayList<>();java.util.Iterator<String> keys=saved.keys();while(keys.hasNext())names.add(keys.next());if(names.isEmpty()){fileError("Сначала сохраните шаблон из выделенной метки");return;}
      sheet("Шаблоны меток",names.toArray(new String[0]),n->{try{MapItem template=ObjectJson.decode(saved.getJSONArray(names.get(n)).toString()).get(0);template.id=0;template.parent=explorer.folder;template.created=template.updated=0;edit(template,(GeoPoint)map.view.getMapCenter());}catch(Exception e){fileError(e.getMessage());}});
    }catch(Exception e){fileError(e.getMessage());}
  }
  private void smartSelections() {
    try{org.json.JSONObject saved=new org.json.JSONObject(getPreferences(MODE_PRIVATE).getString("smartSelections","{}"));List<String> names=new ArrayList<>();names.add("Сохранить текущие фильтры");java.util.Iterator<String> keys=saved.keys();while(keys.hasNext())names.add(keys.next());
      sheet("Умные подборки",names.toArray(new String[0]),n->{if(n==0){EditText name=new EditText(this);name.setHint("Название подборки");new AlertDialog.Builder(this).setTitle("Сохранить условия поиска").setView(name).setPositiveButton("Сохранить",(d,w)->{try{saved.put(name.getText().toString(),new org.json.JSONObject().put("query",explorer.query).put("from",explorer.fromDate).put("to",explorer.toDate).put("descriptions",explorer.descriptions).put("type",objectFilter));getPreferences(MODE_PRIVATE).edit().putString("smartSelections",saved.toString()).apply();}catch(Exception e){fileError(e.getMessage());}}).setNegativeButton("Отмена",null).show();}
        else try{org.json.JSONObject query=saved.getJSONObject(names.get(n));explorer.folder=0;explorer.query=query.getString("query");explorer.fromDate=query.getLong("from");explorer.toDate=query.getLong("to");explorer.descriptions=query.getBoolean("descriptions");objectFilter=query.getString("type");refresh();}catch(Exception e){fileError(e.getMessage());}
      });
    }catch(Exception e){fileError(e.getMessage());}
  }

  private void addOnlineMap() {
    LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);
    EditText name=new EditText(this),url=new EditText(this),credit=new EditText(this);
    name.setHint("Название карты");url.setHint("https://server/{z}/{x}/{y}.png");url.setSingleLine(true);credit.setHint("Источник и сведения об авторских правах");
    CheckBox download=new CheckBox(this);download.setText("Сервер разрешает скачивание области для офлайн-работы");
    form.addView(name);form.addView(url);form.addView(credit);form.addView(download);
    AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Добавить HTTPS-источник").setView(form).setPositiveButton("Добавить",null).setNegativeButton("Отмена",null).create();
    dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{try{catalog.addOnline(name.getText().toString(),url.getText().toString(),credit.getText().toString(),download.isChecked());dialog.dismiss();}catch(Exception e){url.setError(e.getMessage());}}));dialog.show();
  }

  private void importMap() {
    Intent intent=new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*").putExtra(Intent.EXTRA_LOCAL_ONLY,true);
    try{startActivityForResult(intent,IMPORT_MAP);}catch(android.content.ActivityNotFoundException e){fileError("Нет файлового менеджера");}
  }

  private void catalogMenu() {
    List<String> labels=new ArrayList<>();for(MapCatalog.Layer l:catalog.layers)labels.add((l.visible?"✓ ":"○ ")+l.name+(l.offline()?" · офлайн":""));
    sheet("Доступные карты",labels.toArray(new String[0]),n->{MapCatalog.Layer l=catalog.layers.get(n);
      sheet(l.name,new String[]{l.visible?"Скрыть":"Показать", "Сведения об источнике","Экспорт файла карты"},action->{
        if(action==0){l.visible=!l.visible;catalog.save();catalog.updateAppearance();mapLayerVisible=catalog.find("osm").visible;}
        else if(action==1)new AlertDialog.Builder(this).setTitle(l.name).setMessage(l.credit).setPositiveButton("ОК",null).show();
        else exportRaster(l);
      });
    });
  }

  private void exportRaster(MapCatalog.Layer layer) {
    if(!layer.offline()){fileError("Экспорт доступен для локальных архивов. Для онлайн-источника сначала скачайте разрешённую область.");return;}
    if(ru.warriorrus.app.map.TileDownloadService.running){fileError("Сначала завершите или приостановите загрузку карты");return;}
    exportRasterPath=layer.path;
    Intent intent=new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("application/octet-stream").putExtra(Intent.EXTRA_TITLE,layer.name+"."+layer.path.substring(layer.path.lastIndexOf('.')+1)).putExtra(Intent.EXTRA_LOCAL_ONLY,true);
    try{startActivityForResult(intent,EXPORT_MAP);}catch(android.content.ActivityNotFoundException e){fileError("Нет файлового менеджера");}
  }

  private void chooseAreaDownload() {
    List<MapCatalog.Layer> candidates=new ArrayList<>();List<String> names=new ArrayList<>();
    for(MapCatalog.Layer l:catalog.layers)if(!l.offline()&&l.downloadAllowed&&!l.url.isEmpty()){candidates.add(l);names.add(l.name);}
    if(candidates.isEmpty()){fileError("Добавьте HTTPS-источник, который разрешает офлайн-загрузку области. Публичный сервер OSM не предоставляет такой режим.");return;}
    sheet("Источник для загрузки",names.toArray(new String[0]),n->configureArea(candidates.get(n)));
  }

  private void configureArea(MapCatalog.Layer layer) {
    org.osmdroid.util.BoundingBox box=map.view.getBoundingBox();
    LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);
    String[] hints={"Южная широта","Западная долгота","Северная широта","Восточная долгота","Минимальный масштаб (0…22)","Максимальный масштаб (0…22)"};
    String[] values={""+Math.max(-85.05112878,box.getLatSouth()),""+box.getLonWest(),""+Math.min(85.05112878,box.getLatNorth()),""+box.getLonEast(),""+Math.max(layer.min,(int)map.view.getZoomLevelDouble()),""+Math.min(layer.max,(int)map.view.getZoomLevelDouble()+2)};
    EditText[] fields=new EditText[6];for(int n=0;n<fields.length;n++){fields[n]=new EditText(this);fields[n].setHint(hints[n]);fields[n].setText(values[n]);form.addView(fields[n]);}
    ScrollView scroll=new ScrollView(this);scroll.addView(form);
    AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Область и глубина · "+layer.name).setView(scroll).setPositiveButton("Проверить",null).setNegativeButton("Отмена",null).create();
    dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{try {
      ru.warriorrus.app.map.TileDownload.Spec spec=new ru.warriorrus.app.map.TileDownload.Spec();spec.name=layer.name+" · область";spec.credit=layer.credit;spec.url=layer.url;spec.south=Double.parseDouble(fields[0].getText().toString());spec.west=Double.parseDouble(fields[1].getText().toString());spec.north=Double.parseDouble(fields[2].getText().toString());spec.east=Double.parseDouble(fields[3].getText().toString());spec.min=Integer.parseInt(fields[4].getText().toString());spec.max=Integer.parseInt(fields[5].getText().toString());
      int count=ru.warriorrus.app.map.TileDownload.tiles(spec).size();
      new AlertDialog.Builder(this).setTitle("Скачать "+count+" тайлов?").setMessage("Карта сохранится в MBTiles. Уже сохранённые тайлы повторно не скачиваются. Задание можно приостановить и продолжить.")
          .setPositiveButton("Скачать",(d,b)->{
            try {
              if(ru.warriorrus.app.map.TileDownloadService.running){fileError("Другая загрузка уже выполняется");return;}
              File root=new File(getFilesDir(),"maps");if(!root.isDirectory()&&!root.mkdirs())throw new IOException("Хранилище карт недоступно");spec.file=UUID.randomUUID()+".mbtiles";
              File file=new File(root,spec.file);try(android.database.sqlite.SQLiteDatabase db=android.database.sqlite.SQLiteDatabase.openOrCreateDatabase(file,null)){RasterMaps.createMbtiles(db,spec.name);}
              catalog.addOffline(file,spec.name,spec.min,spec.max);startTileService(spec.json());dialog.dismiss();showDownloadStatus();
            }catch(Exception e){fileError(e.getMessage());}
          }).setNegativeButton("Назад",null).show();
    }catch(Exception e){fields[0].setError(e.getMessage());}}));dialog.show();
  }

  private void startTileService(String spec) {
    Intent service=new Intent(this,ru.warriorrus.app.map.TileDownloadService.class).putExtra("spec",spec);
    if(android.os.Build.VERSION.SDK_INT>=26)startForegroundService(service);else startService(service);
  }

  private void showDownloadStatus() {
    if(downloadDialog!=null)downloadDialog.dismiss();downloadDialog=new Dialog(this);Dialog dialog=downloadDialog;
    LinearLayout panel=new LinearLayout(this);panel.setOrientation(LinearLayout.VERTICAL);panel.setBackground(plate());panel.setPadding(dp(12),dp(12),dp(12),dp(12));
    panel.addView(hudText("Офлайн-загрузка",18));TextView status=hudText("",14);panel.addView(status);
    panel.addView(compact("Приостановить",()->startService(new Intent(this,ru.warriorrus.app.map.TileDownloadService.class).setAction("cancel"))));
    panel.addView(compact("Продолжить последнее задание",()->{if(!ru.warriorrus.app.map.TileDownloadService.running){String spec=getSharedPreferences("tileDownload",0).getString("spec","");if(spec.isEmpty())fileError("Нет сохранённого задания");else try{startTileService(spec);}catch(Exception e){fileError(e.getMessage());}}}));
    panel.addView(compact("Закрыть",dialog::dismiss));android.os.Handler handler=new android.os.Handler(android.os.Looper.getMainLooper());
    Runnable update=new Runnable(){public void run(){if(!dialog.isShowing())return;status.setText(getSharedPreferences("tileDownload",0).getString("status","Нет задания"));handler.postDelayed(this,1000);}};
    dialog.setOnDismissListener(d->{handler.removeCallbacksAndMessages(null);catalog.rebuild();});showPanel(dialog,panel,dp(360),false);handler.post(update);
  }

  private void attachmentsMenu(long objectId) {
    MapItem object=store.get(objectId);if(object==null)return;
    if(attachmentsDialog!=null)attachmentsDialog.dismiss();Dialog dialog=new Dialog(this);attachmentsDialog=dialog;LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);
    content.setPadding(dp(12),dp(8),dp(12),dp(8));content.setBackground(plate());content.addView(hudText("Вложения · "+object.name,18));
    if(object.attachments.isEmpty())content.addView(hudText("Пока нет вложений",14));
    for(Attachment attachment:object.attachments) {
      content.addView(compact(attachment.name+" · "+String.format(Locale.ROOT,"%.1f МиБ",attachment.size/1048576.0),()->{
        sheet(attachment.name,new String[]{"Открыть","Удалить вложение"},action->{
          if(action==0) {
            android.net.Uri uri=android.net.Uri.parse("content://"+getPackageName()+".localfiles/media/"+attachment.key);
            Intent view=new Intent(Intent.ACTION_VIEW).setDataAndType(uri,attachment.mime).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            view.setClipData(ClipData.newRawUri("Вложение",uri));
            try{startActivity(view);}catch(android.content.ActivityNotFoundException unavailable){fileError("Нет приложения для просмотра этого типа файла");}
          } else new AlertDialog.Builder(this).setTitle("Удалить вложение из объекта?").setMessage("Копии других объектов останутся доступны. Операцию можно отменить.")
              .setPositiveButton("Удалить",(d,w)->run(()->{
                MapItem current=store.get(objectId);if(current==null)return;current.attachments.removeIf(a->a.key.equals(attachment.key));store.save(current);
                try{new ru.warriorrus.app.media.LocalMedia(this).cleanup(store.referencedMedia());}catch(IOException ignored){}
                dialog.dismiss();attachmentsMenu(objectId);
              })).setNegativeButton("Отмена",null).show();
        });
      }));
    }
    content.addView(compact("Добавить фото / видео / аудио",()->{
      attachmentObject=objectId;Intent choose=new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*")
          .putExtra(Intent.EXTRA_MIME_TYPES,new String[]{"image/*","video/*","audio/*"}).putExtra(Intent.EXTRA_LOCAL_ONLY,true);
      dialog.dismiss();try{startActivityForResult(choose,ATTACH_FILE);}catch(android.content.ActivityNotFoundException missing){fileError("Нет файлового менеджера");}
    }));
    content.addView(compact("Закрыть",dialog::dismiss));ScrollView scroll=new ScrollView(this);scroll.addView(content);showPanel(dialog,scroll,dp(420),false);
  }

  private void attachFile(android.net.Uri uri,long id) {
    String mime=getContentResolver().getType(uri),name="Вложение";
    try(android.database.Cursor cursor=getContentResolver().query(uri,new String[]{android.provider.OpenableColumns.DISPLAY_NAME},null,null,null)){
      if(cursor!=null&&cursor.moveToFirst())name=cursor.getString(0);
    }catch(Exception ignored){}
    final String label=name,type=mime;
    Toast.makeText(this,"Сохранение вложения…",Toast.LENGTH_SHORT).show();
    new Thread(()->{
      try {
        ru.warriorrus.app.media.LocalMedia media=new ru.warriorrus.app.media.LocalMedia(this);Attachment file;
        try(InputStream input=getContentResolver().openInputStream(uri)){if(input==null)throw new IOException("Файл недоступен");file=media.add(input,label,type);}
        runOnUiThread(()->{
          if(isFinishing()||isDestroyed()){try{media.resolve(file.key).delete();}catch(IOException ignored){}return;}
          MapItem current=store.get(id);if(current==null){try{media.resolve(file.key).delete();}catch(IOException ignored){}fileError("Объект уже удалён");return;}
          run(()->{current.attachments.add(file);store.save(current);});attachmentsMenu(id);
        });
      }catch(Exception error){runOnUiThread(()->fileError(error.getMessage()));}
    },"local-media-copy").start();
  }

  private void trashMenu() {
    List<MapItem> trash=new ArrayList<>();for(MapItem i:store.includingTrash())if(i.trashed)trash.add(i);
    List<String> labels=new ArrayList<>();labels.add("Восстановить всё");labels.add("Очистить корзину");for(MapItem i:trash)labels.add(i.typeName()+" · "+i.name);
    sheet("Корзина · объектов: "+trash.size(),labels.toArray(new String[0]),n->{
      if(n==0)run(()->{List<Long> ids=new ArrayList<>();for(MapItem i:trash)ids.add(i.id);store.restoreTrash(ids);});
      else if(n==1)new AlertDialog.Builder(this).setTitle("Очистить корзину навсегда?").setMessage("Удалятся объекты корзины и история отмены. Вложения, используемые другими объектами, сохранятся.")
          .setPositiveButton("Очистить",(d,w)->run(()->{store.emptyTrash();try{new ru.warriorrus.app.media.LocalMedia(this).cleanup(store.referencedMedia());}catch(IOException ignored){}})).setNegativeButton("Отмена",null).show();
      else {MapItem item=trash.get(n-2);new AlertDialog.Builder(this).setTitle(item.name).setPositiveButton("Восстановить",(d,w)->run(()->store.restoreTrash(Collections.singleton(item.id)))).setNegativeButton("Назад",(d,w)->trashMenu()).show();}
    });
  }

  private void startDrawing(String kind, GeoPoint point) {
    if (explorerDialog != null) explorerDialog.dismiss();
    if(mapTools!=null&&mapTools.measuring){fileError("Сначала закройте измерение");return;}
    if(timeline!=null)timeline.close();
    drawing.start(null, kind, explorer.folder, point);
  }

  private void applySettings() {
    android.content.SharedPreferences prefs = getPreferences(MODE_PRIVATE);
    map.grid.coordinateMode=prefs.getInt("primaryCoordinates",0);map.grid.custom=prefs.getString("primaryEPSG","EPSG:32637");
    map.labelsVisible = prefs.getBoolean("placemarkLabels", true);
    map.markerSize = Math.max(8,Math.min(56,prefs.getInt("markerSize",24)));
    map.lineWidth = prefs.getInt("lineWidth", 3);
    if(screen!=null)screen.apply();
    View coordinatePanel=mapRoot.findViewWithTag("coordinatePanel");if(coordinatePanel!=null)coordinatePanel.setVisibility(prefs.getBoolean("coordinateInfo",true)?View.VISIBLE:View.GONE);
    map.view.setMultiTouchControls(prefs.getBoolean("pinchZoom",true));map.rotation.setEnabled(prefs.getBoolean("manualRotation",true));View zoom=mapRoot.findViewWithTag("zoomControls");if(zoom!=null)zoom.setVisibility(prefs.getBoolean("zoomButtons",true)?View.VISIBLE:View.GONE);
    if (prefs.getBoolean("keepScreenOn", false)) getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
    else getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
    updateCoordinates();
    if (drawer != null && rows != null) refresh();
  }

  private void settingsMenu(){settingsDialog=new Dialog(this);SettingsScreen settings=new SettingsScreen(this,()->settingsDialog.dismiss(),()->{applySettings();updateCompass();if(drawing!=null)drawing.updateUnits();});showPanel(settingsDialog,settings.view(),getResources().getDisplayMetrics().widthPixels,true);}

  private void importFile() {
    importParent = explorer.folder;
    Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
        .setType("*/*").putExtra(Intent.EXTRA_LOCAL_ONLY, true);
    try { startActivityForResult(intent, IMPORT_FILE); }
    catch (android.content.ActivityNotFoundException missing) { fileError("На устройстве нет файлового менеджера"); }
  }

  private static String exportMime(String format) {
    switch(format) {
      case "kmz": return "application/vnd.google-earth.kmz";
      case "kml": return "application/vnd.google-earth.kml+xml";
      case "gpx": return "application/gpx+xml";
      case "geojson": return "application/geo+json";
      case "csv": return "text/csv";
      case "tsv": return "text/tab-separated-values";
      default: return "application/dxf";
    }
  }

  private void exportFile() {
    exportSelection = new ArrayList<>(explorer.selected);
    sheet("Формат экспорта", new String[]{"KMZ", "KML", "GPX", "GeoJSON", "CSV", "TSV", "DXF"}, n -> {
      exportFormat = new String[]{"kmz", "kml", "gpx", "geojson", "csv", "tsv", "dxf"}[n];
      List<MapItem> snapshot = store.exportItems(exportSelection);
      if (snapshot.isEmpty()) { fileError("Нет объектов для экспорта"); return; }
      if(!"kmz".equals(exportFormat))for(MapItem i:snapshot)if(!i.attachments.isEmpty()){fileError("Для экспорта вложений выберите KMZ");return;}
      if ("gpx".equals(exportFormat)) for (MapItem i : snapshot) if ("area".equals(i.kind)) {
        fileError("GPX не поддерживает области. Выберите KMZ или KML."); return;
      }
      Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
          .setType(exportMime(exportFormat))
          .putExtra(Intent.EXTRA_TITLE, "Rabochaya-karta."+exportFormat).putExtra(Intent.EXTRA_LOCAL_ONLY, true);
      try { startActivityForResult(intent, EXPORT_FILE); }
      catch (android.content.ActivityNotFoundException missing) { fileError("На устройстве нет файлового менеджера"); }
    });
  }

  private void fileError(String message) {
    if (isFinishing() || isDestroyed()) return;
    new AlertDialog.Builder(this).setTitle("Файлы объектов").setMessage(message == null ? "Не удалось обработать файл" : message)
        .setPositiveButton("ОК", null).show();
  }

  @Override protected void onActivityResult(int request, int result, Intent data) {
    super.onActivityResult(request, result, data);
    if (result != RESULT_OK || data == null || data.getData() == null) return;
    android.net.Uri uri = data.getData();
    if(request==EXPORT_SCREENSHOT){final String path=screenshotPath;new Thread(()->{try(InputStream input=new FileInputStream(path);OutputStream output=getContentResolver().openOutputStream(uri,"wt")){if(output==null)throw new IOException("Файл недоступен");byte[] buffer=new byte[32768];int n;while((n=input.read(buffer))!=-1)output.write(buffer,0,n);runOnUiThread(()->{if(!isFinishing()&&!isDestroyed())Toast.makeText(this,"Снимок сохранён",Toast.LENGTH_LONG).show();});}catch(Exception e){runOnUiThread(()->fileError(e.getMessage()));}},"local-map-image").start();return;}
    if(request==ATTACH_FILE){attachFile(uri,attachmentObject);return;}
    if(request==IMPORT_MAP) {
      String display="map.mbtiles";
      try(android.database.Cursor c=getContentResolver().query(uri,new String[]{android.provider.OpenableColumns.DISPLAY_NAME},null,null,null)){if(c!=null&&c.moveToFirst())display=c.getString(0);}catch(Exception ignored){}
      final String name=display;Toast.makeText(this,"Проверка архива карты…",Toast.LENGTH_SHORT).show();
      new Thread(()->{try(InputStream input=getContentResolver().openInputStream(uri)) {
        if(input==null)throw new IOException("Файл недоступен");RasterMaps.Imported importedMap=RasterMaps.importFile(this,input,name);
        runOnUiThread(()->{if(isFinishing()||isDestroyed())return;catalog.addOffline(importedMap.file,importedMap.name,importedMap.min,importedMap.max);if(importedMap.bounds!=null)map.view.post(()->map.view.zoomToBoundingBox(new org.osmdroid.util.BoundingBox(importedMap.bounds[3],importedMap.bounds[2],importedMap.bounds[1],importedMap.bounds[0]),true,48));Toast.makeText(this,"Офлайн-карта добавлена",Toast.LENGTH_LONG).show();});
      }catch(Exception e){runOnUiThread(()->fileError(e.getMessage()));}},"offline-map-import").start();return;
    }
    if(request==EXPORT_MAP) {
      final String key=exportRasterPath;
      new Thread(()->{try {
        File root=new File(getFilesDir(),"maps").getCanonicalFile(),file=new File(root,key).getCanonicalFile();if(!root.equals(file.getParentFile()))throw new IOException("Неверный архив");
        try(InputStream input=new FileInputStream(file);OutputStream output=getContentResolver().openOutputStream(uri,"wt")){if(output==null)throw new IOException("Файл недоступен");byte[] b=new byte[65536];int n;while((n=input.read(b))!=-1)output.write(b,0,n);}
        runOnUiThread(()->Toast.makeText(this,"Карта экспортирована",Toast.LENGTH_LONG).show());
      }catch(Exception e){runOnUiThread(()->fileError(e.getMessage()));}},"offline-map-export").start();return;
    }
    if (request == IMPORT_FILE) {
      final long destination = importParent;
      Toast.makeText(this, "Чтение файла…", Toast.LENGTH_SHORT).show();
      new Thread(() -> {
        try (InputStream input = getContentResolver().openInputStream(uri)) {
          if (input == null) throw new IOException("Файл недоступен");
          List<MapItem> imported = BundleExchange.read(this,input);
          runOnUiThread(() -> {
            if (isFinishing() || isDestroyed()) return;
            new AlertDialog.Builder(this).setTitle("Импорт объектов: "+imported.size())
                .setMessage("Добавить объекты в выбранную папку? Текущие объекты сохранятся.")
                .setPositiveButton("Импортировать", (d,w) -> run(() -> {store.importItems(imported,destination);refresh();}))
                .setNegativeButton("Отмена",(d,w)->{try{new ru.warriorrus.app.media.LocalMedia(this).cleanup(store.referencedMedia());}catch(IOException ignored){}}).show();
          });
        } catch (Exception e) {runOnUiThread(() -> fileError(e.getMessage()));}
      }, "local-placemark-import").start();
    } else if (request == EXPORT_FILE) {
      final List<MapItem> snapshot = store.exportItems(exportSelection);
      final String format = exportFormat;
      new Thread(() -> {
        try (OutputStream output = getContentResolver().openOutputStream(uri, "wt")) {
          if (output == null) throw new IOException("Файл недоступен");
          BundleExchange.write(this,snapshot, output, format);
          runOnUiThread(() -> {if (!isFinishing() && !isDestroyed()) Toast.makeText(this,"Экспорт завершён",Toast.LENGTH_LONG).show();});
        } catch (Exception e) {runOnUiThread(() -> fileError(e.getMessage()));}
      }, "local-placemark-export").start();
    }
  }

  private void bluetoothExport() {
    final List<MapItem> snapshot = store.exportItems(explorer.selected);
    if (snapshot.isEmpty()) {fileError("Нет объектов для передачи"); return;}
    new AlertDialog.Builder(this).setTitle("Передать по Bluetooth")
        .setMessage("Подготовить KMZ выбранных объектов для системной передачи по Bluetooth?")
        .setPositiveButton("Подготовить", (d,w) -> {
          new Thread(() -> {
            try {
              File directory = new File(getFilesDir(), "shared"); if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Не удалось создать файл");
              File file = new File(directory, "Rabochaya-karta-"+java.util.UUID.randomUUID()+".kmz");
              try (OutputStream output = new FileOutputStream(file)) {BundleExchange.write(this,snapshot, output, "kmz");}
              runOnUiThread(() -> {
                if (isFinishing() || isDestroyed()) return;
                android.net.Uri uri = android.net.Uri.parse("content://"+getPackageName()+".localfiles/"+file.getName());
                Intent send = new Intent(Intent.ACTION_SEND).setType("application/vnd.google-earth.kmz").setPackage("com.android.bluetooth")
                    .putExtra(Intent.EXTRA_STREAM,uri).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                send.setClipData(ClipData.newRawUri("KMZ",uri));
                try {startActivity(send);}catch(android.content.ActivityNotFoundException unavailable){fileError("Системная передача Bluetooth недоступна. Сохраните KMZ через экспорт и передайте его из файлового менеджера.");}
              });
            } catch (Exception e) {runOnUiThread(() -> fileError(e.getMessage()));}
          },"bluetooth-file").start();
        }).setNegativeButton("Отмена",null).show();
  }

  @Override public boolean onKeyDown(int code,KeyEvent event){if(code==KeyEvent.KEYCODE_VOLUME_DOWN||code==KeyEvent.KEYCODE_VOLUME_UP){if(event.getRepeatCount()==0)event.startTracking();return true;}return super.onKeyDown(code,event);}
  @Override public boolean onKeyLongPress(int code,KeyEvent event){if(code==KeyEvent.KEYCODE_VOLUME_DOWN){screen.lock(!screen.locked());return true;}return super.onKeyLongPress(code,event);}
  @Override public boolean onKeyUp(int code,KeyEvent event){if(code==KeyEvent.KEYCODE_VOLUME_DOWN||code==KeyEvent.KEYCODE_VOLUME_UP){if(!event.isCanceled()&&!screen.locked()&&getPreferences(MODE_PRIVATE).getBoolean("volumeZoom",true)){if(code==KeyEvent.KEYCODE_VOLUME_UP)map.view.getController().zoomIn();else map.view.getController().zoomOut();}return true;}return super.onKeyUp(code,event);}

  @Override public void onBackPressed() {
    if(screen!=null&&screen.locked()){screen.lock(false);return;}
    if (drawing != null && drawing.active()) { drawing.confirmCancel(); return; }
    if(mapTools!=null&&mapTools.measuring){mapTools.finish();return;}
    if(timeline!=null&&timeline.model.active){timeline.close();return;}
    requestExit();
  }

  @Override
  protected void onSaveInstanceState(Bundle state) {
    super.onSaveInstanceState(state);
    state.putLong("folder",explorer.folder);state.putBoolean("explorerSelectionMode",selectionMode);long[] selectedObjects=new long[explorer.selected.size()];int offset=0;for(long id:explorer.selected)selectedObjects[offset++]=id;state.putLongArray("explorerSelected",selectedObjects);List<Long> clipboardObjects=explorer.clipboardIds();long[] clipboardIds=new long[clipboardObjects.size()];for(int n=0;n<clipboardIds.length;n++)clipboardIds[n]=clipboardObjects.get(n);state.putLongArray("explorerClipboard",clipboardIds);state.putBoolean("explorerCut",explorer.isCut());
    if(screen!=null)screen.save(state);state.putString("screenshotPath",screenshotPath);
    if (drawing != null) drawing.saveState(state);
    if(mapTools!=null)mapTools.saveState();
    if(timeline!=null)timeline.saveState(state);
    state.putString("exportRasterPath",exportRasterPath);
    state.putLong("attachmentObject",attachmentObject);
    state.putString("exportFormat", exportFormat);
    state.putLong("importParent", importParent);
    long[] selected = new long[exportSelection.size()];
    for (int n=0; n<selected.length; n++) selected[n]=exportSelection.get(n);
    state.putLongArray("exportSelection", selected);
    state.putDouble("mapLat", map.view.getMapCenter().getLatitude());
    state.putDouble("mapLon", map.view.getMapCenter().getLongitude());
    state.putDouble("mapZoom", map.view.getZoomLevelDouble());
    state.putFloat("mapAngle",map.view.getMapOrientation());
  }

  @Override
  protected void onResume() {
    super.onResume();
    if(compassController!=null&&getPreferences(MODE_PRIVATE).getBoolean("compassEnabled",false))setCompass(true);
    if (map != null) {
      map.view.onResume();
      refresh();
      iconRevision = map.iconRevision();
      iconHandler.postDelayed(iconPoll, 3000);
    }
  }

  @Override
  protected void onPause() {
    if(map!=null)MapViewport.save(map.view,getPreferences(MODE_PRIVATE));
    if(mapTools!=null)mapTools.saveState();
    if(timeline!=null)timeline.pause();
    iconHandler.removeCallbacksAndMessages(null);
    if(compassController!=null)compassController.stop();
    if (map != null) map.view.onPause();
    super.onPause();
  }

  @Override
  protected void onDestroy() {
    if(timeline!=null)timeline.pause();
    iconHandler.removeCallbacksAndMessages(null);
    for(Dialog panel:new ArrayList<>(openPanels))if(panel.isShowing())panel.dismiss();
    openPanels.clear();
    if(marksDialog!=null)marksDialog.dismiss();
    if(orientationDialog!=null)orientationDialog.dismiss();
    if(compassDialog!=null)compassDialog.dismiss();
    if (menuDialog != null) menuDialog.dismiss();
    if (layersDialog != null) layersDialog.dismiss();
    if (mapsDialog != null) mapsDialog.dismiss();
    if (settingsDialog != null) settingsDialog.dismiss();
    if (explorerDialog != null && explorerDialog.isShowing()) explorerDialog.dismiss();
    if(downloadDialog!=null)downloadDialog.dismiss();
    if(attachmentsDialog!=null)attachmentsDialog.dismiss();
    if(catalog!=null)catalog.close();
    if (map != null) map.view.onDetach();
    if (store != null) store.close();
    super.onDestroy();
  }
}
