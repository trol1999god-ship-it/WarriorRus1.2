package org.rabochaya.projects;

import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Private categories. A KMZ assignment copies bytes, so library edits never affect projects. */
final class UserIconLibrary {
 private static final int MAX_ICONS = 2048;
 private static final long MAX_PACK = 64L * 1024 * 1024;
 private final File root;

 UserIconLibrary(File files) throws IOException {
  root = new File(files, "user-icons");
  directory(root);
 }

 File folder(String path) throws IOException {
  File current = root;
  if (path.isEmpty()) return current;
  String[] parts = path.split("/", -1);
  if (parts.length > 2) throw new IOException("Слишком глубокая категория");
  for (String part : parts) current = new File(current, name(part));
  if (!current.isDirectory()) throw new IOException("Категория удалена");
  return current;
 }

 File[] entries(String path) throws IOException {
  File[] items = folder(path).listFiles(item -> !item.getName().startsWith(".") &&
    (item.isDirectory() || item.getName().toLowerCase(Locale.ROOT).endsWith(".svg")));
  if (items == null) throw new IOException("Не удалось прочитать значки");
  Arrays.sort(items, (first, second) -> first.isDirectory() == second.isDirectory()
    ? String.CASE_INSENSITIVE_ORDER.compare(first.getName(), second.getName()) : first.isDirectory() ? -1 : 1);
  return items;
 }

 void createCategory(String title) throws IOException {
  File target = new File(root, name(title));
  if (!target.mkdir()) throw new IOException("Категория уже существует или недоступна");
 }

 void delete(String category, String item) throws IOException {
  File target = new File(folder(category), name(item));
  if (!target.delete()) throw new IOException("Не удалось удалить значок или непустую категорию");
 }

 byte[] read(String category, String item) throws IOException {
  try (InputStream in = new FileInputStream(new File(folder(category), name(item)))) {
   return ObjectTreeWrites.readSvg(in);
  }
 }

 void add(String category, String title, InputStream in) throws IOException {
  File target = new File(folder(category), svgName(title));
  byte[] bytes = ObjectTreeWrites.readSvg(in);
  File temporary = File.createTempFile(".svg-", ".tmp", target.getParentFile());
  try {
   write(temporary, bytes);
   synchronized (UserIconLibrary.class) {
    publish(temporary, target);
   }
  } finally {
   temporary.delete();
  }
 }

 void installPack(String title, InputStream input) throws IOException {
  if (input == null) throw new IOException("Не удалось открыть набор");
  File target = new File(root, name(title));
  File archive = File.createTempFile(".archive-", ".zip", root);
  File stage = new File(root, ".pack-" + UUID.randomUUID());
  try {
   try (FileOutputStream copy = new FileOutputStream(archive)) {
    byte[] buffer = new byte[16384];
    long total = 0;
    for (int n; (n = input.read(buffer)) != -1;) {
     total += n;
     if (total > MAX_PACK) throw new IOException("ZIP больше 64 МиБ");
     copy.write(buffer, 0, n);
    }
   }
   directory(stage);
   unpack(archive, stage);
   synchronized (UserIconLibrary.class) {
    publish(stage, target);
   }
  } finally {
   archive.delete();
   discardStage(stage);
  }
 }

 private static void unpack(File archive, File stage) throws IOException {
  try (ZipFile zip = new ZipFile(archive)) {
   if (zip.size() > MAX_ICONS * 2) throw new IOException("Слишком много файлов в ZIP");
   long total = 0;
   int icons = 0;
   Enumeration<? extends ZipEntry> entries = zip.entries();
   while (entries.hasMoreElements()) {
    ZipEntry entry = entries.nextElement();
    if (entry.isDirectory()) continue;
    String[] parts = entry.getName().split("/", -1);
    if (parts.length > 2 || ++icons > MAX_ICONS) throw new IOException("Недопустимая структура набора");
    File category = parts.length == 1 ? stage : new File(stage, name(parts[0]));
    directory(category);
    File target = new File(category, svgName(parts[parts.length - 1]));
    if (target.exists()) throw new IOException("Повторяющийся значок в ZIP");
    byte[] bytes;
    try (InputStream file = zip.getInputStream(entry)) {
     bytes = ObjectTreeWrites.readSvg(file);
    }
    CRC32 crc = new CRC32();
    crc.update(bytes);
    if (bytes.length != entry.getSize() || crc.getValue() != entry.getCrc()) {
     throw new IOException("Повреждённый значок в ZIP");
    }
    total += bytes.length;
    if (total > MAX_PACK) throw new IOException("Распакованный набор больше 64 МиБ");
    write(target, bytes);
   }
   if (icons == 0) throw new IOException("В ZIP нет значков SVG");
  }
 }

 private static void publish(File source, File target) throws IOException {
  if (target.exists()) throw new IOException("Имя уже используется");
  if (!source.renameTo(target)) throw new IOException("Не удалось записать значки");
 }

 private static void write(File file, byte[] data) throws IOException {
  try (FileOutputStream out = new FileOutputStream(file)) {
   out.write(data);
   out.getFD().sync();
  }
 }

 private static void discardStage(File file) {
  File[] children = file.listFiles();
  if (children != null) for (File child : children) discardStage(child);
  file.delete();
 }

 private static void directory(File file) throws IOException {
  if (!file.isDirectory() && !file.mkdir()) throw new IOException("Не удалось создать категорию");
 }

 private static String name(String raw) throws IOException {
  String value = raw == null ? "" : raw.trim();
  if (value.isEmpty() || value.startsWith(".") || value.getBytes(java.nio.charset.StandardCharsets.UTF_8).length > 160 ||
    value.matches("(?s).*[\\p{Cntrl}/\\\\].*")) throw new IOException("Недопустимое имя значка или категории");
  return value;
 }

 private static String svgName(String raw) throws IOException {
  String value = name(raw);
  if (!value.toLowerCase(Locale.ROOT).endsWith(".svg")) throw new IOException("Поддерживаются файлы SVG");
  return value;
 }
}
