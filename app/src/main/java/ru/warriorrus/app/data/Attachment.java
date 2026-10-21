package ru.warriorrus.app.data;

/** Immutable reference to an app-private file; copies may safely share the same bytes. */
public final class Attachment {
  public final String key, name, mime;
  public final long size;
  public Attachment(String key, String name, String mime, long size) {
    if (key == null || !key.matches("[A-Za-z0-9_-]+\\.[A-Za-z0-9]+"))
      throw new IllegalArgumentException("Неверный файл вложения");
    this.key=key; this.name=name; this.mime=mime; this.size=size;
  }
}
