package org.rabochaya.projects;

import android.app.Activity;
import android.hardware.*;

final class MagneticHeading implements SensorEventListener {
    interface Listener { void changed(double heading,int accuracy,String status); }
    private final Activity owner;
    private final SensorManager sensors;
    private final Listener listener;
    private float[] gravity,magnetic;
    private double heading=Double.NaN;
    private int accuracy;
    private boolean active;

    MagneticHeading(Activity owner,Listener listener) {
        this.owner=owner;
        this.listener=listener;
        sensors=(SensorManager)owner.getSystemService(Activity.SENSOR_SERVICE);
    }
    void start() {
        if(active)return;
        Sensor acceleration=sensors==null?null:sensors.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        Sensor field=sensors==null?null:sensors.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);
        if(acceleration==null||field==null) {
            listener.changed(Double.NaN,0,"нет магнитного датчика или акселерометра");
            return;
        }
        active=sensors.registerListener(this,acceleration,SensorManager.SENSOR_DELAY_UI)
            && sensors.registerListener(this,field,SensorManager.SENSOR_DELAY_UI);
        if(!active)sensors.unregisterListener(this);
        listener.changed(Double.NaN,0,active?"ожидаются данные датчиков":"датчики не отвечают");
    }
    void stop() {
        if(sensors!=null)sensors.unregisterListener(this);
        active=false;
        heading=Double.NaN;
        gravity=magnetic=null;
        accuracy=SensorManager.SENSOR_STATUS_UNRELIABLE;
    }
    public void onSensorChanged(SensorEvent event) {
        if(!active)return;
        if(event.sensor.getType()==Sensor.TYPE_ACCELEROMETER)gravity=event.values.clone();
        else if(event.sensor.getType()==Sensor.TYPE_MAGNETIC_FIELD){magnetic=event.values.clone();accuracy=event.accuracy;}
        else return;
        double value=CompassMath.heading(gravity,magnetic,owner.getWindowManager().getDefaultDisplay().getRotation());
        if(Double.isNaN(value)){
            listener.changed(Double.NaN,accuracy,"держите телефон горизонтально");
            return;
        }
        heading=CompassMath.smooth(heading,value);
        listener.changed(heading,accuracy,null);
    }
    public void onAccuracyChanged(Sensor sensor,int value) {
        if(sensor.getType()==Sensor.TYPE_MAGNETIC_FIELD)accuracy=value;
    }
}
