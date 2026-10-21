package ru.warriorrus.app;

import android.content.Context;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.widget.*;

/** Compact map editor: fixed heading/actions, independently collapsible statistics. */
public final class EditorPanel extends LinearLayout {
  private final ReferenceMenu ui;
  private final FrameLayout host;
  private final TextView title, summary;
  private final LinearLayout actions;
  private final ScrollView details;
  private final Button statistics, closeButton;
  private boolean expanded;
  private boolean docked;
  private int detailsMaximum;

  public EditorPanel(Context context, FrameLayout host, String tag, String name,
      Runnable search, Runnable options, Runnable close) {
    super(context);
    this.host = host;
    ui = new ReferenceMenu(context);
    setTag(tag);
    setOrientation(VERTICAL);
    setBackgroundColor(0xffd6ecff);
    LinearLayout heading = new LinearLayout(context);
    heading.setGravity(Gravity.CENTER_VERTICAL);
    heading.setBackgroundColor(0xffb2d5f2);
    title = new TextView(context);
    title.setText(name);
    title.setTextColor(ReferenceMenu.TEXT);
    title.setTextSize(14);
    title.setSingleLine(true);
    title.setEllipsize(TextUtils.TruncateAt.END);
    title.setPadding(ui.dp(8), 0, ui.dp(4), 0);
    heading.addView(title, new LayoutParams(0, ui.dp(44), 1));
    if (search != null) heading.addView(headerButton(R.drawable.ui_search, "Поиск местоположения", search));
    if (options != null) heading.addView(headerButton(R.drawable.ui_more, "Опции редактора", options));
    closeButton=headerButton(R.drawable.ui_close, "Закрыть редактор", close);
    heading.addView(closeButton);
    addView(heading, new LayoutParams(-1, -2));
    actions = new LinearLayout(context);
    actions.setPadding(ui.dp(3), ui.dp(3), ui.dp(3), ui.dp(3));
    addView(actions, new LayoutParams(-1, ui.dp(54)));
    statistics = ui.action("⌄  Статистика", () -> expanded(!expanded));
    statistics.setTextSize(12);
    statistics.setContentDescription("Развернуть статистику");
    addView(statistics, new LayoutParams(-1, ui.dp(40)));
    summary = new TextView(context);
    summary.setTextColor(ReferenceMenu.TEXT);
    summary.setTextSize(12);
    summary.setPadding(ui.dp(12), ui.dp(4), ui.dp(12), ui.dp(8));
    details = new ScrollView(context){
      @Override protected void onMeasure(int width,int height){
        super.onMeasure(width,View.MeasureSpec.makeMeasureSpec(detailsMaximum,View.MeasureSpec.AT_MOST));
      }
    };
    details.addView(summary);
    details.setVisibility(GONE);
    addView(details, new LayoutParams(-1, -2));
    expanded(false);
  }

  private Button headerButton(int icon, String description, Runnable action) {
    Button button = ui.action("", action);
    ReferenceAssets.apply(button,icon,20);
    button.setPadding(ui.dp(12),0,ui.dp(12),0);
    button.setContentDescription(description);
    button.setGravity(Gravity.CENTER);
    button.setMinHeight(0);
    button.setMinimumHeight(0);
    button.setLayoutParams(new LayoutParams(ui.dp(44), ui.dp(44)));
    return button;
  }

  public Button action(String title, String description, Runnable command) {
    Button button = ui.action(title, command);
    button.setTextSize(11);
    button.setGravity(Gravity.CENTER);
    button.setPadding(ui.dp(3), 0, ui.dp(3), 0);
    button.setContentDescription(description);
    button.setBackgroundColor(0xffb6d9f4);
    LayoutParams params = new LayoutParams(0, -1, 1);
    params.setMargins(ui.dp(2), 0, ui.dp(2), 0);
    actions.addView(button, params);
    return button;
  }

  public void title(String value) { title.setText(value); }
  public void closeAction(int icon,String value) { ReferenceAssets.apply(closeButton,icon,20);closeButton.setContentDescription(value); }
  public void summary(String value) { summary.setText(value); }
  public void expanded(boolean value) {
    expanded = value;
    details.setVisibility(value ? VISIBLE : GONE);
    statistics.setText("Статистика");
    ReferenceAssets.applyNamed(statistics,value?"app_action_expand_less_24":"app_action_expand_more_24",16,true);
    statistics.setContentDescription(value ? "Свернуть статистику" : "Развернуть статистику");
  }
  public boolean expanded() { return expanded; }
  public void dockMap() { docked=true; expanded(true); }
  public boolean docked() { return docked; }

  public void show() {
    FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-1, -2,
        Gravity.BOTTOM | Gravity.START);
    params.setMargins(docked?0:ui.dp(4), 0, docked?0:ui.dp(4), docked?0:ui.dp(64));
    if(docked)addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->EditorViewport.update(host));
    host.addView(this, params);
  }

  @Override protected void onMeasure(int width, int height) {
    // Preserve the map and toolbar even on short landscape windows or with a keyboard.
    int available = View.MeasureSpec.getMode(height) == View.MeasureSpec.UNSPECIFIED
        ? host.getHeight() : View.MeasureSpec.getSize(height);
    int windowHeight=host.getHeight()>0?host.getHeight()-host.getPaddingTop()-host.getPaddingBottom():available+ui.dp(64);
    int limit=Math.max(0,Math.min(available,Math.min(docked?windowHeight:ui.dp(300),Math.max(ui.dp(138),(int)(windowHeight*.45f)))));
    detailsMaximum=Math.max(0,limit-ui.dp(138));
    super.onMeasure(width, View.MeasureSpec.makeMeasureSpec(limit, docked&&expanded?View.MeasureSpec.EXACTLY:View.MeasureSpec.AT_MOST));
  }
}
