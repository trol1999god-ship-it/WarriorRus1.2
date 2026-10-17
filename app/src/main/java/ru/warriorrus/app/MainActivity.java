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
  private TextView coordinates;
  private boolean cards, onScreenOnly, gridEnabled;
  private long selectedPoint;
  private boolean coordinatesCollapsed, mapLayerVisible, rightCollapsed;
  private int mapLayerOpacity;
  private Dialog menuDialog, layersDialog, mapsDialog;
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
    v.setTextColor(0xff202632);
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
    root.setBackgroundColor(0xfff3f5f9);
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
    system.setPadding(dp(8), dp(3), dp(4), 0);
    coordinateDetails.addView(system);
    coordinates = hudText("", 11);
    coordinates.setPadding(dp(8), dp(2), 0, dp(2));
    coordinateDetails.addView(coordinates);
    TextView additional = hudText("MGRS —  ·  Высота —", 10);
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
    String[] tabNames = {"Меню", "Объекты", "Слои", "Карты"};
    int[] tabIcons = {R.drawable.ui_menu, R.drawable.ui_pin, R.drawable.ui_layers, R.drawable.ui_map};
    Runnable[] tabActions = {this::mainMenu, this::objectsMenu, this::layersMenu, this::mapsMenu};
    for (int i = 0; i < tabNames.length; i++) {
      Button tab = iconButton(tabNames[i], tabIcons[i], tabActions[i]);
      tab.setTag(tabNames[i]);
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
    String[] filterNames = {"Все", "Метки", "Папки"};
    String[] filterKinds = {"all", "point", "folder"};
    for (int i = 0; i < filterNames.length; i++) {
      final String kind = filterKinds[i];
      Button tab = compact(filterNames[i], () -> { objectFilter = kind; refresh(); });
      tab.setTag("filter:" + kind);
      objectTabs.add(tab);
      filters.addView(tab, new LinearLayout.LayoutParams(0, dp(48), 1));
    }
    if (getResources().getConfiguration().orientation == android.content.res.Configuration.ORIENTATION_LANDSCAPE)
      objectHeader.addView(filters, 1, new LinearLayout.LayoutParams(dp(240), dp(48)));
    else drawer.addView(filters);
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
        this::toolsMenu, () -> new AlertDialog.Builder(this).setTitle("Рабочая карта")
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
    Switch visible = new Switch(this);
    visible.setText("OpenStreetMap");
    visible.setTextColor(0xffe4f2ff);
    visible.setMinHeight(dp(48));
    visible.setChecked(mapLayerVisible);
    visible.setOnCheckedChangeListener((button, checked) -> {
      mapLayerVisible = checked;
      applyMapLayer();
      saveMapLayer();
    });
    panel.addView(visible);
    TextView opacity = hudText("Непрозрачность: " + mapLayerOpacity + "%", 13);
    panel.addView(opacity);
    SeekBar slider = new SeekBar(this);
    slider.setMax(100);
    slider.setProgress(mapLayerOpacity);
    slider.setContentDescription("Непрозрачность OpenStreetMap");
    slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
      public void onProgressChanged(SeekBar bar, int progress, boolean user) {
        mapLayerOpacity = progress;
        opacity.setText("Непрозрачность: " + progress + "%");
        applyMapLayer();
        saveMapLayer();
      }
      public void onStartTrackingTouch(SeekBar bar) {}
      public void onStopTrackingTouch(SeekBar bar) { saveMapLayer(); }
    });
    panel.addView(slider);
    panel.addView(compact("Карты", () -> { layersDialog.dismiss(); mapsMenu(); }));
    showPanel(layersDialog, panel, dp(360), false);
  }

  private void applyMapLayer() {
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
    String location =
        String.format(Locale.ROOT, "%.6f, %.6f", point.getLatitude(), point.getLongitude());
    new AlertDialog.Builder(this)
        .setTitle("Точка на карте: " + location)
        .setItems(
            new String[] {"Создать метку", "Скопировать координаты"},
            (dialog, which) -> {
              if (which == 0) edit(null, point);
              else {
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

  private void mapsMenu() {
    mapsDialog = new Dialog(this);
    LinearLayout panel = new LinearLayout(this);
    panel.setOrientation(LinearLayout.VERTICAL);
    panel.setPadding(dp(12), dp(12), dp(12), dp(12));
    panel.setBackground(plate());
    LinearLayout heading = new LinearLayout(this);
    heading.addView(hudText("Карты", 19), new LinearLayout.LayoutParams(0, -2, 1));
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
    panel.addView(modes);
    TextView source = hudText("© OpenStreetMap\nhttps://www.openstreetmap.org/copyright", 13);
    source.setAutoLinkMask(android.text.util.Linkify.WEB_URLS);
    source.setMovementMethod(android.text.method.LinkMovementMethod.getInstance());
    source.setCompoundDrawablesRelativeWithIntrinsicBounds(R.drawable.ui_map, 0, 0, 0);
    source.setCompoundDrawablePadding(dp(12));
    source.setMinHeight(dp(64));
    panel.addView(source);
    panel.addView(explanation);
    panel.addView(compact("Слои карт", () -> { mapsDialog.dismiss(); layersMenu(); }));
    update.run();
    showPanel(mapsDialog, panel, dp(360), false);
  }

  private void setMapOnline(boolean online) {
    map.view.setUseDataConnection(online);
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
    sheet(
        "Метки",
        new String[] {"Все метки", "Метки на экране", "Новая метка", "Поиск на карте", "Опции"},
        n -> {
          switch (n) {
            case 0:
              openExplorer(false);
              break;
            case 1:
              openExplorer(true);
              break;
            case 2:
              edit(null, (GeoPoint) map.view.getMapCenter());
              break;
            case 3:
              searchMap();
              break;
            case 4:
              sheet(
                  "Опции меток",
                  new String[] {"Список / карточки Explorer", "Значки"},
                  k -> {
                    if (k == 0) {
                      cards = !cards;
                      getPreferences(MODE_PRIVATE)
                          .edit()
                          .putBoolean("explorerCards", cards)
                          .apply();
                      openExplorer(false);
                    } else openIcons();
                  });
              break;
          }
        });
  }

  private void toolsMenu() {
    sheet(
        "Инструменты",
        new String[] {
          gridEnabled ? "Выключить координатную сетку" : "Включить координатную сетку",
          "Объекты карты",
          "Значки",
          "Отмена последней операции"
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
      if (i != null && !i.isFolder()) ids.add(id);
    }
    long[] selectedIds = new long[ids.size()];
    for (int n = 0; n < ids.size(); n++) selectedIds[n] = ids.get(n);
    android.content.Intent intent =
        new android.content.Intent(this, ru.warriorrus.app.icons.IconsActivity.class);
    intent.putExtra(ru.warriorrus.app.icons.IconsActivity.POINT_IDS, selectedIds);
    store.clearUndo();
    startActivity(intent);
  }

  private void updateCoordinates() {
    if (coordinates == null) return;
    double lat = map.view.getMapCenter().getLatitude(),
        lon = map.view.getMapCenter().getLongitude();
    coordinates.setText(
        String.format(
            Locale.ROOT,
            "%.6f° %s   %.6f° %s",
            Math.abs(lat), lat < 0 ? "S" : "N",
            Math.abs(lon), lon < 0 ? "W" : "E"));
  }

  private void searchMap() {
    EditText input = new EditText(this);
    input.setHint("Название или широта, долгота");
    new AlertDialog.Builder(this)
        .setTitle("Поиск на карте — локально")
        .setView(input)
        .setPositiveButton(
            "Найти",
            (d, w) -> {
              String query = input.getText().toString().trim();
              String[] pair = query.split(",");
              if (pair.length == 2) {
                try {
                  double lat = Double.parseDouble(pair[0].trim()),
                      lon = Double.parseDouble(pair[1].trim());
                  if (Double.isNaN(lat)
                      || Double.isNaN(lon)
                      || Math.abs(lat) > 90
                      || Math.abs(lon) > 180) {
                    throw new IllegalArgumentException();
                  }
                  map.view.getController().setCenter(new GeoPoint(lat, lon));
                  updateCoordinates();
                  return;
                } catch (Exception invalid) {
                }
              }
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
        new String[] {"Подробнее", "Редактировать", "Выбрать значок", "Выделить в Explorer"},
        n -> {
          switch (n) {
            case 0:
              pointDetails(i);
              break;
            case 1:
              edit(i, new GeoPoint(i.latitude, i.longitude));
              break;
            case 2:
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
                "Координаты: %.6f, %.6f\nЗначок: %s\nЦвет: #%06X",
                i.latitude,
                i.longitude,
                i.icon,
                i.color & 0xffffff))
        .setPositiveButton(
            "Редактировать", (d, w) -> edit(i, new GeoPoint(i.latitude, i.longitude)))
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
      name.setContentDescription((i.isFolder() ? "Папка " : "Метка ") + i.name);
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
                        if (item == null)
                          store.create(explorer.folder, name.getText().toString(), "point", a, b);
                        else store.edit(item.id, name.getText().toString(), a, b);
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
            "Вложенные объекты папок также будут удалены. Доступна отмена последней операции до"
                + " закрытия приложения.")
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

  @Override
  protected void onSaveInstanceState(Bundle state) {
    super.onSaveInstanceState(state);
    state.putLong("folder", explorer.folder);
    state.putDouble("mapLat", map.view.getMapCenter().getLatitude());
    state.putDouble("mapLon", map.view.getMapCenter().getLongitude());
    state.putDouble("mapZoom", map.view.getZoomLevelDouble());
  }

  @Override
  protected void onResume() {
    super.onResume();
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
    if (map != null) map.view.onPause();
    super.onPause();
  }

  @Override
  protected void onDestroy() {
    iconHandler.removeCallbacksAndMessages(null);
    if (menuDialog != null) menuDialog.dismiss();
    if (layersDialog != null) layersDialog.dismiss();
    if (mapsDialog != null) mapsDialog.dismiss();
    if (explorerDialog != null && explorerDialog.isShowing()) explorerDialog.dismiss();
    if (map != null) map.view.onDetach();
    if (store != null) store.close();
    super.onDestroy();
  }
}
