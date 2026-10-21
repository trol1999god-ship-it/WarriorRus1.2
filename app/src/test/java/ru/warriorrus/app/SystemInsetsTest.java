package ru.warriorrus.app;

import static org.junit.Assert.*;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.WindowInsets;
import android.widget.LinearLayout;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {23, 35})
public class SystemInsetsTest {
  @Test public void bottomNavigationAndSideNavigationBoundTheWholePanel() {
    LinearLayout panel = new LinearLayout(RuntimeEnvironment.getApplication());
    SafePanelHost host = new SafePanelHost(panel.getContext(), panel, 640, true);
    int gap = 0; // Full-screen lists meet the safe rectangle without floating-panel margins.
    WindowInsets insets;
    if (Build.VERSION.SDK_INT >= 30) {
      insets = new WindowInsets.Builder().setInsets(WindowInsets.Type.systemBars(),
          android.graphics.Insets.of(0, 24, 0, 48)).setVisible(WindowInsets.Type.systemBars(), true).build();
    } else insets = org.robolectric.util.ReflectionHelpers.callConstructor(WindowInsets.class,
        org.robolectric.util.ReflectionHelpers.ClassParameter.from(Rect.class, new Rect(0, 24, 0, 48)));
    host.dispatchApplyWindowInsets(insets);
    layout(host, 360, 800);
    assertEquals(24 + gap, panel.getTop());
    assertEquals(800 - 48 - gap, panel.getBottom());
    host.dispatchApplyWindowInsets(insets);
    layout(host, 360, 800);
    assertEquals(800 - 48 - gap, panel.getBottom()); // Padding must not accumulate.
    if (Build.VERSION.SDK_INT >= 30) insets = new WindowInsets.Builder()
        .setInsets(WindowInsets.Type.systemBars(), android.graphics.Insets.of(0, 24, 48, 0)).setVisible(WindowInsets.Type.systemBars(), true).build();
    else insets = org.robolectric.util.ReflectionHelpers.callConstructor(WindowInsets.class,
        org.robolectric.util.ReflectionHelpers.ClassParameter.from(Rect.class, new Rect(0, 24, 48, 0)));
    host.dispatchApplyWindowInsets(insets);
    layout(host, 600, 360);
    assertTrue(panel.getRight() <= 600 - 48 - gap);
    assertEquals(360 - gap, panel.getBottom());
  }

  @Test @Config(sdk = 35)
  public void keyboardAndCutoutUseTheLargerInsetRatherThanAddingThem() {
    LinearLayout panel = new LinearLayout(RuntimeEnvironment.getApplication());
    SafePanelHost host = new SafePanelHost(panel.getContext(), panel, 640, true);
    WindowInsets insets = new WindowInsets.Builder()
        .setInsets(WindowInsets.Type.systemBars(), android.graphics.Insets.of(0, 24, 0, 48))
        .setInsets(WindowInsets.Type.displayCutout(), android.graphics.Insets.of(30, 40, 0, 0))
        .setInsets(WindowInsets.Type.ime(), android.graphics.Insets.of(0, 0, 0, 250))
        .setVisible(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout() | WindowInsets.Type.ime(), true).build();
    host.dispatchApplyWindowInsets(insets);
    int gap = 0; // Full-screen lists meet the safe rectangle without floating-panel margins.
    assertEquals(40 + gap, host.getPaddingTop());
    assertEquals(30 + gap, host.getPaddingLeft());
    assertEquals(250 + gap, host.getPaddingBottom());
  }

  private void layout(View view, int width, int height) {
    view.forceLayout();
    view.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
    view.layout(0, 0, width, height);
  }

  @Test public void dockedEditorResizesMapAndFocusAndRestoresThemOnClose() {
    android.widget.FrameLayout root=new android.widget.FrameLayout(RuntimeEnvironment.getApplication());root.setTag("mapRoot");
    View map=new View(root.getContext());map.setTag("mapCanvas");root.addView(map,new android.widget.FrameLayout.LayoutParams(-1,-1));
    View focus=new View(root.getContext());focus.setTag("mapFocus");root.addView(focus,new android.widget.FrameLayout.LayoutParams(44,44,android.view.Gravity.CENTER));
    LinearLayout bar=new LinearLayout(root.getContext());bar.setTag("bottomPanel");root.addView(bar,new android.widget.FrameLayout.LayoutParams(192,48,android.view.Gravity.BOTTOM));
    EditorPanel editor=new EditorPanel(root.getContext(),root,"drawingControls","Путь",null,null,()->{});editor.dockMap();editor.show();
    for(int[] size:new int[][]{{360,800},{800,360}}){
      root.setPadding(0,24,0,48);layout(root,size[0],size[1]);EditorViewport.update(root);layout(root,size[0],size[1]);
      assertEquals("editor="+editor.getHeight()+" map margin="+((android.widget.FrameLayout.LayoutParams)map.getLayoutParams()).bottomMargin+" measured="+map.getMeasuredHeight(),editor.getTop(),map.getBottom());
      assertEquals(map.getHeight()/2f,focus.getY()+22,.51f);
      assertTrue(bar.getBottom()<=editor.getTop());assertEquals(48,bar.getWidth());
      editor.expanded(false);layout(root,size[0],size[1]);EditorViewport.update(root);layout(root,size[0],size[1]);
      assertEquals(editor.getTop(),map.getBottom());assertEquals(map.getHeight()/2f,focus.getY()+22,.51f);
      editor.expanded(true);
    }
    root.removeView(editor);EditorViewport.update(root);layout(root,360,800);
    assertEquals(800,map.getHeight());assertEquals(400,focus.getY()+22,.51f);assertEquals(192,bar.getWidth());
  }

  @Test @Config(sdk=23) public void mapViewportAndFocusStayFixedWhileLegacyBarsHideAndKeyboardRemainsProtected(){
    android.widget.FrameLayout root=new android.widget.FrameLayout(RuntimeEnvironment.getApplication());root.setTag("mapRoot");View map=new View(root.getContext());map.setTag("mapCanvas");root.addView(map,new android.widget.FrameLayout.LayoutParams(-1,-1));View focus=new View(root.getContext());focus.setTag("mapFocus");root.addView(focus,new android.widget.FrameLayout.LayoutParams(44,44,android.view.Gravity.CENTER));SystemInsets.protect(root,0);
    WindowInsets insets=org.robolectric.util.ReflectionHelpers.callConstructor(WindowInsets.class,org.robolectric.util.ReflectionHelpers.ClassParameter.from(Rect.class,new Rect(0,24,0,48)));org.robolectric.util.ReflectionHelpers.setField(insets,"mStableInsets",new Rect(0,24,0,48));
    root.dispatchApplyWindowInsets(insets);layout(root,360,800);assertEquals(800,map.getHeight());assertEquals(0,map.getTop());assertEquals(400,focus.getY()+22,.01);
    root.setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN|View.SYSTEM_UI_FLAG_HIDE_NAVIGATION);root.dispatchApplyWindowInsets(insets);layout(root,360,800);assertEquals(0,root.getPaddingTop());assertEquals(0,root.getPaddingBottom());assertEquals(800,map.getHeight());assertEquals(400,focus.getY()+22,.01);
    WindowInsets keyboard=org.robolectric.util.ReflectionHelpers.callConstructor(WindowInsets.class,org.robolectric.util.ReflectionHelpers.ClassParameter.from(Rect.class,new Rect(0,24,0,280)));org.robolectric.util.ReflectionHelpers.setField(keyboard,"mStableInsets",new Rect(0,24,0,48));root.dispatchApplyWindowInsets(keyboard);assertEquals(280,root.getPaddingBottom());
  }
}
