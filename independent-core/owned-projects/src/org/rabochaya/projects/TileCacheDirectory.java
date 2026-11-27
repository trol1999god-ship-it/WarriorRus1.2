package org.rabochaya.projects;

import android.content.Context;
import android.os.Build;
import android.os.Environment;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/** Location of downloaded public tiles. Projects and attachments use their existing private store. */
final class TileCacheDirectory {
 private static final String KEY="tile_cache_directory";
 private TileCacheDirectory(){}

 static List<File> choices(Context context){
  List<File> result=new ArrayList<>();
  result.add(new File(context.getFilesDir(),"tile-cache"));
  if(Build.VERSION.SDK_INT>=30){
   for(File appDirectory:context.getExternalFilesDirs(null)){
    if(appDirectory==null)continue;
    try{
     if(Environment.isExternalStorageRemovable(appDirectory)
         &&Environment.MEDIA_MOUNTED.equals(Environment.getExternalStorageState(appDirectory)))
      result.add(new File(appDirectory,"tile-cache"));
    }catch(IllegalArgumentException unavailable){/* The removable volume was detached. */}
   }
  }
  return result;
 }

 static String selected(Context context){
  return OnlineMapSettings.prefs(context).getString(KEY,"");
 }

 static File directory(Context context)throws IOException{
  String selected=selected(context);
  List<File> choices=choices(context);
  if(selected.isEmpty())return choices.get(0);
  for(File candidate:choices)if(candidate.getAbsolutePath().equals(selected))return candidate;
  throw new IOException("Выбранный накопитель для кэша недоступен");
 }

 static void select(Context context,File candidate)throws IOException{
  List<File> choices=choices(context);
  if(!choices.contains(candidate))throw new IOException("Выбранный накопитель для кэша недоступен");
  if((!candidate.isDirectory()&&!candidate.mkdirs())||!candidate.canWrite())
   throw new IOException("Запись в выбранный каталог кэша недоступна");
  if(!OnlineMapSettings.prefs(context).edit().putString(KEY,candidate.equals(choices.get(0))?"":candidate.getAbsolutePath()).commit())
   throw new IOException("Не удалось сохранить путь к кэшу");
 }
}
