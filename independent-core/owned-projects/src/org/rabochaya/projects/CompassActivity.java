package org.rabochaya.projects;
import android.app.Activity;import android.os.Bundle;import android.content.Context;import android.hardware.*;import android.view.*;import android.graphics.*;import android.widget.*;import java.util.Locale;
/** Magnetic compass independent of map position and all location providers. */
public final class CompassActivity extends Activity implements SensorEventListener {
 private SensorManager sensors;private Sensor accelerometer,magnetometer;private float[] acceleration,magnetic;private TextView status;private Dial dial;private double heading=Double.NaN;private int accuracy=SensorManager.SENSOR_STATUS_UNRELIABLE;
 protected void onCreate(Bundle state){super.onCreate(state);LinearLayout root=new LinearLayout(this);root.setOrientation(1);root.setPadding(12,12,12,12);root.setBackgroundColor(0xff232d1d);setContentView(root);status=new TextView(this);status.setTextColor(0xffffffff);status.setTextSize(20);status.setText("Компас · магнитный север");root.addView(status);dial=new Dial(this);root.addView(dial,new LinearLayout.LayoutParams(-1,0,1));TextView help=new TextView(this);help.setTextColor(0xffffffff);help.setText("Держите телефон близко к горизонтали. Металл и магниты искажают показания. Азимут верхнего края экрана относится к магнитному северу.");root.addView(help);Button back=new Button(this);back.setText("Назад");back.setTextColor(0xff202020);back.setBackgroundColor(0xffe8ece3);back.setOnClickListener(v->finish());root.addView(back);sensors=(SensorManager)getSystemService(SENSOR_SERVICE);accelerometer=sensors.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);magnetometer=sensors.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);}
 protected void onResume(){super.onResume();if(accelerometer==null||magnetometer==null){status.setText("Компас недоступен: нет магнитного датчика или акселерометра");return;}boolean a=sensors.registerListener(this,accelerometer,SensorManager.SENSOR_DELAY_UI),m=sensors.registerListener(this,magnetometer,SensorManager.SENSOR_DELAY_UI);if(!a||!m){sensors.unregisterListener(this);status.setText("Компас недоступен: датчики не отвечают");}}
 protected void onPause(){sensors.unregisterListener(this);super.onPause();}
 public void onSensorChanged(SensorEvent event){if(event.sensor.getType()==Sensor.TYPE_ACCELEROMETER)acceleration=event.values.clone();else if(event.sensor.getType()==Sensor.TYPE_MAGNETIC_FIELD){magnetic=event.values.clone();accuracy=event.accuracy;}else return;
  double value=CompassMath.heading(acceleration,magnetic,getWindowManager().getDefaultDisplay().getRotation());
  if(Double.isNaN(value)){status.setText("Компас · ожидаются данные; держите телефон горизонтально");return;}
  heading=CompassMath.smooth(heading,value);status.setText(String.format(Locale.US,"Магнитный азимут: %03.0f°%s",heading,accuracy==SensorManager.SENSOR_STATUS_UNRELIABLE?" · нужна калибровка":""));dial.setContentDescription(String.format(Locale.US,"Магнитный азимут %.0f градусов",heading));dial.invalidate();
 }
 public void onAccuracyChanged(Sensor sensor,int value){if(sensor.getType()==Sensor.TYPE_MAGNETIC_FIELD)accuracy=value;}
 private final class Dial extends View {
  private final Paint paint=new Paint(3);Dial(Context context){super(context);setContentDescription("Магнитный компас");}
  protected void onDraw(Canvas canvas){super.onDraw(canvas);float cx=getWidth()/2f,cy=getHeight()/2f,r=Math.min(getWidth(),getHeight())*.39f;paint.setColor(0xffe5eadd);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(3);canvas.drawCircle(cx,cy,r,paint);double angle=Double.isNaN(heading)?0:heading;
   for(int degree=0;degree<360;degree+=10){double a=Math.toRadians(degree-angle);float sin=(float)Math.sin(a),cos=(float)Math.cos(a);paint.setColor(degree==0?0xffed6868:0xffe5eadd);canvas.drawLine(cx+sin*r*.87f,cy-cos*r*.87f,cx+sin*r,cy-cos*r,paint);if(degree%90==0){paint.setStyle(Paint.Style.FILL);paint.setTextSize(r*.16f);paint.setTextAlign(Paint.Align.CENTER);canvas.drawText(new String[]{"С","В","Ю","З"}[degree/90],cx+sin*r*.7f,cy-cos*r*.7f+r*.05f,paint);paint.setStyle(Paint.Style.STROKE);}}
   paint.setColor(0xfff0cf52);paint.setStyle(Paint.Style.FILL);canvas.drawCircle(cx,cy,5,paint);paint.setColor(0xfff0cf52);Path pointer=new Path();pointer.moveTo(cx,cy-r*.52f);pointer.lineTo(cx-r*.07f,cy-r*.37f);pointer.lineTo(cx+r*.07f,cy-r*.37f);pointer.close();canvas.drawPath(pointer,paint);
  }
 }
}
