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

  public boolean isFolder() {
    return "folder".equals(kind);
  }
}
