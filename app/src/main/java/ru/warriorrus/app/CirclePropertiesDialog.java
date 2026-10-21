package ru.warriorrus.app;

import android.app.*;
import android.text.InputType;
import android.widget.*;
import java.util.*;
import java.util.function.Consumer;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.geometry.*;
import ru.warriorrus.app.settings.Coordinates;

/** Editable geodesic circle exported as a standard polygon plus local circle metadata. */
public final class CirclePropertiesDialog {
  private CirclePropertiesDialog() {}
  public static void show(Activity activity,MapItem source,Consumer<MapItem> save) {
    MapItem value=ObjectJson.decode(ObjectJson.encode(Collections.singletonList(source))).get(0);
    double latitude=value.appearance.circleLatitude==null?value.latitude:value.appearance.circleLatitude;
    double longitude=value.appearance.circleLongitude==null?value.longitude:value.appearance.circleLongitude;
    double meters=value.appearance.circleRadiusMeters;
    if(meters<=0&&!value.segments.isEmpty()&&!value.segments.get(0).isEmpty())meters=Geometry.distance(new Vertex(latitude,longitude),value.segments.get(0).get(0));
    LinearLayout form=new LinearLayout(activity);form.setOrientation(LinearLayout.VERTICAL);int pad=Math.round(16*activity.getResources().getDisplayMetrics().density);form.setPadding(pad,pad,pad,pad);
    EditText name=new EditText(activity);name.setSingleLine(true);name.setHint("Название");name.setText(value.name);form.addView(name);
    EditText center=new EditText(activity);center.setSingleLine(true);center.setHint("Координаты центра");center.setText(String.format(Locale.ROOT,"%.8f, %.8f",latitude,longitude));form.addView(center);
    EditText radius=new EditText(activity);radius.setSingleLine(true);radius.setHint("Радиус");radius.setInputType(InputType.TYPE_CLASS_NUMBER|InputType.TYPE_NUMBER_FLAG_DECIMAL);radius.setText(Double.toString(meters));form.addView(radius);
    Spinner units=new Spinner(activity);ArrayAdapter<String> adapter=new ArrayAdapter<>(activity,android.R.layout.simple_spinner_item,new String[]{"Метры","Километры","Морские мили"});adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);units.setAdapter(adapter);form.addView(units);
    ScrollView scroll=new ScrollView(activity);scroll.addView(form);
    AlertDialog dialog=new AlertDialog.Builder(activity).setTitle("Свойства круга").setView(scroll).setPositiveButton("Сохранить",null).setNegativeButton("Отмена",null).create();
    dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{
      if(name.getText().toString().trim().isEmpty()){name.setError("Введите название");return;}
      Vertex origin;
      try{origin=Coordinates.parse(center.getText().toString());}catch(Exception e){center.setError(e.getMessage());return;}
      double size;
      try{size=Double.parseDouble(radius.getText().toString().trim().replace(',','.'))*new double[]{1,1000,1852}[units.getSelectedItemPosition()];if(Double.isNaN(size)||Double.isInfinite(size)||size<=0||size>20000000)throw new IllegalArgumentException();}
      catch(IllegalArgumentException e){radius.setError("Радиус больше нуля, не более 20000 км");return;}
      value.name=name.getText().toString().trim();value.latitude=origin.latitude;value.longitude=origin.longitude;
      value.appearance.circleLatitude=origin.latitude;value.appearance.circleLongitude=origin.longitude;value.appearance.circleRadiusMeters=size;
      List<Vertex> ring=new ArrayList<>();for(int n=0;n<96;n++)ring.add(Geometry.project(origin,n*360.0/96,size));value.segments.clear();value.segments.add(ring);
      try{save.accept(value);dialog.dismiss();}catch(Exception e){name.setError(e.getMessage());}
    }));dialog.show();
  }
}
