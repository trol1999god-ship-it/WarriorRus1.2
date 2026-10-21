package ru.warriorrus.app;

import android.app.*;
import android.graphics.Color;
import android.text.InputType;
import android.widget.*;
import java.util.*;
import java.util.function.Consumer;
import ru.warriorrus.app.data.*;

/** Scrollable local object properties. Changes are applied together on confirmation. */
public final class ObjectAppearanceDialog {
  private ObjectAppearanceDialog() {}

  public static void show(Activity activity,MapItem item,Consumer<ObjectAppearance> accepted) {
    ObjectAppearance current=item.appearance;
    ReferenceMenu ui=new ReferenceMenu(activity);
    LinearLayout form=new LinearLayout(activity);form.setOrientation(LinearLayout.VERTICAL);
    form.setPadding(ui.dp(16),ui.dp(8),ui.dp(16),ui.dp(12));
    heading(form,"Линия и область");
    EditText width=number(form,"Толщина линии, dp (0 — из настроек)",current.lineWidth);
    Spinner dash=new Spinner(activity);
    String[] codes={"solid","dash","dot","dashdot"};
    ArrayAdapter<String> adapter=new ArrayAdapter<>(activity,android.R.layout.simple_spinner_item,
        new String[]{"Сплошная","Штриховая","Точечная","Штрихпунктирная"});
    adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
    dash.setAdapter(adapter);dash.setSelection(Math.max(0,Arrays.asList(codes).indexOf(current.dash)));
    dash.setContentDescription("Стиль линии");form.addView(dash);
    Spinner mode=new Spinner(activity);String[] modes={"solid","elevation","speed","slope"};
    ArrayAdapter<String> modesAdapter=new ArrayAdapter<>(activity,android.R.layout.simple_spinner_item,
        new String[]{"Один цвет","По высоте","По скорости","По уклону"});
    modesAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
    mode.setAdapter(modesAdapter);mode.setSelection(Math.max(0,Arrays.asList(modes).indexOf(current.colorMode)));
    mode.setContentDescription("Окраска линии");mode.setEnabled(item.isGeometry()&&!"area".equals(item.kind));form.addView(mode);
    CheckBox outline=check(form,"Отображать контур",current.outline);
    CheckBox fill=check(form,"Заливка области",current.fill);
    EditText fillColor=text(form,"Цвет заливки #RRGGBB (пусто — цвет объекта)",colorText(current.fillColor));
    EditText fillAlpha=number(form,"Непрозрачность заливки, %",current.fillOpacity*100);
    heading(form,"Значок и подпись");
    EditText markerSize=number(form,"Размер значка, dp (0 — из настроек)",current.markerSize);
    CheckBox labels=check(form,"Отображать название",current.labels);
    EditText labelSize=number(form,"Размер подписи, sp",current.labelSize);
    CheckBox bold=check(form,"Полужирный шрифт",current.labelBold),italic=check(form,"Курсив",current.labelItalic);
    EditText labelColor=text(form,"Цвет подписи #RRGGBB (пусто — чёрный)",colorText(current.labelColor));
    heading(form,"Дополнительные свойства");
    EditText activityField=text(form,"Активность",current.activity);
    EditText weight=number(form,"Пользовательский вес",current.weight);
    EditText url=text(form,"URL",current.url);
    EditText keywords=text(form,"Ключевые слова",current.keywords);
    ScrollView scroll=new ScrollView(activity);scroll.addView(form);
    AlertDialog dialog=new AlertDialog.Builder(activity).setTitle("Свойства · "+item.typeName())
        .setView(scroll).setPositiveButton("ОК",null).setNegativeButton("Отмена",null).create();
    dialog.setOnShowListener(v->dialog.getButton(-1).setOnClickListener(w->{
      try {
        ObjectAppearance next=current.copy();
        next.lineWidth=(float)read(width,0,40);next.markerSize=(float)read(markerSize,0,128);
        next.labelSize=(float)read(labelSize,6,48);next.fillOpacity=(float)read(fillAlpha,0,100)/100f;
        next.weight=read(weight,0,1e12);next.dash=codes[dash.getSelectedItemPosition()];
        next.colorMode=modes[mode.getSelectedItemPosition()];
        next.labelBold=bold.isChecked();next.labelItalic=italic.isChecked();next.fill=fill.isChecked();next.outline=outline.isChecked();next.labels=labels.isChecked();
        next.fillColor=readColor(fillColor);next.labelColor=readColor(labelColor);
        next.activity=activityField.getText().toString().trim();next.url=url.getText().toString().trim();
        next.keywords=keywords.getText().toString().trim();
        accepted.accept(next);dialog.dismiss();
      }catch(IllegalArgumentException invalid){/* The field identifies the invalid input. */}
    }));dialog.show();
  }
  private static void heading(LinearLayout form,String value) {
    TextView label=new TextView(form.getContext());label.setText(value);label.setTextColor(ReferenceMenu.TEXT);
    label.setTypeface(null,android.graphics.Typeface.BOLD);label.setPadding(0,20,0,8);form.addView(label);
  }
  private static EditText text(LinearLayout form,String label,String value) {
    TextView caption=new TextView(form.getContext());caption.setText(label);caption.setTextColor(ReferenceMenu.TEXT);form.addView(caption);
    EditText field=new EditText(form.getContext());field.setSingleLine(true);field.setContentDescription(label);
    field.setText(value);form.addView(field,new LinearLayout.LayoutParams(-1,-2));return field;
  }
  private static EditText number(LinearLayout form,String label,double value) {
    EditText field=text(form,label,String.format(Locale.ROOT,"%s",value));
    field.setInputType(InputType.TYPE_CLASS_NUMBER|InputType.TYPE_NUMBER_FLAG_DECIMAL);return field;
  }
  private static CheckBox check(LinearLayout form,String label,boolean value) {
    CheckBox field=new CheckBox(form.getContext());field.setText(label);field.setChecked(value);form.addView(field);return field;
  }
  private static double read(EditText field,double min,double max) {
    try {
      double n=Double.parseDouble(field.getText().toString().trim().replace(',','.'));
      if(Double.isNaN(n)||Double.isInfinite(n)||n<min||n>max)throw new NumberFormatException();return n;
    }catch(NumberFormatException error){field.setError("Допустимо от "+min+" до "+max);field.requestFocus();throw new IllegalArgumentException(error);}
  }
  private static String colorText(Integer color) { return color==null?"":String.format(Locale.ROOT,"#%06X",color&0xffffff); }
  private static Integer readColor(EditText field) {
    String s=field.getText().toString().trim();if(s.isEmpty())return null;
    if(!s.matches("#[0-9a-fA-F]{6}")){field.setError("Введите #RRGGBB или оставьте пустым");field.requestFocus();throw new IllegalArgumentException();}
    return Color.parseColor(s);
  }
}
