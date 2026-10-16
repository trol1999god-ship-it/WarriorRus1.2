package ru.warriorrus.app.icons;

import android.app.*;
import android.content.*;
import android.database.Cursor;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.*;
import android.provider.OpenableColumns;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.util.*;
import ru.warriorrus.app.data.ObjectStore;

/**
 * Touch-first SVG file manager and point-icon picker. No storage permissions or network clients.
 */
public final class IconsActivity extends Activity {
  public static final String POINT_IDS = "point_ids";
  private IconLibrary library;
  private ObjectStore store;
  private LinearLayout list, crumbs;
  private TextView status;
  private String folder = "";
  private final Set<String> selected = new LinkedHashSet<>();
  private List<String> clipboard = new ArrayList<>();
  private boolean cut;
  private volatile boolean foreground;
  private int color = 0xff3f6db5;
  private long[] pointIds;
  private long revision = Long.MIN_VALUE;
  private final android.util.LruCache<String, android.graphics.drawable.Drawable.ConstantState>
      thumbnails = new android.util.LruCache<>(128);
  private final Handler handler = new Handler(Looper.getMainLooper());
  private final Runnable update =
      () -> {
        if (foreground) {
          thumbnails.evictAll();
          refresh();
        }
      };
  private final Runnable poll =
      new Runnable() {
        public void run() {
          if (foreground) {
            try {
              if (library == null || library.fingerprint() != revision) refresh();
            } catch (IOException unavailable) {
              refresh();
            }
            handler.postDelayed(this, 3000);
          }
        }
      };

  private int dp(int n) {
    return Math.round(n * getResources().getDisplayMetrics().density);
  }

  private TextView text(String s, int size) {
    TextView v = new TextView(this);
    v.setText(s);
    v.setTextSize(size);
    v.setTextColor(0xff202632);
    v.setPadding(dp(12), dp(10), dp(12), dp(10));
    return v;
  }

  private Button button(String s, Runnable action) {
    Button b = new Button(this);
    b.setText(s);
    b.setTextSize(12);
    b.setMinHeight(dp(48));
    b.setOnClickListener(v -> action.run());
    return b;
  }

  private interface Operation {
    void run() throws Exception;
  }

  private void execute(Operation action) {
    try {
      if (library == null) library = IconLibrary.open(this);
      action.run();
      refresh();
    } catch (Exception e) {
      error(e);
    }
  }

  private void error(Exception e) {
    new AlertDialog.Builder(this)
        .setTitle("Значки — Рабочая карта")
        .setMessage(e.getMessage())
        .setPositiveButton("ОК", null)
        .show();
  }

  @Override
  public void onCreate(Bundle state) {
    super.onCreate(state);
    store = new ObjectStore(this);
    color = getPreferences(MODE_PRIVATE).getInt("previewColor", color);
    pointIds = getIntent().getLongArrayExtra(POINT_IDS);
    if (state != null) {
      folder = state.getString("folder", "");
      color = state.getInt("color", color);
    }
    try {
      library = IconLibrary.open(this);
    } catch (IOException e) {
      error(e);
    }
    LinearLayout root = new LinearLayout(this);
    root.setOrientation(LinearLayout.VERTICAL);
    root.setBackgroundColor(0xfff4f6fa);
    root.addView(text("Значки — Рабочая карта", 22));
    HorizontalScrollView nav = new HorizontalScrollView(this);
    crumbs = new LinearLayout(this);
    nav.addView(crumbs);
    root.addView(nav);
    HorizontalScrollView toolbar = new HorizontalScrollView(this);
    LinearLayout actions = new LinearLayout(this);
    toolbar.addView(actions);
    root.addView(toolbar);
    actions.addView(
        button(
            "Папка +", () -> nameDialog("Новая папка", "", name -> library.mkdir(folder, name))));
    actions.addView(button("SVG +", () -> createSvg()));
    actions.addView(button("Импорт SVG", () -> importFiles()));
    actions.addView(button("Обновить", () -> execute(() -> thumbnails.evictAll())));
    actions.addView(
        button(
            "Выделить всё",
            () ->
                execute(
                    () -> {
                      for (IconLibrary.Entry e : library.list(folder)) selected.add(e.key);
                    })));
    actions.addView(
        button(
            "Снять",
            () -> {
              selected.clear();
              refresh();
            }));
    actions.addView(
        button(
            "Копировать",
            () -> {
              clipboard = new ArrayList<>(selected);
              cut = false;
              refresh();
            }));
    actions.addView(
        button(
            "Вырезать",
            () -> {
              clipboard = new ArrayList<>(selected);
              cut = true;
              refresh();
            }));
    actions.addView(
        button(
            "Вставить",
            () ->
                execute(
                    () -> {
                      store.relocateIcons(library.transfer(clipboard, folder, !cut));
                      if (cut) clipboard.clear();
                      selected.clear();
                    })));
    actions.addView(button("Переименовать", () -> rename()));
    actions.addView(button("Переместить", () -> move()));
    actions.addView(button("Удалить", () -> delete()));
    actions.addView(button("Цвет", () -> chooseColor()));
    if (pointIds != null && pointIds.length > 0)
      actions.addView(button("Назначить меткам", () -> assign()));
    ScrollView scroll = new ScrollView(this);
    list = new LinearLayout(this);
    list.setOrientation(LinearLayout.VERTICAL);
    scroll.addView(list);
    root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
    status = text("", 12);
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
    if (list == null) return;
    crumbs.removeAllViews();
    crumbs.addView(button("Пользовательские", () -> open("")));
    crumbs.addView(button("Встроенные 🔒", () -> open("@builtin")));
    if (!folder.isEmpty() && !folder.equals("@builtin")) {
      String path = "";
      for (String part : folder.split("/")) {
        path += (path.isEmpty() ? "" : "/") + part;
        final String dest = path;
        crumbs.addView(button("› " + part, () -> open(dest)));
      }
    }
    list.removeAllViews();
    if (library == null) {
      status.setText("Хранилище недоступно. Нажмите «Обновить» после подключения.");
      return;
    }
    try {
      if (!folder.equals("@builtin") && !library.resolve(folder).isDirectory()) folder = "";
      List<IconLibrary.Entry> entries = library.list(folder);
      Set<String> exists = new HashSet<>();
      for (IconLibrary.Entry e : entries) exists.add(e.key);
      selected.retainAll(exists);
      for (IconLibrary.Entry e : entries) {
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(64));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(selected.contains(e.key) ? 0xffdceaff : Color.WHITE);
        bg.setCornerRadius(dp(10));
        row.setBackground(bg);
        CheckBox check = new CheckBox(this);
        check.setContentDescription("Выбрать " + e.name());
        check.setChecked(selected.contains(e.key));
        check.setOnClickListener(
            v -> {
              if (!selected.remove(e.key)) selected.add(e.key);
              refresh();
            });
        row.addView(check);
        if (!e.folder) {
          ImageView preview = new ImageView(this);
          preview.setContentDescription("Предпросмотр " + e.name());
          try {
            preview.setImageDrawable(thumbnail(e.key));
          } catch (Exception invalid) {
            preview.setImageResource(android.R.drawable.ic_dialog_alert);
          }
          row.addView(preview, new LinearLayout.LayoutParams(dp(48), dp(48)));
        }
        TextView label = text((e.folder ? "📁 " : e.builtin ? "🔒 " : "") + e.name(), 16);
        row.addView(label, new LinearLayout.LayoutParams(0, -2, 1));
        label.setOnClickListener(
            v -> {
              if (e.folder) open(e.key);
              else preview(e);
            });
        row.setOnLongClickListener(
            v -> {
              selected.add(e.key);
              context(e, label);
              return true;
            });
        list.addView(row);
      }
      status.setText(
          "Выбрано: "
              + selected.size()
              + " · Цвет: "
              + String.format(Locale.ROOT, "#%06X", color & 0xffffff)
              + "\nUSB: "
              + library.root
              + "\n"
              + (pointIds == null
                  ? "Выберите метки в Explorer для назначения значка"
                  : "Метки для назначения: " + pointIds.length));
      revision = library.fingerprint();
      if (foreground)
        library.watch(
            () -> {
              handler.removeCallbacks(update);
              handler.postDelayed(update, 350);
            });
    } catch (Exception e) {
      status.setText("Не удалось обновить: " + e.getMessage());
    }
  }

  private android.graphics.drawable.Drawable thumbnail(String key) throws Exception {
    String cacheKey = key + ":" + color;
    if (!key.startsWith("builtin:")) {
      File file = library.resolve(key);
      cacheKey += ":" + file.lastModified() + ":" + file.length();
    }
    android.graphics.drawable.Drawable.ConstantState cached = thumbnails.get(cacheKey);
    if (cached != null) return cached.newDrawable(getResources());
    android.graphics.drawable.Drawable drawable =
        SvgPreview.render(getResources(), library.text(key), color, dp(40));
    if (drawable.getConstantState() != null) thumbnails.put(cacheKey, drawable.getConstantState());
    return drawable;
  }

  private void open(String dest) {
    folder = dest;
    selected.clear();
    refresh();
  }

  private void context(IconLibrary.Entry e, View anchor) {
    PopupMenu menu = new PopupMenu(this, anchor);
    String[] commands = {
      "Просмотр", "Переименовать", "Копировать", "Вырезать", "Переместить", "Удалить"
    };
    for (String c : commands) menu.getMenu().add(c);
    menu.setOnMenuItemClickListener(
        item -> {
          switch (item.getTitle().toString()) {
            case "Просмотр":
              if (e.folder) open(e.key);
              else preview(e);
              break;
            case "Переименовать":
              rename();
              break;
            case "Копировать":
              clipboard = new ArrayList<>(selected);
              cut = false;
              break;
            case "Вырезать":
              clipboard = new ArrayList<>(selected);
              cut = true;
              break;
            case "Переместить":
              move();
              break;
            case "Удалить":
              delete();
              break;
          }
          return true;
        });
    menu.show();
  }

  private interface Named {
    void run(String name) throws Exception;
  }

  private void nameDialog(String title, String initial, Named action) {
    EditText input = new EditText(this);
    input.setSingleLine(true);
    input.setText(initial);
    AlertDialog d =
        new AlertDialog.Builder(this)
            .setTitle(title)
            .setView(input)
            .setPositiveButton("Сохранить", null)
            .setNegativeButton("Отмена", null)
            .create();
    d.setOnShowListener(
        v ->
            d.getButton(-1)
                .setOnClickListener(
                    w -> {
                      try {
                        if (library == null) library = IconLibrary.open(this);
                        action.run(input.getText().toString());
                        d.dismiss();
                        refresh();
                      } catch (Exception e) {
                        input.setError(e.getMessage());
                      }
                    }));
    d.show();
  }

  private void rename() {
    if (selected.size() != 1) {
      error(new IOException("Выберите один файл или папку"));
      return;
    }
    String key = selected.iterator().next();
    nameDialog(
        "Переименовать",
        new File(key).getName(),
        name -> {
          store.relocateIcons(library.rename(key, name));
          selected.clear();
        });
  }

  private void move() {
    if (selected.isEmpty()) return;
    nameDialog(
        "Путь папки от icons (пусто — корень)",
        "",
        dest -> {
          store.relocateIcons(library.transfer(selected, dest, false));
          selected.clear();
        });
  }

  private void delete() {
    if (selected.isEmpty()) return;
    new AlertDialog.Builder(this)
        .setTitle("Удалить выбранные файлы и папки?")
        .setMessage(
            "Удаление файлов необратимо. Метки сохранятся и будут показаны запасным значком.")
        .setPositiveButton(
            "Удалить",
            (d, w) ->
                execute(
                    () -> {
                      library.delete(selected);
                      selected.clear();
                    }))
        .setNegativeButton("Отмена", null)
        .show();
  }

  private void createSvg() {
    LinearLayout form = new LinearLayout(this);
    form.setOrientation(LinearLayout.VERTICAL);
    EditText name = new EditText(this), code = new EditText(this);
    name.setHint("Имя.svg");
    code.setText(IconLibrary.PIN);
    code.setMinLines(5);
    form.addView(name);
    form.addView(code);
    AlertDialog d =
        new AlertDialog.Builder(this)
            .setTitle("Создать SVG")
            .setView(form)
            .setPositiveButton("Создать", null)
            .setNegativeButton("Отмена", null)
            .create();
    d.setOnShowListener(
        v ->
            d.getButton(-1)
                .setOnClickListener(
                    w -> {
                      try {
                        if (library == null) library = IconLibrary.open(this);
                        library.importSvg(
                            folder,
                            name.getText().toString(),
                            new ByteArrayInputStream(
                                code.getText()
                                    .toString()
                                    .getBytes(java.nio.charset.StandardCharsets.UTF_8)));
                        d.dismiss();
                        refresh();
                      } catch (Exception e) {
                        code.setError(e.getMessage());
                      }
                    }));
    d.show();
  }

  private void importFiles() {
    Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT);
    i.setType("*/*");
    i.addCategory(Intent.CATEGORY_OPENABLE);
    i.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
    startActivityForResult(i, 41);
  }

  @Override
  protected void onActivityResult(int request, int result, Intent data) {
    super.onActivityResult(request, result, data);
    if (request != 41 || result != RESULT_OK || data == null) return;
    List<android.net.Uri> uris = new ArrayList<>();
    if (data.getClipData() != null)
      for (int n = 0; n < data.getClipData().getItemCount(); n++)
        uris.add(data.getClipData().getItemAt(n).getUri());
    else if (data.getData() != null) uris.add(data.getData());
    int success = 0;
    List<String> failures = new ArrayList<>();
    for (android.net.Uri uri : uris) {
      try {
        if (library == null) library = IconLibrary.open(this);
        String name = "import.svg";
        try (Cursor cursor =
            getContentResolver()
                .query(uri, new String[] {OpenableColumns.DISPLAY_NAME}, null, null, null)) {
          if (cursor != null && cursor.moveToFirst()) name = cursor.getString(0);
        }
        if (name == null || !name.toLowerCase(Locale.ROOT).endsWith(".svg"))
          throw new IOException("Выберите файл .svg");
        try (InputStream in = getContentResolver().openInputStream(uri)) {
          if (in == null) throw new IOException("Файл недоступен");
          library.importSvg(folder, name, in);
        }
        success++;
      } catch (Exception e) {
        failures.add(e.getMessage());
      }
    }
    refresh();
    new AlertDialog.Builder(this)
        .setTitle("Импортировано: " + success)
        .setMessage(
            failures.isEmpty()
                ? "SVG сохранены в пользовательскую библиотеку"
                : android.text.TextUtils.join("\n", failures))
        .setPositiveButton("ОК", null)
        .show();
  }

  private void chooseColor() {
    EditText input = new EditText(this);
    input.setSingleLine(true);
    input.setHint("#RRGGBB");
    input.setText(String.format(Locale.ROOT, "#%06X", color & 0xffffff));
    AlertDialog d =
        new AlertDialog.Builder(this)
            .setTitle("Цвет предпросмотра и выбранных меток")
            .setView(input)
            .setPositiveButton("Применить", null)
            .setNegativeButton("Отмена", null)
            .create();
    d.setOnShowListener(
        v ->
            d.getButton(-1)
                .setOnClickListener(
                    w -> {
                      try {
                        color = Color.parseColor(input.getText().toString());
                        getPreferences(MODE_PRIVATE).edit().putInt("previewColor", color).apply();
                        d.dismiss();
                        refresh();
                      } catch (Exception e) {
                        input.setError("Введите #RRGGBB");
                      }
                    }));
    d.show();
  }

  private void preview(IconLibrary.Entry e) {
    try {
      LinearLayout box = new LinearLayout(this);
      box.setOrientation(LinearLayout.VERTICAL);
      ImageView image = new ImageView(this);
      image.setImageDrawable(
          SvgPreview.render(getResources(), library.text(e.key), color, dp(160)));
      box.addView(image, new LinearLayout.LayoutParams(-1, dp(180)));
      box.addView(text(e.key, 14));
      new AlertDialog.Builder(this)
          .setTitle("Предпросмотр SVG")
          .setView(box)
          .setPositiveButton(
              "Выбрать",
              (d, w) -> {
                selected.clear();
                selected.add(e.key);
                refresh();
              })
          .setNeutralButton("Цвет", (d, w) -> chooseColor())
          .setNegativeButton("Закрыть", null)
          .show();
    } catch (Exception invalid) {
      error(invalid);
    }
  }

  private void assign() {
    if (selected.size() != 1) {
      error(new IOException("Выберите один SVG"));
      return;
    }
    execute(
        () -> {
          String key = selected.iterator().next();
          SvgPreview.parse(library.text(key));
          List<Long> ids = new ArrayList<>();
          for (long id : pointIds) ids.add(id);
          store.assignIcon(ids, key, color);
          setResult(RESULT_OK);
          finish();
        });
  }

  @Override
  protected void onResume() {
    super.onResume();
    foreground = true;
    refresh();
    handler.postDelayed(poll, 3000);
  }

  @Override
  protected void onPause() {
    foreground = false;
    handler.removeCallbacksAndMessages(null);
    if (library != null) library.stopWatching();
    super.onPause();
  }

  @Override
  protected void onDestroy() {
    if (library != null) library.stopWatching();
    handler.removeCallbacksAndMessages(null);
    store.close();
    super.onDestroy();
  }

  @Override
  protected void onSaveInstanceState(Bundle state) {
    super.onSaveInstanceState(state);
    state.putString("folder", folder);
    state.putInt("color", color);
  }
}
