package org.rabochaya.projects;
import android.content.*;import android.util.Base64;import java.io.*;import java.util.*;
/** Private job CAS and one foreground worker per project. No launch-time download. */
public final class CompositionDownloadSettings {
 private static final Map<Long,String> running=new HashMap<>();private static SharedPreferences prefs(Context c){return c.getSharedPreferences("composition-downloads",0);}private static String key(long p){if(p<=0)throw new IllegalArgumentException("Нужен проект");return "job_"+p;}
 public static final class Snapshot {public final CompositionDownloadJob job;final String raw;Snapshot(CompositionDownloadJob j,String r){job=j;raw=r;}}
 public static synchronized Snapshot load(Context c,long p)throws IOException{String raw=prefs(c).getString(key(p),null);if(raw==null)return new Snapshot(null,null);try{if(raw.length()>176000)throw new IOException("Задание слишком велико");return new Snapshot(CompositionDownloadJob.decode(Base64.decode(raw,Base64.NO_WRAP),p),raw);}catch(IllegalArgumentException e){throw new IOException("Сохранённое задание повреждено; кеш сохранён",e);}}
 private static Snapshot write(Context c,long p,Snapshot old,CompositionDownloadJob job)throws IOException{if(job.composition.project!=p||!Objects.equals(prefs(c).getString(key(p),null),old.raw))throw new IOException("Задание изменилось в другом окне");String raw=Base64.encodeToString(job.encode(),Base64.NO_WRAP);if(!prefs(c).edit().putString(key(p),raw).commit())throw new IOException("Не удалось сохранить задание; кеш не удалён");return new Snapshot(job,raw);}
 public static synchronized Snapshot begin(Context c,long p,Snapshot previous,CompositionDownloadJob job)throws IOException{if(running.containsKey(p))throw new IOException("Предыдущая загрузка ещё останавливается");Snapshot next=write(c,p,previous,job);running.put(p,job.generation);return next;}
 public static synchronized Snapshot progress(Context c,long p,Snapshot previous,int count)throws IOException{if(!Objects.equals(running.get(p),previous.job.generation))throw new IOException("Задание больше не принадлежит этому экрану");return write(c,p,previous,previous.job.progress(count));}
 public static synchronized void end(long p,String generation){if(Objects.equals(running.get(p),generation))running.remove(p);}
 public static synchronized void removeDeletedProject(Context c,long p){if(p>0)prefs(c).edit().remove(key(p)).commit();}
}
