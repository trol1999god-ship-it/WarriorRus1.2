package ru.warriorrus.app;

import static org.junit.Assert.*;
import android.app.Dialog;
import android.view.*;
import android.widget.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import org.robolectric.android.controller.ActivityController;

@RunWith(RobolectricTestRunner.class)
@Config(sdk={23,35})
public class MenuModelTest {
  @Before public void reset(){RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");RuntimeEnvironment.getApplication().getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).commit();}
  @Test public void categoriesFollowOriginalOrderAndPlacemarksOpenTheirSubmenu(){
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup()){
      View root=c.get().getWindow().getDecorView();ViewGroup bar=root.findViewWithTag("bottomToolbar");
      String[] descriptions={"Меню","Карты и слои","Метки","Ориентирование"};assertEquals(4,bar.getChildCount());
      for(int n=0;n<4;n++)assertEquals(descriptions[n],bar.getChildAt(n).getContentDescription());
      bar.getChildAt(2).performClick();Dialog menu=org.robolectric.shadows.ShadowDialog.getLatestDialog();View options=menu.getWindow().getDecorView();
      assertNotNull(text(options,"Все метки"));assertNotNull(text(options,"Новая метка"));assertNotNull(text(options,"Поиск на карте"));
      assertNull(text(options,"Метки на экране"));text(options,"Все метки").performClick();
      assertNotNull(text(org.robolectric.shadows.ShadowDialog.getLatestDialog().getWindow().getDecorView(),"Локальные метки"));
    }
  }
  @Test public void mapMenuExposesMapsLayersAndAreaInOneCategoryAndSettingsOpenDirectly(){
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup()){
      View root=c.get().getWindow().getDecorView();root.findViewWithTag("Карты").performClick();Dialog menu=org.robolectric.shadows.ShadowDialog.getLatestDialog();View options=menu.getWindow().getDecorView();
      assertNotNull(text(options,"Доступные карты"));assertNotNull(text(options,"Карты на экране"));assertNotNull(text(options,"Сохранить участок карты"));menu.dismiss();
      root.findViewWithTag("Меню").performClick();text(org.robolectric.shadows.ShadowDialog.getLatestDialog().getWindow().getDecorView(),"Настройки").performClick();
      assertNotNull(text(org.robolectric.shadows.ShadowDialog.getLatestDialog().getWindow().getDecorView(),"Формат местоположения"));
    }
  }
  private View text(View v,String value){if(v instanceof TextView&&value.contentEquals(((TextView)v).getText()))return v;if(v instanceof ViewGroup)for(int n=0;n<((ViewGroup)v).getChildCount();n++){View result=text(((ViewGroup)v).getChildAt(n),value);if(result!=null)return result;}return null;}
}
