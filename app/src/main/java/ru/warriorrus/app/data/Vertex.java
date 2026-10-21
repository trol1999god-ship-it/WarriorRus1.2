package ru.warriorrus.app.data;

/** A location supplied by the user or a local file, never a device location. */
public final class Vertex {
  public final double latitude, longitude;
  public final Double elevation;
  public final String time;
  public final String name, description;
  public Vertex(double latitude, double longitude) { this(latitude, longitude, null, null); }
  public Vertex(double latitude, double longitude, Double elevation, String time) {
    this(latitude,longitude,elevation,time,"","");
  }
  public Vertex(double latitude,double longitude,Double elevation,String time,String name,String description) {
    if ((Double.isNaN(latitude) || Double.isInfinite(latitude)) || (Double.isNaN(longitude) || Double.isInfinite(longitude)) || Math.abs(latitude) > 90 || Math.abs(longitude) > 180
        || (elevation != null && (Double.isNaN(elevation) || Double.isInfinite(elevation))))
      throw new IllegalArgumentException("Неверные координаты");
    this.latitude = latitude; this.longitude = longitude; this.elevation = elevation; this.time = time; this.name=name; this.description=description;
  }
}
