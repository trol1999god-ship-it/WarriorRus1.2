package ru.warriorrus.app;

import android.os.Build;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;

/** One inset owner per window. No fixed assumptions about Android navigation-bar size. */
public final class SystemInsets {
  private SystemInsets() {}

  public static void edgeToEdge(Window window) {
    if (Build.VERSION.SDK_INT >= 30) window.setDecorFitsSystemWindows(false);
    else window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_STABLE
        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION);
  }

  public static void protect(View content, int spacing) {
    content.setOnApplyWindowInsetsListener((view, insets) -> {
      int left, top, right, bottom;
      if (Build.VERSION.SDK_INT >= 30) {
        android.graphics.Insets safe = insets.getInsets(WindowInsets.Type.systemBars()
            | WindowInsets.Type.displayCutout() | WindowInsets.Type.ime());
        left = safe.left; top = safe.top; right = safe.right; bottom = safe.bottom;
      } else {
        left = insets.getSystemWindowInsetLeft();
        top = insets.getSystemWindowInsetTop();
        right = insets.getSystemWindowInsetRight();
        bottom = insets.getSystemWindowInsetBottom();
        if (Build.VERSION.SDK_INT >= 28 && insets.getDisplayCutout() != null) {
          android.view.DisplayCutout cutout = insets.getDisplayCutout();
          left = Math.max(left, cutout.getSafeInsetLeft());
          top = Math.max(top, cutout.getSafeInsetTop());
          right = Math.max(right, cutout.getSafeInsetRight());
          bottom = Math.max(bottom, cutout.getSafeInsetBottom());
        }
      }
      view.setPadding(left + spacing, top + spacing, right + spacing, bottom + spacing);
      return insets;
    });
    content.requestApplyInsets();
  }
}
