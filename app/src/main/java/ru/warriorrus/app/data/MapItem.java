package ru.warriorrus.app.data;

/** Persisted object; folders also act as map layer groups. Coordinates are WGS84. */
public final class MapItem {
  public long id, parent;
  public String name, kind;
  public String icon = "builtin:pin";
  public double latitude, longitude;
  public boolean visible;
  public int position, color;
  public float opacity;
  public String description = "";
  public final java.util.List<java.util.List<Vertex>> segments = new java.util.ArrayList<>();
  public boolean isGeometry() { return !isFolder() && !"point".equals(kind); }
  public String typeName() {
    switch (kind) {
      case "folder": return "Папка";
      case "route": return "Маршрут";
      case "area": return "Область";
      case "path": return "Линия";
      case "track": return "Трек";
      default: return "Метка";
    }
  }


  public boolean isFolder() {
    return "folder".equals(kind);
  }
}
