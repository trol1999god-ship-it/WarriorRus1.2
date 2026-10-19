package ru.warriorrus.app;

import android.app.*;
import android.graphics.Typeface;
import android.view.*;
import android.widget.*;
import java.util.function.IntConsumer;

/** Reference creation list with its section headings, original artwork and descriptions. */
public final class PlacemarkCreationMenu {
  private PlacemarkCreationMenu(){}
  public static void show(Activity activity,IntConsumer action){
    String[] names={"Локальные метки","Путевая точка","Аудиоточка","Набор точек","Маршрут","Путь","Область","Круг","Текст","Инструменты","Поиск на карте","Измерение"};
    String[] descriptions={"","Создать путевую точку на карте.","Связать локальную аудиозапись с точкой.","Создать набор путевых точек на карте.","Проложить маршрут на карте по заданным точкам.","Начертить путь на карте.","Начертить область на карте.","Создать круговую область с заданным радиусом.","Добавить текст на карту.","","Искать названия, координаты и прочее.","Измерить расстояние и азимут между точками."};
    String[] icons={null,"landmarks_explorer_cell_waypoint_36","app_action_audio_24","landmarks_explorer_cell_set_36","landmarks_explorer_cell_route_36","landmarks_explorer_cell_path_36","landmarks_explorer_cell_area_36","landmarks_explorer_cell_circle_36","landmarks_explorer_cell_text_36",null,"app_action_search_24","app_action_landmarks_measure_24"};
    ReferenceMenu ui=new ReferenceMenu(activity);
    ArrayAdapter<String> adapter=new ArrayAdapter<String>(activity,android.R.layout.simple_list_item_1,names){
      @Override public boolean areAllItemsEnabled(){return false;}
      @Override public boolean isEnabled(int position){return position!=0&&position!=9;}
      @Override public View getView(int position,View recycled,ViewGroup parent){
        if(!isEnabled(position)){TextView section=new TextView(activity);section.setText(names[position].toUpperCase(java.util.Locale.ROOT));section.setTextColor(ReferenceMenu.MUTED);section.setTextSize(12);section.setPadding(ui.dp(8),ui.dp(8),ui.dp(8),ui.dp(8));return section;}
        LinearLayout row=new LinearLayout(activity);row.setGravity(Gravity.CENTER_VERTICAL);row.setMinimumHeight(ui.dp(60));row.setPadding(ui.dp(16),ui.dp(8),ui.dp(12),ui.dp(8));
        ImageView icon=new ImageView(activity);icon.setImageDrawable(ReferenceAssets.drawable(activity,icons[position],36,true));row.addView(icon,new LinearLayout.LayoutParams(ui.dp(44),ui.dp(44)));
        LinearLayout column=new LinearLayout(activity);column.setOrientation(LinearLayout.VERTICAL);column.setPadding(ui.dp(8),0,0,0);TextView title=new TextView(activity);title.setText(names[position]);title.setTextSize(18);title.setTextColor(ReferenceMenu.TEXT);column.addView(title);
        if(!descriptions[position].isEmpty()){TextView description=new TextView(activity);description.setText(descriptions[position]);description.setTextColor(ReferenceMenu.MUTED);description.setTextSize(13);description.setTypeface(null,Typeface.ITALIC);column.addView(description);}
        row.addView(column,new LinearLayout.LayoutParams(0,-2,1));return row;
      }
    };
    new AlertDialog.Builder(activity).setTitle("Новая метка").setAdapter(adapter,(dialog,position)->action.accept(position)).setNegativeButton("Отмена",null).show();
  }
}
