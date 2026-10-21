package ru.warriorrus.app.map;

import static org.junit.Assert.*;
import android.app.Activity;
import android.hardware.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowSensor;
import org.robolectric.shadows.ShadowSensorManager;

@RunWith(RobolectricTestRunner.class) @Config(sdk={23,35})
public class CompassControllerTest {
  @Test public void barometerCannotOverwriteHeadingAccuracyAndRestartClearsOldAccuracy(){
    try(ActivityController<Activity> activity=Robolectric.buildActivity(Activity.class).setup()){
      SensorManager manager=(SensorManager)activity.get().getSystemService(Activity.SENSOR_SERVICE);
      ShadowSensorManager shadow=Shadows.shadowOf(manager);
      Sensor rotation=ShadowSensor.newInstance(Sensor.TYPE_ROTATION_VECTOR);
      Sensor pressure=ShadowSensor.newInstance(Sensor.TYPE_PRESSURE);
      shadow.addSensor(rotation);shadow.addSensor(pressure);
      CompassController compass=new CompassController(activity.get(),c->{});
      assertTrue(compass.start("rotation"));
      compass.onAccuracyChanged(rotation,SensorManager.SENSOR_STATUS_ACCURACY_LOW);
      compass.onAccuracyChanged(pressure,SensorManager.SENSOR_STATUS_ACCURACY_HIGH);
      assertEquals(SensorManager.SENSOR_STATUS_ACCURACY_LOW,compass.accuracy);
      compass.stop();
      compass.onAccuracyChanged(rotation,SensorManager.SENSOR_STATUS_ACCURACY_HIGH);
      assertEquals(SensorManager.SENSOR_STATUS_UNRELIABLE,compass.accuracy);
      assertTrue(compass.start("rotation"));
      assertFalse(compass.ready);
      assertEquals(SensorManager.SENSOR_STATUS_UNRELIABLE,compass.accuracy);
      compass.stop();
    }
  }
  @Test public void fallsBackToMagnetometerWhenRotationSensorIsAbsent(){
    try(ActivityController<Activity> activity=Robolectric.buildActivity(Activity.class).setup()){
      SensorManager manager=(SensorManager)activity.get().getSystemService(Activity.SENSOR_SERVICE);
      ShadowSensorManager shadow=Shadows.shadowOf(manager);
      shadow.addSensor(ShadowSensor.newInstance(Sensor.TYPE_ACCELEROMETER));
      Sensor magnetic=ShadowSensor.newInstance(Sensor.TYPE_MAGNETIC_FIELD);shadow.addSensor(magnetic);
      CompassController compass=new CompassController(activity.get(),c->{});
      assertTrue(compass.start("rotation"));
      compass.onAccuracyChanged(magnetic,SensorManager.SENSOR_STATUS_ACCURACY_MEDIUM);
      assertEquals(SensorManager.SENSOR_STATUS_ACCURACY_MEDIUM,compass.accuracy);
      compass.stop();assertFalse(compass.enabled);assertFalse(compass.ready);
    }
  }
}
