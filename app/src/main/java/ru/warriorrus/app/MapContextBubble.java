package ru.warriorrus.app;

import android.app.AlertDialog;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.view.*;
import android.widget.*;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;

/** The center menu points at its actual map anchor and remains inside the visible window. */
public final class MapContextBubble extends Drawable {
  private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
  private final Path path=new Path();
  private final int triangle;private final float pointer;private final boolean above;
  private MapContextBubble(int triangle,float pointer,boolean above){this.triangle=triangle;this.pointer=pointer;this.above=above;}
  @Override public void draw(Canvas canvas){
    Rect b=getBounds();float width=b.width(),body=b.height()-triangle,radius=4,tip=Math.max(12,Math.min(width-12,pointer));
    path.reset();path.moveTo(radius,0);path.lineTo(width-radius,0);path.quadTo(width,0,width,radius);path.lineTo(width,body-radius);path.quadTo(width,body,width-radius,body);path.lineTo(tip+triangle/2f,body);path.lineTo(tip,body+triangle);path.lineTo(tip-triangle/2f,body);path.lineTo(radius,body);path.quadTo(0,body,0,body-radius);path.lineTo(0,radius);path.quadTo(0,0,radius,0);path.close();
    canvas.save();canvas.translate(b.left,b.top);if(!above){canvas.translate(0,b.height());canvas.scale(1,-1);}
    paint.setStyle(Paint.Style.FILL);paint.setColor(ReferenceMenu.PANEL);canvas.drawPath(path,paint);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(1);paint.setColor(0xff6898bf);canvas.drawPath(path,paint);canvas.restore();
  }
  @Override public void setAlpha(int alpha){}
  @Override public void setColorFilter(ColorFilter filter){}
  @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}

  public static void show(AlertDialog dialog,LinearLayout panel,MapView map,GeoPoint anchor){
    float density=map.getResources().getDisplayMetrics().density;int gap=Math.round(4*density),triangle=Math.round(16*density),width=Math.min(Math.round(264*density),map.getResources().getDisplayMetrics().widthPixels-gap*2);
    panel.setPadding(gap,gap,gap,gap);compact(panel,Math.round(44*density));
    panel.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));int height=panel.getMeasuredHeight()+triangle;
    int[] location=new int[2];map.getLocationOnScreen(location);Point point=new Point();map.getProjection().toPixels(anchor,point);point.offset(location[0],location[1]);
    // Before first layout, use the visible focus position rather than an uninitialised projection.
    if(map.getWidth()==0||map.getHeight()==0){point.x=map.getResources().getDisplayMetrics().widthPixels/2;point.y=map.getResources().getDisplayMetrics().heightPixels/2;}
    Rect safe=new Rect();map.getWindowVisibleDisplayFrame(safe);if(safe.width()<=0||safe.height()<=0)safe.set(0,0,map.getResources().getDisplayMetrics().widthPixels,map.getResources().getDisplayMetrics().heightPixels);
    int left=Math.max(safe.left+gap,Math.min(safe.right-width-gap,point.x-width/2));boolean above=point.y-height-gap>=safe.top;
    int top=above?point.y-height-gap:point.y+gap;top=Math.max(safe.top+gap,Math.min(safe.bottom-height-gap,top));
    dialog.setView(panel,0,above?0:triangle,0,above?triangle:0);dialog.setCanceledOnTouchOutside(true);dialog.show();Window window=dialog.getWindow();
    if(window!=null){window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);SystemInsets.edgeToEdge(window);window.setBackgroundDrawable(new MapContextBubble(triangle,point.x-left,above));window.setLayout(width,-2);window.setGravity(Gravity.TOP|Gravity.LEFT);WindowManager.LayoutParams attributes=window.getAttributes();attributes.x=left;attributes.y=top;window.setAttributes(attributes);}
  }
  private static void compact(View view,int height){
    if(view instanceof Button){Button button=(Button)view;button.setTextSize(18);button.setMinHeight(0);button.setMinimumHeight(0);}
    if(view instanceof LinearLayout){LinearLayout layout=(LinearLayout)view;for(int n=0;n<layout.getChildCount();n++){View child=layout.getChildAt(n);if(child instanceof Button||child instanceof LinearLayout){ViewGroup.LayoutParams p=child.getLayoutParams();p.height=height;child.setLayoutParams(p);}compact(child,height);}}
  }
}
