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
import ru.warriorrus.app.exchange.PlacemarkFiles;
import ru.warriorrus.app.exchange.BundleExchange;
import android.content.Intent;
import java.io.*;

/** Touch workspace: persistent map plus Explorer drawer; all mutations go through ObjectStore. */
public final class MainActivity extends Activity {
  private ObjectStore store;
  private ExplorerController explorer;
  private MapWorkspace map;
  private LinearLayout drawer, rows, tree, crumbs;
  private TextView path, status;
  private EditText search;
  private boolean refreshing;
  private long dragged;
  private Dialog explorerDialog;
  private TextView coordinates, coordinateSystem, coordinateAdditional;
  private DrawingController drawing;
  private MapTools mapTools;
  private Dialog settingsDialog;
  private static final int IMPORT_FILE = 701, EXPORT_FILE = 702, ATTACH_FILE = 703, IMPORT_MAP = 704, EXPORT_MAP = 705;
  private MapCatalog catalog;
  private String exportRasterPath="";
  private Dialog downloadDialog, attachmentsDialog;
  private long attachmentObject;
  private String exportFormat = "kmz";
  private long importParent;
  private ArrayList<Long> exportSelection = new ArrayList<>();
  private boolean cards, onScreenOnly, gridEnabled;
  private long selectedPoint;
  private boolean coordinatesCollapsed, mapLayerVisible, rightCollapsed;
  private int mapLayerOpacity;
  private final List<Dialog> openPanels=new ArrayList<>();
  private Dialog menuDialog, layersDialog, mapsDialog, marksDialog, orientationDialog, compassDialog;
  private CompassController compassController;
  private CompassDial compassDial, mapCompass;
  private TextView headingInfo, compassReadout;
  private String objectFilter = "all";
  private final List<Button> objectTabs = new ArrayList<>();

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
    v.setTextColor(0xffe4f2ff);
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
    store = new ObjectStore(this);
    explorer = new ExplorerController(store);
    if (state != null) explorer.folder = state.getLong("folder");
    map = new MapWorkspace(this, this::mapContextMenu);
    if (state != null) {
      map.view
          .getController()
          .setCenter(
              new GeoPoint(state.getDouble("mapLat", 55.75), state.getDouble("mapLon", 37.62)));
      map.view.getController().setZoom(state.getDouble("mapZoom", 5));
    }
    FrameLayout root = new FrameLayout(this);
    root.setBackgroundColor(0xff071b2c);
    root.addView(map.view, new FrameLayout.LayoutParams(-1, -1));
    coordinatesCollapsed = getPreferences(MODE_PRIVATE).getBoolean("coordinatesCollapsed", false);
    mapLayerVisible = getPreferences(MODE_PRIVATE).getBoolean("mapLayerVisible", true);
    mapLayerOpacity = getPreferences(MODE_PRIVATE).getInt("mapLayerOpacity", 100);
    map.view.setUseDataConnection(getPreferences(MODE_PRIVATE).getBoolean("mapOnline", true));
    applyMapLayer();

    // Map focus is a single dot, independent of user objects and map movement.
    View focus = new View(this);
    GradientDrawable dot = new GradientDrawable();
    dot.setShape(GradientDrawable.OVAL);
    dot.setColor(0xffff4545);
    focus.setBackground(dot);
    focus.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
    root.addView(focus, new FrameLayout.LayoutParams(dp(7), dp(7), Gravity.CENTER));

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
    coordinatePanel.addView(coordinateDetails, new LinearLayout.LayoutParams(0, -2, 1));
    Button coordinateHeader = compact("", () -> {});
    coordinateHeader.setTag("coordinateToggle");
    coordinateHeader.setContentDescription("Свернуть или раскрыть координаты");
    coordinatePanel.addView(coordinateHeader, new LinearLayout.LayoutParams(dp(48), dp(48)));
    int coordinateWidth = Math.min(getResources().getDisplayMetrics().widthPixels - dp(72), dp(248));
    FrameLayout.LayoutParams hud = new FrameLayout.LayoutParams(coordinateWidth, -2, Gravity.TOP | Gravity.START);
    hud.setMargins(dp(8), dp(8), dp(64), 0);
    root.addView(coordinatePanel, hud);
    Runnable renderCoordinates = () -> {
      coordinateDetails.setVisibility(coordinatesCollapsed ? View.GONE : View.VISIBLE);
      coordinateHeader.setText(coordinatesCollapsed ? "⌄" : "⌃");
      coordinateHeader.setTextSize(20);
      coordinateHeader.setSelected(!coordinatesCollapsed);
      coordinatePanel.getLayoutParams().width = coordinatesCollapsed ? dp(48) : coordinateWidth;
      coordinatePanel.requestLayout();
    };
    coordinateHeader.setOnClickListener(v -> {
      coordinatesCollapsed = !coordinatesCollapsed;
      renderCoordinates.run();
      getPreferences(MODE_PRIVATE).edit().putBoolean("coordinatesCollapsed", coordinatesCollapsed).apply();
    });
    coordinateDetails.setOnClickListener(v -> coordinateHeader.performClick());
    renderCoordinates.run();

    LinearLayout bottomContainer = new LinearLayout(this);
    bottomContainer.setOrientation(LinearLayout.HORIZONTAL);
    bottomContainer.setGravity(Gravity.CENTER_VERTICAL);
    bottomContainer.setTag("bottomPanel");
    bottomContainer.setBackground(plate());
    LinearLayout toolbar = new LinearLayout(this);
    toolbar.setOrientation(LinearLayout.HORIZONTAL);
    toolbar.setTag("bottomToolbar");
    String[] tabNames = {"Меню", "Карты", "Объекты", "Ориентация"};
    int[] tabIcons = {R.drawable.ui_menu, R.drawable.ui_map, R.drawable.ui_pin, R.drawable.ui_compass};
    Runnable[] tabActions = {this::mainMenu, this::mapsMenu, this::marksMenu, this::orientationMenu};
    for (int i = 0; i < tabNames.length; i++) {
      Button tab = iconButton(tabNames[i], tabIcons[i], tabActions[i]);
      tab.setTag(tabNames[i]);
      if(i==1)tab.setContentDescription("Карты и слои");
      if(i==2)tab.setContentDescription("Метки");
      final int category=i;
      tab.setOnLongClickListener(v->{if(category==0)settingsMenu();else if(category==1)catalogMenu();else if(category==2)openExplorer(false);else toggleCompass();return true;});
      if (i == 0) tab.setBackground(selectedPlate());
      tab.setText("");
      tab.setCompoundDrawablesRelativeWithIntrinsicBounds(tabIcons[i], 0, 0, 0);
      tab.setCompoundDrawablePadding(0);
      tab.setPadding(dp(12), 0, dp(12), 0);
      toolbar.addView(tab, new LinearLayout.LayoutParams(dp(48), dp(48)));
    }
    bottomContainer.addView(toolbar, new LinearLayout.LayoutParams(0, -2, 1));
    FrameLayout.LayoutParams bottom = new FrameLayout.LayoutParams(dp(192), dp(48), Gravity.BOTTOM | Gravity.START);
    bottom.setMargins(dp(8), 0, dp(8), dp(8));
    root.addView(bottomContainer, bottom);
    headingInfo=hudText("",11);headingInfo.setVisibility(View.GONE);coordinateDetails.addView(headingInfo);
    mapCompass=new CompassDial(this);mapCompass.setVisibility(View.GONE);
    FrameLayout.LayoutParams compassPosition=new FrameLayout.LayoutParams(dp(96),dp(96),Gravity.BOTTOM|Gravity.END);compassPosition.setMargins(0,0,dp(8),dp(68));root.addView(mapCompass,compassPosition);
    mapCompass.setOnClickListener(v->showCompass());
    compassController=new CompassController(this,c->updateCompass());

    rightCollapsed = getPreferences(MODE_PRIVATE).getBoolean("rightCollapsed", false);
    LinearLayout rightPanel = new LinearLayout(this);
    rightPanel.setTag("rightPanel");
    rightPanel.setOrientation(LinearLayout.VERTICAL);
    rightPanel.setBackground(plate());
    Button rightToggle = compact("", () -> {});
    rightToggle.setTag("rightToggle");
    rightToggle.setTextSize(20);
    rightToggle.setContentDescription("Свернуть или раскрыть правую панель");
    rightPanel.addView(rightToggle, new LinearLayout.LayoutParams(dp(48), dp(48)));
    Button compass = iconButton("Север сверху", R.drawable.ui_compass, () -> map.view.setMapOrientation(0f));
    compass.setText("");
    compass.setCompoundDrawablesRelativeWithIntrinsicBounds(R.drawable.ui_compass, 0, 0, 0);
    compass.setPadding(dp(12), 0, dp(12), 0);
    rightPanel.addView(compass, new LinearLayout.LayoutParams(dp(48), dp(48)));
    String[] rightNames = {"Слои карт", "Действия в центре карты", "Увеличить", "Уменьшить"};
    int[] rightIcons = {R.drawable.ui_layers, R.drawable.ui_focus, R.drawable.ui_plus, R.drawable.ui_minus};
    Runnable[] rightActions = {this::layersMenu, () -> mapContextMenu((GeoPoint) map.view.getMapCenter()),
        () -> map.view.getController().zoomIn(), () -> map.view.getController().zoomOut()};
    for (int i = 0; i < rightNames.length; i++) {
      Button control = iconButton(rightNames[i], rightIcons[i], rightActions[i]);
      control.setText("");
      control.setCompoundDrawablesRelativeWithIntrinsicBounds(rightIcons[i], 0, 0, 0);
      control.setPadding(dp(12), 0, dp(12), 0);
      rightPanel.addView(control, new LinearLayout.LayoutParams(dp(48), dp(48)));
    }
    FrameLayout.LayoutParams right = new FrameLayout.LayoutParams(dp(48), -2, Gravity.END | Gravity.TOP);
    right.setMargins(0, dp(8), dp(8), 0);
    root.addView(rightPanel, right);
    Runnable renderRight = () -> {
      for (int i = 1; i < rightPanel.getChildCount(); i++)
        rightPanel.getChildAt(i).setVisibility(rightCollapsed ? View.GONE : View.VISIBLE);
      rightToggle.setText(rightCollapsed ? "⌄" : "⌃");
    };
    rightToggle.setOnClickListener(v -> {
      rightCollapsed = !rightCollapsed;
      renderRight.run();
      getPreferences(MODE_PRIVATE).edit().putBoolean("rightCollapsed", rightCollapsed).apply();
    });
    compass.setOnLongClickListener(v -> { rightToggle.performClick(); return true; });
    renderRight.run();
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
    drawer = new LinearLayout(this);
    drawer.setOrientation(LinearLayout.VERTICAL);
    drawer.setBackground(plate());
    drawer.setPadding(dp(8), dp(8), dp(8), dp(8));
    LinearLayout objectHeader = new LinearLayout(this);
    TextView title = hudText("Объекты карты", 20);
    title.setTypeface(null, Typeface.BOLD);
    objectHeader.addView(title, new LinearLayout.LayoutParams(0, -2, 1));
    Button closeObjects = compact("×", () -> explorerDialog.dismiss());
    closeObjects.setContentDescription("Закрыть объекты");
    objectHeader.addView(closeObjects, new LinearLayout.LayoutParams(dp(48), dp(48)));
    drawer.addView(objectHeader);
    LinearLayout filters = new LinearLayout(this);
    String[] filterNames = {"Все", "Метки", "Папки", "Маршруты", "Линии", "Области", "Треки"};
    String[] filterKinds = {"all", "point", "folder", "route", "path", "area", "track"};
    for (int i = 0; i < filterNames.length; i++) {
      final String kind = filterKinds[i];
      Button tab = compact(filterNames[i], () -> { objectFilter = kind; refresh(); });
      tab.setTag("filter:" + kind);
      objectTabs.add(tab);
      filters.addView(tab, new LinearLayout.LayoutParams(-2, dp(48)));
    }
    HorizontalScrollView filterScroll = new HorizontalScrollView(this);
    filterScroll.addView(filters);
    if (getResources().getConfiguration().orientation == android.content.res.Configuration.ORIENTATION_LANDSCAPE)
      objectHeader.addView(filterScroll, 1, new LinearLayout.LayoutParams(dp(240), dp(48)));
    else drawer.addView(filterScroll);
    path = hudText("", 14);
    path.setOnClickListener(
        v -> {
          if (explorer.folder != 0) {
            MapItem i = store.get(explorer.folder);
            explorer.folder = i == null ? 0 : i.parent;
            explorer.selected.clear();
            refresh();
          }
        });
    HorizontalScrollView breadcrumbScroll = new HorizontalScrollView(this);
    crumbs = new LinearLayout(this);
    breadcrumbScroll.addView(crumbs);
    drawer.addView(breadcrumbScroll);
    dropTarget(path, () -> explorer.folder == 0 ? 0 : store.get(explorer.folder).parent);
    search = new EditText(this);
    search.setSingleLine(true);
    search.setTextSize(14);
    search.setHint("Поиск по всем папкам");
    search.setTextColor(0xffe4f2ff);
    search.setHintTextColor(0xff94b4cb);
    search.setPadding(dp(12), dp(8), dp(12), dp(8));
    search.setBackground(selectedPlate());
    search.setMinHeight(dp(48));
    drawer.addView(search);
    search.addTextChangedListener(
        new TextWatcher() {
          public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

          public void onTextChanged(CharSequence s, int start, int before, int count) {
            if (!refreshing) {
              explorer.query = s.toString();
              refresh();
            }
          }

          public void afterTextChanged(Editable e) {}
        });
    HorizontalScrollView tools = new HorizontalScrollView(this);
    LinearLayout actions = new LinearLayout(this);
    tools.addView(actions);

    actions.addView(button("Папка +", () -> newFolder()));
    actions.addView(
        button(
            "Выделить всё",
            () -> {
              for (MapItem i : visibleEntries()) explorer.selected.add(i.id);
              refresh();
            }));
    actions.addView(
        button(
            "Снять",
            () -> {
              explorer.selected.clear();
              refresh();
            }));
    actions.addView(button("Копировать", () -> run(() -> explorer.clipboard(false))));
    actions.addView(button("Вырезать", () -> run(() -> explorer.clipboard(true))));
    actions.addView(button("Вставить", () -> run(() -> explorer.paste())));
    actions.addView(button("Удалить", () -> delete()));
    actions.addView(button("Оформление", () -> style()));
    actions.addView(
        button(
            "Сортировка",
            () -> {
              explorer.alphabetical = !explorer.alphabetical;
              refresh();
            }));
    actions.addView(button("Импорт объектов", this::importFile));
    actions.addView(button("Экспорт выбранного / всех", this::exportFile));
    actions.addView(button("Передать по Bluetooth", this::bluetoothExport));
    actions.addView(button("Корзина", this::trashMenu));
    actions.addView(button("Фильтры по имени и дате",this::filtersMenu));
    actions.addView(button("Собрать в набор",this::groupSelected));
    actions.addView(button("Объединить линии",this::mergeSelected));
    actions.addView(button("Сохранить шаблон метки",()->templatesMenu(true)));
    actions.addView(button("Создать из шаблона",()->templatesMenu(false)));
    actions.addView(button("Умные подборки",this::smartSelections));
    actions.addView(button("Вложения", () -> { if(explorer.selected.size()==1)attachmentsMenu(explorer.selected.iterator().next()); else fileError("Выберите один объект"); }));
    LinearLayout explorerToolbar = new LinearLayout(this);
    explorerToolbar.addView(
        compact(
            "Операции",
            () -> {
              PopupMenu menu = new PopupMenu(new android.view.ContextThemeWrapper(this, android.R.style.Theme_Material), explorerToolbar);
              for (int n = 0; n < actions.getChildCount(); n++) {
                final Button action = (Button) actions.getChildAt(n);
                menu.getMenu()
                    .add(0, n, 0, action.getText())
                    .setOnMenuItemClickListener(
                        item -> {
                          action.performClick();
                          return true;
                        });
              }
              menu.show();
            }));
    explorerToolbar.addView(
        compact(
            "Вид",
            () -> {
              cards = !cards;
              getPreferences(MODE_PRIVATE).edit().putBoolean("explorerCards", cards).apply();
              refresh();
            }));
    explorerToolbar.addView(compact("Значки", () -> openIcons()));
    explorerToolbar.addView(compact("Папки", () -> folderMenu()));
    for (int i = 0; i < explorerToolbar.getChildCount(); i++)
      explorerToolbar.getChildAt(i).setLayoutParams(new LinearLayout.LayoutParams(0, dp(48), 1));
    drawer.addView(explorerToolbar);
    LinearLayout lists = new LinearLayout(this);
    drawer.addView(lists, new LinearLayout.LayoutParams(-1, 0, 1));
    ScrollView folders = new ScrollView(this);
    tree = new LinearLayout(this);
    tree.setOrientation(LinearLayout.VERTICAL);
    folders.addView(tree);
    if (getResources().getConfiguration().screenWidthDp < 600) folders.setVisibility(View.GONE);
    lists.addView(folders, new LinearLayout.LayoutParams(dp(120), -1));
    ScrollView content = new ScrollView(this);
    rows = new LinearLayout(this);
    rows.setOrientation(LinearLayout.VERTICAL);
    content.addView(rows);
    lists.addView(content, new LinearLayout.LayoutParams(0, -1, 1));
    LinearLayout objectFooter = new LinearLayout(this);
    objectFooter.setGravity(Gravity.CENTER_VERTICAL);
    objectFooter.setMinimumHeight(dp(48));
    status = hudText("", 11);
    status.setPadding(dp(10), 0, dp(10), 0);
    status.setMaxLines(2);
    objectFooter.addView(status, new LinearLayout.LayoutParams(0, -2, 1));
    Button addObject = iconButton("Создать объект", R.drawable.ui_plus, () -> {
      PopupMenu menu = new PopupMenu(new android.view.ContextThemeWrapper(this, android.R.style.Theme_Material), objectFooter);
      menu.getMenu().add("Метка в центре карты").setOnMenuItemClickListener(item -> {
        edit(null, (GeoPoint) map.view.getMapCenter()); return true;
      });
      String[] kinds = {"route", "path", "area"};
      String[] names = {"Маршрут", "Линия", "Область"};
      for (int n = 0; n < kinds.length; n++) {
        final String kind = kinds[n];
        menu.getMenu().add(names[n]).setOnMenuItemClickListener(item -> {
          explorerDialog.dismiss(); startDrawing(kind, (GeoPoint) map.view.getMapCenter()); return true;
        });
      }
      menu.getMenu().add("Из шаблона").setOnMenuItemClickListener(item->{templatesMenu(false);return true;});
      menu.getMenu().add("Папка").setOnMenuItemClickListener(item -> { newFolder(); return true; });
      menu.show();
    });
    addObject.setText("");
    addObject.setBackground(selectedPlate());
    objectFooter.addView(addObject, new LinearLayout.LayoutParams(dp(48), dp(48)));
    drawer.addView(objectFooter);
    SystemInsets.edgeToEdge(getWindow());
    SystemInsets.protect(root, 0);
    setContentView(root);
    root.requestApplyInsets();
    drawing = new DrawingController(this, root, map, item -> { store.save(item); refresh(); });
    mapTools=new MapTools(this,map.view,root);
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
    explorerDialog.setOnDismissListener(d -> onScreenOnly = false);
    refresh();
    updateCoordinates();
  }

  private TextView hudText(String value, int size) {
    TextView view = label(value, size);
    view.setTextColor(0xffe4f2ff);
    view.setPadding(dp(10), dp(6), dp(10), dp(6));
    return view;
  }

  private void mainMenu() {
    menuDialog = new Dialog(this);
    LinearLayout panel = new LinearLayout(this);
    panel.setOrientation(LinearLayout.VERTICAL);
    panel.setPadding(dp(10), dp(10), dp(10), dp(10));
    panel.setBackground(plate());
    LinearLayout heading = new LinearLayout(this);
    heading.addView(hudText("Рабочая карта", 19), new LinearLayout.LayoutParams(0, -2, 1));
    heading.addView(compact("×", () -> menuDialog.dismiss()));
    panel.addView(heading);
    String[] names = {"Объекты", "Слои", "Карты", "Значки", "Настройки", "О программе"};
    int[] icons = {R.drawable.ui_pin, R.drawable.ui_layers, R.drawable.ui_map,
        R.drawable.ui_menu, R.drawable.ui_settings, R.drawable.ui_info};
    Runnable[] actions = {this::objectsMenu, this::layersMenu, this::mapsMenu, this::openIcons,
        this::settingsMenu, () -> new AlertDialog.Builder(this).setTitle("Рабочая карта")
            .setMessage("Локальная картографическая рабочая область без GPS.")
            .setPositiveButton("ОК", null).show()};
    for (int row = 0; row < 2; row++) {
      LinearLayout line = new LinearLayout(this);
      for (int col = 0; col < 3; col++) {
        final int index = row * 3 + col;
        Button tile = iconButton(names[index], icons[index], () -> {
          menuDialog.dismiss();
          actions[index].run();
        });
        tile.setBackground(selectedPlate());
        LinearLayout.LayoutParams size = new LinearLayout.LayoutParams(0, dp(88), 1);
        size.setMargins(dp(3), dp(3), dp(3), dp(3));
        line.addView(tile, size);
      }
      panel.addView(line);
    }
    showPanel(menuDialog, panel, dp(360), false);
  }

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
    background.setColor(0xcc073b65);
    background.setStroke(dp(1), 0xff087ddd);
    background.setCornerRadius(dp(10));
    return background;
  }

  private Button iconButton(String name, int icon, Runnable action) {
    Button button = compact(name, action);
    button.setCompoundDrawablesRelativeWithIntrinsicBounds(0, icon, 0, 0);
    button.setCompoundDrawablePadding(dp(4));
    button.setPadding(dp(4), dp(9), dp(4), dp(7));
    button.setGravity(Gravity.CENTER);
    return button;
  }

  private void objectsMenu() {
    openExplorer(false);
  }

  private void layersMenu() {
    layersDialog = new Dialog(this);
    LinearLayout panel = new LinearLayout(this);
    panel.setOrientation(LinearLayout.VERTICAL);
    panel.setPadding(dp(12), dp(12), dp(12), dp(12));
    panel.setBackground(plate());
    LinearLayout heading = new LinearLayout(this);
    heading.addView(hudText("Слои карт", 19), new LinearLayout.LayoutParams(0, -2, 1));
    heading.addView(compact("×", () -> layersDialog.dismiss()));
    panel.addView(heading);
    for(MapCatalog.Layer layer:catalog.layers) {
      LinearLayout row=new LinearLayout(this);Switch visible=new Switch(this);visible.setText(layer.name);visible.setTextColor(0xffe4f2ff);visible.setMinHeight(dp(48));visible.setChecked(layer.visible);
      visible.setOnCheckedChangeListener((button,checked)->{layer.visible=checked;mapLayerVisible=catalog.find("osm").visible;catalog.save();catalog.updateAppearance();});
      row.addView(visible,new LinearLayout.LayoutParams(0,-2,1));
      row.addView(compact("↑",()->{catalog.reorder(layer,1);layersDialog.dismiss();layersMenu();}));
      row.addView(compact("↓",()->{catalog.reorder(layer,-1);layersDialog.dismiss();layersMenu();}));panel.addView(row);
      TextView opacity=hudText("Непрозрачность: "+layer.opacity+"%",13);panel.addView(opacity);SeekBar slider=new SeekBar(this);slider.setMax(100);slider.setProgress(layer.opacity);slider.setContentDescription("Непрозрачность "+layer.name);
      slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
        public void onProgressChanged(SeekBar bar,int progress,boolean user){layer.opacity=progress;mapLayerOpacity=catalog.find("osm").opacity;opacity.setText("Непрозрачность: "+progress+"%");catalog.save();catalog.updateAppearance();}
        public void onStartTrackingTouch(SeekBar bar){} public void onStopTrackingTouch(SeekBar bar){}
      });panel.addView(slider);
      if(!"osm".equals(layer.id))panel.addView(compact("Убрать слой · "+layer.name,()->{catalog.remove(layer);layersDialog.dismiss();layersMenu();}));
    }
    panel.addView(compact("Карты", () -> { layersDialog.dismiss(); mapsMenu(); }));
    ScrollView scroll=new ScrollView(this);scroll.addView(panel);showPanel(layersDialog, scroll, dp(360), false);
  }

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
    bg.setColor(0xee071b2c);
    bg.setStroke(dp(1), 0xff2e6387);
    bg.setCornerRadius(dp(12));
    return bg;
  }

  private Button compact(String name, Runnable action) {
    Button b = button(name, action);
    b.setMinWidth(0);
    b.setMinimumWidth(0);
    b.setMinHeight(dp(44));
    b.setTextSize(11);
    b.setTextColor(0xffe4f2ff);
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
  private void mapContextMenu(GeoPoint point) {
    if (drawing != null && drawing.active()) { drawing.add(point); return; }
    String location = String.format(Locale.ROOT, "%.6f, %.6f", point.getLatitude(), point.getLongitude());
    new AlertDialog.Builder(this)
        .setTitle("Точка на карте: " + location)
        .setItems(
            new String[] {"Создать метку", "Скопировать координаты", "Создать маршрут", "Нарисовать линию", "Создать область", "Поиск по координатам / названию", "Импорт объектов", "Задать цель", "Инструменты…"},
            (dialog, which) -> {
              if (which == 0) edit(null, point);
              else if (which >= 2) {
                if (which == 2) startDrawing("route", point);
                else if (which == 3) startDrawing("path", point);
                else if (which == 4) startDrawing("area", point);
                else if (which == 5) searchMap();
                else if(which==6)importFile();
                else if(which==7)mapTools.target(new Vertex(point.getLatitude(),point.getLongitude()));
                else mapToolsMenu(point);
              } else {
                android.content.ClipboardManager clipboard =
                    (android.content.ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
                if (clipboard != null)
                  clipboard.setPrimaryClip(ClipData.newPlainText("Координаты", location));
                Toast.makeText(this, "Координаты скопированы", Toast.LENGTH_SHORT).show();
              }
            })
        .setNegativeButton("Отмена", null)
        .show();
  }

  private void mapToolsMenu(GeoPoint point){sheet("Инструменты",new String[]{"Измерить","Проекция точки по расстоянию и азимуту","Удалить измерения",mapTools.hasTarget()?"Убрать цель":"Задать цель","Перейти к цели"},n->{
    Vertex origin=new Vertex(point.getLatitude(),point.getLongitude());
    if(n==0){if(drawing.active()){fileError("Сначала завершите рисунок");return;}mapTools.start(origin);}
    else if(n==1)projectPoint(origin);else if(n==2)new AlertDialog.Builder(this).setTitle("Удалить все измерения?").setPositiveButton("Удалить",(d,w)->mapTools.clear()).setNegativeButton("Отмена",null).show();
    else if(n==3)mapTools.target(mapTools.hasTarget()?null:origin);else mapTools.jumpTarget();
  });}
  private void projectPoint(Vertex origin){
    LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);EditText distance=new EditText(this),bearing=new EditText(this);distance.setHint("Расстояние, метры");bearing.setHint("Азимут, градусы от севера");distance.setInputType(8194);bearing.setInputType(12290);form.addView(distance);form.addView(bearing);
    AlertDialog dialog=new AlertDialog.Builder(this).setTitle("Проекция точки").setView(form).setPositiveButton("Создать метку",null).setNegativeButton("Отмена",null).create();dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{try{Vertex destination=Geometry.project(origin,Double.parseDouble(bearing.getText().toString().replace(',','.')),Double.parseDouble(distance.getText().toString().replace(',','.')));dialog.dismiss();edit(null,new GeoPoint(destination.latitude,destination.longitude));}catch(Exception error){distance.setError("Введите расстояние и азимут числами");}}));dialog.show();
  }

  private void mapsMenu() {
    mapsDialog = new Dialog(this);
    LinearLayout panel = new LinearLayout(this);
    panel.setOrientation(LinearLayout.VERTICAL);
    panel.setPadding(dp(12), dp(12), dp(12), dp(12));
    panel.setBackground(plate());
    LinearLayout heading = new LinearLayout(this);
    heading.addView(hudText("Карты и слои", 19), new LinearLayout.LayoutParams(0, -2, 1));
    Button close = compact("×", () -> mapsDialog.dismiss());
    close.setContentDescription("Закрыть карты");
    heading.addView(close, new LinearLayout.LayoutParams(dp(48), dp(48)));
    panel.addView(heading);
    LinearLayout modes = new LinearLayout(this);
    TextView explanation = hudText("", 13);
    Button online = compact("Онлайн", () -> {}), offline = compact("Офлайн", () -> {});
    Runnable update = () -> {
      boolean connected = map.view.useDataConnection();
      online.setBackground(connected ? selectedPlate() : plate());
      offline.setBackground(connected ? plate() : selectedPlate());
      explanation.setText(connected ? "Загрузка тайлов карты через интернет" : "Только сохранённые тайлы. Пустые участки не загружаются.");
    };
    online.setOnClickListener(v -> { setMapOnline(true); update.run(); });
    offline.setOnClickListener(v -> { setMapOnline(false); update.run(); });
    modes.addView(online, new LinearLayout.LayoutParams(0, dp(48), 1));
    modes.addView(offline, new LinearLayout.LayoutParams(0, dp(48), 1));
    panel.addView(compact("Доступные карты",()->{mapsDialog.dismiss();catalogMenu();}));
    Button displayedMaps=compact("Отображаемые карты",()->{mapsDialog.dismiss();layersMenu();});displayedMaps.setTag("displayedMaps");panel.addView(displayedMaps);
    panel.addView(compact("Выбрать и сохранить область",this::chooseAreaDownload));
    panel.addView(modes);
    TextView source = hudText("© OpenStreetMap\nhttps://www.openstreetmap.org/copyright", 13);
    android.text.util.Linkify.addLinks(source, android.text.util.Linkify.WEB_URLS);
    source.setMovementMethod(android.text.method.LinkMovementMethod.getInstance());
    source.setCompoundDrawablesRelativeWithIntrinsicBounds(R.drawable.ui_map, 0, 0, 0);
    source.setCompoundDrawablePadding(dp(12));
    source.setMinHeight(dp(64));
    panel.addView(source);
    panel.addView(explanation);
    panel.addView(compact("Открыть офлайн-архив",this::importMap));
    panel.addView(compact("Добавить HTTPS-источник",this::addOnlineMap));
    panel.addView(compact("Задание офлайн-загрузки",this::showDownloadStatus));
    update.run();
    ScrollView scroll=new ScrollView(this);scroll.addView(panel);showPanel(mapsDialog, scroll, dp(360), false);
  }

  private void setMapOnline(boolean online) {
    map.view.setUseDataConnection(online);
    if(catalog!=null)catalog.setOnline(online);
    getPreferences(MODE_PRIVATE).edit().putBoolean("mapOnline", online).apply();
  }

  private void openExplorer(boolean visibleOnly) {
    onScreenOnly = visibleOnly;
    objectFilter = "all";
    explorer.folder = 0;
    explorer.query = "";
    refresh();
    showPanel(explorerDialog, drawer, dp(640), true);
  }

  private void marksMenu() {
    marksDialog=new Dialog(this);LinearLayout panel=featurePanel("Метки",marksDialog);
    panel.addView(compact("Проводник меток",()->{marksDialog.dismiss();openExplorer(false);}));
    if(!store.renderItems().isEmpty())panel.addView(compact("Отображаемые метки",()->{marksDialog.dismiss();openExplorer(true);}));
    panel.addView(compact("Создать метку",()->{marksDialog.dismiss();createPlacemark();}));
    panel.addView(compact("Поиск местоположения",()->{marksDialog.dismiss();searchMap();}));
    panel.addView(compact("Опции",()->{marksDialog.dismiss();placemarkOptions();}));
    showFeature(marksDialog,panel);
  }
  private LinearLayout featurePanel(String title,Dialog dialog) {
    LinearLayout panel=new LinearLayout(this);panel.setOrientation(LinearLayout.VERTICAL);panel.setPadding(dp(12),dp(8),dp(12),dp(8));panel.setBackground(plate());
    LinearLayout header=new LinearLayout(this);header.addView(hudText(title,18),new LinearLayout.LayoutParams(0,-2,1));header.addView(compact("×",dialog::dismiss),new LinearLayout.LayoutParams(dp(48),dp(48)));panel.addView(header);return panel;
  }
  private void showFeature(Dialog dialog,LinearLayout panel){ScrollView scroll=new ScrollView(this);scroll.addView(panel);showPanel(dialog,scroll,dp(360),false);}
  private void createPlacemark(){sheet("Создать метку",new String[]{"Точка","Набор точек","Маршрут","Линия","Область","Папка"},n->{GeoPoint p=(GeoPoint)map.view.getMapCenter();if(n==0)edit(null,p);else if(n==1||n==5){EditText name=new EditText(this);new AlertDialog.Builder(this).setTitle(n==1?"Набор точек":"Папка").setView(name).setPositiveButton("Создать",(d,w)->run(()->store.create(explorer.folder,name.getText().toString(),n==1?"set":"folder",0,0))).setNegativeButton("Отмена",null).show();}else startDrawing(n==2?"route":n==3?"path":"area",p);});}
  private void placemarkOptions(){
    Dialog dialog=new Dialog(this);LinearLayout panel=featurePanel("Опции меток",dialog);
    CheckBox labels=new CheckBox(this);labels.setText("Подписи меток");labels.setTextColor(0xffe4f2ff);labels.setChecked(map.labelsVisible);labels.setOnCheckedChangeListener((v,on)->{getPreferences(MODE_PRIVATE).edit().putBoolean("placemarkLabels",on).apply();applySettings();});panel.addView(labels);
    for(String key:new String[]{"targetLine","targetInfo"}){CheckBox option=new CheckBox(this);option.setText("targetLine".equals(key)?"Линия к цели":"Информация о цели");option.setTextColor(0xffe4f2ff);option.setChecked(getPreferences(MODE_PRIVATE).getBoolean(key,true));option.setOnCheckedChangeListener((v,on)->{getPreferences(MODE_PRIVATE).edit().putBoolean(key,on).apply();mapTools.update();});panel.addView(option);}
    panel.addView(compact("Значки",()->{dialog.dismiss();openIcons();}));panel.addView(compact("Размер значков и толщина линий",()->{dialog.dismiss();settingsMenu();}));showFeature(dialog,panel);
  }
  private void orientationMenu(){
    orientationDialog=new Dialog(this);LinearLayout panel=featurePanel("Ориентация",orientationDialog);
    panel.addView(compact("Компас",()->{orientationDialog.dismiss();showCompass();}));
    CheckBox enabled=new CheckBox(this);enabled.setText("Включить компас");enabled.setTextColor(0xffe4f2ff);enabled.setChecked(getPreferences(MODE_PRIVATE).getBoolean("compassEnabled",false));
    enabled.setOnCheckedChangeListener((v,on)->{setCompass(on);if(on&&!compassController.enabled)enabled.setChecked(false);});panel.addView(enabled);
    String[] labels={"Поворачивать карту по компасу","Показывать компас на карте","Текущий азимут"};String[] keys={"compassRotate","compassOnMap","compassInfo"};
    for(int n=0;n<keys.length;n++){final String key=keys[n];CheckBox option=new CheckBox(this);option.setText(labels[n]);option.setTextColor(0xffe4f2ff);option.setChecked(getPreferences(MODE_PRIVATE).getBoolean(key,false));option.setOnCheckedChangeListener((v,on)->{getPreferences(MODE_PRIVATE).edit().putBoolean(key,on).apply();updateCompass();});panel.addView(option);}
    panel.addView(compact("Север сверху",()->map.view.setMapOrientation(0)));showFeature(orientationDialog,panel);
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
    CheckBox rose=new CheckBox(this);rose.setText("Подвижная шкала");rose.setTextColor(0xffe4f2ff);rose.setChecked(getPreferences(MODE_PRIVATE).getBoolean("compassRose",true));rose.setOnCheckedChangeListener((v,on)->{getPreferences(MODE_PRIVATE).edit().putBoolean("compassRose",on).apply();updateCompass();});panel.addView(rose);
    panel.addView(compact("Датчик",()->sheet("Датчик компаса",new String[]{"Вектор вращения (если доступен)","Магнитометр и акселерометр"},n->{getPreferences(MODE_PRIVATE).edit().putString("compassSensor",n==0?"rotation":"magnetic").apply();if(compassController.enabled)setCompass(true);}))); 
    panel.addView(hudText("Магнитный север. Местоположение не запрашивается. Для калибровки поверните телефон в разных направлениях.",12));showFeature(compassDialog,panel);updateCompass();
  }
  private void updateCompass(){
    if(compassController==null||headingInfo==null)return;CompassController c=compassController;android.content.SharedPreferences prefs=getPreferences(MODE_PRIVATE);
    String value=!c.enabled?"Компас выключен":!c.ready?"Ожидание показаний датчика":String.format(Locale.ROOT,"Азимут: %.1f° · %.0f mil\nНаклон: %.1f° · Крен: %.1f°%s",c.heading,c.heading*6400/360,c.pitch,c.roll,c.accuracy<=android.hardware.SensorManager.SENSOR_STATUS_ACCURACY_LOW?"\nТребуется калибровка":"");
    if(compassReadout!=null)compassReadout.setText(value);headingInfo.setText(value);headingInfo.setVisibility(c.enabled&&prefs.getBoolean("compassInfo",false)?View.VISIBLE:View.GONE);
    for(CompassDial dial:new CompassDial[]{compassDial,mapCompass})if(dial!=null){dial.heading=c.heading;dial.ready=c.ready;dial.movingRose=prefs.getBoolean("compassRose",true);dial.invalidate();}
    mapCompass.setVisibility(c.enabled&&prefs.getBoolean("compassOnMap",false)?View.VISIBLE:View.GONE);
    if(c.enabled&&c.ready&&prefs.getBoolean("compassRotate",false))map.view.setMapOrientation(-c.heading);
  }

  private void toolsMenu() {
    sheet(
        "Настройки",
        new String[] {
          gridEnabled ? "Выключить координатную сетку" : "Включить координатную сетку",
          "Объекты карты",
          "Значки",
          "Отмена последней операции",
          "Параметры карты и координат",
          "Импорт объектов",
          "Экспорт выбранного / всех",
          "Передать по Bluetooth",
          "Корзина"
        },
        n -> {
          switch (n) {
            case 0:
              gridEnabled = !gridEnabled;
              map.showGrid(gridEnabled);
              getPreferences(MODE_PRIVATE).edit().putBoolean("coordinateGrid", gridEnabled).apply();
              break;
            case 1:
              openExplorer(false);
              break;
            case 2:
              openIcons();
              break;
            case 3:
              run(() -> store.undo());
              break;
            case 4: settingsMenu(); break;
            case 5: importFile(); break;
            case 6: exportFile(); break;
            case 7: bluetoothExport(); break;
            case 8: trashMenu(); break;
          }
        });
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
          onScreenOnly = false;
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
    coordinateSystem.setText(Coordinates.NAMES[Math.max(0, Math.min(4, primary))]);
    coordinates.setText(Coordinates.format(primary, lat, lon));
    coordinateAdditional.setVisibility(secondary < 0 ? View.GONE : View.VISIBLE);
    coordinateAdditional.setText(secondary < 0 ? "" : Coordinates.format(secondary, lat, lon));
    if(mapTools!=null)mapTools.update();
  }

  private void searchMap() {
    EditText input = new EditText(this);
    input.setHint("Название, широта и долгота, UTM или MGRS");
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

  private void pointActions(MapItem i) {
    sheet(
        i.name,
        new String[] {"Подробнее", "Редактировать", i.isGeometry() ? "Вершины" : "Выбрать значок", "Выделить в Explorer"},
        n -> {
          switch (n) {
            case 0:
              pointDetails(i);
              break;
            case 1:
              edit(i, new GeoPoint(i.latitude, i.longitude));
              break;
            case 2:
              if (i.isGeometry()) { edit(i, new GeoPoint(i.latitude, i.longitude)); drawing.vertices(); break; }
              explorer.selected.clear();
              explorer.selected.add(i.id);
              openIcons();
              break;
            case 3:
              explorer.selected.clear();
              explorer.selected.add(i.id);
              openExplorer(false);
              explorer.folder = i.parent;
              refresh();
              break;
          }
        });
  }

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
                i.color & 0xffffff, i.description, Geometry.summary(i)+(i.isGeometry()?"\n"+TrackStatistics.of(i).summary():"")))
        .setPositiveButton(
            "Редактировать", (d, w) -> edit(i, new GeoPoint(i.latitude, i.longitude)))
        .setNeutralButton(i.isGeometry()?"Профиль / Вложения":"Вложения ("+i.attachments.size()+")", (d,w) -> {
          if(i.isGeometry())sheet(i.name,new String[]{"Профиль высот и статистика","Вложения"},n->{if(n==0)profile(i);else attachmentsMenu(i.id);});else attachmentsMenu(i.id);
        })
        .setNegativeButton("Закрыть", null)
        .show();
  }

  private List<MapItem> visibleEntries() {
    if (!onScreenOnly) {
      List<MapItem> entries = new ArrayList<>(explorer.entries());
      if (!objectFilter.equals("all")) entries.removeIf(item -> !objectFilter.equals(item.kind));
      return entries;
    }
    List<MapItem> visible = new ArrayList<>();
    org.osmdroid.util.BoundingBox box = map.view.getBoundingBox();
    for (MapItem i : store.renderItems())
      if (!i.isFolder()
          && store.effectiveOpacity(i) > 0
          && CoordinateGrid.contains(
              box.getLatSouth(),
              box.getLatNorth(),
              box.getLonWest(),
              box.getLonEast(),
              i.latitude,
              i.longitude)
          && i.name.toLowerCase(Locale.ROOT).contains(explorer.query.toLowerCase(Locale.ROOT))) {
        visible.add(i);
      }
    return visible;
  }

  private void refresh() {
    explorer.reconcile();
    for (Button tab : objectTabs) {
      boolean active = ("filter:" + objectFilter).equals(tab.getTag());
      tab.setBackground(active ? selectedPlate() : null);
      tab.setSelected(active);
    }
    map.refresh(store);
    crumbs.removeAllViews();
    path.setText("‹");
    path.setContentDescription("На уровень выше");
    crumbs.addView(path);
    TextView rootCrumb = hudText("Рабочая карта", 14);
    rootCrumb.setOnClickListener(
        v -> {
          explorer.folder = 0;
          explorer.query = "";
          explorer.selected.clear();
          refresh();
        });
    crumbs.addView(rootCrumb);
    List<MapItem> ancestors = new ArrayList<>();
    for (MapItem i = store.get(explorer.folder); i != null; i = store.get(i.parent))
      ancestors.add(i);
    Collections.reverse(ancestors);
    for (MapItem i : ancestors) {
      TextView crumb = hudText("› " + i.name, 14);
      crumb.setOnClickListener(
          v -> {
            explorer.open(i.id);
            refresh();
          });
      dropTarget(crumb, () -> i.id);
      crumbs.addView(crumb);
    }
    refreshing = true;
    if (!search.getText().toString().equals(explorer.query)) search.setText(explorer.query);
    refreshing = false;
    tree.removeAllViews();
    TextView home = hudText("Все объекты", 13);
    home.setOnClickListener(
        v -> {
          explorer.folder = 0;
          explorer.selected.clear();
          refresh();
        });
    tree.addView(home);
    dropTarget(home, () -> 0);
    addTree(0, 0);
    rows.removeAllViews();
    for (MapItem i : visibleEntries()) {
      LinearLayout row = new LinearLayout(this);
      row.setGravity(Gravity.CENTER_VERTICAL);
      row.setMinimumHeight(dp(cards ? 96 : 48));
      GradientDrawable bg = new GradientDrawable();
      bg.setColor(explorer.selected.contains(i.id) ? 0xff114e7b : 0xff102c40);
      bg.setCornerRadius(dp(8));
      row.setBackground(bg);
      CheckBox select = new CheckBox(this);
      select.setChecked(explorer.selected.contains(i.id));
      select.setButtonTintList(android.content.res.ColorStateList.valueOf(0xff4cb5ff));
      select.setContentDescription("Выбрать " + i.name);
      select.setMinWidth(dp(40));
      select.setOnClickListener(
          v -> {
            explorer.toggle(i.id);
            refresh();
          });
      row.addView(select);
      if (cards && !i.isFolder()) {
        ImageView thumbnail = new ImageView(this);
        thumbnail.setContentDescription("Значок " + i.name);
        try {
          String svg =
              i.icon.startsWith("builtin:")
                  ? ru.warriorrus.app.icons.IconLibrary.builtinText(i.icon)
                  : ru.warriorrus.app.icons.IconLibrary.open(this).text(i.icon);
          thumbnail.setImageDrawable(
              ru.warriorrus.app.icons.SvgPreview.render(getResources(), svg, i.color, dp(40)));
        } catch (Exception unavailable) {
          thumbnail.setImageResource(android.R.drawable.ic_dialog_alert);
        }
        row.addView(thumbnail, new LinearLayout.LayoutParams(dp(48), dp(48)));
      }
      TextView name = hudText(i.name, 15);
      name.setContentDescription(i.typeName() + " " + i.name);
      name.setCompoundDrawablesRelativeWithIntrinsicBounds(i.isFolder() ? R.drawable.ui_folder : R.drawable.ui_pin, 0, 0, 0);
      name.setCompoundDrawablePadding(dp(8));
      name.setMaxLines(3);
      if (cards && !i.isFolder())
        name.setText(
            String.format(Locale.ROOT, "%s\n%.5f, %.5f", i.name, i.latitude, i.longitude));
      row.addView(name, new LinearLayout.LayoutParams(0, -2, 1));
      name.setOnClickListener(
          v -> {
            if (i.isFolder()) {
              explorer.open(i.id);
              refresh();
            } else {
              map.center(i);
              context(i, name);
            }
          });
      Switch visibility = new Switch(this);
      visibility.setChecked(i.visible);
      visibility.setContentDescription("Видимость " + i.name);
      visibility.setButtonTintList(android.content.res.ColorStateList.valueOf(0xff4cb5ff));
      visibility.setOnCheckedChangeListener(
          (b, checked) -> run(() -> store.style(Collections.singleton(i.id), checked, null, null)));
      row.addView(visibility);
      name.setOnLongClickListener(
          v -> {
            explorer.selected.add(i.id);
            context(i, name);
            return true;
          });
      Button handle = compact("↕", () -> context(i, name));
      handle.setContentDescription("Перетащить " + i.name);
      handle.setOnLongClickListener(
          v -> {
            dragged = i.id;
            ClipData data = ClipData.newPlainText("object", "" + i.id);
            if (android.os.Build.VERSION.SDK_INT >= 24) {
              v.startDragAndDrop(data, new View.DragShadowBuilder(v), null, 0);
            } else {
              v.startDrag(data, new View.DragShadowBuilder(v), null, 0);
            }
            return true;
          });
      row.addView(handle, new LinearLayout.LayoutParams(dp(48), dp(48)));
      if (i.isFolder()) dropTarget(row, () -> i.id);
      LinearLayout.LayoutParams rowSize = new LinearLayout.LayoutParams(-1, -2);
      rowSize.setMargins(0, dp(3), 0, dp(3));
      rows.addView(row, rowSize);
    }
    if (rows.getChildCount() == 0) rows.addView(hudText(explorer.query.isEmpty() ? "Нет объектов" : "Ничего не найдено", 15));
    updateCoordinates();
    status.setText("Объектов: " + visibleEntries().size() + "  ·  Выбрано: " + explorer.selected.size());
  }

  private String indent(int depth) {
    StringBuilder b = new StringBuilder();
    for (int n = 0; n < Math.min(depth, 8); n++) b.append("  ");
    return b.toString();
  }

  private void addTree(long parent, int depth) {
    for (MapItem i : store.all())
      if (i.parent == parent && i.isFolder()) {
        TextView v = hudText(indent(depth) + i.name, 12);
        v.setCompoundDrawablesRelativeWithIntrinsicBounds(R.drawable.ui_folder, 0, 0, 0);
        v.setSingleLine(true);
        v.setEllipsize(android.text.TextUtils.TruncateAt.END);
        v.setOnClickListener(
            w -> {
              explorer.open(i.id);
              refresh();
            });
        dropTarget(v, () -> i.id);
        tree.addView(v);
        addTree(i.id, depth + 1);
      }
  }

  private void dropTarget(View view, java.util.function.LongSupplier target) {
    view.setOnDragListener(
        (v, e) -> {
          if (e.getAction() == DragEvent.ACTION_DRAG_STARTED)
            return e.getClipDescription() != null
                && "object".equals(e.getClipDescription().getLabel());
          if (e.getAction() == DragEvent.ACTION_DROP) {
            run(() -> store.transfer(Collections.singleton(dragged), target.getAsLong(), false));
            return true;
          }
          return true;
        });
  }

  private void context(MapItem i, View anchor) {
    PopupMenu menu = new PopupMenu(new android.view.ContextThemeWrapper(this, android.R.style.Theme_Material), anchor);
    String[] commands = {
      "Открыть / на карте",
      "Редактировать",
      "Копировать",
      "Вырезать",
      "Вставить сюда",
      "Удалить",
      "Стиль слоя",
      "Выше",
      "Ниже"
    };
    for (String s : commands) menu.getMenu().add(s);
    menu.setOnMenuItemClickListener(
        m -> {
          String s = m.getTitle().toString();
          if (!explorer.selected.contains(i.id)) {
            explorer.selected.clear();
            explorer.selected.add(i.id);
          }
          switch (s) {
            case "Открыть / на карте":
              if (i.isFolder()) explorer.open(i.id);
              else map.center(i);
              refresh();
              break;
            case "Редактировать":
              edit(i, new GeoPoint(i.latitude, i.longitude));
              break;
            case "Копировать":
              run(() -> explorer.clipboard(false));
              break;
            case "Вырезать":
              run(() -> explorer.clipboard(true));
              break;
            case "Вставить сюда":
              run(
                  () -> {
                    if (i.isFolder()) explorer.folder = i.id;
                    explorer.paste();
                  });
              break;
            case "Удалить":
              delete();
              break;
            case "Стиль слоя":
              style();
              break;
            case "Выше":
              run(() -> store.reorder(i.id, -1));
              break;
            case "Ниже":
              run(() -> store.reorder(i.id, 1));
              break;
          }
          return true;
        });
    menu.show();
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
      drawing.start(item, item.kind, item.parent, null); return;
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
    Dialog dialog=new Dialog(this);LinearLayout panel=new LinearLayout(this);panel.setOrientation(LinearLayout.VERTICAL);panel.setBackground(plate());panel.setPadding(dp(12),dp(12),dp(12),dp(12));panel.addView(hudText(item.name,18));panel.addView(hudText(Geometry.summary(item)+"\n"+TrackStatistics.of(item).summary(),14));
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
    drawing.start(null, kind, explorer.folder, point);
  }

  private void applySettings() {
    android.content.SharedPreferences prefs = getPreferences(MODE_PRIVATE);
    map.labelsVisible = prefs.getBoolean("placemarkLabels", true);
    map.markerSize = prefs.getInt("markerSize", 24);
    map.lineWidth = prefs.getInt("lineWidth", 3);
    if (prefs.getBoolean("keepScreenOn", false)) getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
    else getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
    updateCoordinates();
    if (drawer != null && rows != null) refresh();
  }

  private void settingsMenu() {
    settingsDialog = new Dialog(this);
    LinearLayout form = new LinearLayout(this); form.setOrientation(LinearLayout.VERTICAL);
    form.setPadding(dp(12), dp(8), dp(12), dp(8)); form.setBackground(plate());
    form.addView(hudText("Параметры карты и координат", 18));
    form.addView(hudText("Основные координаты", 13));
    Spinner primary = new Spinner(new android.view.ContextThemeWrapper(this, android.R.style.Theme_Material));
    primary.setAdapter(new ArrayAdapter<>(primary.getContext(), android.R.layout.simple_spinner_dropdown_item, Coordinates.NAMES));
    primary.setSelection(getPreferences(MODE_PRIVATE).getInt("primaryCoordinates", 0)); form.addView(primary);
    form.addView(hudText("Дополнительные координаты", 13));
    String[] secondaryNames = new String[6]; secondaryNames[0] = "Не показывать";
    System.arraycopy(Coordinates.NAMES, 0, secondaryNames, 1, 5);
    Spinner secondary = new Spinner(new android.view.ContextThemeWrapper(this, android.R.style.Theme_Material));
    secondary.setAdapter(new ArrayAdapter<>(secondary.getContext(), android.R.layout.simple_spinner_dropdown_item, secondaryNames));
    secondary.setSelection(getPreferences(MODE_PRIVATE).getInt("secondaryCoordinates", 4)+1); form.addView(secondary);
    CheckBox labels = new CheckBox(this); labels.setText("Подписи объектов"); labels.setTextColor(0xffe4f2ff);
    labels.setChecked(getPreferences(MODE_PRIVATE).getBoolean("placemarkLabels", true)); form.addView(labels);
    CheckBox grid=new CheckBox(this);grid.setText("Координатная сетка");grid.setTextColor(0xffe4f2ff);grid.setChecked(gridEnabled);form.addView(grid);
    CheckBox screen = new CheckBox(this); screen.setText("Не выключать экран"); screen.setTextColor(0xffe4f2ff);
    screen.setChecked(getPreferences(MODE_PRIVATE).getBoolean("keepScreenOn", false)); form.addView(screen);
    TextView markerValue = hudText("Размер значков: "+map.markerSize+" dp", 13); form.addView(markerValue);
    SeekBar marker = new SeekBar(this); marker.setMax(40); marker.setProgress(map.markerSize-16); form.addView(marker);
    TextView lineValue = hudText("Толщина линий: "+map.lineWidth+" dp", 13); form.addView(lineValue);
    SeekBar line = new SeekBar(this); line.setMax(11); line.setProgress(map.lineWidth-1); form.addView(line);
    marker.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
      public void onProgressChanged(SeekBar bar,int value,boolean user){markerValue.setText("Размер значков: "+(value+16)+" dp");}
      public void onStartTrackingTouch(SeekBar bar){} public void onStopTrackingTouch(SeekBar bar){}
    });
    line.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
      public void onProgressChanged(SeekBar bar,int value,boolean user){lineValue.setText("Толщина линий: "+(value+1)+" dp");}
      public void onStartTrackingTouch(SeekBar bar){} public void onStopTrackingTouch(SeekBar bar){}
    });
    form.addView(compact("Применить", () -> {
      getPreferences(MODE_PRIVATE).edit().putInt("primaryCoordinates", primary.getSelectedItemPosition())
          .putInt("secondaryCoordinates", secondary.getSelectedItemPosition()-1).putBoolean("placemarkLabels", labels.isChecked())
          .putBoolean("keepScreenOn", screen.isChecked()).putInt("markerSize", marker.getProgress()+16).putInt("lineWidth", line.getProgress()+1).apply();
      gridEnabled=grid.isChecked();map.showGrid(gridEnabled);getPreferences(MODE_PRIVATE).edit().putBoolean("coordinateGrid",gridEnabled).apply();
      applySettings(); settingsDialog.dismiss();
    }));
    form.addView(compact("Закрыть", () -> settingsDialog.dismiss()));
    ScrollView scroll = new ScrollView(this); scroll.addView(form); showPanel(settingsDialog, scroll, dp(360), false);
  }

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

  @Override public void onBackPressed() {
    if (drawing != null && drawing.active()) { drawing.confirmCancel(); return; }
    super.onBackPressed();
  }

  @Override
  protected void onSaveInstanceState(Bundle state) {
    super.onSaveInstanceState(state);
    state.putLong("folder", explorer.folder);
    if (drawing != null) drawing.saveState(state);
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
    iconHandler.removeCallbacksAndMessages(null);
    if(compassController!=null)compassController.stop();
    if (map != null) map.view.onPause();
    super.onPause();
  }

  @Override
  protected void onDestroy() {
    iconHandler.removeCallbacksAndMessages(null);
    for(Dialog panel:openPanels)if(panel.isShowing())panel.dismiss();
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
