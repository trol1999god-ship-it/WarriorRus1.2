package org.rabochaya.projects;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.SharedPreferences;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.text.InputType;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.AdapterView;
import android.view.View;
import java.util.Locale;

final class BarometerDialog implements SensorEventListener {
    private static final String[] UNITS={"Гектопаскали/Миллибары","Миллиметры ртутного столба","Дюймы ртутного столба"};
    private static final String[] SYMBOLS={"гПа","мм рт.ст.","дюйм рт.ст."};
    private static final double ATMOSPHERE_HEIGHT=44330.77, EXPONENT=5.25588;
    private final Activity owner;
    private final SharedPreferences prefs;
    private final SensorManager manager;
    private final TextView reading;
    private final Button calibrate;
    private AlertDialog dialog, calibration;
    private double pressure=Double.NaN;

    BarometerDialog(Activity owner){
        this.owner=owner;
        prefs=owner.getSharedPreferences("barometer-display",0);
        manager=(SensorManager)owner.getSystemService(Activity.SENSOR_SERVICE);
        reading=new TextView(owner);
        calibrate=WorkspaceUi.button(owner,"Калибровать",this::calibrate);
        calibrate.setEnabled(false);
    }

    void show(){
        LinearLayout form=new LinearLayout(owner);
        form.setOrientation(LinearLayout.VERTICAL);
        int pad=WorkspaceUi.dp(owner,16);
        form.setPadding(pad,pad,pad,pad);
        reading.setText("Ожидаются данные датчика давления");
        form.addView(reading);
        Spinner units=new Spinner(owner);
        units.setContentDescription("Давление");
        ArrayAdapter<String> adapter=new ArrayAdapter<>(owner,android.R.layout.simple_spinner_item,UNITS);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        units.setAdapter(adapter);
        units.setSelection(unit());
        units.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onNothingSelected(AdapterView<?> parent){}
            public void onItemSelected(AdapterView<?> parent,View view,int position,long id){
                prefs.edit().putInt("unit",position).apply();
                if(!Double.isNaN(pressure))render();
            }
        });
        form.addView(units);
        form.addView(calibrate);
        dialog=new AlertDialog.Builder(owner).setTitle("Барометр").setView(form)
            .setPositiveButton("Закрыть",null).create();
        dialog.setOnDismissListener(closed->stop());
        WorkspaceUi.showDialog(owner,dialog);
        Sensor sensor=manager==null?null:manager.getDefaultSensor(Sensor.TYPE_PRESSURE);
        if(sensor==null||!manager.registerListener(this,sensor,SensorManager.SENSOR_DELAY_NORMAL))
            reading.setText("Датчик давления недоступен");
    }

    void dismiss(){
        if(calibration!=null)calibration.dismiss();
        if(dialog!=null)dialog.dismiss();
        stop();
    }

    private void stop(){
        if(manager!=null)manager.unregisterListener(this);
    }

    public void onSensorChanged(SensorEvent sensor){
        if(sensor.sensor.getType()!=Sensor.TYPE_PRESSURE||sensor.values.length==0)return;
        double value=sensor.values[0];
        if(Double.isNaN(value)||Double.isInfinite(value)||value<=0)return;
        pressure=value;
        calibrate.setEnabled(true);
        render();
    }
    public void onAccuracyChanged(Sensor sensor,int accuracy){}

    private int unit(){return Math.max(0,Math.min(SYMBOLS.length-1,prefs.getInt("unit",0)));}
    static double convert(double hpa,int unit){return unit==1?hpa*0.750061683:unit==2?hpa*0.0295299831:hpa;}
    static double seaLevel(double hpa,double elevation){return hpa/Math.pow(1-elevation/ATMOSPHERE_HEIGHT,EXPONENT);}
    static double elevation(double hpa,double seaLevel){return ATMOSPHERE_HEIGHT*(1-Math.pow(hpa/seaLevel,1/EXPONENT));}

    private String format(double hpa){
        int unit=unit();
        return String.format(Locale.getDefault(),unit==2?"%.2f %s":"%.1f %s",convert(hpa,unit),SYMBOLS[unit]);
    }
    private void render(){
        String text="Давление: "+format(pressure);
        double baseline=prefs.getFloat("sea_level_hpa",0);
        if(baseline>0){
            text+="\nДавление над уровнем моря: "+format(baseline)
                +String.format(Locale.getDefault(),"\nБарометрическая высота: %.0f м",elevation(pressure,baseline));
        }
        reading.setText(text);
    }
    private void calibrate(){
        if(Double.isNaN(pressure))return;
        final double reference=pressure;
        EditText input=new EditText(owner);
        input.setSingleLine(true);
        input.setHint("Текущая высота, м");
        input.setInputType(InputType.TYPE_CLASS_NUMBER|InputType.TYPE_NUMBER_FLAG_DECIMAL|InputType.TYPE_NUMBER_FLAG_SIGNED);
        calibration=new AlertDialog.Builder(owner).setTitle("Калибровать")
            .setMessage("Введите известную высоту в метрах.")
            .setView(input).setPositiveButton("Сохранить",null).setNegativeButton("Отмена",null).create();
        calibration.setOnShowListener(ignored->calibration.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view->{
            try{
                double metres=Double.parseDouble(input.getText().toString().trim().replace(',','.'));
                if(Double.isNaN(metres)||metres< -1000||metres>11000)throw new NumberFormatException();
                prefs.edit().putFloat("sea_level_hpa",(float)seaLevel(reference,metres)).apply();
                render();
                calibration.dismiss();
            }catch(NumberFormatException error){input.setError("Высота от −1000 до 11000 м");}
        }));
        WorkspaceUi.showDialog(owner,calibration);
    }
}
