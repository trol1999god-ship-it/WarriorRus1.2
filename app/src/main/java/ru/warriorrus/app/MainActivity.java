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
    LinearLayout root = new LinearLayout(this);
    root.setOrientation(LinearLayout.VERTICAL);
    root.setBackgroundColor(0xfff3f5f9);
    LinearLayout bar = new LinearLayout(this);
    bar.addView(
        button(
            "☰ Explorer",
            () -> {
              drawer.setVisibility(
                  drawer.getVisibility() == View.VISIBLE ? View.GONE : View.VISIBLE);
            }));
    bar.addView(button("＋ Точка", () -> edit(null, (GeoPoint) map.view.getMapCenter())));
    bar.addView(button("Отмена", () -> run(() -> store.undo())));
    bar.addView(
        button(
            "Карты",
            () ->
                new AlertDialog.Builder(this)
                    .setTitle("Карта OpenStreetMap")
                    .setMessage(
                        "Онлайн: загружаются только тайлы. Точки остаются на устройстве. Без сети"
                            + " доступны ранее закэшированные тайлы; гарантированный офлайн-атлас"
                            + " ещё не реализован.")
                    .setPositiveButton("Онлайн", (d, w) -> map.view.setUseDataConnection(true))
                    .setNegativeButton("Только кэш", (d, w) -> map.view.setUseDataConnection(false))
                    .show()));
    root.addView(bar);
    LinearLayout body = new LinearLayout(this);
    body.setOrientation(
        getResources().getConfiguration().screenWidthDp >= 700
            ? LinearLayout.HORIZONTAL
            : LinearLayout.VERTICAL);
    root.addView(body, new LinearLayout.LayoutParams(-1, 0, 1));
    body.addView(
        map.view,
        new LinearLayout.LayoutParams(
            getResources().getConfiguration().screenWidthDp >= 700 ? 0 : -1,
            getResources().getConfiguration().screenWidthDp >= 700 ? -1 : 0,
            1));
    drawer = new LinearLayout(this);
    drawer.setOrientation(LinearLayout.VERTICAL);
    drawer.setBackgroundColor(0xfff4f6fa);
    body.addView(
        drawer,
        new LinearLayout.LayoutParams(
            getResources().getConfiguration().screenWidthDp >= 700 ? dp(380) : -1,
            getResources().getConfiguration().screenWidthDp >= 700 ? -1 : dp(330)));
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
    drawer.addView(tools);
    actions.addView(button("Папка +", () -> newFolder()));
    actions.addView(
        button(
            "Выделить всё",
            () -> {
              for (MapItem i : explorer.entries()) explorer.selected.add(i.id);
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
    LinearLayout lists = new LinearLayout(this);
    drawer.addView(lists, new LinearLayout.LayoutParams(-1, 0, 1));
    ScrollView folders = new ScrollView(this);
    tree = new LinearLayout(this);
    tree.setOrientation(LinearLayout.VERTICAL);
    folders.addView(tree);
    lists.addView(folders, new LinearLayout.LayoutParams(dp(120), -1));
    ScrollView content = new ScrollView(this);
    rows = new LinearLayout(this);
    rows.setOrientation(LinearLayout.VERTICAL);
    content.addView(rows);
    lists.addView(content, new LinearLayout.LayoutParams(0, -1, 1));
    status = label("", 12);
    root.addView(status);
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
    refresh();
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
    for (MapItem i : explorer.entries()) {
      LinearLayout row = new LinearLayout(this);
      row.setGravity(Gravity.CENTER_VERTICAL);
      row.setMinimumHeight(dp(56));
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
      TextView name = label((i.isFolder() ? "📁 " : "● ") + i.name, 15);
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
      Button handle = button("↕", () -> context(i, name));
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
      row.addView(handle);
      if (i.isFolder()) dropTarget(row, () -> i.id);
      rows.addView(row);
    }
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
  }

  @Override
  protected void onResume() {
    super.onResume();
    if (map != null) map.view.onResume();
  }

  @Override
  protected void onPause() {
    if (map != null) map.view.onPause();
    super.onPause();
  }

  @Override
  protected void onDestroy() {
    if (map != null) map.view.onDetach();
    if (store != null) store.close();
    super.onDestroy();
  }
}
