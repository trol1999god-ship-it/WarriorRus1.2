package ru.warriorrus.app.icons;

import android.content.Context;
import android.os.FileObserver;
import java.io.*;
import java.util.*;

/** USB-visible user files. Builtins exist in memory and cannot be mutated. */
public final class IconLibrary {
  public static final String PIN =
      "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'><path d='M16 2 C8 2 5 8 5 13 C5"
          + " 21 16 30 16 30 C16 30 27 21 27 13 C27 8 24 2 16 2 Z'/></svg>";
  public static final String STAR =
      "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'><path d='M16 1 L20 11 L31 12 L23"
          + " 20 L26 31 L16 25 L6 31 L9 20 L1 12 L12 11 Z'/></svg>";
  public final File root;

  public static final class Entry {
    public final String key;
    public final boolean folder, builtin;

    public Entry(String k, boolean f, boolean b) {
      key = k;
      folder = f;
      builtin = b;
    }

    public String name() {
      return key.startsWith("builtin:") ? key.substring(8) : new File(key).getName();
    }
  }

  private final List<FileObserver> observers = new ArrayList<>();

  public IconLibrary(File directory) throws IOException {
    root = directory.getCanonicalFile();
    if (!root.isDirectory() && !root.mkdirs())
      throw new IOException("Каталог значков недоступен: " + root);
  }

  public static IconLibrary open(Context c) throws IOException {
    File[] dirs = c.getExternalMediaDirs();
    for (File dir : dirs) if (dir != null) return new IconLibrary(new File(dir, "icons"));
    throw new IOException(
        "Внешнее хранилище недоступно. Подключите накопитель и обновите библиотеку.");
  }

  public File resolve(String key) throws IOException {
    if ("@builtin".equals(key) || (key != null && key.startsWith("@builtin/")))
      throw new IOException("Встроенная библиотека защищена");
    if (key == null || key.startsWith("builtin:") || key.startsWith("/") || key.contains("\\"))
      throw new IOException("Защищённый или неверный путь");
    File f = new File(root, key);
    File canonical = f.getCanonicalFile();
    if (!(canonical.equals(root) || canonical.getPath().startsWith(root.getPath() + File.separator))
        || !canonical.equals(f.getAbsoluteFile()))
      throw new IOException("Путь выходит из библиотеки или содержит ссылку");
    return canonical;
  }

  public List<Entry> list(String folder) throws IOException {
    if ("@builtin".equals(folder))
      return Arrays.asList(
          new Entry("builtin:pin", false, true), new Entry("builtin:star", false, true));
    File f = resolve(folder);
    if (!f.isDirectory()) throw new IOException("Папка недоступна");
    File[] files = f.listFiles();
    if (files == null) throw new IOException("Нет доступа к папке");
    List<Entry> entries = new ArrayList<>();
    for (File child : files) {
      if (child.getName().startsWith(".")) continue;
      String key = key(child);
      try {
        File safe = resolve(key);
        if (safe.isDirectory() || safe.getName().toLowerCase(Locale.ROOT).endsWith(".svg"))
          entries.add(new Entry(key, safe.isDirectory(), false));
      } catch (IOException ignored) {
      }
    }
    entries.sort(
        Comparator.comparing((Entry e) -> !e.folder)
            .thenComparing(e -> e.name().toLowerCase(Locale.ROOT)));
    return entries;
  }

  public String key(File f) {
    return f.equals(root)
        ? ""
        : f.getPath().substring(root.getPath().length() + 1).replace(File.separatorChar, '/');
  }

  private void name(String name) throws IOException {
    if (name == null
        || name.trim().isEmpty()
        || name.startsWith(".")
        || name.contains("/")
        || name.contains("\\")
        || name.indexOf(0) >= 0)
      throw new IOException("Введите имя без разделителей и начальной точки");
  }

  private File destination(String folder, String name) throws IOException {
    name(name);
    File parent = resolve(folder);
    if (!parent.isDirectory()) throw new IOException("Папка недоступна");
    File dest = resolve(folder.isEmpty() ? name : folder + "/" + name);
    if (dest.exists()) throw new IOException("Уже существует: " + name);
    return dest;
  }

  public void mkdir(String folder, String name) throws IOException {
    if (!destination(folder, name).mkdir()) throw new IOException("Не удалось создать папку");
  }

  public String importSvg(String folder, String name, InputStream input) throws Exception {
    if (!name.toLowerCase(Locale.ROOT).endsWith(".svg")) name += ".svg";
    String text = SvgPreview.read(input);
    SvgPreview.parse(text);
    File dest = destination(folder, name), tmp = File.createTempFile(".import-", ".tmp", root);
    try {
      try (FileOutputStream out = new FileOutputStream(tmp)) {
        out.write(text.getBytes(java.nio.charset.StandardCharsets.UTF_8));
        out.getFD().sync();
      }
      if (!tmp.renameTo(dest)) throw new IOException("Не удалось сохранить SVG");
      return key(dest);
    } finally {
      if (tmp.exists()) tmp.delete();
    }
  }

  public static String builtinText(String key) throws IOException {
    if ("builtin:pin".equals(key)) return PIN;
    if ("builtin:star".equals(key)) return STAR;
    throw new IOException("Встроенный значок не найден");
  }

  public String text(String key) throws IOException {
    if (key.startsWith("builtin:")) return builtinText(key);
    try (InputStream in = new FileInputStream(resolve(key))) {
      return SvgPreview.read(in);
    }
  }

  public Map<String, String> rename(String key, String name) throws IOException {
    File from = mutable(key);
    if (!from.isDirectory() && !name.toLowerCase(Locale.ROOT).endsWith(".svg")) name += ".svg";
    File dest = destination(key(from.getParentFile()), name);
    if (!from.renameTo(dest)) throw new IOException("Не удалось переименовать");
    return Collections.singletonMap(key, key(dest));
  }

  private File mutable(String key) throws IOException {
    File f = resolve(key);
    if (f.equals(root) || !f.exists()) throw new IOException("Объект защищён или не найден");
    return f;
  }

  private List<String> roots(Collection<String> keys) throws IOException {
    List<String> result = new ArrayList<>();
    for (String k : new LinkedHashSet<>(keys)) {
      mutable(k);
      boolean nested = false;
      for (String other : keys) if (!other.equals(k) && k.startsWith(other + "/")) nested = true;
      if (!nested) result.add(k);
    }
    return result;
  }

  public Map<String, String> transfer(Collection<String> keys, String target, boolean copy)
      throws Exception {
    List<String> source = roots(keys);
    Map<File, File> plan = new LinkedHashMap<>();
    for (String k : source) {
      File from = mutable(k), dest = destination(target, from.getName());
      if ((dest.equals(from) || dest.getPath().startsWith(from.getPath() + File.separator)))
        throw new IOException("Нельзя переместить папку в себя");
      for (File d : plan.values()) if (d.equals(dest)) throw new IOException("Повторяющиеся имена");
      plan.put(from, dest);
    }
    List<File> completed = new ArrayList<>();
    Map<String, String> moved = new LinkedHashMap<>();
    try {
      for (Map.Entry<File, File> step : plan.entrySet()) {
        File from = step.getKey(), dest = step.getValue();
        if (copy) {
          File temp = new File(root, ".copy-" + UUID.randomUUID());
          try {
            copyTree(from, temp);
            if (!temp.renameTo(dest)) throw new IOException("Не удалось скопировать");
          } finally {
            if (temp.exists()) deleteTree(temp);
          }
        } else if (!from.renameTo(dest)) throw new IOException("Не удалось переместить");
        completed.add(dest);
        moved.put(key(from), key(dest));
      }
    } catch (Exception failure) {
      for (File dest : completed) {
        if (copy) deleteTree(dest);
        else
          for (Map.Entry<File, File> step : plan.entrySet())
            if (step.getValue().equals(dest) && !dest.renameTo(step.getKey()))
              failure.addSuppressed(new IOException("Не удалось откатить перемещение"));
      }
      throw failure;
    }
    return copy ? Collections.emptyMap() : moved;
  }

  private void copyTree(File from, File dest) throws IOException {
    resolve(key(from));
    if (from.isDirectory()) {
      if (!dest.mkdir()) throw new IOException("Не удалось создать папку");
      File[] children = from.listFiles();
      if (children == null) throw new IOException("Не удалось прочитать папку");
      for (File f : children) copyTree(f, new File(dest, f.getName()));
    } else
      try (InputStream in = new FileInputStream(from);
          OutputStream out = new FileOutputStream(dest)) {
        byte[] b = new byte[8192];
        int n;
        while ((n = in.read(b)) != -1) out.write(b, 0, n);
      }
  }

  public void delete(Collection<String> keys) throws IOException {
    List<String> source = roots(keys);
    for (String key : source) validateTree(mutable(key));
    for (String key : source) deleteTree(mutable(key));
  }

  private void validateTree(File f) throws IOException {
    resolve(key(f));
    if (f.isDirectory()) {
      File[] files = f.listFiles();
      if (files == null) throw new IOException("Нет доступа к папке");
      for (File child : files) validateTree(child);
    }
  }

  private void deleteTree(File f) throws IOException {
    if (f.isDirectory()) {
      File[] files = f.listFiles();
      if (files == null) throw new IOException("Нет доступа к папке");
      for (File child : files) deleteTree(child);
    }
    if (!f.delete()) throw new IOException("Не удалось удалить " + f.getName());
  }

  public long fingerprint() throws IOException {
    return fingerprint(root);
  }

  private long fingerprint(File directory) throws IOException {
    File[] files = directory.listFiles();
    if (files == null) throw new IOException("Хранилище недоступно");
    Arrays.sort(files, Comparator.comparing(File::getName));
    long hash = 17;
    for (File file : files) {
      if (file.getName().startsWith(".")) continue;
      try {
        resolve(key(file));
      } catch (IOException unsafe) {
        continue;
      }
      hash = 31 * hash + file.getName().hashCode();
      hash = 31 * hash + file.lastModified();
      hash = 31 * hash + file.length();
      if (file.isDirectory()) hash = 31 * hash + fingerprint(file);
    }
    return hash;
  }

  public void watch(Runnable changed) throws IOException {
    stopWatching();
    watchDirectory(root, changed);
  }

  @SuppressWarnings("deprecation")
  private void watchDirectory(File directory, Runnable changed) throws IOException {
    FileObserver observer =
        new FileObserver(
            directory.getAbsolutePath(),
            FileObserver.CREATE
                | FileObserver.DELETE
                | FileObserver.MOVED_FROM
                | FileObserver.MOVED_TO
                | FileObserver.CLOSE_WRITE) {
          @Override
          public void onEvent(int event, String path) {
            changed.run();
          }
        };
    observer.startWatching();
    observers.add(observer);
    File[] children = directory.listFiles();
    if (children != null)
      for (File f : children)
        if (f.isDirectory() && !f.getName().startsWith(".")) {
          try {
            resolve(key(f));
          } catch (IOException unsafe) {
            continue;
          }
          watchDirectory(f, changed);
        }
  }

  public void stopWatching() {
    for (FileObserver observer : observers) observer.stopWatching();
    observers.clear();
  }
}
