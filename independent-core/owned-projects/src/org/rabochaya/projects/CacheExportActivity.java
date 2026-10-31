package org.rabochaya.projects;
import android.app.*;import android.content.*;import android.net.Uri;import android.os.Bundle;import android.provider.DocumentsContract;import android.widget.*;import java.io.*;import java.util.concurrent.*;
/** Explicit SAF export; cancellation never removes cached source tiles. */
public final class CacheExportActivity extends Activity {
 private final ExecutorService worker=Executors.newSingleThreadExecutor();private TextView status;private Button save;private ProgressBar progress;private volatile boolean disposed,cancelled,running;private TileSource source;
 protected void onCreate(Bundle b){super.onCreate(b);source=OnlineMapSettings.source(this);LinearLayout root=new LinearLayout(this);root.setOrientation(1);root.setPadding(20,20,20,20);root.setBackgroundColor(0xff232d1d);setContentView(root);
  status=new TextView(this);status.setTextColor(-1);status.setTextSize(17);status.setText("Экспорт кеша · "+source.name+"\n\nСохранённые тайлы всех слоёв выбранной карты объединяются в один растровый MBTiles/TMS. Яндекс преобразуется в EPSG:3857. Только имеющийся кеш: новые тайлы из интернета не загружаются.\n\nДо 20 000 тайлов и 512 МиБ. Метки и вложения в файл карты не входят. Совместимость с конкретной сторонней программой нужно проверить.");root.addView(status);progress=new ProgressBar(this,null,android.R.attr.progressBarStyleHorizontal);root.addView(progress,new LinearLayout.LayoutParams(-1,-2));
  save=new Button(this);save.setText("Сохранить MBTiles");root.addView(save);save.setOnClickListener(v->{if(running)return;Intent i=new Intent(Intent.ACTION_CREATE_DOCUMENT).setType("application/octet-stream").addCategory(Intent.CATEGORY_OPENABLE).putExtra(Intent.EXTRA_TITLE,"Рабочая-карта-кеш.mbtiles").putExtra(Intent.EXTRA_LOCAL_ONLY,true);try{startActivityForResult(i,4401);}catch(ActivityNotFoundException e){status.setText("На устройстве нет файлового диалога Android");}});
  Button cancel=new Button(this);cancel.setText("Отмена / назад");root.addView(cancel);cancel.setOnClickListener(v->onBackPressed());
 }
 protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(request==4401&&result==RESULT_OK&&data!=null&&data.getData()!=null)export(data.getData());}
 private void export(final Uri uri){if(running)return;running=true;cancelled=false;save.setEnabled(false);status.setText("Подготовка снимка кеша…");worker.execute(()->{File tmp=null;String message;boolean copied=false;try{
   tmp=File.createTempFile("map-cache-export-",".mbtiles",getCacheDir());int count=CacheExport.write(this,source,tmp,(done,total)->{checkCancelled();if(done%10==0||done==total)runOnUiThread(()->{if(!disposed){progress.setMax(total);progress.setProgress(done);status.setText("Экспорт тайлов: "+done+" / "+total);}});});
   checkCancelled();try(InputStream in=new FileInputStream(tmp);OutputStream out=getContentResolver().openOutputStream(uri,"wt")){if(out==null)throw new IOException("Не удалось открыть файл назначения");byte[] buffer=new byte[65536];int n;while((n=in.read(buffer))!=-1){checkCancelled();out.write(buffer,0,n);}out.flush();}checkCancelled();copied=true;message="Сохранено: "+count+" тайлов в одном MBTiles. Исходный кеш сохранён.";
  }catch(Exception e){message=cancelled?"Экспорт отменён. Исходный кеш сохранён.":"Экспорт не завершён: "+e.getMessage();}finally{if(tmp!=null)tmp.delete();if(!copied)try{DocumentsContract.deleteDocument(getContentResolver(),uri);}catch(Exception ignored){}}
  final String text=message;runOnUiThread(()->{running=false;if(!disposed){status.setText(text);save.setEnabled(true);}});
 });}
 private void checkCancelled()throws IOException{if(cancelled||disposed)throw new IOException("Экспорт отменён");}
 public void onBackPressed(){if(running){cancelled=true;status.setText("Отмена экспорта…");}else super.onBackPressed();}
 protected void onStop(){if(running)cancelled=true;super.onStop();}
 protected void onDestroy(){disposed=true;cancelled=true;worker.shutdown();super.onDestroy();}
}
