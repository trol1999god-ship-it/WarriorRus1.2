package ru.warriorrus.app.map;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.view.*;
import android.widget.FrameLayout;
import org.osmdroid.views.MapView;

/** The center icon is tappable without swallowing drags or multi-touch map gestures. */
public final class MapFocusTarget extends FrameLayout {
  private final MapView map;private final int slop;private float downX,downY;private boolean dragged;
  public MapFocusTarget(Context context,MapView map,Runnable tap){super(context);this.map=map;slop=ViewConfiguration.get(context).getScaledTouchSlop();setClickable(true);setContentDescription("Действия в центре карты");setOnClickListener(v->tap.run());View dot=new View(context);GradientDrawable background=new GradientDrawable();background.setShape(GradientDrawable.OVAL);background.setColor(android.graphics.Color.TRANSPARENT);background.setStroke(Math.max(1,Math.round(getResources().getDisplayMetrics().density)),ru.warriorrus.app.ReferenceMenu.TEXT);dot.setBackground(background);dot.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);int size=Math.round(8*getResources().getDisplayMetrics().density);addView(dot,new LayoutParams(size,size,Gravity.CENTER));}
  @Override public boolean onTouchEvent(MotionEvent event){int action=event.getActionMasked();if(action==MotionEvent.ACTION_DOWN){downX=event.getX();downY=event.getY();dragged=false;}if(event.getPointerCount()>1||Math.hypot(event.getX()-downX,event.getY()-downY)>slop)dragged=true;boolean tap=action==MotionEvent.ACTION_UP&&!dragged&&event.getEventTime()-event.getDownTime()<ViewConfiguration.getLongPressTimeout();MotionEvent copy=MotionEvent.obtain(event);int[] source=new int[2],target=new int[2];getLocationOnScreen(source);map.getLocationOnScreen(target);copy.offsetLocation(source[0]-target[0],source[1]-target[1]);if(tap)copy.setAction(MotionEvent.ACTION_CANCEL);try{map.dispatchTouchEvent(copy);}finally{copy.recycle();}if(tap)performClick();return true;}
}
