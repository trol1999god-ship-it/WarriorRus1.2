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
    addGeometryColumns(db);
  }

  @Override
  public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
    if (oldVersion < 2)
      db.execSQL("ALTER TABLE objects ADD COLUMN icon TEXT NOT NULL DEFAULT 'builtin:pin'");
    if (oldVersion < 3) addGeometryColumns(db);
  }

  private void addGeometryColumns(SQLiteDatabase db) {
    // Keep the legacy kind constraint and IDs intact; subtype identifies extended placemarks.
    db.execSQL("ALTER TABLE objects ADD COLUMN subtype TEXT NOT NULL DEFAULT ''");
    db.execSQL("ALTER TABLE objects ADD COLUMN geometry TEXT NOT NULL DEFAULT '[]'");
    db.execSQL("ALTER TABLE objects ADD COLUMN description TEXT NOT NULL DEFAULT ''");
  }

  private MapItem readItem(Cursor c) {
        MapItem i = new MapItem();
        i.id = c.getLong(c.getColumnIndexOrThrow("id"));
        i.parent =
            c.isNull(c.getColumnIndexOrThrow("parent"))
                ? 0
                : c.getLong(c.getColumnIndexOrThrow("parent"));
        i.name = c.getString(c.getColumnIndexOrThrow("name"));
        i.kind = c.getString(c.getColumnIndexOrThrow("kind"));
        String subtype = c.getString(c.getColumnIndexOrThrow("subtype"));
        if (!subtype.isEmpty()) i.kind = subtype;
        i.description = c.getString(c.getColumnIndexOrThrow("description"));
        i.segments.addAll(ru.warriorrus.app.geometry.Geometry.decode(c.getString(c.getColumnIndexOrThrow("geometry"))));
        i.icon = c.getString(c.getColumnIndexOrThrow("icon"));
        i.latitude = c.getDouble(c.getColumnIndexOrThrow("latitude"));
        i.longitude = c.getDouble(c.getColumnIndexOrThrow("longitude"));
        i.visible = c.getInt(c.getColumnIndexOrThrow("visible")) != 0;
        i.position = c.getInt(c.getColumnIndexOrThrow("position"));
        i.color = c.getInt(c.getColumnIndexOrThrow("color"));
        i.opacity = c.getFloat(c.getColumnIndexOrThrow("opacity"));
    return i;
  }

  public List<MapItem> all() {
    List<MapItem> items = new ArrayList<>();
    try (Cursor c = getReadableDatabase().query("objects", null, null, null, null, null, "position,id")) {
      while (c.moveToNext()) items.add(readItem(c));
    }
    return items;
  }

  public List<MapItem> renderItems() {
    List<MapItem> snapshot = all();
    List<MapItem> result = new ArrayList<>();
    Set<Long> visited = new HashSet<>();
    appendChildren(0, snapshot, result, visited);
    // Preserve legacy records even if a parent folder was deleted or corrupted.
    for (MapItem item : snapshot)
      if (!visited.contains(item.id))
        appendChildren(item.parent, snapshot, result, visited);
    return result;
  }

  private void appendChildren(
      long parent, List<MapItem> snapshot, List<MapItem> result, Set<Long> visited) {
    for (MapItem i : snapshot)
      if (i.parent == parent && visited.add(i.id)) {
        result.add(i);
        if (i.isFolder()) appendChildren(i.id, snapshot, result, visited);
      }
  }

  public MapItem get(long id) {
    try (Cursor c = getReadableDatabase().query("objects", null, "id=?", new String[]{""+id}, null, null, null)) {
      return c.moveToFirst() ? readItem(c) : null;
    }
  }

  private ContentValues values(MapItem i, boolean withId) {
    ContentValues v = new ContentValues();
    if (withId) v.put("id", i.id);
    if (i.parent == 0) v.putNull("parent");
    else v.put("parent", i.parent);
    v.put("name", i.name);
    v.put("kind", i.isFolder() ? "folder" : "point");
    v.put("subtype", i.isGeometry() ? i.kind : "");
    v.put("description", i.description);
    v.put("geometry", ru.warriorrus.app.geometry.Geometry.encode(i.segments));
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
    i.icon = "builtin:pin";
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

  /** Save a complete placemark atomically, including its ordered vertices and notes. */
  public long save(MapItem item) {
    requireFolder(item.parent);
    name(item.name);
    new Vertex(item.latitude, item.longitude);
    if (!Arrays.asList("folder", "point", "route", "path", "track", "area").contains(item.kind))
      throw new IllegalArgumentException("Тип не поддерживается");
    if (item.isGeometry()) ru.warriorrus.app.geometry.Geometry.validate(item);
    if (item.id != 0 && get(item.id) == null) throw new IllegalArgumentException("Объект не найден");
    if (item.id == 0) item.position = all().size();
    long[] id = {item.id};
    mutate(() -> {
      if (item.id == 0) id[0] = getWritableDatabase().insertOrThrow("objects", null, values(item, false));
      else getWritableDatabase().update("objects", values(item, false), "id=?", new String[] {"" + item.id});
    });
    return id[0];
  }

  /** A failed import leaves the existing workspace unchanged; one undo reverses the import. */
  public void importItems(List<MapItem> items, long parent) {
    requireFolder(parent);
    for (MapItem i : items) {
      name(i.name); new Vertex(i.latitude, i.longitude);
      if (i.isGeometry()) ru.warriorrus.app.geometry.Geometry.validate(i);
    }
    mutate(() -> {
      Map<Long, Long> imported = new HashMap<>();
      for (MapItem item : items) {
        ContentValues v = values(item, false);
        Long nextParent = item.parent == 0 ? Long.valueOf(parent) : imported.get(item.parent);
        if (nextParent == null) throw new IllegalArgumentException("Неверная структура папок");
        if (nextParent == 0) v.putNull("parent"); else v.put("parent", nextParent);
        long id = getWritableDatabase().insertOrThrow("objects", null, v);
        imported.put(item.id, id);
      }
    });
  }

  public List<MapItem> exportItems(Collection<Long> selection) {
    if (selection.isEmpty()) return renderItems();
    List<Long> top = roots(selection);
    List<MapItem> result = new ArrayList<>();
    for (MapItem i : renderItems()) for (long id : top) if (descendant(i.id, id)) { result.add(i); break; }
    return result;
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
    Set<Long> visited = new HashSet<>();
    for (MapItem i = item; i != null && visited.add(i.id); i = get(i.parent)) {
      if (!i.visible) return 0;
      alpha *= i.opacity;
    }
    return alpha;
  }
}
