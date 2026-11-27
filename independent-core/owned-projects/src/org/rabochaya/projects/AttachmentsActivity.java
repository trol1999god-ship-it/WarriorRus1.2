package org.rabochaya.projects;
import android.app.*;import android.content.*;import android.database.Cursor;import android.net.Uri;import android.os.Bundle;import android.provider.OpenableColumns;import android.widget.*;
import java.io.*;import java.util.*;import java.util.concurrent.*;
/** Explicit local SAF import; files and KML references commit together. */
public final class AttachmentsActivity extends Activity {
 private static final int PICK=4401;private long projectId;private String featureId;private LinearLayout root;private TextView status;private boolean busy;private volatile boolean disposed;private Uri queued;
 private ScrollView attachmentList;
 private int scrollPosition;
 private String selectedAttachment;
 private boolean confirmingRemoval;
 private AlertDialog attachmentDialog;
 private final ExecutorService worker=Executors.newSingleThreadExecutor();
 protected void onCreate(Bundle state){super.onCreate(state);projectId=getIntent().getLongExtra("project",-1);featureId=getIntent().getStringExtra("feature");if(state!=null){
  scrollPosition=state.getInt("scroll_position");
  selectedAttachment=state.getString("selected_attachment");
  confirmingRemoval=state.getBoolean("confirming_removal");
  queued=state.getParcelable("queued_attachment");
 }root=new LinearLayout(this);root.setOrientation(LinearLayout.VERTICAL);root.setPadding(12,12,12,12);root.setBackgroundColor(0xff232d1d);WorkspaceUi.systemBars(this);setContentView(root);load();}
 private TextView text(String value){TextView t=new TextView(this);t.setText(value);t.setTypeface(WorkspaceUi.font(this));t.setTextColor(MapHud.INK);t.setTextSize(16);t.setPadding(10,12,10,12);return t;}
 private void button(LinearLayout parent,String title,Runnable action){parent.addView(WorkspaceUi.button(this,title,()->{if(!busy)action.run();}),new LinearLayout.LayoutParams(-1,-2));}
 private void load(){if(attachmentList!=null)scrollPosition=attachmentList.getScrollY();busy=true;root.removeAllViews();status=text("Открытие вложений…");root.addView(status);worker.execute(()->{ProjectStore store=null;try{store=new ProjectStore(this);KmlProject p=store.load(projectId);org.w3c.dom.Element f=p.byId(featureId);if(f==null)throw new IOException("Объект удалён");final List<MediaLinks.Item> items=MediaLinks.list(f);final HashMap<String,Integer> sizes=new HashMap<>();for(MediaLinks.Item item:items){byte[] bytes=p.assets.get(MediaLinks.path(p,item.href));sizes.put(item.id,bytes==null?-1:bytes.length);}runOnUiThread(()->{if(disposed)return;busy=false;show(items,sizes);if(queued!=null){Uri uri=queued;queued=null;importFile(uri);}});}catch(final Exception e){runOnUiThread(()->{if(!disposed){busy=false;status.setText("Не удалось открыть вложения: "+e.getMessage());button(root,"Назад",()->finish());}});}finally{if(store!=null)store.close();}});}
 private void show(List<MediaLinks.Item> items,Map<String,Integer> sizes){
  root.removeAllViews();
  status=text("Вложений: "+items.size());root.addView(status);
  button(root,"Добавить вложение",this::pick);button(root,"Назад",this::finish);
  ScrollView scroll=new ScrollView(this);attachmentList=scroll;
  LinearLayout list=new LinearLayout(this);list.setOrientation(LinearLayout.VERTICAL);
  scroll.addView(list);root.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
  MediaLinks.Item restored=null;
  for(MediaLinks.Item item:items){
   Integer size=sizes.get(item.id);
   button(list,item.name+" · "+item.mime+" · "+(size==null||size<0?"файл отсутствует":size+" байт"),
      ()->attachmentActions(item,false));
   if(item.id.equals(selectedAttachment))restored=item;
  }
  if(scrollPosition>0)scroll.post(()->{if(attachmentList==scroll)scroll.scrollTo(0,scrollPosition);});
  if(restored!=null&&queued==null)attachmentActions(restored,confirmingRemoval);
  else{selectedAttachment=null;confirmingRemoval=false;}
 }

 private void attachmentActions(MediaLinks.Item item,boolean removal){
  AlertDialog.Builder builder=new AlertDialog.Builder(this);
  if(removal){
   builder.setTitle(item.name)
       .setMessage("Убрать это вложение из объекта? Общий файл сохранится, если он нужен другому объекту.")
       .setPositiveButton("Убрать",(dialog,which)->remove(item.id));
  }else{
   builder.setTitle(item.name).setItems(new String[]{"Открыть","Убрать из объекта"},(dialog,which)->{
    if(which==0){
     Intent intent=new Intent(this,MediaPlaybackActivity.class);
     intent.putExtra("project",projectId).putExtra("feature",featureId).putExtra("attachment",item.id);
     startActivity(intent);
    }else attachmentActions(item,true);
   });
  }
  AlertDialog dialog=builder.setNegativeButton("Отмена",null).create();
  selectedAttachment=item.id;
  confirmingRemoval=removal;
  attachmentDialog=dialog;
  dialog.setOnDismissListener(closed->{
   if(attachmentDialog==closed){
    attachmentDialog=null;selectedAttachment=null;confirmingRemoval=false;
   }
  });
  dialog.show();
 }

 protected void onSaveInstanceState(Bundle state){
  state.putInt("scroll_position",attachmentList==null?scrollPosition:attachmentList.getScrollY());
  state.putString("selected_attachment",selectedAttachment);
  state.putBoolean("confirming_removal",confirmingRemoval);
  state.putParcelable("queued_attachment",queued);
  super.onSaveInstanceState(state);
 }
 private void pick(){Intent i=new Intent(Intent.ACTION_OPEN_DOCUMENT);i.addCategory(Intent.CATEGORY_OPENABLE);i.setType("*/*");i.putExtra(Intent.EXTRA_MIME_TYPES,new String[]{"image/*","audio/*","video/*","text/plain"});i.putExtra(Intent.EXTRA_LOCAL_ONLY,true);try{startActivityForResult(i,PICK);}catch(ActivityNotFoundException e){status.setText("На устройстве нет системного выбора файлов");}}
 protected void onActivityResult(int request,int result,Intent intent){super.onActivityResult(request,result,intent);if(request==PICK&&result==RESULT_OK&&intent!=null&&intent.getData()!=null){if(busy)queued=intent.getData();else importFile(intent.getData());}}
 private void importFile(final Uri uri){
  if(!"content".equals(uri.getScheme())&&!"file".equals(uri.getScheme())){status.setText("Выберите локальный файл");return;}
  busy=true;status.setText("Сохранение вложения…");worker.execute(()->{ProjectStore store=null;try{
   String name=uri.getLastPathSegment(),type=getContentResolver().getType(uri);if("content".equals(uri.getScheme()))try(Cursor c=getContentResolver().query(uri,new String[]{OpenableColumns.DISPLAY_NAME},null,null,null)){if(c!=null&&c.moveToFirst())name=c.getString(0);}
   ByteArrayOutputStream out=new ByteArrayOutputStream();try(InputStream in=getContentResolver().openInputStream(uri)){if(in==null)throw new IOException("Файл недоступен");byte[] buffer=new byte[16384];int n;while((n=in.read(buffer))!=-1){if(disposed)throw new IOException("Импорт отменён");if(out.size()+n>ProjectWrites.MAX_FILE)throw new IOException("Предел одного вложения — 8 МиБ");out.write(buffer,0,n);}}
   if(disposed)throw new IOException("Импорт отменён");store=new ProjectStore(this);ProjectWrites.addAttachment(store,projectId,featureId,name,type,out.toByteArray());
   runOnUiThread(()->{if(!disposed){busy=false;load();}});
  }catch(final Exception e){runOnUiThread(()->{if(!disposed){busy=false;status.setText("Вложение не добавлено: "+e.getMessage());}});}finally{if(store!=null)store.close();}});
 }
 private void remove(final String id){busy=true;status.setText("Удаление ссылки на вложение…");worker.execute(()->{ProjectStore store=null;try{store=new ProjectStore(this);ProjectWrites.removeAttachment(store,projectId,featureId,id);runOnUiThread(()->{if(!disposed){busy=false;load();}});}catch(final Exception e){runOnUiThread(()->{if(!disposed){busy=false;status.setText("Не удалось убрать вложение: "+e.getMessage());}});}finally{if(store!=null)store.close();}});}
 protected void onDestroy(){disposed=true;worker.shutdown();super.onDestroy();}
}
