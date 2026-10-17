package ru.warriorrus.app.map;

import android.app.Activity;
import android.hardware.*;
import android.view.Surface;
import java.util.function.Consumer;

/** Heading from orientation sensors only. Never reads a device location. */
public final class CompassController implements SensorEventListener {
  private final Activity activity;
  private final SensorManager manager;
  private final Consumer<CompassController> changed;
  private final float[] gravity=new float[3], magnetic=new float[3];
  private boolean haveGravity,haveMagnetic;
  public boolean enabled,ready;
  public float heading,pitch,roll;
  public int accuracy=SensorManager.SENSOR_STATUS_UNRELIABLE;
  public String method="rotation";
  public CompassController(Activity activity,Consumer<CompassController> changed) {
    this.activity=activity;this.changed=changed;
    manager=(SensorManager)activity.getSystemService(Activity.SENSOR_SERVICE);
  }
  public boolean start(String method) {
    stop();this.method=method;haveGravity=haveMagnetic=false;
    if(manager==null)return false;
    Sensor rotation=manager.getDefaultSensor(Sensor.TYPE_ROTATION_VECTOR);
    if(!"magnetic".equals(method)&&rotation!=null)enabled=manager.registerListener(this,rotation,SensorManager.SENSOR_DELAY_UI);
    else {
      Sensor a=manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER),m=manager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);
      if(a!=null&&m!=null){boolean first=manager.registerListener(this,a,SensorManager.SENSOR_DELAY_UI);boolean second=manager.registerListener(this,m,SensorManager.SENSOR_DELAY_UI);enabled=first&&second;}
    }
    if(!enabled)manager.unregisterListener(this);
    changed.accept(this);return enabled;
  }
  public void stop(){if(manager!=null)manager.unregisterListener(this);enabled=false;ready=false;}
  @Override public void onSensorChanged(SensorEvent event) {
    if(!enabled)return;
    float[] matrix=new float[9];
    if(event.sensor.getType()==Sensor.TYPE_ROTATION_VECTOR)SensorManager.getRotationMatrixFromVector(matrix,event.values);
    else {
      if(event.sensor.getType()==Sensor.TYPE_ACCELEROMETER){System.arraycopy(event.values,0,gravity,0,3);haveGravity=true;}
      if(event.sensor.getType()==Sensor.TYPE_MAGNETIC_FIELD){System.arraycopy(event.values,0,magnetic,0,3);haveMagnetic=true;}
      if(!haveGravity||!haveMagnetic||!SensorManager.getRotationMatrix(matrix,null,gravity,magnetic))return;
    }
    float[] remapped=new float[9],angles=new float[3];
    int rotation=activity.getWindowManager().getDefaultDisplay().getRotation(),x=SensorManager.AXIS_X,y=SensorManager.AXIS_Y;
    if(rotation==Surface.ROTATION_90){x=SensorManager.AXIS_Y;y=SensorManager.AXIS_MINUS_X;}
    else if(rotation==Surface.ROTATION_180){x=SensorManager.AXIS_MINUS_X;y=SensorManager.AXIS_MINUS_Y;}
    else if(rotation==Surface.ROTATION_270){x=SensorManager.AXIS_MINUS_Y;y=SensorManager.AXIS_X;}
    if(!SensorManager.remapCoordinateSystem(matrix,x,y,remapped))return;
    SensorManager.getOrientation(remapped,angles);
    heading=normalize((float)Math.toDegrees(angles[0]));pitch=(float)Math.toDegrees(angles[1]);roll=(float)Math.toDegrees(angles[2]);
    ready=true;changed.accept(this);
  }
  public static float normalize(float angle){return (angle%360+360)%360;}
  @Override public void onAccuracyChanged(Sensor sensor,int value){if(sensor.getType()!=Sensor.TYPE_ACCELEROMETER){accuracy=value;changed.accept(this);}}
}
