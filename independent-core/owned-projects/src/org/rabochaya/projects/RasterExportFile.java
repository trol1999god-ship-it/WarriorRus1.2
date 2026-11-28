package org.rabochaya.projects;
import java.io.*;import java.util.*;
/** Assemble a raster export next to its destination and replace it only after successful sync. */
public final class RasterExportFile {
 public interface Writer {int write(File temporary)throws IOException;}
 private RasterExportFile(){}
 public static int replace(File destination,Writer writer)throws IOException{if(destination==null||writer==null)throw new IllegalArgumentException("Нужен файл экспорта");File target=destination.getAbsoluteFile(),parent=target.getParentFile();if(parent==null||!parent.isDirectory()||target.isDirectory())throw new IOException("Не удалось открыть каталог экспорта; прежний файл сохранён");File temporary=File.createTempFile("rk-export-",".mbtiles",parent);try{int count=writer.write(temporary);if(temporary.length()>512L*1024*1024)throw new IOException("Экспорт больше 512 МиБ; прежний файл сохранён");if(count<=0||temporary.length()<100)throw new IOException("Нет готового растрового экспорта");byte[] signature=new byte[16];try(RandomAccessFile file=new RandomAccessFile(temporary,"rw")){file.readFully(signature);if(!Arrays.equals(signature,"SQLite format 3\0".getBytes("US-ASCII")))throw new IOException("Экспорт не является SQLite MBTiles");file.getFD().sync();}if(!temporary.renameTo(target))throw new IOException("Не удалось заменить экспорт; прежний файл сохранён");return count;}finally{if(temporary.exists())temporary.delete();}}
}
