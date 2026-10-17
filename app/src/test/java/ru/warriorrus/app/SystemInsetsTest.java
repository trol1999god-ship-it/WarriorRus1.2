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
    view.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
    view.layout(0, 0, width, height);
  }
}
