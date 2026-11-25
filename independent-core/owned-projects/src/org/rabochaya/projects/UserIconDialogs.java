package org.rabochaya.projects;

import android.app.AlertDialog;
import android.graphics.Bitmap;
import android.graphics.LightingColorFilter;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

final class UserIconDialogs {
 private final ObjectManagerActivity activity;
 private final UserIconLibrary library;
 private final String key, token;

 UserIconDialogs(ObjectManagerActivity activity, String key, String token) throws IOException {
  this.activity = activity;
  this.library = new UserIconLibrary(activity.getFilesDir());
  this.key = key;
  this.token = token;
 }

 void show(String category) throws IOException {
  List<String> labels = new ArrayList<>();
  List<Runnable> actions = new ArrayList<>();
  if (category.isEmpty()) {
   add(labels, actions, "Создать категорию", () -> create());
   add(labels, actions, "Установить набор значков (ZIP)", () -> pick(category, true));
  } else {
   int slash = category.lastIndexOf('/');
   add(labels, actions, "Вверх", () -> reopen(slash < 0 ? "" : category.substring(0, slash)));
  }
  add(labels, actions, "Импортировать SVG", () -> pick(category, false));
  File[] items = library.entries(category);
  if (items.length == 0 && !category.isEmpty()) {
   int slash = category.lastIndexOf('/');
   String parent = slash < 0 ? "" : category.substring(0, slash);
   String name = category.substring(slash + 1);
   add(labels, actions, "Удалить пустую категорию", () -> confirmDelete(parent, name));
  }
  for (File item : items) {
   String name = item.getName();
   if (item.isDirectory()) {
    add(labels, actions, "Категория · " + name, () -> reopen(category.isEmpty() ? name : category + "/" + name));
   } else {
    add(labels, actions, name, () -> preview(category, name));
   }
  }
  activity.iconDialog().setTitle(category.isEmpty() ? "Менеджер значков" : category)
   .setItems(labels.toArray(new String[0]), (d, index) -> actions.get(index).run())
   .setNegativeButton("Закрыть", null).show();
 }

 private static void add(List<String> labels, List<Runnable> actions, String title, Runnable action) {
  labels.add(title);
  actions.add(action);
 }

 private void pick(String category, boolean pack) {
  activity.pickLibraryFile(key, token, category, pack);
 }

 private void reopen(String category) {
  try { show(category); }
  catch (IOException error) { activity.iconNotice(error.getMessage()); }
 }

 private void create() {
  EditText name = new EditText(activity);
  name.setSingleLine();
  name.setTypeface(WorkspaceUi.font(activity));
  AlertDialog dialog = activity.iconDialog().setTitle("Название категории").setView(name)
   .setPositiveButton("Создать", null).setNegativeButton("Отмена", (d, w) -> reopen("")).create();
  dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
   try {
    library.createCategory(name.getText().toString());
    dialog.dismiss();
    reopen("");
   } catch (IOException error) { name.setError(error.getMessage()); }
  }));
  dialog.show();
 }

 private void confirmDelete(String category, String name) {
  activity.iconDialog().setTitle("Удалить «" + name + "»?")
   .setMessage("Значки, уже добавленные к меткам и проектам KMZ, сохранятся.")
   .setPositiveButton("Удалить", (d, w) -> {
    try {
     library.delete(category, name);
     reopen(category);
    } catch (IOException error) { activity.iconNotice(error.getMessage()); }
   }).setNegativeButton("Отмена", (d, w) -> reopen(category)).show();
 }

 private void preview(String category, String name) {
  byte[] bytes;
  Bitmap bitmap;
  try {
   bytes = library.read(category, name);
   bitmap = SvgRaster.preview(SvgIcon.parse(bytes), WorkspaceUi.dp(activity, 96));
  } catch (IOException | IllegalArgumentException error) {
   activity.iconNotice(error.getMessage());
   return;
  }
  LinearLayout panel = new LinearLayout(activity);
  panel.setOrientation(LinearLayout.VERTICAL);
  int inset = WorkspaceUi.dp(activity, 16);
  panel.setPadding(inset, inset, inset, inset);
  ImageView preview = new ImageView(activity);
  preview.setContentDescription("Предпросмотр значка");
  preview.setImageBitmap(bitmap);
  preview.setScaleType(ImageView.ScaleType.FIT_CENTER);
  panel.addView(preview, new LinearLayout.LayoutParams(-1, WorkspaceUi.dp(activity, 96)));
  EditText color = new EditText(activity);
  color.setTypeface(WorkspaceUi.font(activity));
  color.setSingleLine();
  color.setHint("Цвет aabbggrr, пусто — исходный");
  if (key != null) panel.addView(color);
  color.addTextChangedListener(new TextWatcher() {
   public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
   public void onTextChanged(CharSequence s, int start, int before, int count) {
    Integer paint = KmlComponentStyle.color(s.toString().trim());
    preview.setColorFilter(paint == null ? null : new LightingColorFilter(paint & 0xffffff, 0));
    preview.setImageAlpha(paint == null ? 255 : paint >>> 24);
   }
   public void afterTextChanged(Editable s) {}
  });
  AlertDialog dialog = activity.iconDialog().setTitle(name).setView(panel)
   .setPositiveButton(key == null ? "Закрыть" : "Выбрать", null).setNeutralButton("Удалить", (d, w) -> confirmDelete(category, name))
   .setNegativeButton("Назад", (d, w) -> reopen(category)).create();
  dialog.setOnDismissListener(d -> {
   preview.setImageDrawable(null);
   bitmap.recycle();
  });
  if (key != null) dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
   try {
    String tint = KmlComponentStyleEdit.value("component-icon", color.getText().toString());
    dialog.dismiss();
    activity.assignLibraryIcon(key, token, bytes, tint.isEmpty() ? "ffffffff" : tint);
   } catch (IllegalArgumentException invalid) { color.setError(invalid.getMessage()); }
  }));
  dialog.show();
 }
}
