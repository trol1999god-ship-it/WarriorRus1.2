package org.rabochaya.projects;
import android.app.*;import android.content.*;import android.os.Bundle;import android.widget.*;import java.util.concurrent.*;
/** Launch the local workspace directly, without a replacement home menu. */
public final class OwnedHomeActivity extends Activity {
 private final ExecutorService worker=Executors.newSingleThreadExecutor();private boolean busy,disposed;private TextView status;private LinearLayout root;
 protected void onCreate(Bundle state){super.onCreate(state);root=new LinearLayout(this);root.setOrientation(1);root.setPadding(20,20,20,20);root.setBackgroundColor(0xff232d1d);setContentView(root);status=new TextView(this);status.setTextColor(-1);root.addView(status);open();}
 private void open(){if(busy)return;busy=true;status.setText("Открытие рабочей карты…");worker.execute(()->{
  try{final long id=ProjectSession.current(this);runOnUiThread(()->{if(!disposed){LocalMapActivity.open(this,id);finish();}});}
  catch(final Exception error){runOnUiThread(()->{if(!disposed){busy=false;status.setText("Не удалось открыть карту: "+error.getMessage());if(root.getChildCount()==1){button("Повторить",()->open());button("Проекты и файлы KML/KMZ",()->startActivity(new Intent().setClassName(this,"org.rabochaya.projects.ProjectsActivity")));}}});}
 });}
 private void button(String title,Runnable action){Button button=new Button(this);button.setText(title);button.setAllCaps(false);root.addView(button);button.setOnClickListener(v->{if(!busy)action.run();});}
 protected void onDestroy(){disposed=true;worker.shutdown();super.onDestroy();}
}
