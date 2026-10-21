package ru.warriorrus.app.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import java.util.*;

/** Single transactional owner of the local working database. No network or exchange files. */
public final class ObjectStore extends SQLiteOpenHelper {


  public ObjectStore(Context context) {
    super(context, "warrior2.db", null, 5);
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
    addMediaHistory(db);
    addAppearance(db);
  }

  @Override
  public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
    if (oldVersion < 2)
      db.execSQL("ALTER TABLE objects ADD COLUMN icon TEXT NOT NULL DEFAULT 'builtin:pin'");
    if (oldVersion < 3) addGeometryColumns(db);
    if (oldVersion < 4) addMediaHistory(db);
    if (oldVersion < 5) addAppearance(db);
  }

  private void addAppearance(SQLiteDatabase db) {
    db.execSQL("ALTER TABLE objects ADD COLUMN appearance TEXT NOT NULL DEFAULT '{}' ");
  }

  private void addMediaHistory(SQLiteDatabase db) {
    db.execSQL("ALTER TABLE objects ADD COLUMN attachments TEXT NOT NULL DEFAULT '[]'");
    db.execSQL("ALTER TABLE objects ADD COLUMN created INTEGER NOT NULL DEFAULT 0");
    db.execSQL("ALTER TABLE objects ADD COLUMN updated INTEGER NOT NULL DEFAULT 0");
    db.execSQL("ALTER TABLE objects ADD COLUMN trashed INTEGER NOT NULL DEFAULT 0");
    db.execSQL("CREATE TABLE history(id INTEGER PRIMARY KEY AUTOINCREMENT,snapshot TEXT NOT NULL,created INTEGER NOT NULL)");
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
        i.appearance = ObjectAppearance.decode(c.getString(c.getColumnIndexOrThrow("appearance")));
        i.attachments.addAll(ObjectJson.attachments(c.getString(c.getColumnIndexOrThrow("attachments"))));
        i.created = c.getLong(c.getColumnIndexOrThrow("created"));
        i.updated = c.getLong(c.getColumnIndexOrThrow("updated"));
        i.trashed = c.getInt(c.getColumnIndexOrThrow("trashed")) != 0;
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
    try (Cursor c = getReadableDatabase().query("objects", null, "trashed=0", null, null, null, "position,id")) {
      while (c.moveToNext()) items.add(readItem(c));
    }
    return items;
  }

  public List<MapItem> includingTrash() {
    List<MapItem> items = new ArrayList<>();
    try (Cursor c = getReadableDatabase().query("objects", null, null, null, null, null, "position,id")) {
      while(c.moveToNext())items.add(readItem(c));
    }return items;
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
    try (Cursor c = getReadableDatabase().query("objects", null, "id=? AND trashed=0", new String[]{""+id}, null, null, null)) {
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
    v.put("subtype", i.isGeometry() || "set".equals(i.kind) ? i.kind : "");
    v.put("description", i.description);
    v.put("appearance", i.appearance.encode());
    v.put("attachments", ObjectJson.attachments(i.attachments));
    v.put("created", i.created);
    v.put("updated", i.updated);
    v.put("trashed", i.trashed ? 1 : 0);
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
    String before = ObjectJson.encode(includingTrash());
    db.beginTransaction();
    try {
      action.run();
      ContentValues entry=new ContentValues();entry.put("snapshot",before);entry.put("created",System.currentTimeMillis());
      db.insertOrThrow("history",null,entry);
      db.execSQL("DELETE FROM history WHERE id NOT IN (SELECT id FROM history ORDER BY id DESC LIMIT 16)");
      db.setTransactionSuccessful();
    } finally { db.endTransaction(); }
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
    if (!"folder".equals(kind) && !"set".equals(kind) && !"point".equals(kind))
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
    i.created = i.updated = System.currentTimeMillis();
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
    if (!Arrays.asList("folder", "set", "point", "route", "path", "track", "area").contains(item.kind))
      throw new IllegalArgumentException("Тип не поддерживается");
    if (item.isGeometry()) ru.warriorrus.app.geometry.Geometry.validate(item);
    if (item.id != 0 && get(item.id) == null) throw new IllegalArgumentException("Объект не найден");
    if("point".equals(item.kind)&&!item.segments.isEmpty()&&!item.segments.get(0).isEmpty()){Vertex v=item.segments.get(0).get(0);item.segments.get(0).set(0,new Vertex(item.latitude,item.longitude,v.elevation,v.time,v.name,v.description));}
    item.name=item.name.trim();item.updated=System.currentTimeMillis();
    if(item.id==0) {item.position=all().size();if(item.created==0)item.created=item.updated;}
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

  public void group(Collection<Long> ids,long parent,String name,boolean move) {
    requireFolder(parent);name(name);List<Long> roots=roots(ids);if(roots.isEmpty())throw new IllegalArgumentException("Выберите объекты");
    for(long id:roots)if(descendant(parent,id))throw new IllegalArgumentException("Нельзя группировать папку внутри неё самой");
    List<MapItem> snapshot=all();MapItem group=new MapItem();group.kind="set";group.name=name.trim();group.parent=parent;group.visible=true;group.opacity=1;group.color=0xff3f6db5;group.position=snapshot.size();group.created=group.updated=System.currentTimeMillis();
    mutate(()->{long target=getWritableDatabase().insertOrThrow("objects",null,values(group,false));for(long id:roots){if(move){ContentValues v=new ContentValues();v.put("parent",target);getWritableDatabase().update("objects",v,"id=?",new String[]{""+id});}else cloneTree(id,target,snapshot);}});
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
          ContentValues values=new ContentValues();values.put("trashed",1);
          for (long id : remove) getWritableDatabase().update("objects",values,"id=?",new String[]{""+id});
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
      for (MapItem i : includingTrash()) {
        String next = relocated(i.icon, moves);
        if (!next.equals(i.icon)) {
          ContentValues v = new ContentValues();v.put("icon", next);
          db.update("objects", v, "id=?", new String[] {"" + i.id});
        }
      }
      // Keep undo and recycled objects valid when a user moves their SVG files.
      try(Cursor c=db.query("history",new String[]{"id","snapshot"},null,null,null,null,null)) {
        while(c.moveToNext()) {
          List<MapItem> items=ObjectJson.decode(c.getString(1));
          for(MapItem i:items)i.icon=relocated(i.icon,moves);
          ContentValues v=new ContentValues();v.put("snapshot",ObjectJson.encode(items));
          db.update("history",v,"id=?",new String[]{c.getString(0)});
        }
      }
      db.setTransactionSuccessful();
    } finally {db.endTransaction();}
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

  public void clearUndo() {getWritableDatabase().delete("history",null,null);}

  public boolean canUndo() {
    try(Cursor c=getReadableDatabase().rawQuery("SELECT 1 FROM history LIMIT 1",null)){return c.moveToFirst();}
  }

  public void undo() {
    SQLiteDatabase db=getWritableDatabase();long id;String snapshot;
    try(Cursor c=db.rawQuery("SELECT id,snapshot FROM history ORDER BY id DESC LIMIT 1",null)) {
      if(!c.moveToFirst())return;id=c.getLong(0);snapshot=c.getString(1);
    }
    List<MapItem> items=ObjectJson.decode(snapshot);db.beginTransaction();
    try {
      db.execSQL("PRAGMA defer_foreign_keys=ON");db.delete("objects",null,null);
      for(MapItem i:items)db.insertOrThrow("objects",null,values(i,true));
      db.delete("history","id=?",new String[]{""+id});db.setTransactionSuccessful();
    }finally{db.endTransaction();}
  }

  public Set<String> referencedMedia() {
    Set<String> keys=new HashSet<>();for(MapItem i:includingTrash())for(Attachment a:i.attachments)keys.add(a.key);
    try(Cursor c=getReadableDatabase().query("history",new String[]{"snapshot"},null,null,null,null,null)) {
      while(c.moveToNext())for(MapItem i:ObjectJson.decode(c.getString(0)))for(Attachment a:i.attachments)keys.add(a.key);
    }return keys;
  }

  public void restoreTrash(Collection<Long> ids) {
    List<MapItem> snapshot=includingTrash();Set<Long> restore=new HashSet<>();
    for(MapItem i:snapshot)if(i.trashed)for(long id:ids) {
      Set<Long> seen=new HashSet<>();MapItem p=i;
      while(p!=null&&seen.add(p.id)) {
        if(p.id==id){restore.add(i.id);break;}
        long parent=p.parent;p=null;for(MapItem candidate:snapshot)if(candidate.id==parent){p=candidate;break;}
      }
    }
    mutate(()->{for(MapItem i:snapshot)if(restore.contains(i.id)) {
      boolean parentVisible=i.parent==0||restore.contains(i.parent);for(MapItem p:snapshot)if(p.id==i.parent&&!p.trashed)parentVisible=true;
      i.trashed=false;if(!parentVisible)i.parent=0;
      getWritableDatabase().update("objects",values(i,false),"id=?",new String[]{""+i.id});
    }});
  }

  public void emptyTrash() {
    SQLiteDatabase db=getWritableDatabase();db.beginTransaction();
    try{db.execSQL("PRAGMA defer_foreign_keys=ON");db.delete("history",null,null);db.delete("objects","trashed=1",null);db.setTransactionSuccessful();}
    finally{db.endTransaction();}
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
