package ru.warriorrus.app;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;

/** Full-window transparent host; its panel is measured only inside the safe padded rectangle. */
public final class SafePanelHost extends FrameLayout {
  private final int maximumWidth;

  public SafePanelHost(Context context, View panel, int maximumWidth, boolean fillHeight) {
    super(context);
    this.maximumWidth = maximumWidth;
    setTag("dialogSafeArea");
    setFocusableInTouchMode(true);
    panel.setClickable(true);
    addView(panel, new LayoutParams(maximumWidth, fillHeight ? -1 : -2, Gravity.BOTTOM | Gravity.START));
    int spacing = fillHeight?0:(int) (8 * getResources().getDisplayMetrics().density);
    setPadding(spacing, spacing, spacing, spacing);
    SystemInsets.protect(this, spacing);
  }

  @Override protected void onMeasure(int widthSpec, int heightSpec) {
    getChildAt(0).getLayoutParams().width = Math.min(maximumWidth,
        Math.max(0, MeasureSpec.getSize(widthSpec) - getPaddingLeft() - getPaddingRight()));
    super.onMeasure(widthSpec, heightSpec);
  }

  public void submenuToolbar(View toolbar,int width,int height){
    LayoutParams panel=(LayoutParams)getChildAt(0).getLayoutParams();panel.bottomMargin=height+(int)(4*getResources().getDisplayMetrics().density);getChildAt(0).setLayoutParams(panel);
    addView(toolbar,new LayoutParams(width,height,Gravity.BOTTOM|Gravity.START));
  }
}
