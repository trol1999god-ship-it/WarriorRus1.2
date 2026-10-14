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
    map = new MapWorkspace(this, p -> edit(null, p));
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
    coordinates = label("", 13);
    coordinates.setBackground(plate());
    FrameLayout.LayoutParams hud =
        new FrameLayout.LayoutParams(-2, -2, Gravity.TOP | Gravity.START);
    hud.setMargins(dp(8), dp(8), dp(8), 0);
    root.addView(coordinates, hud);
    LinearLayout toolbar = new LinearLayout(this);
    toolbar.setOrientation(LinearLayout.VERTICAL);
    toolbar.setBackground(plate());
    toolbar.addView(compact("Карты", () -> mapsMenu()));
    toolbar.addView(compact("Слои", () -> openExplorer(false)));
    toolbar.addView(compact("Метки", () -> marksMenu()));
    toolbar.addView(compact("Инструменты", () -> toolsMenu()));
    FrameLayout.LayoutParams bottom =
        new FrameLayout.LayoutParams(-2, -2, Gravity.BOTTOM | Gravity.START);
    bottom.setMargins(dp(8), 0, 0, dp(24));
    root.addView(toolbar, bottom);
    LinearLayout zoom = new LinearLayout(this);
    zoom.setOrientation(LinearLayout.VERTICAL);
    zoom.setBackground(plate());
    zoom.addView(compact("＋", () -> map.view.getController().zoomIn()));
    zoom.addView(compact("−", () -> map.view.getController().zoomOut()));
    FrameLayout.LayoutParams right =
        new FrameLayout.LayoutParams(dp(48), -2, Gravity.END | Gravity.CENTER_VERTICAL);
    right.setMargins(0, 0, dp(8), 0);
    root.addView(zoom, right);
    TextView attribution = label("© OpenStreetMap", 11);
    FrameLayout.LayoutParams credit =
        new FrameLayout.LayoutParams(-2, -2, Gravity.BOTTOM | Gravity.END);
    root.addView(attribution, credit);
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
    drawer.setBackgroundColor(0xfff4f6fa);
    TextView title = label("Warrior Explorer", 20);
    title.setTypeface(null, Typeface.BOLD);
    drawer.addView(title);
    path = label("", 14);
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
    actions.addView(button("Слои", () -> style()));
    actions.addView(
        button(
            "Сортировка",
            () -> {
              explorer.alphabetical = !explorer.alphabetical;
              refresh();
            }));
    LinearLayout explorerToolbar = new LinearLayout(this);
    explorerToolbar.addView(
        button(
            "Операции",
            () -> {
              PopupMenu menu = new PopupMenu(this, explorerToolbar);
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
        button(
            "Вид",
            () -> {
              cards = !cards;
              getPreferences(MODE_PRIVATE).edit().putBoolean("explorerCards", cards).apply();
              refresh();
            }));
    explorerToolbar.addView(button("Значки", () -> openIcons()));
    explorerToolbar.addView(button("Папки", () -> folderMenu()));
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
    status = label("", 12);
    drawer.addView(status);
    root.setOnApplyWindowInsetsListener(
        (v, insets) -> {
          v.setPadding(
              insets.getSystemWindowInsetLeft(),
              insets.getSystemWindowInsetTop(),
              insets.getSystemWindowInsetRight(),
              insets.getSystemWindowInsetBottom());
          return insets;
        });
    setContentView(root);
    root.requestApplyInsets();
    explorerDialog = new Dialog(this);
    explorerDialog.setContentView(drawer);
    explorerDialog.setOnDismissListener(d -> onScreenOnly = false);
    refresh();
    updateCoordinates();
  }

  private android.graphics.drawable.Drawable plate() {
    GradientDrawable bg = new GradientDrawable();
    bg.setColor(0xddeff3f8);
    bg.setCornerRadius(dp(12));
    return bg;
  }

  private Button compact(String name, Runnable action) {
    Button b = button(name, action);
    b.setMinWidth(0);
    b.setMinimumWidth(0);
    b.setPadding(dp(8), 0, dp(8), 0);
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

  private void mapsMenu() {
    sheet(
        "Карты",
        new String[] {"OpenStreetMap — онлайн", "Только загруженные тайлы"},
        n -> map.view.setUseDataConnection(n == 0));
  }

  private void openExplorer(boolean visibleOnly) {
    onScreenOnly = visibleOnly;
    explorer.folder = 0;
    explorer.query = "";
    refresh();
    explorerDialog.show();
    android.view.Window window = explorerDialog.getWindow();
    if (window != null) {
      window.setBackgroundDrawableResource(android.R.color.transparent);
      window.setGravity(Gravity.BOTTOM);
      window.setLayout(
          Math.min(getResources().getDisplayMetrics().widthPixels - dp(16), dp(640)),
          Math.round(getResources().getDisplayMetrics().heightPixels * 0.78f));
    }
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
                  new String[] {"Список / карточки Explorer", "Warrior Icons"},
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
          "Warrior Explorer",
          "Warrior Icons",
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
    names.add("Warrior");
    for (MapItem i : store.renderItems())
      if (i.isFolder()) {
        List<String> chain = new ArrayList<>();
        for (MapItem p = i; p != null; p = store.get(p.parent)) chain.add(p.name);
        Collections.reverse(chain);
        ids.add(i.id);
        names.add("Warrior / " + android.text.TextUtils.join(" / ", chain));
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
    MapItem chosen = store.get(selectedPoint);
    double lat = chosen == null ? map.view.getMapCenter().getLatitude() : chosen.latitude,
        lon = chosen == null ? map.view.getMapCenter().getLongitude() : chosen.longitude;
    double z = map.view.getZoomLevelDouble();
    double metres = 156543.03392 * Math.cos(Math.toRadians(lat)) / Math.pow(2, z);
    coordinates.setText(
        String.format(
            Locale.ROOT,
            "%s  %.6f, %.6f\nZ %.1f · %.2f м/пкс",
            chosen == null ? "Центр" : "Метка",
            lat,
            lon,
            z,
            metres));
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
    if (!onScreenOnly) return explorer.entries();
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
    map.refresh(store);
    crumbs.removeAllViews();
    path.setText("‹");
    path.setContentDescription("На уровень выше");
    crumbs.addView(path);
    TextView rootCrumb = label("Warrior", 14);
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
      TextView crumb = label("› " + i.name, 14);
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
    TextView home = label("⌂ Все объекты", 13);
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
      bg.setColor(explorer.selected.contains(i.id) ? 0xffdceaff : Color.WHITE);
      bg.setCornerRadius(dp(8));
      row.setBackground(bg);
      CheckBox select = new CheckBox(this);
      select.setChecked(explorer.selected.contains(i.id));
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
      TextView name = label((i.isFolder() ? "📁 " : "● ") + i.name, 15);
      if (cards && !i.isFolder())
        name.setText(
            String.format(Locale.ROOT, "● %s\n%.5f, %.5f", i.name, i.latitude, i.longitude));
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
      visibility.setContentDescription("Показать слой " + i.name);
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
      rows.addView(row);
    }
    updateCoordinates();
    status.setText(
        "Выбрано: "
            + explorer.selected.size()
            + "  ·  "
            + (explorer.alphabetical ? "По имени" : "Порядок слоёв")
            + "  ·  "
            + (store.canUndo() ? "Доступна отмена" : "Локальная база")
            + "  ·  © OpenStreetMap");
  }

  private String indent(int depth) {
    StringBuilder b = new StringBuilder();
    for (int n = 0; n < Math.min(depth, 8); n++) b.append("  ");
    return b.toString();
  }

  private void addTree(long parent, int depth) {
    for (MapItem i : store.all())
      if (i.parent == parent && i.isFolder()) {
        TextView v = label(indent(depth) + "📁 " + i.name, 12);
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
    PopupMenu menu = new PopupMenu(this, anchor);
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
    if (explorerDialog != null && explorerDialog.isShowing()) explorerDialog.dismiss();
    if (map != null) map.view.onDetach();
    if (store != null) store.close();
    super.onDestroy();
  }
}
