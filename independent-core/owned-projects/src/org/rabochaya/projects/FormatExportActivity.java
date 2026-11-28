package org.rabochaya.projects;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.io.IOException;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Adds explicit local SAF export to the existing project menu. */
public final class FormatExportActivity extends Activity {
 private static final int SAVE=4698;
 private final ExecutorService worker=Executors.newSingleThreadExecutor();
 private volatile boolean disposed;
 private long projectId;
 private String format;
 private byte[] prepared, preparedDigest;
 private ExportWrite writing;

 public static void open(Activity activity,long projectId){
  activity.startActivity(new Intent(activity,FormatExportActivity.class).putExtra("project",projectId));
 }

 @Override protected void onCreate(Bundle state){
  super.onCreate(state);
  projectId=getIntent().getLongExtra("project",-1);
  writing=(ExportWrite)getLastNonConfigurationInstance();
  if(state!=null){
   format=state.getString("format");
   preparedDigest=state.getByteArray("preparedDigest");
  }
  if(writing!=null){showWriteProgress();writing.attach(this);return;}
  if(state!=null&&state.getBoolean("writing")){
   failure(new IOException("Запись прервалась. Проверьте выбранный файл и повторите экспорт при необходимости."));
   return;
  }
  if(preparedDigest!=null)return;
  if(format!=null){confirm(format);return;}
  new AlertDialog.Builder(this).setTitle("Экспорт объектов")
   .setItems(new String[]{"GPX 1.1","GeoJSON"},(dialog,index)->confirm(index==0?"gpx":"geojson"))
   .setOnCancelListener(dialog->finish()).show();
 }

 private void confirm(String choice){
  format=choice;
  String details="Сохраняются геометрия, высоты как записанные числа и поддерживаемые атрибуты. "
    +"Файлы вложений, SVG, оформление и структура папок сохраняются в KMZ. "
    +"Способ отсчёта высоты может отличаться между приложениями.";
  if(choice.equals("gpx"))details+=" Области передаются замкнутыми треками. Сторонние навигаторы видят их контуры. Произвольные атрибуты и расширения могут быть потеряны.";
  else details+=" Временные ряды GPX и служебные данные KML не входят в GeoJSON.";
  new AlertDialog.Builder(this).setTitle("Экспорт "+(choice.equals("gpx")?"GPX 1.1":"GeoJSON"))
   .setMessage(details).setPositiveButton("Выбрать файл",(dialog,button)->prepare(choice))
   .setNegativeButton("Отмена",(dialog,button)->finish()).setOnCancelListener(dialog->finish()).show();
 }

 private static byte[] snapshot(Context context,long projectId,String choice)throws IOException{
  ProjectStore store=new ProjectStore(context);
  try{return ObjectExchange.write(store.load(projectId),choice);}
  finally{store.close();}
 }

 private void prepare(String choice){
  worker.execute(()->{
   try{
    byte[] data=snapshot(this,projectId,choice);
    runOnUiThread(()->{
     if(disposed)return;
     prepared=data;preparedDigest=digest(data);
     Intent intent=new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
      .setType(choice.equals("gpx")?"application/gpx+xml":"application/geo+json")
      .putExtra(Intent.EXTRA_TITLE,"project."+choice).putExtra(Intent.EXTRA_LOCAL_ONLY,true);
     try{startActivityForResult(intent,SAVE);}
     catch(RuntimeException error){failure(error);}
    });
   }catch(Exception error){runOnUiThread(()->failure(error));}
  });
 }

 @Override protected void onActivityResult(int request,int result,Intent intent){
  super.onActivityResult(request,result,intent);
  if(request!=SAVE)return;
  if(result!=RESULT_OK||intent==null||intent.getData()==null||format==null){finish();return;}
  Uri target=intent.getData();
  if(!"content".equals(target.getScheme())&&!"file".equals(target.getScheme())){
   failure(new IOException("Выберите локальный файл"));return;
  }
  if(writing!=null)return;
  writing=new ExportWrite(getApplicationContext(),projectId,format,target,prepared,preparedDigest);
  showWriteProgress();
  writing.attach(this);
  worker.execute(writing);
 }

 private void showWriteProgress(){
  android.widget.TextView text=new android.widget.TextView(this);
  text.setTypeface(WorkspaceUi.font(this));
  int inset=WorkspaceUi.dp(this,16);
  text.setPadding(inset,inset,inset,inset);
  text.setText("Запись файла экспорта…");
  setContentView(text);
 }

 @Override public Object onRetainNonConfigurationInstance(){
  if(writing!=null)writing.detach(this);
  return writing;
 }

 private void writeCompleted(Exception error){
  writing=null;
  if(error!=null){failure(error);return;}
  Toast.makeText(this,"Объекты экспортированы",Toast.LENGTH_SHORT).show();
  finish();
 }

 private static final class ExportWrite implements Runnable {
  private final Context context;
  private final long projectId;
  private final String format;
  private final Uri target;
  private final byte[] prepared,digest;
  private final Handler main=new Handler(Looper.getMainLooper());
  private FormatExportActivity owner;
  private boolean completed;
  private Exception error;

  ExportWrite(Context context,long projectId,String format,Uri target,byte[] prepared,byte[] digest){
   this.context=context;this.projectId=projectId;this.format=format;
   this.target=target;this.prepared=prepared;this.digest=digest;
  }

  void attach(FormatExportActivity activity){
   owner=activity;
   dispatch();
  }

  void detach(FormatExportActivity activity){if(owner==activity)owner=null;}

  private void dispatch(){
   if(!completed||owner==null)return;
   FormatExportActivity activity=owner;
   owner=null;
   activity.writeCompleted(error);
  }

  @Override public void run(){
   Exception failure=null;
   try{
    byte[] data=prepared!=null?prepared:snapshot(context,projectId,format);
    if(digest==null||!MessageDigest.isEqual(digest,digest(data)))
     throw new IOException("Проект изменился после подготовки экспорта. Откройте экспорт заново.");
    try(OutputStream stream=context.getContentResolver().openOutputStream(target,"wt")){
     if(stream==null)throw new IOException("Не удалось открыть файл");
     stream.write(data);
    }
   }catch(Exception problem){failure=problem;}
   final Exception outcome=failure;
   main.post(()->{error=outcome;completed=true;dispatch();});
  }
 }

 private static byte[] digest(byte[] data){
  try{return MessageDigest.getInstance("SHA-256").digest(data);}
  catch(NoSuchAlgorithmException unavailable){throw new IllegalStateException(unavailable);}
 }

 private void failure(Exception error){
  if(!disposed)new AlertDialog.Builder(this).setTitle("Экспорт не завершён").setMessage(error.getMessage())
   .setPositiveButton("Закрыть",(dialog,button)->finish()).setOnCancelListener(dialog->finish()).show();
 }

 @Override protected void onSaveInstanceState(Bundle state){
  super.onSaveInstanceState(state);
  state.putString("format",format);
  state.putByteArray("preparedDigest",preparedDigest);
  state.putBoolean("writing",writing!=null);
 }

 @Override protected void onDestroy(){disposed=true;if(writing!=null)writing.detach(this);worker.shutdown();super.onDestroy();}
}
