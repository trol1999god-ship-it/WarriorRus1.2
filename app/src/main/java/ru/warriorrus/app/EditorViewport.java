package ru.warriorrus.app;

import android.view.*;
import android.widget.*;

/** Keeps the map, focus and map controls above a docked drawing editor. */
public final class EditorViewport {
  private static final java.util.WeakHashMap<FrameLayout,Snapshot> snapshots=new java.util.WeakHashMap<>();
  private static final class Snapshot {
    int width,toolbarBottom,zoomBottom;int[] visibility;
  }
  private EditorViewport() {}
  public static void update(FrameLayout root) {
    View editor=root.findViewWithTag("drawingControls");
    int occupied=editor instanceof EditorPanel && ((EditorPanel)editor).docked()?editor.getHeight():0;
    View compass=root.findViewWithTag("compassPanel");if(compass instanceof CompassPanel)occupied=Math.max(occupied,compass.getHeight());
    View map=root.findViewWithTag("mapCanvas"), focus=root.findViewWithTag("mapFocus");
    if(map!=null){
      FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)map.getLayoutParams();
      int left=-root.getPaddingLeft(),top=-root.getPaddingTop(),right=-root.getPaddingRight(),bottom=occupied>0?occupied:-root.getPaddingBottom();
      if(p.leftMargin!=left||p.topMargin!=top||p.rightMargin!=right||p.bottomMargin!=bottom){p.setMargins(left,top,right,bottom);map.setLayoutParams(p);}
    }
    if(focus!=null){focus.setTranslationX((root.getPaddingRight()-root.getPaddingLeft())/2f);focus.setTranslationY((occupied>0?-root.getPaddingTop()-occupied:root.getPaddingBottom()-root.getPaddingTop())/2f);}
    int spacing=Math.round(3*root.getResources().getDisplayMetrics().density);
    View toolbar=root.findViewWithTag("bottomPanel");
    View zoom=root.findViewWithTag("zoomControls");
    Snapshot snapshot=snapshots.get(root);
    if(occupied>0 && snapshot==null){
      snapshot=new Snapshot();
      if(toolbar!=null){FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)toolbar.getLayoutParams();snapshot.width=p.width;snapshot.toolbarBottom=p.bottomMargin;}
      if(zoom!=null)snapshot.zoomBottom=((FrameLayout.LayoutParams)zoom.getLayoutParams()).bottomMargin;
      LinearLayout buttons=root.findViewWithTag("bottomToolbar");
      if(buttons!=null){snapshot.visibility=new int[buttons.getChildCount()];for(int n=0;n<buttons.getChildCount();n++)snapshot.visibility[n]=buttons.getChildAt(n).getVisibility();}
      snapshots.put(root,snapshot);
    }
    if(toolbar!=null && snapshot!=null){
      FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)toolbar.getLayoutParams();
      int width=occupied>0?Math.round(48*root.getResources().getDisplayMetrics().density):snapshot.width;
      int bottom=occupied>0?spacing+occupied:snapshot.toolbarBottom;
      if(p.bottomMargin!=bottom||p.width!=width){p.bottomMargin=bottom;p.width=width;toolbar.setLayoutParams(p);}
      LinearLayout buttons=root.findViewWithTag("bottomToolbar");
      if(buttons!=null)for(int n=1;n<buttons.getChildCount();n++)buttons.getChildAt(n).setVisibility(occupied>0?View.GONE:snapshot.visibility!=null&&n<snapshot.visibility.length?snapshot.visibility[n]:View.VISIBLE);
    }
    if(zoom!=null && snapshot!=null){FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)zoom.getLayoutParams();int bottom=occupied>0?spacing+occupied:snapshot.zoomBottom;if(p.bottomMargin!=bottom){p.bottomMargin=bottom;zoom.setLayoutParams(p);}}
    if(occupied==0)snapshots.remove(root);
  }
}
