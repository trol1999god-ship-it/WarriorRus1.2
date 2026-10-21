package ru.warriorrus.app.geometry;

import android.content.Context;
import android.view.Gravity;
import android.widget.*;
import java.util.*;
import ru.warriorrus.app.ReferenceMenu;
import ru.warriorrus.app.data.MapItem;
import ru.warriorrus.app.settings.DisplayUnits;

/** Object statistics and profiles share the same local geometry in editor and object details. */
public final class GeometryStatisticsView extends LinearLayout {
  private final LinearLayout rows;
  private final ReferenceMenu ui;
  public final ProfilePanel profile;
  public GeometryStatisticsView(Context context,MapItem item){super(context);setOrientation(VERTICAL);setTag("geometryStatistics");ui=new ReferenceMenu(context);rows=new LinearLayout(context);rows.setOrientation(VERTICAL);addView(rows);ui.heading(this,"Профиль","",null);profile=new ProfilePanel(context,item);addView(profile);update(item);}
  private void row(String name,String value){LinearLayout row=new LinearLayout(getContext());row.setGravity(Gravity.CENTER_VERTICAL);row.setPadding(ui.dp(8),ui.dp(5),ui.dp(8),ui.dp(5));TextView label=new TextView(getContext()),number=new TextView(getContext());label.setText(name);label.setTextColor(ReferenceMenu.MUTED);label.setTextSize(12);number.setText(value);number.setTextColor(ReferenceMenu.TEXT);number.setTextSize(12);number.setGravity(Gravity.END);row.addView(label,new LayoutParams(0,-2,1));row.addView(number,new LayoutParams(0,-2,1));rows.addView(row);}
  public void update(MapItem item){DisplayUnits units=DisplayUnits.load(getContext());TrackStatistics stats=TrackStatistics.of(item);rows.removeAllViews();
    row("Точек",String.valueOf(Geometry.count(item)));row("Сегментов / контуров",String.valueOf(item.segments.size()));row("area".equals(item.kind)?"Периметр":"Длина",units.distance(Geometry.length(item)));if("area".equals(item.kind))row("Площадь",units.area(Geometry.area(item)));
    if(stats.min!=Double.POSITIVE_INFINITY){row("Высота · мин. / макс.",units.height(stats.min)+" / "+units.height(stats.max));row("Подъём / спуск",units.height(stats.ascent)+" / "+units.height(stats.descent));row("Максимальные уклоны",units.slope(stats.maxUphill)+" / "+units.slope(stats.maxDownhill));}
    if(stats.first!=Long.MAX_VALUE&&stats.last>=stats.first)row("Продолжительность",ElevationProfile.duration(((double)stats.last-stats.first)/1000));
    if(stats.movingMillis>0){row("Время по сегментам",ElevationProfile.duration(stats.movingMillis/1000.0));row("Средняя скорость",units.speed(stats.timedDistance/stats.movingMillis*1000));row("Максимальная скорость",units.speed(stats.maxSpeed));}
    profile.update(item);
  }
}
