package ru.warriorrus.app.geometry;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Bundle;
import android.view.Gravity;
import android.widget.*;
import java.util.function.Consumer;
import ru.warriorrus.app.ReferenceMenu;
import ru.warriorrus.app.data.MapItem;
import ru.warriorrus.app.settings.DisplayUnits;

/** Local profile axis selection, cursor readout and optional map selection callback. */
public final class ProfilePanel extends LinearLayout {
  private static final String[] VALUES={"Высота","Скорость","Уклон"},AXES={"Расстояние","Время"};
  private final ReferenceMenu ui;
  public final ElevationProfile chart;
  private final Button valueButton,axisButton;
  private final TextView cursor;
  private ProfileSeries series;
  private int valueMode,axisMode;
  private Consumer<ProfileSeries.Sample> selected;
  public ProfilePanel(Context context,MapItem item){
    super(context);setOrientation(VERTICAL);setTag("profilePanel");ui=new ReferenceMenu(context);series=new ProfileSeries(item);
    LinearLayout choices=new LinearLayout(context);valueButton=ui.action(VALUES[0],()->choose(true));axisButton=ui.action(AXES[0],()->choose(false));
    for(Button button:new Button[]{valueButton,axisButton}){button.setTextSize(12);button.setGravity(Gravity.CENTER);choices.addView(button,new LayoutParams(0,ui.dp(44),1));}addView(choices);
    valueButton.setContentDescription("Установить по оси Y");axisButton.setContentDescription("Установить по оси X");
    chart=new ElevationProfile(context,item);chart.setTag("profileChart");chart.setContentDescription("Профиль объекта "+item.name);chart.onSelection(sample->{readout(sample);if(selected!=null)selected.accept(sample);});addView(chart,new LayoutParams(-1,ui.dp(180)));
    cursor=new TextView(context);cursor.setTextColor(ReferenceMenu.TEXT);cursor.setTextSize(12);cursor.setPadding(ui.dp(8),ui.dp(4),ui.dp(8),ui.dp(8));cursor.setTag("profileCursor");cursor.setText("Коснитесь экрана для управления профилем");addView(cursor);
  }
  private void choose(boolean vertical){new AlertDialog.Builder(getContext()).setTitle(vertical?"Установить по оси Y":"Установить по оси X").setSingleChoiceItems(vertical?VALUES:AXES,vertical?valueMode:axisMode,(dialog,n)->{axes(vertical?n:valueMode,vertical?axisMode:n);dialog.dismiss();}).setNegativeButton("Отмена",null).show();}
  public void onSelection(Consumer<ProfileSeries.Sample> callback){selected=callback;}
  public void update(MapItem item){series=new ProfileSeries(item);chart.setSeries(series);axes(valueMode,axisMode);}
  public void axes(int value,int axis){valueMode=Math.max(0,Math.min(2,value));axisMode=Math.max(0,Math.min(1,axis));valueButton.setText(VALUES[valueMode]+" ▾");axisButton.setText(AXES[axisMode]+" ▾");chart.axes(ProfileSeries.Value.values()[valueMode],ProfileSeries.Axis.values()[axisMode]);if(chart.selection()>=0)readout(series.samples.get(chart.selection()));else cursor.setText("Коснитесь экрана для управления профилем");}
  private void readout(ProfileSeries.Sample sample){Double x=series.x(sample,ProfileSeries.Axis.values()[axisMode]),y=sample.value(ProfileSeries.Value.values()[valueMode]);if(x==null||y==null)return;String time=sample.vertex.time==null?"":"\n"+sample.vertex.time;cursor.setText("Сегмент "+(sample.segment+1)+" · точка "+(sample.index+1)+" · "+chart.formatX(x)+"\n"+VALUES[valueMode]+": "+chart.formatValue(y)+(sample.vertex.name==null||sample.vertex.name.isEmpty()?"":" · "+sample.vertex.name)+time);}
  public void save(Bundle state,String prefix){state.putInt(prefix+"Value",valueMode);state.putInt(prefix+"Axis",axisMode);state.putInt(prefix+"Cursor",chart.selection());}
  public void restore(Bundle state,String prefix){if(state==null)return;axes(state.getInt(prefix+"Value",0),state.getInt(prefix+"Axis",0));chart.select(state.getInt(prefix+"Cursor",-1),false);if(chart.selection()>=0)readout(series.samples.get(chart.selection()));}
}
