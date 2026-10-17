package ru.warriorrus.app;

import android.app.Activity;
import android.graphics.Color;
import android.os.*;
import android.view.*;
import android.widget.*;

/** Touch lock and system-bar preferences. This never locks or tracks the device. */
public final class ScreenController {
  private final Activity activity;private final FrameLayout root;private FrameLayout shield;
  public ScreenController(Activity activity,FrameLayout root){this.activity=activity;this.root=root;}
  public boolean locked(){return shield!=null;}
  public void lock(boolean enabled){if(shield!=null){root.removeView(shield);shield=null;}if(!enabled)return;
    shield=new FrameLayout(activity);shield.setTag("touchLock");shield.setClickable(true);shield.setBackgroundColor(Color.TRANSPARENT);
    ReferenceMenu ui=new ReferenceMenu(activity);Button unlock=ui.action("Удерживайте для разблокировки",()->Toast.makeText(activity,"Удерживайте кнопку или клавишу уменьшения громкости",Toast.LENGTH_SHORT).show());unlock.setContentDescription("Разблокировать экран");unlock.setBackground(ui.background());unlock.setOnLongClickListener(v->{lock(false);return true;});FrameLayout.LayoutParams p=new FrameLayout.LayoutParams(-2,ui.dp(48),Gravity.TOP|Gravity.CENTER_HORIZONTAL);p.topMargin=ui.dp(8);shield.addView(unlock,p);root.addView(shield,new FrameLayout.LayoutParams(-1,-1));
  }
  public void apply(){android.content.SharedPreferences p=activity.getPreferences(Activity.MODE_PRIVATE);boolean status=p.getBoolean("hideStatusBar",false),navigation=p.getBoolean("immersive",false);
    Window w=activity.getWindow();if(Build.VERSION.SDK_INT>=30){android.view.WindowInsetsController c=w.getInsetsController();if(c!=null){c.setSystemBarsBehavior(android.view.WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);if(status)c.hide(WindowInsets.Type.statusBars());else c.show(WindowInsets.Type.statusBars());if(navigation)c.hide(WindowInsets.Type.navigationBars());else c.show(WindowInsets.Type.navigationBars());}}
    else{int flags=View.SYSTEM_UI_FLAG_LAYOUT_STABLE|View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN|View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;if(status)flags|=View.SYSTEM_UI_FLAG_FULLSCREEN;if(navigation)flags|=View.SYSTEM_UI_FLAG_HIDE_NAVIGATION;if(status||navigation)flags|=View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;w.getDecorView().setSystemUiVisibility(flags);}
    if(p.getBoolean("showWhenLocked",false))w.addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);else w.clearFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);
    root.requestApplyInsets();
  }
  public void showStatusBar(){if(Build.VERSION.SDK_INT>=30){if(activity.getWindow().getInsetsController()!=null)activity.getWindow().getInsetsController().show(WindowInsets.Type.statusBars());}else activity.getWindow().getDecorView().setSystemUiVisibility(activity.getWindow().getDecorView().getSystemUiVisibility()&~View.SYSTEM_UI_FLAG_FULLSCREEN);}
  public void save(Bundle state){state.putBoolean("touchLocked",locked());}
  public void restore(Bundle state){if(state!=null&&state.getBoolean("touchLocked"))lock(true);}
}
