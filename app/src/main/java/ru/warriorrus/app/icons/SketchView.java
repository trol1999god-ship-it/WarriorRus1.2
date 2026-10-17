package ru.warriorrus.app.icons;

import android.content.Context;
import android.graphics.*;
import android.view.*;
import java.util.*;

/** User strokes become native vector paths; no image service or external resources. */
public final class SketchView extends View {
  private final List<List<PointF>> strokes=new ArrayList<>();private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);private int points;
  public SketchView(Context context){super(context);setContentDescription("Поле рисования значка");setBackgroundColor(Color.WHITE);paint.setColor(0xff3f6db5);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);}
  public void undo(){if(!strokes.isEmpty()){points-=strokes.remove(strokes.size()-1).size();invalidate();}}
  public void clear(){strokes.clear();points=0;invalidate();}
  @Override public boolean onTouchEvent(MotionEvent event) {
    if(event.getAction()==MotionEvent.ACTION_DOWN){if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(true);if(points>=5000)return true;strokes.add(new ArrayList<>());}
    if(event.getAction()==MotionEvent.ACTION_DOWN||event.getAction()==MotionEvent.ACTION_MOVE||event.getAction()==MotionEvent.ACTION_UP){
      if(!strokes.isEmpty()&&points<5000){List<PointF> line=strokes.get(strokes.size()-1);PointF p=new PointF(Math.max(0,Math.min(64,event.getX()/Math.max(1,getWidth())*64)),Math.max(0,Math.min(64,event.getY()/Math.max(1,getHeight())*64)));
        if(line.isEmpty()||Math.hypot(line.get(line.size()-1).x-p.x,line.get(line.size()-1).y-p.y)>0.4){line.add(p);points++;invalidate();}}
      return true;
    }return true;
  }
  @Override protected void onDraw(Canvas canvas){super.onDraw(canvas);canvas.save();canvas.scale(getWidth()/64f,getHeight()/64f);paint.setStrokeWidth(3);
    for(List<PointF> line:strokes){if(line.isEmpty())continue;if(line.size()==1){paint.setStyle(Paint.Style.FILL);canvas.drawCircle(line.get(0).x,line.get(0).y,1.5f,paint);}
      else{paint.setStyle(Paint.Style.STROKE);Path path=new Path();path.moveTo(line.get(0).x,line.get(0).y);for(int n=1;n<line.size();n++)path.lineTo(line.get(n).x,line.get(n).y);canvas.drawPath(path,paint);}}
    canvas.restore();
  }
  public String svg(){if(points==0)throw new IllegalArgumentException("Сначала нарисуйте значок");StringBuilder svg=new StringBuilder("<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64'>");
    for(List<PointF> line:strokes){if(line.isEmpty())continue;if(line.size()==1){PointF p=line.get(0);svg.append("<circle cx='").append(p.x).append("' cy='").append(p.y).append("' r='1.5'/>");}
      else{svg.append("<path fill='none' stroke='currentColor' stroke-width='3' stroke-linecap='round' stroke-linejoin='round' d='M");for(int n=0;n<line.size();n++){PointF p=line.get(n);if(n>0)svg.append(" L");svg.append(p.x).append(' ').append(p.y);}svg.append("'/>");}}
    return svg.append("</svg>").toString();
  }
}
