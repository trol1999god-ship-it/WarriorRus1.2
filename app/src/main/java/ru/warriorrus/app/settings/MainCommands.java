package ru.warriorrus.app.settings;

import android.content.SharedPreferences;
import java.util.*;
import org.json.*;

/** Stable action IDs; only commands implemented locally are offered. */
public final class MainCommands {
  public static final String[] IDS={"hide","lock","capture","point","quickPoint","search","measure","compass","north","grid","night","coordinates","maps","displayedMaps","explorer","import","export","settings","about"};
  public static final String[] LABELS={"Скрыть кнопки меню","Блокировать экран","Снимок экрана","Метка","Быстрая метка","Поиск местоположения","Измерить","Компас","Север сверху","Координатная сетка","Ночной режим","Координаты центра экрана","Доступные карты","Карты на экране","Проводник меток","Импорт меток","Экспорт меток","Настройки","О программе"};
  private final SharedPreferences prefs;
  public MainCommands(SharedPreferences prefs){this.prefs=prefs;}
  public List<String> items(){List<String> result=new ArrayList<>();if(!prefs.contains("mainCommands"))return new ArrayList<>(Arrays.asList("hide","lock","capture"));try{JSONArray a=new JSONArray(prefs.getString("mainCommands","[]"));for(int n=0;n<a.length()&&result.size()<24;n++){String id=a.optString(n);if(Arrays.asList(IDS).contains(id))result.add(id);}}catch(JSONException ignored){}return result;}
  public void replace(int position,String id){List<String> items=items();if(position<0||position>items.size())throw new IllegalArgumentException("Команда не найдена");if(id!=null&&!Arrays.asList(IDS).contains(id))throw new IllegalArgumentException("Команда недоступна");if(position==items.size()){if(id!=null&&items.size()<24)items.add(id);}else if(id==null)items.remove(position);else items.set(position,id);prefs.edit().putString("mainCommands",new JSONArray(items).toString()).apply();}
  public static String label(String id){int n=Arrays.asList(IDS).indexOf(id);return n<0?"":LABELS[n];}
}
