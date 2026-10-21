package ru.warriorrus.app.geometry;

import android.content.Context;
import android.graphics.*;
import android.view.*;
import java.util.function.Consumer;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.ReferenceMenu;
import ru.warriorrus.app.settings.DisplayUnits;

/** Interactive profiles computed only from the supplied object's vertices. */
public final class ElevationProfile extends View {
  private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
  private ProfileSeries series;
  private ProfileSeries.Value value=ProfileSeries.Value.ELEVATION;
  private ProfileSeries.Axis axis=ProfileSeries.Axis.DISTANCE;
  private Consumer<ProfileSeries.Sample> selected;
  private int selection=-1;
  private float downX,downY;
  private final RectF plot=new RectF();
  public ElevationProfile(Context context,MapItem item){super(context);setFocusable(true);setSeries(new ProfileSeries(item));}
  public void onSelection(Consumer<ProfileSeries.Sample> callback){selected=callback;}
  public void setSeries(ProfileSeries source){series=source;if(selection>=source.samples.size())selection=-1;invalidate();}
  public void axes(ProfileSeries.Value value,ProfileSeries.Axis axis){this.value=value;this.axis=axis;if(selection>=0&&!series.valid(series.samples.get(selection),value,axis))selection=-1;invalidate();}
  public int selection(){return selection;}
  public void select(int index,boolean notify){selection=index>=0&&index<series.samples.size()&&series.valid(series.samples.get(index),value,axis)?index:-1;invalidate();if(notify&&selection>=0&&selected!=null)selected.accept(series.samples.get(selection));}
  public static String duration(double seconds){long s=Math.max(0,Math.round(seconds));return String.format(java.util.Locale.ROOT,"%d:%02d:%02d",s/3600,s/60%60,s%60);}
  public String formatValue(double number){DisplayUnits units=DisplayUnits.load(getContext());return value==ProfileSeries.Value.ELEVATION?units.height(number):value==ProfileSeries.Value.SPEED?units.speed(number):units.slope(number);}
  public String formatX(double number){return axis==ProfileSeries.Axis.DISTANCE?DisplayUnits.load(getContext()).distance(number):duration(number);}
  private float density(){return getResources().getDisplayMetrics().density;}
  @Override protected void onDraw(Canvas canvas){
    super.onDraw(canvas);canvas.drawColor(0xffd6ecff);float d=density();paint.setTextSize(11*d);paint.setColor(ReferenceMenu.MUTED);paint.setStyle(Paint.Style.FILL);
    double[] bounds=series.bounds(value,axis);
    if(bounds[0]==Double.POSITIVE_INFINITY){canvas.drawText("Данных недостаточно",8*d,24*d,paint);plot.setEmpty();return;}
    double low=bounds[2],high=bounds[3];if(high-low<1e-9){low-=.5;high+=.5;}
    float labelWidth=Math.max(paint.measureText(formatValue(low)),paint.measureText(formatValue(high)));
    plot.set(Math.min(getWidth()*.42f,Math.max(42*d,labelWidth+6*d)),14*d,Math.max(1,getWidth()-10*d),Math.max(15*d,getHeight()-28*d));
    paint.setTextAlign(Paint.Align.LEFT);canvas.drawText(formatValue(high),2*d,plot.top+4*d,paint);canvas.drawText(formatValue(low),2*d,plot.bottom,paint);
    canvas.drawText(formatX(bounds[0]),plot.left,getHeight()-6*d,paint);paint.setTextAlign(Paint.Align.RIGHT);canvas.drawText(formatX(bounds[1]),plot.right,getHeight()-6*d,paint);paint.setTextAlign(Paint.Align.LEFT);
    paint.setColor(0xff9bc4e4);paint.setStrokeWidth(d);paint.setStyle(Paint.Style.STROKE);canvas.drawRect(plot,paint);
    Path path=new Path();ProfileSeries.Sample previous=null;float previousX=0,previousY=0;boolean hasLine=false;
    double span=Math.max(1e-9,bounds[1]-bounds[0]);
    for(ProfileSeries.Sample sample:series.samples){
      if(!series.valid(sample,value,axis)){previous=null;continue;}
      float x=plot.left+(float)((series.x(sample,axis)-bounds[0])/span*plot.width());float y=plot.bottom-(float)((sample.value(value)-low)/(high-low)*plot.height());
      if(previous!=null&&series.connected(previous,sample,value,axis)){path.lineTo(x,y);hasLine=true;}else{path.moveTo(x,y);paint.setStyle(Paint.Style.FILL);paint.setColor(0xff0879ca);canvas.drawCircle(x,y,2*d,paint);}
      previous=sample;previousX=x;previousY=y;
    }
    paint.setColor(0xff0879ca);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(2*d);canvas.drawPath(path,paint);paint.setStyle(Paint.Style.FILL);
    if(!hasLine&&previous!=null)canvas.drawCircle(previousX,previousY,3*d,paint);
    if(selection>=0&&selection<series.samples.size()){
      ProfileSeries.Sample sample=series.samples.get(selection);
      if(series.valid(sample,value,axis)){float x=plot.left+(float)((series.x(sample,axis)-bounds[0])/span*plot.width()),y=plot.bottom-(float)((sample.value(value)-low)/(high-low)*plot.height());paint.setColor(0xffdf4242);paint.setStrokeWidth(d);canvas.drawLine(x,plot.top,x,plot.bottom,paint);canvas.drawCircle(x,y,4*d,paint);}
    }
  }
  private void touch(float x,boolean notify){double[] bounds=series.bounds(value,axis);if(plot.isEmpty()||bounds[0]==Double.POSITIVE_INFINITY)return;double fraction=Math.max(0,Math.min(1,(x-plot.left)/Math.max(1,plot.width())));select(series.nearest(bounds[0]+fraction*(bounds[1]-bounds[0]),value,axis),notify);}
  @Override public boolean onTouchEvent(MotionEvent event){
    switch(event.getActionMasked()){
      case MotionEvent.ACTION_DOWN:if(plot.isEmpty())return false;downX=event.getX();downY=event.getY();if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(true);touch(event.getX(),false);return true;
      case MotionEvent.ACTION_MOVE:if(Math.abs(event.getY()-downY)>Math.abs(event.getX()-downX)+8*density()){if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(false);return true;}touch(event.getX(),true);return true;
      case MotionEvent.ACTION_UP:touch(event.getX(),true);performClick();if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(false);return true;
      case MotionEvent.ACTION_CANCEL:if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(false);return true;
      default:return super.onTouchEvent(event);
    }
  }
  @Override public boolean performClick(){super.performClick();return true;}
  @Override public boolean onKeyDown(int code,KeyEvent event){if(code==KeyEvent.KEYCODE_DPAD_LEFT||code==KeyEvent.KEYCODE_DPAD_RIGHT){int step=code==KeyEvent.KEYCODE_DPAD_LEFT?-1:1;for(int n=selection<0?(step>0?0:series.samples.size()-1):selection+step;n>=0&&n<series.samples.size();n+=step)if(series.valid(series.samples.get(n),value,axis)){select(n,true);return true;}return true;}return super.onKeyDown(code,event);}
}
