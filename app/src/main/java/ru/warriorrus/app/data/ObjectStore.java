package ru.warriorrus.app.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import java.util.*;

/** Single transactional owner of the local working database. No network or exchange files. */
public final class ObjectStore extends SQLiteOpenHelper {
  private List<ContentValues> undo;

  public ObjectStore(Context context) {
    super(context, "warrior2.db", null, 3);
  }

  @Override
  public void onConfigure(SQLiteDatabase db) {
    db.setForeignKeyConstraintsEnabled(true);
  }

  @Override
  public void onCreate(SQLiteDatabase db) {
    db.execSQL(
        "CREATE TABLE objects(id INTEGER PRIMARY KEY AUTOINCREMENT,parent INTEGER REFERENCES"
            + " objects(id),name TEXT NOT NULL,kind TEXT NOT NULL CHECK(kind IN"
            + " ('folder','point')),latitude REAL NOT NULL DEFAULT 0,longitude REAL NOT NULL"
            + " DEFAULT 0,visible INTEGER NOT NULL DEFAULT 1,position INTEGER NOT NULL DEFAULT"
            + " 0,color INTEGER NOT NULL DEFAULT -12627531,opacity REAL NOT NULL DEFAULT 1,icon"
            + " TEXT NOT NULL DEFAULT 'builtin:pin')");
    db.execSQL("CREATE INDEX objects_parent ON objects(parent)");
    createMediaTables(db);
  }

  @Override
  public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
    if (oldVersion < 2)
      db.execSQL("ALTER TABLE objects ADD COLUMN icon TEXT NOT NULL DEFAULT 'builtin:pin'");
    if (oldVersion < 3) createMediaTables(db);
  }

  private void createMediaTables(SQLiteDatabase db) {
    db.execSQL("CREATE TABLE point_notes(point_id INTEGER PRIMARY KEY REFERENCES objects(id) ON DELETE CASCADE,note TEXT NOT NULL DEFAULT '')");
    db.execSQL("CREATE TABLE point_attachments(id INTEGER PRIMARY KEY AUTOINCREMENT,point_id INTEGER NOT NULL REFERENCES objects(id) ON DELETE CASCADE,display_name TEXT NOT NULL,mime TEXT NOT NULL,filename TEXT NOT NULL UNIQUE)");
    db.execSQL("CREATE INDEX point_attachments_point ON point_attachments(point_id)");
  }

  public List<MapItem> all() {
    List<MapItem> items = new ArrayList<>();
    try (Cursor c =
        getReadableDatabase().query("objects", null, null, null, null, null, "position,id")) {
      while (c.moveToNext()) {
        MapItem i = new MapItem();
        i.id = c.getLong(c.getColumnIndexOrThrow("id"));
        i.parent =
            c.isNull(c.getColumnIndexOrThrow("parent"))
                ? 0
                : c.getLong(c.getColumnIndexOrThrow("parent"));
        i.name = c.getString(c.getColumnIndexOrThrow("name"));
        i.kind = c.getString(c.getColumnIndexOrThrow("kind"));
        i.icon = c.getString(c.getColumnIndexOrThrow("icon"));
        i.latitude = c.getDouble(c.getColumnIndexOrThrow("latitude"));
        i.longitude = c.getDouble(c.getColumnIndexOrThrow("longitude"));
        i.visible = c.getInt(c.getColumnIndexOrThrow("visible")) != 0;
        i.position = c.getInt(c.getColumnIndexOrThrow("position"));
        i.color = c.getInt(c.getColumnIndexOrThrow("color"));
        i.opacity = c.getFloat(c.getColumnIndexOrThrow("opacity"));
        items.add(i);
      }
    }
    return items;
  }

  public List<MapItem> renderItems() {
    List<MapItem> result = new ArrayList<>();
    appendChildren(0, all(), result);
    return result;
  }

  private void appendChildren(long parent, List<MapItem> snapshot, List<MapItem> result) {
    for (MapItem i : snapshot)
      if (i.parent == parent) {
        result.add(i);
        if (i.isFolder()) appendChildren(i.id, snapshot, result);
      }
  }

  public MapItem get(long id) {
    for (MapItem i : all()) if (i.id == id) return i;
    return null;
  }

  private ContentValues values(MapItem i, boolean withId) {
    ContentValues v = new ContentValues();
    if (withId) v.put("id", i.id);
    if (i.parent == 0) v.putNull("parent");
    else v.put("parent", i.parent);
    v.put("name", i.name);
    v.put("kind", i.kind);
    v.put("icon", i.icon);
    v.put("latitude", i.latitude);
    v.put("longitude", i.longitude);
    v.put("visible", i.visible ? 1 : 0);
    v.put("position", i.position);
    v.put("color", i.color);
    v.put("opacity", i.opacity);
    return v;
  }

  private void mutate(Runnable action) {
    SQLiteDatabase db = getWritableDatabase();
    List<ContentValues> before = new ArrayList<>();
    for (MapItem i : all()) before.add(values(i, true));
    db.beginTransaction();
    try {
      action.run();
      db.setTransactionSuccessful();
    } finally {
      db.endTransaction();
    }
    undo = before;
  }

  private void requireFolder(long parent) {
    if (parent != 0 && (get(parent) == null || !get(parent).isFolder()))
      throw new IllegalArgumentException("Папка не найдена");
  }

  private void name(String name) {
    if (name == null || name.trim().isEmpty())
      throw new IllegalArgumentException("Введите название");
  }

  public long create(long parent, String name, String kind, double lat, double lon) {
    requireFolder(parent);
    name(name);
    if (!"folder".equals(kind) && !"point".equals(kind))
      throw new IllegalArgumentException("Тип не поддерживается");
    if (Double.isNaN(lat)
        || Double.isInfinite(lat)
        || Double.isNaN(lon)
        || Double.isInfinite(lon)
        || lat < -90
        || lat > 90
        || lon < -180
        || lon > 180) throw new IllegalArgumentException("Неверные координаты");
    MapItem i = new MapItem();
    i.parent = parent;
    i.name = name.trim();
    i.kind = kind;
    i.latitude = lat;
    i.longitude = lon;
    i.visible = true;
    i.opacity = 1;
    i.color = 0xff3f6db5;
    i.position = all().size();
    long[] id = {0};
    mutate(() -> id[0] = getWritableDatabase().insertOrThrow("objects", null, values(i, false)));
    return id[0];
  }

  public void edit(long id, String name, double lat, double lon) {
    MapItem i = get(id);
    if (i == null) throw new IllegalArgumentException("Объект не найден");
    name(name);
    if (Double.isNaN(lat)
        || Double.isInfinite(lat)
        || Double.isNaN(lon)
        || Double.isInfinite(lon)
        || Math.abs(lat) > 90
        || Math.abs(lon) > 180) throw new IllegalArgumentException("Неверные координаты");
    i.name = name.trim();
    i.latitude = lat;
    i.longitude = lon;
    mutate(
        () ->
            getWritableDatabase()
                .update("objects", values(i, false), "id=?", new String[] {"" + id}));
  }

  public boolean descendant(long id, long ancestor) {
    for (MapItem i = get(id); i != null; i = get(i.parent)) {
      if (i.id == ancestor) return true;
    }
    return false;
  }

  public List<Long> roots(Collection<Long> ids) {
    List<Long> result = new ArrayList<>();
    for (long id : new LinkedHashSet<>(ids)) {
      if (get(id) == null) throw new IllegalArgumentException("Объект не найден");
      boolean child = false;
      for (long other : ids) if (other != id && descendant(id, other)) child = true;
      if (!child) result.add(id);
    }
    return result;
  }

  public void transfer(Collection<Long> ids, long target, boolean copy) {
    requireFolder(target);
    List<Long> roots = roots(ids);
    for (long id : roots)
      if (descendant(target, id))
        throw new IllegalArgumentException("Нельзя вставить папку внутрь себя");
    List<MapItem> snapshot = all();
    mutate(
        () -> {
          for (long id : roots) {
            if (copy) cloneTree(id, target, snapshot);
            else {
              ContentValues v = new ContentValues();
              if (target == 0) v.putNull("parent");
              else v.put("parent", target);
              getWritableDatabase().update("objects", v, "id=?", new String[] {"" + id});
            }
          }
        });
  }

  private void cloneTree(long id, long parent, List<MapItem> snapshot) {
    MapItem source = null;
    for (MapItem i : snapshot) if (i.id == id) source = i;
    if (source == null) return;
    ContentValues v = values(source, false);
    if (parent == 0) v.putNull("parent");
    else v.put("parent", parent);
    long next = getWritableDatabase().insertOrThrow("objects", null, v);
    for (MapItem i : snapshot) if (i.parent == id) cloneTree(i.id, next, snapshot);
  }

  public void delete(Collection<Long> ids) {
    List<Long> roots = roots(ids);
    List<MapItem> items = all();
    List<Long> remove = new ArrayList<>();
    for (MapItem i : items)
      for (long id : roots)
        if (descendant(i.id, id)) {
          remove.add(i.id);
          break;
        }
    mutate(
        () -> {
          Collections.reverse(
              remove); // foreign key references can be deferred within this transaction
          getWritableDatabase().execSQL("PRAGMA defer_foreign_keys=ON");
          for (long id : remove)
            getWritableDatabase().delete("objects", "id=?", new String[] {"" + id});
        });
  }

  public void style(Collection<Long> ids, Boolean visible, Float opacity, Integer color) {
    if (opacity != null && (opacity < 0 || opacity > 1 || Float.isNaN(opacity)))
      throw new IllegalArgumentException("Прозрачность 0–100%");
    roots(ids);
    mutate(
        () -> {
          for (long id : ids) {
            ContentValues v = new ContentValues();
            if (visible != null) v.put("visible", visible ? 1 : 0);
            if (opacity != null) v.put("opacity", opacity);
            if (color != null) v.put("color", color);
            getWritableDatabase().update("objects", v, "id=?", new String[] {"" + id});
          }
        });
  }

  public void assignIcon(Collection<Long> ids, String icon, int color) {
    if (icon == null || icon.isEmpty()) throw new IllegalArgumentException("Выберите значок");
    for (long id : ids)
      if (get(id) == null || get(id).isFolder())
        throw new IllegalArgumentException("Выберите только метки");
    mutate(
        () -> {
          for (long id : ids) {
            ContentValues v = new ContentValues();
            v.put("icon", icon);
            v.put("color", color);
            getWritableDatabase().update("objects", v, "id=?", new String[] {"" + id});
          }
        });
  }

  /** Only references change after library moves. Missing files never delete map objects. */
  public void relocateIcons(Map<String, String> moves) {
    SQLiteDatabase db = getWritableDatabase();
    db.beginTransaction();
    try {
      for (MapItem i : all()) {
        String next = relocated(i.icon, moves);
        if (!next.equals(i.icon)) {
          ContentValues v = new ContentValues();
          v.put("icon", next);
          db.update("objects", v, "id=?", new String[] {"" + i.id});
        }
      }
      db.setTransactionSuccessful();
    } finally {
      db.endTransaction();
    }
    if (undo != null)
      for (ContentValues v : undo) v.put("icon", relocated(v.getAsString("icon"), moves));
  }

  private String relocated(String key, Map<String, String> moves) {
    for (Map.Entry<String, String> move : moves.entrySet())
      if (key.equals(move.getKey()) || key.startsWith(move.getKey() + "/"))
        return move.getValue() + key.substring(move.getKey().length());
    return key;
  }

  public void reorder(long id, int delta) {
    MapItem item = get(id);
    if (item == null) return;
    List<MapItem> peers = new ArrayList<>();
    for (MapItem i : all()) if (i.parent == item.parent) peers.add(i);
    int index = 0;
    while (peers.get(index).id != id) index++;
    int next = index + delta;
    if (next < 0 || next >= peers.size()) return;
    Collections.swap(peers, index, next);
    mutate(
        () -> {
          for (int n = 0; n < peers.size(); n++) {
            ContentValues v = new ContentValues();
            v.put("position", n);
            getWritableDatabase().update("objects", v, "id=?", new String[] {"" + peers.get(n).id});
          }
        });
  }

  public void clearUndo() {
    undo = null;
  }

  public boolean canUndo() {
    return undo != null;
  }

  public void undo() {
    if (undo == null) return;
    SQLiteDatabase db = getWritableDatabase();
    db.beginTransaction();
    try {
      db.execSQL("PRAGMA defer_foreign_keys=ON");
      db.delete("objects", null, null);
      for (ContentValues v : undo) db.insertOrThrow("objects", null, v);
      db.setTransactionSuccessful();
      undo = null;
    } finally {
      db.endTransaction();
    }
  }

  public float effectiveOpacity(MapItem item) {
    float alpha = 1;
    for (MapItem i = item; i != null; i = get(i.parent)) {
      if (!i.visible) return 0;
      alpha *= i.opacity;
    }
    return alpha;
  }
}
