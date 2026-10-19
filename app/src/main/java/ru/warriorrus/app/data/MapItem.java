package ru.warriorrus.app.data;

/** Persisted object; folders also act as map layer groups. Coordinates are WGS84. */
public final class MapItem {
  public long id, parent, created, updated;
  public boolean trashed;
  public final java.util.List<Attachment> attachments = new java.util.ArrayList<>();
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
    if("builtin:text".equals(icon))return "Текст";
    if("builtin:circle".equals(icon)&&"area".equals(kind))return "Круг";
    switch (kind) {
      case "folder": return "Папка";
      case "set": return "Набор точек";
      case "route": return "Маршрут";
      case "area": return "Область";
      case "path": return "Путь";
      case "track": return "Трек";
      default: return "Метка";
    }
  }


  public boolean isFolder() {
    return "folder".equals(kind) || "set".equals(kind);
  }
}
