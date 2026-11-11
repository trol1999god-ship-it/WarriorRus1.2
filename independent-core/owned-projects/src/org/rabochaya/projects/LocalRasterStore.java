package org.rabochaya.projects;
import android.system.Os;import android.system.StructStat;import android.system.ErrnoException;import java.io.*;
/** Shared lock for local map replacement/removal. A stale importer cannot replace a newer map. */
public final class LocalRasterStore {
 private LocalRasterStore(){}
 public static synchronized String stamp(File file)throws IOException{try{StructStat s=Os.stat(file.getAbsolutePath());return s.st_dev+":"+s.st_ino+":"+s.st_size+":"+s.st_mtime+":"+s.st_ctime;}catch(ErrnoException e){if(e.errno==android.system.OsConstants.ENOENT)return "absent";throw new IOException("Не удалось проверить локальную карту",e);}}
 public static synchronized void replace(File prepared,File target,String expected)throws IOException{if(!stamp(target).equals(expected))throw new IOException("Локальная карта изменена в другом окне; импорт не применён");if(!prepared.renameTo(target))throw new IOException("Не удалось сохранить карту");}
 public static synchronized boolean remove(File file){return !file.exists()||file.delete();}
}
