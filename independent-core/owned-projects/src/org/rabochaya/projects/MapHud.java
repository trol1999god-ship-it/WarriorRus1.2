package org.rabochaya.projects;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.Toast;

/** Map-only chrome and owned, density-independent pictograms. */
final class MapHud {
 static final int INK = 0xffeaf5ff;
 static final int BAR = 0xff1a344b;
 static final int SURFACE = 0xf21a344b;
 private static final int EDGE = 0xff5b86a7;
 private static final int ACCENT = 0xff81c5f2;

 private MapHud() {}

 static GradientDrawable panel(Activity activity) {
  GradientDrawable background = new GradientDrawable();
  background.setColor(SURFACE);
  background.setCornerRadius(WorkspaceUi.dp(activity, 6));
  background.setStroke(WorkspaceUi.dp(activity, 1), EDGE);
  return background;
 }

 static ImageButton button(Activity activity, String name, String label, Runnable action) {
  ImageButton button = new ImageButton(activity);
  button.setScaleType(ImageView.ScaleType.FIT_CENTER);
  button.setImageDrawable(new Glyph(name));
  button.setContentDescription(label);
  button.setBackground(new RippleDrawable(ColorStateList.valueOf(0x4081c5f2), panel(activity), null));
  int padding = WorkspaceUi.dp(activity, 10);
  button.setPadding(padding, padding, padding, padding);
  button.setOnClickListener(view -> action.run());
  button.setOnLongClickListener(view -> {
   Toast.makeText(activity, label, Toast.LENGTH_SHORT).show();
   return true;
  });
  return button;
 }

 private static final class Glyph extends Drawable {
  private final String name;
  private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
  private final Path path = new Path();

  Glyph(String name) {
   this.name = name;
   paint.setStrokeWidth(1.8f);
   paint.setStyle(Paint.Style.STROKE);
   paint.setStrokeCap(Paint.Cap.ROUND);
   paint.setStrokeJoin(Paint.Join.ROUND);
  }

  @Override public void draw(Canvas canvas) {
   Rect bounds = getBounds();
   int save = canvas.save();
   canvas.translate(bounds.left, bounds.top);
   canvas.scale(bounds.width() / 24f, bounds.height() / 24f);
   paint.setColor(INK);
   switch (name) {
    case "menu":
     canvas.drawLine(4, 6, 20, 6, paint);
     canvas.drawLine(4, 12, 20, 12, paint);
     canvas.drawLine(4, 18, 20, 18, paint);
     break;
    case "maps":
     outline(canvas, 2, 6, 8, 3, 16, 6, 22, 3, 22, 18, 16, 21, 8, 18, 2, 21, 2, 6);
     paint.setColor(ACCENT);
     canvas.drawLine(8, 3, 8, 18, paint);
     canvas.drawLine(16, 6, 16, 21, paint);
     break;
    case "marks":
     path.reset();
     path.moveTo(12, 22);
     path.cubicTo(9, 18, 5, 14, 5, 9);
     path.cubicTo(5, 0, 19, 0, 19, 9);
     path.cubicTo(19, 14, 15, 18, 12, 22);
     path.close();
     canvas.drawPath(path, paint);
     paint.setColor(ACCENT);
     canvas.drawCircle(12, 9, 2.4f, paint);
     break;
    case "files":
     outline(canvas, 2, 20, 2, 5, 9, 5, 11, 8, 22, 8, 22, 20, 2, 20);
     paint.setColor(ACCENT);
     canvas.drawLine(4, 11, 20, 11, paint);
     break;
    case "compass":
     canvas.drawCircle(12, 12, 9.5f, paint);
     paint.setColor(ACCENT);
     outline(canvas, 16, 7, 13, 14, 8, 17, 11, 10, 16, 7);
     break;
    case "collapse":
     outline(canvas, 6, 15, 12, 9, 18, 15);
     break;
    case "expand":
     outline(canvas, 9, 6, 15, 12, 9, 18);
     break;
    case "plus":
     canvas.drawLine(12, 5, 12, 19, paint);
     canvas.drawLine(5, 12, 19, 12, paint);
     break;
    case "minus":
     canvas.drawLine(5, 12, 19, 12, paint);
     break;
    default:
     throw new IllegalArgumentException("Unknown map control: " + name);
   }
   canvas.restoreToCount(save);
  }

  private void outline(Canvas canvas, float... points) {
   path.reset();
   path.moveTo(points[0], points[1]);
   for (int i = 2; i < points.length; i += 2) path.lineTo(points[i], points[i + 1]);
   canvas.drawPath(path, paint);
  }

  @Override public int getIntrinsicWidth() { return 24; }
  @Override public int getIntrinsicHeight() { return 24; }
  @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
  @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); }
  @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
 }
}
