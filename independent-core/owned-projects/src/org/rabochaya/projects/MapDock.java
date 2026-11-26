package org.rabochaya.projects;

import android.app.Activity;
import android.content.SharedPreferences;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageButton;
import android.widget.LinearLayout;

/** Lays out the existing map actions independently of project and map state. */
final class MapDock extends LinearLayout {
 private static final String[] GLYPHS = {"menu", "maps", "marks", "files", "compass"};
 private final FrameLayout scene;
 private final View attribution, zoom;
 private final HorizontalScrollView scroll;
 private final ImageButton toggle;
 private final SharedPreferences preferences;
 private final int touch, edge, bottom, toolsWidth;
 private boolean expanded;

 MapDock(Activity activity, FrameLayout scene, View attribution, View zoom, WorkspaceUi.Item... actions) {
  super(activity);
  this.scene = scene;
  this.attribution = attribution;
  this.zoom = zoom;
  touch = WorkspaceUi.dp(activity, MapHud.TOUCH_DP);
  edge = WorkspaceUi.dp(activity, 4);
  bottom = WorkspaceUi.dp(activity, 2);
  preferences = activity.getPreferences(0);
  expanded = preferences.getBoolean("show_tools", true);
  toolsWidth = actions.length * touch;

  scroll = new HorizontalScrollView(activity);
  scroll.setHorizontalScrollBarEnabled(false);
  LinearLayout tools = new LinearLayout(activity);
  scroll.addView(tools, new FrameLayout.LayoutParams(-2, -1));
  for (int i = 0; i < actions.length; i++) {
   WorkspaceUi.Item item = actions[i];
   ImageButton button = MapHud.button(activity, GLYPHS[i], item.title, item.action);
   MapHud.insetButton(activity, button, 3, 13);
   tools.addView(button, new LayoutParams(touch, -1));
  }
  addView(scroll, new LayoutParams(-1, -1));

  toggle = MapHud.button(activity, "expand", "Свернуть / развернуть инструменты", () -> {
   expanded = !expanded;
   preferences.edit().putBoolean("show_tools", expanded).commit();
   layoutControls();
  });
  MapHud.insetButton(activity, toggle, 3, 13);

  FrameLayout.LayoutParams dock = new FrameLayout.LayoutParams(touch, touch, Gravity.LEFT | Gravity.BOTTOM);
  dock.setMargins(edge, 0, 0, bottom);
  scene.addView(this, dock);
  scene.addView(toggle, new FrameLayout.LayoutParams(touch, touch, Gravity.LEFT | Gravity.BOTTOM));
  scroll.setVisibility(expanded ? VISIBLE : GONE);
  scene.addOnLayoutChangeListener((view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
   if (right - left != oldRight - oldLeft) layoutControls();
  });
  zoom.addOnLayoutChangeListener((view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
   if (right - left != oldRight - oldLeft) layoutControls();
  });
 }

 void layoutControls() {
  int zoomClearance = zoom.getVisibility() == VISIBLE ? touch + edge : 0;
  int width = scene.getWidth();
  int available = Math.max(touch, width - 2 * edge - zoomClearance);
  // The disclosure button can move up a row before it displaces any primary action.
  boolean separate = expanded && available < toolsWidth + touch;
  int strip = expanded ? Math.min(toolsWidth, available - (separate ? 0 : touch)) : touch;
  scroll.setVisibility(expanded ? VISIBLE : GONE);
  if (getLayoutParams().width != strip) {
   getLayoutParams().width = strip;
   requestLayout();
  }
  FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) toggle.getLayoutParams();
  int left = expanded && !separate ? edge + strip : edge;
  int offset = separate ? bottom + touch : bottom;
  if (params.leftMargin != left || params.bottomMargin != offset) {
   params.leftMargin = left;
   params.bottomMargin = offset;
   toggle.setLayoutParams(params);
  }
  FrameLayout.LayoutParams status = (FrameLayout.LayoutParams) attribution.getLayoutParams();
  int statusLeft = separate ? edge * 2 + touch : edge;
  if (status.leftMargin != statusLeft) {
   status.leftMargin = statusLeft;
   attribution.setLayoutParams(status);
  }
 }
}
