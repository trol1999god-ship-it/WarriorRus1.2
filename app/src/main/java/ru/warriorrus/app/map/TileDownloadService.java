package ru.warriorrus.app.map;

import android.app.*;
import android.content.*;
import android.os.*;
import java.io.*;
import java.net.*;
import javax.net.ssl.HttpsURLConnection;
import ru.warriorrus.app.MainActivity;
import ru.warriorrus.app.R;

/** Foreground, explicitly started tile download. No boot receiver or object uploads. */
public final class TileDownloadService extends Service {
  public static volatile boolean running;
  private volatile boolean cancelled;
  private volatile HttpsURLConnection connection;
  private long lastNotification;
  private android.content.SharedPreferences prefs;
  @Override public void onCreate(){super.onCreate();prefs=getSharedPreferences("tileDownload",0);if(Build.VERSION.SDK_INT>=26){NotificationChannel channel=new NotificationChannel("map-download","Загрузка офлайн-карты",NotificationManager.IMPORTANCE_LOW);getSystemService(NotificationManager.class).createNotificationChannel(channel);}}
  private Notification notification(String text,int done,int total) {
    Notification.Builder b=Build.VERSION.SDK_INT>=26?new Notification.Builder(this,"map-download"):new Notification.Builder(this);
    Intent open=new Intent(this,MainActivity.class);PendingIntent show=PendingIntent.getActivity(this,0,open,PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
    return b.setSmallIcon(R.drawable.ui_map).setContentTitle("Рабочая карта · офлайн-загрузка").setContentText(text).setContentIntent(show).setOngoing(true).setProgress(total,done,total==0).build();
  }
  @Override public int onStartCommand(Intent intent,int flags,int startId) {
    if(intent!=null&&"cancel".equals(intent.getAction())){cancelled=true;HttpsURLConnection c=connection;if(c!=null)c.disconnect();if(!running)stopSelf();return START_NOT_STICKY;}
    if(running)return START_NOT_STICKY;
    startForeground(1401,notification("Подготовка…",0,0));running=true;cancelled=false;
    String json=intent==null?null:intent.getStringExtra("spec");if(json==null)json=prefs.getString("spec","");final String specJson=json;
    prefs.edit().putString("spec",specJson).putString("status","Загрузка…").putBoolean("finished",false).apply();
    new Thread(()->{
      try {
        TileDownload.Spec spec=TileDownload.Spec.parse(specJson);File root=new File(getFilesDir(),"maps").getCanonicalFile();File output=new File(root,spec.file).getCanonicalFile();
        if(!root.equals(output.getParentFile()))throw new IOException("Неверный архив");
        TileDownload.run(spec,output,this::fetch,()->cancelled,(done,total)->{
          if(done==total||System.currentTimeMillis()-lastNotification>1000){lastNotification=System.currentTimeMillis();String text="Тайлов: "+done+" / "+total;prefs.edit().putString("status",text).apply();startForeground(1401,notification(text,done,total));}
        });prefs.edit().putString("status","Готово: "+spec.name).putBoolean("finished",true).apply();
      }catch(Exception error){prefs.edit().putString("status",error.getMessage()==null?"Загрузка остановлена":error.getMessage()).apply();}
      finally{running=false;stopForeground(true);stopSelf();}
    },"raster-tile-download").start();return START_NOT_STICKY;
  }
  private byte[] fetch(String location)throws Exception {
    URL url=new URL(location);
    for(int redirects=0;redirects<4;redirects++) {
      if(cancelled)throw new InterruptedIOException("Загрузка приостановлена");if(!"https".equalsIgnoreCase(url.getProtocol()))throw new IOException("Требуется HTTPS");
      connection=(HttpsURLConnection)url.openConnection();connection.setConnectTimeout(20000);connection.setReadTimeout(20000);connection.setInstanceFollowRedirects(false);connection.setRequestProperty("User-Agent",getPackageName()+"/2.2 (+https://github.com/trol1999god-ship-it/WarriorRus1.2)");
      try {
        int status=connection.getResponseCode();if(status>=300&&status<400){String next=connection.getHeaderField("Location");if(next==null)throw new IOException("Неверное перенаправление");url=new URL(url,next);continue;}
        if(status!=200)throw new IOException("Сервер карты: HTTP "+status);
        try(InputStream input=connection.getInputStream()){return ru.warriorrus.app.exchange.PlacemarkFiles.bounded(input,5*1024*1024);}
      }finally{connection.disconnect();}
    }throw new IOException("Слишком много перенаправлений");
  }
  @Override public void onTimeout(int startId,int type){cancelled=true;HttpsURLConnection c=connection;if(c!=null)c.disconnect();stopSelf();}
  @Override public void onDestroy(){cancelled=true;super.onDestroy();}
  @Override public IBinder onBind(Intent intent){return null;}
}
