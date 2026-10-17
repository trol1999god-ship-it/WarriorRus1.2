package ru.warriorrus.app.geometry;

import android.app.Activity;
import android.graphics.drawable.GradientDrawable;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.time.Instant;
import java.util.List;
import java.util.function.Supplier;
import ru.warriorrus.app.data.MapItem;
import ru.warriorrus.app.map.MapWorkspace;

/** Local playback of timestamps supplied by a file; never records device location. */
public final class TimelineController {
  public final TimelineModel model=new TimelineModel();
  private final Activity activity;private final FrameLayout host;private final MapWorkspace map;
  private final Supplier<List<MapItem>> source;private final Handler handler=new Handler(Looper.getMainLooper());
  private ScrollView panel;private TextView caption;private SeekBar seek;private Button play;
  private boolean playing,updating;private int speed=60;private long tick;
  private final Runnable step=new Runnable(){@Override public void run(){if(!playing)return;long now=SystemClock.elapsedRealtime();double next=model.cursor+(now-(double)tick)*speed;tick=now;model.cursor=(long)Math.min(model.last,next);if(model.cursor>=model.last)pause();changed();if(playing)handler.postDelayed(this,250);}};
  public TimelineController(Activity activity,FrameLayout host,MapWorkspace map,Supplier<List<MapItem>> source){this.activity=activity;this.host=host;this.map=map;this.source=source;map.timeline=model;}
  private int dp(int value){return Math.round(value*activity.getResources().getDisplayMetrics().density);}
  public boolean available(){return new TimelineModel().bounds(source.get());}
  public boolean open(){if(!model.bounds(source.get()))return false;model.active=true;model.cursor=model.first;show();changed();return true;}
  public void refreshBounds(){if(model.active){if(!model.bounds(source.get())){close();return;}update();}}
  public void close(){pause();model.active=false;if(panel!=null)host.removeView(panel);panel=null;map.redraw();}
  public void pause(){playing=false;handler.removeCallbacks(step);if(play!=null)play.setText("Воспроизвести");}
  private Button button(String title,Runnable action){Button b=new Button(activity);b.setText(title);b.setTextColor(0xffe4f2ff);b.setAllCaps(false);b.setTextSize(12);b.setMinHeight(dp(48));b.setOnClickListener(v->action.run());return b;}
  private void show(){if(panel!=null)host.removeView(panel);
    panel=new ScrollView(activity){@Override protected void onMeasure(int w,int h){int limit=Math.min(dp(270),Math.max(dp(48),host.getHeight()-dp(140)));super.onMeasure(w,MeasureSpec.makeMeasureSpec(limit,MeasureSpec.AT_MOST));}};
    panel.setTag("timelineControls");GradientDrawable background=new GradientDrawable();background.setColor(0xf20b2335);background.setCornerRadius(dp(12));background.setStroke(dp(1),0xff297ab6);panel.setBackground(background);
    LinearLayout body=new LinearLayout(activity);body.setOrientation(LinearLayout.VERTICAL);body.setPadding(dp(8),dp(4),dp(8),dp(4));panel.addView(body);
    caption=new TextView(activity);caption.setTextColor(0xffe4f2ff);caption.setTextSize(12);body.addView(caption);
    seek=new SeekBar(activity);seek.setMax(10000);seek.setTag("timelineSeek");seek.setContentDescription("Момент времени трека");body.addView(seek,new LinearLayout.LayoutParams(-1,dp(48)));
    seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar s){pause();}public void onStopTrackingTouch(SeekBar s){}public void onProgressChanged(SeekBar s,int p,boolean user){if(!updating&&user){model.seek(p);changed();}}});
    HorizontalScrollView row=new HorizontalScrollView(activity);LinearLayout buttons=new LinearLayout(activity);row.addView(buttons);body.addView(row);
    buttons.addView(button("В начало",()->{pause();model.cursor=model.first;changed();}));
    play=button("Воспроизвести",()->{if(playing){pause();return;}if(model.cursor>=model.last)model.cursor=model.first;playing=true;tick=SystemClock.elapsedRealtime();play.setText("Пауза");handler.post(step);});buttons.addView(play);
    buttons.addView(button("В конец",()->{pause();model.cursor=model.last;changed();}));buttons.addView(button("Закрыть время",this::close));
    LinearLayout options=new LinearLayout(activity);body.addView(options);Spinner speeds=spinner(new String[]{"×1","×10","×60","×360","×3600"});int[] rates={1,10,60,360,3600};int selected=2;for(int n=0;n<rates.length;n++)if(speed==rates[n])selected=n;speeds.setSelection(selected);speeds.setContentDescription("Скорость воспроизведения");options.addView(speeds,new LinearLayout.LayoutParams(0,dp(48),1));
    speeds.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int pos,long id){speed=rates[pos];tick=SystemClock.elapsedRealtime();}});
    Spinner windows=spinner(new String[]{"Всё до момента","Последняя минута","Последние 5 минут","Последние 30 минут","Последний час"});long[] lengths={0,60000,300000,1800000,3600000};int interval=0;for(int n=0;n<lengths.length;n++)if(model.windowMillis==lengths[n])interval=n;windows.setSelection(interval);windows.setContentDescription("Временной интервал");options.addView(windows,new LinearLayout.LayoutParams(0,dp(48),2));
    windows.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int pos,long id){model.windowMillis=lengths[pos];changed();}});
    CheckBox heads=new CheckBox(activity);heads.setText("Положение по времени файла");heads.setTextColor(0xffe4f2ff);heads.setChecked(model.showHeads);heads.setOnCheckedChangeListener((b,on)->{model.showHeads=on;changed();});body.addView(heads);
    FrameLayout.LayoutParams layout=new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM|Gravity.START);layout.setMargins(dp(8),0,dp(8),dp(64));host.addView(panel,layout);update();
  }
  private Spinner spinner(String[] values){Spinner s=new Spinner(activity);ArrayAdapter<String> a=new ArrayAdapter<>(activity,android.R.layout.simple_spinner_item,values);a.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);s.setAdapter(a);return s;}
  private void changed(){update();map.redraw();}
  private void update(){if(panel==null)return;updating=true;seek.setProgress(model.progress());caption.setText("Контроль времени · "+Instant.ofEpochMilli(model.cursor).toString()+"\n"+Instant.ofEpochMilli(model.first)+" — "+Instant.ofEpochMilli(model.last)+" · UTC");updating=false;}
  public void saveState(Bundle state){state.putBoolean("timelineActive",model.active);state.putLong("timelineCursor",model.cursor);state.putLong("timelineWindow",model.windowMillis);state.putInt("timelineSpeed",speed);state.putBoolean("timelineHeads",model.showHeads);}
  public void restore(Bundle state){if(state==null||!state.getBoolean("timelineActive",false))return;model.cursor=state.getLong("timelineCursor");model.windowMillis=Math.max(0,state.getLong("timelineWindow"));model.showHeads=state.getBoolean("timelineHeads",true);speed=state.getInt("timelineSpeed",60);if(model.bounds(source.get())){model.active=true;show();}}
}
