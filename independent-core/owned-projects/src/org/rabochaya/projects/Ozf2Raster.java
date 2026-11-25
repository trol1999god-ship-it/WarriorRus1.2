package org.rabochaya.projects;

import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Reads the base image of an unencrypted, indexed OZF2 as bounded 64×64 tiles. */
final class Ozf2Raster implements Closeable {
 private static final int TILE = 64, PIXELS = TILE * TILE;
 private final RandomAccessFile file;
 private final int columns, rows;
 private final long offsets, length;
 private final int[] palette = new int[256];
 private final LinkedHashMap<Integer, byte[]> cache = new LinkedHashMap<>(32, .75f, true);
 final int width, height;

 static boolean hasSignature(byte[] header) { return header[0] == 0x78 && header[1] == 0x77; }

 Ozf2Raster(File input) throws IOException {
  file = new RandomAccessFile(input, "r");
  boolean success = false;
  try {
   length = file.length();
   if (length < 1100 || length > OziRaster.MAX_IMAGE || u16() != 0x7778) throw invalid("заголовок");
   file.seek(6);
   if (i32() != 0x00010040 || i32() != 0x436) throw invalid("сигнатура растрового заголовка");
   if (i32() != 40) throw invalid("размер растрового заголовка");
   width = i32();
   height = i32();
   if (width <= 0 || height <= 0 || width > 20000 || height > 20000 || (long) width * height > 100000000L ||
    u16() != 1 || u16() != 8) throw invalid("размер или глубина цвета");
   file.seek(54);
   if (i32() != 0x77777777) throw invalid("граница заголовка");
   int levels = u16();
   if (levels < 1 || levels > 255) throw invalid("число уровней");
   long afterScales = 60L + 4L * levels;
   file.seek(afterScales);
   if (i32() != 0x77777777) {
    file.seek(afterScales + 8);
    if (i32() != 0x77777777) throw invalid("граница таблицы уровней");
   }
   long dataStart = file.getFilePointer();
   file.seek(length - 4);
   long index = i32();
   if (index < dataStart || index + levels * 4L > length - 4) throw invalid("смещение каталога уровней");
   file.seek(index);
   long base = i32();
   if (base < dataStart || base + 1040 > index) throw invalid("смещение базового уровня");
   file.seek(base);
   if (i32() != width || i32() != height) throw invalid("размер базового уровня");
   columns = u16();
   rows = u16();
   long count = (long) columns * rows;
   if (columns < (width + TILE - 1) / TILE || rows < (height + TILE - 1) / TILE ||
    count > 100000 || base + 1036L + (count + 1L) * 4L > index) throw invalid("таблица тайлов");
   for (int i = 0; i < palette.length; i++) palette[i] = 0xff000000 | (i32() & 0xffffff);
   offsets = file.getFilePointer();
   success = true;
  } finally {
   if (!success) file.close();
  }
 }

 int pixel(int x, int y) throws IOException {
  if (x < 0 || y < 0 || x >= width || y >= height) throw invalid("координаты пикселя");
  int index = (y / TILE) * columns + x / TILE;
  byte[] tile = cache.get(index);
  if (tile == null) {
   tile = load(index);
   if (cache.size() >= 64) {
    Iterator<Integer> first = cache.keySet().iterator();
    first.next();
    first.remove();
   }
   cache.put(index, tile);
  }
  return palette[tile[(TILE - 1 - y % TILE) * TILE + x % TILE] & 255];
 }

 private byte[] load(int tile) throws IOException {
  file.seek(offsets + 4L * tile);
  long start = i32(), end = i32();
  if (start < 54 || end > length - 4 || end - start < 8 || end - start > PIXELS * 10L) {
   throw invalid("смещение данных тайла");
  }
  byte[] encoded = new byte[(int) (end - start)];
  file.seek(start);
  file.readFully(encoded);
  byte[] pixels = new byte[PIXELS + 1];
  Inflater inflater = new Inflater();
  try {
   inflater.setInput(encoded);
   int read = 0;
   while (!inflater.finished() && read < pixels.length) {
    int decoded = inflater.inflate(pixels, read, pixels.length - read);
    if (decoded == 0 && !inflater.finished()) throw invalid("неполный блок zlib");
    read += decoded;
   }
   if (read != PIXELS || !inflater.finished()) throw invalid("размер декодированного тайла");
   return pixels;
  } catch (DataFormatException invalidData) {
   throw new IOException("OZF2: повреждён блок zlib", invalidData);
  } finally {
   inflater.end();
  }
 }

 private int u16() throws IOException { return Short.reverseBytes(file.readShort()) & 0xffff; }
 private int i32() throws IOException { return Integer.reverseBytes(file.readInt()); }
 private static IOException invalid(String field) { return new IOException("OZF2: недопустим " + field); }

 @Override public void close() throws IOException {
  cache.clear();
  file.close();
 }
}
