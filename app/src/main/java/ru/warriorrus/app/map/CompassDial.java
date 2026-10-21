package ru.warriorrus.app.map;

import android.content.Context;
import android.graphics.*;
import android.view.View;
import android.graphics.drawable.Drawable;
import ru.warriorrus.app.ReferenceAssets;
import ru.warriorrus.app.ReferenceMenu;

/** Orientation-only compass: fixed standard dial or rotating TopoChaix dial. */
public final class CompassDial extends View {
  private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
  private final Drawable standardDial,topoDial,needle,sight;
  public float heading;
  public boolean topo,ready;
  public CompassDial(Context context){
    super(context);setContentDescription("Шкала компаса");
    standardDial=ReferenceAssets.drawable(context,"orientation_compass_bg_280",336,false);
    topoDial=ReferenceAssets.drawable(context,"orientation_compass_topo_280",280,false);
    needle=ReferenceAssets.drawable(context,"orientation_compass_needle_100",300,false);
    sight=ReferenceAssets.drawable(context,"orientation_compass_topoline_100",300,false);
    bluePalette(standardDial);bluePalette(topoDial);
  }
  private void bluePalette(Drawable drawable){
    if(drawable==null)return;
    // Map luminance to dark/light blue; SRC_IN would erase every opaque scale marking.
    float r=191/255f,g=179/255f,b=172/255f;
    drawable.setColorFilter(new ColorMatrixColorFilter(new float[]{
      r*.213f,r*.715f,r*.072f,0,8,
      g*.213f,g*.715f,g*.072f,0,46,
      b*.213f,b*.715f,b*.072f,0,76,
      0,0,0,1,0}));
  }
  private void layer(Canvas canvas,Drawable drawable,float x,float y,float width,float height,float angle,int alpha){
    canvas.save();canvas.translate(x,y);canvas.rotate(angle);
    drawable.setBounds(Math.round(-width/2),Math.round(-height/2),Math.round(width/2),Math.round(height/2));
    drawable.setAlpha(alpha);drawable.draw(canvas);canvas.restore();
  }
  @Override protected void onDraw(Canvas canvas){
    super.onDraw(canvas);int size=Math.min(getWidth(),getHeight());float angle=ready?-heading:0;
    Drawable dial=topo?topoDial:standardDial;
    if(dial!=null&&needle!=null){
      float scale=Math.min(getWidth()/300f,getHeight()/346f);
      float cx=getWidth()/2f,cy=getHeight()/2f+28*scale;int alpha=ready?255:110;
      layer(canvas,standardDial,cx,cy-28*scale,280*scale,336*scale,0,alpha);
      if(topo)layer(canvas,dial,cx,cy,280*scale,280*scale,angle,alpha);
      layer(canvas,needle,cx,cy,100*scale,300*scale,angle,alpha);
      if(topo&&sight!=null)layer(canvas,sight,cx,cy,100*scale,300*scale,0,alpha);
      return;
    }
    float radius=size*.39f;
    canvas.save();canvas.translate(getWidth()/2f,getHeight()/2f);if(topo)canvas.rotate(angle);
    paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(2);paint.setColor(0xff83abc7);canvas.drawCircle(0,0,radius,paint);
    for(int n=0;n<72;n++){canvas.save();canvas.rotate(n*5);canvas.drawLine(0,-radius,0,-radius+(n%6==0?12:5),paint);canvas.restore();}
    paint.setStyle(Paint.Style.FILL);paint.setTextAlign(Paint.Align.CENTER);paint.setTextSize(radius*.16f);
    String[] names={"С","В","Ю","З"};
    for(int n=0;n<4;n++){double a=Math.toRadians(n*90);paint.setColor(n==0?0xffff6262:ReferenceMenu.TEXT);canvas.drawText(names[n],(float)Math.sin(a)*radius*.76f,-(float)Math.cos(a)*radius*.76f+paint.getTextSize()/3,paint);}
    canvas.restore();canvas.save();canvas.translate(getWidth()/2f,getHeight()/2f);canvas.rotate(angle);
    Path arrow=new Path();arrow.moveTo(0,-radius*.63f);arrow.lineTo(-radius*.10f,radius*.16f);arrow.lineTo(radius*.10f,radius*.16f);arrow.close();paint.setColor(ready?0xffff6262:0xff6d8495);canvas.drawPath(arrow,paint);canvas.restore();
  }
}
