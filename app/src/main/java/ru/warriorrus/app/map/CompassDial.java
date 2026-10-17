package ru.warriorrus.app.map;

import android.content.Context;
import android.graphics.*;
import android.view.View;

/** Windows-styled compass, with a fixed dial or a rotating rose. */
public final class CompassDial extends View {
  private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
  public float heading;
  public boolean movingRose=true,ready;
  public CompassDial(Context context){super(context);setContentDescription("Шкала компаса");}
  @Override protected void onDraw(Canvas canvas){super.onDraw(canvas);
    float radius=Math.min(getWidth(),getHeight())*.39f,cx=getWidth()/2f,cy=getHeight()/2f;
    canvas.save();canvas.translate(cx,cy);
    if(movingRose&&ready)canvas.rotate(-heading);
    paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(2);paint.setColor(0xff83abc7);canvas.drawCircle(0,0,radius,paint);
    for(int n=0;n<72;n++){canvas.save();canvas.rotate(n*5);canvas.drawLine(0,-radius,0,-radius+(n%6==0?12:5),paint);canvas.restore();}
    paint.setStyle(Paint.Style.FILL);paint.setTextAlign(Paint.Align.CENTER);paint.setTextSize(radius*.16f);
    String[] names={"С","В","Ю","З"};
    for(int n=0;n<4;n++){double angle=Math.toRadians(n*90);paint.setColor(n==0?0xffff6262:0xffe4f2ff);canvas.drawText(names[n],(float)Math.sin(angle)*radius*.76f,-(float)Math.cos(angle)*radius*.76f+paint.getTextSize()/3,paint);}
    canvas.restore();
    canvas.save();canvas.translate(cx,cy);if(!movingRose&&ready)canvas.rotate(-heading);
    Path arrow=new Path();arrow.moveTo(0,-radius*.63f);arrow.lineTo(-radius*.10f,radius*.16f);arrow.lineTo(radius*.10f,radius*.16f);arrow.close();paint.setColor(ready?0xffff6262:0xff6d8495);canvas.drawPath(arrow,paint);canvas.restore();
  }
}
