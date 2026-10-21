package ru.warriorrus.app;

import android.content.Context;
import android.graphics.Typeface;
import android.view.*;
import android.widget.*;
import java.util.function.Consumer;
import ru.warriorrus.app.map.CompassDial;

/** Bottom compass work area. The map and its focus remain above this panel. */
public final class CompassPanel extends LinearLayout {
  private final FrameLayout host;
  public final Switch toggle;
  public final CompassDial dial;
  public final TextView status;
  public CompassPanel(Context context,FrameLayout host,Consumer<Boolean> enabled,Runnable help,Runnable settings,Runnable close){
    super(context);this.host=host;ReferenceMenu ui=new ReferenceMenu(context);setTag("compassPanel");setOrientation(VERTICAL);setBackgroundColor(0xffd6ecff);
    LinearLayout header=new LinearLayout(context);header.setGravity(Gravity.CENTER_VERTICAL);header.setBackgroundColor(0xffb2d5f2);
    toggle=new Switch(context);toggle.setContentDescription("Включить компас");toggle.setPadding(ui.dp(8),0,0,0);toggle.setOnCheckedChangeListener((v,on)->enabled.accept(on));header.addView(toggle,new LayoutParams(ui.dp(56),ui.dp(44)));
    TextView title=new TextView(context);title.setText("Компас");title.setTextColor(ReferenceMenu.TEXT);title.setTextSize(16);title.setSingleLine(true);title.setTypeface(null,Typeface.ITALIC);header.addView(title,new LayoutParams(0,-2,1));
    header.addView(button(ui,R.drawable.ui_info,"Справка о компасе",help));
    header.addView(button(ui,R.drawable.ui_settings,"Настройки компаса",settings));
    header.addView(button(ui,R.drawable.ui_close,"Закрыть компас",close));addView(header,new LayoutParams(-1,ui.dp(44)));
    FrameLayout body=new FrameLayout(context);dial=new CompassDial(context);dial.setTag("compassDial");FrameLayout.LayoutParams artwork=new FrameLayout.LayoutParams(-1,-1);artwork.setMargins(ui.dp(4),ui.dp(4),ui.dp(4),ui.dp(34));body.addView(dial,artwork);
    status=new TextView(context);status.setTextColor(ReferenceMenu.MUTED);status.setTextSize(11);status.setGravity(Gravity.CENTER);status.setPadding(ui.dp(4),0,ui.dp(4),ui.dp(2));body.addView(status,new FrameLayout.LayoutParams(-1,ui.dp(34),Gravity.BOTTOM));addView(body,new LayoutParams(-1,0,1));
    addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->EditorViewport.update(host));
  }
  private Button button(ReferenceMenu ui,int icon,String description,Runnable action){Button b=ui.action("",action);if(description.equals("Справка о компасе"))ReferenceAssets.glyph(b,"?");else ReferenceAssets.apply(b,icon,20);b.setContentDescription(description);b.setGravity(Gravity.CENTER);b.setPadding(ui.dp(12),0,ui.dp(12),0);b.setMinHeight(0);b.setMinimumHeight(0);b.setLayoutParams(new LayoutParams(ui.dp(44),ui.dp(44)));return b;}
  public void show(){host.addView(this,new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM));}
  @Override protected void onMeasure(int width,int height){int available=MeasureSpec.getSize(height);int window=host.getHeight()>0?host.getHeight()-host.getPaddingTop()-host.getPaddingBottom():available;int limit=Math.min(available,Math.max(0,Math.round(window*.48f)));super.onMeasure(width,MeasureSpec.makeMeasureSpec(limit,MeasureSpec.EXACTLY));}
}
