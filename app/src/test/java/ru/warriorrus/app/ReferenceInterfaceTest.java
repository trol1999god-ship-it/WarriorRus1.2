package ru.warriorrus.app;

import static org.junit.Assert.*;
import android.app.Dialog;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import org.robolectric.android.controller.ActivityController;
import ru.warriorrus.app.settings.MainCommands;
import ru.warriorrus.app.map.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk={23,35})
public class ReferenceInterfaceTest {
  private SharedPreferences prefs;
  @Before public void reset(){android.content.Context c=RuntimeEnvironment.getApplication();c.deleteDatabase("warrior2.db");prefs=c.getSharedPreferences("MainActivity",0);prefs.edit().clear().putBoolean("mapOnline",false).commit();}
  @Test public void mainMenuUsesReferenceActionsAndNoLegacyTiles(){try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup()){
    c.get().getWindow().getDecorView().findViewWithTag("Меню").performClick();View root=org.robolectric.shadows.ShadowDialog.getLatestDialog().getWindow().getDecorView();
    for(String name:new String[]{"Скрыть кнопки меню","Блокировать экран","Снимок экрана","Настройки","Выход","Ещё…"})assertNotNull(text(root,name));
    for(String name:new String[]{"Объекты","Слои","Карты","Значки"})assertNull(text(root,name));
    assertEquals(3,new MainCommands(prefs).items().size());
  }}
  @Test public void customCommandSurvivesRestartAndDrivesActualMainLongPress(){MainCommands commands=new MainCommands(prefs);commands.replace(0,"coordinates");commands.replace(1,null);commands.replace(2,"grid");assertEquals(Arrays.asList("coordinates","capture","grid"),commands.items());try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup()){
    View root=c.get().getWindow().getDecorView();root.findViewWithTag("Меню").performLongClick();assertEquals(View.GONE,root.findViewWithTag("coordinatePanel").getVisibility());root.findViewWithTag("Меню").performLongClick();assertEquals(View.VISIBLE,root.findViewWithTag("coordinatePanel").getVisibility());
  }assertEquals("coordinates",new MainCommands(prefs).items().get(0));}
  @Test public void touchLockSurvivesRotationAndUnlocksOnlyOnDeliberateAction()throws Exception {Bundle state=new Bundle();try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup()){
    java.lang.reflect.Field field=MainActivity.class.getDeclaredField("screen");field.setAccessible(true);ScreenController screen=(ScreenController)field.get(c.get());screen.lock(true);View lock=c.get().getWindow().getDecorView().findViewWithTag("touchLock");assertNotNull(lock);desc(lock,"Разблокировать экран").performClick();assertTrue(screen.locked());c.saveInstanceState(state);
  }try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup(state)){
    View lock=c.get().getWindow().getDecorView().findViewWithTag("touchLock");assertNotNull(lock);desc(lock,"Разблокировать экран").performLongClick();assertNull(c.get().getWindow().getDecorView().findViewWithTag("touchLock"));
  }}
  @Test public void favoriteSetRestoresLayerOrderAndAllColorParametersWithoutLosingInstalledSources()throws Exception {
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup()){
      java.lang.reflect.Field f=MainActivity.class.getDeclaredField("catalog");f.setAccessible(true);MapCatalog catalog=(MapCatalog)f.get(c.get());MapCatalog.Layer base=catalog.find("osm"),added=catalog.addOnline("Synthetic map","https://example.invalid/{z}/{x}/{y}.png","Synthetic source",false);added.opacity=42;added.saturation=.3f;added.contrast=1.3f;added.brightness=-.2f;added.hue=35;added.inverted=true;catalog.saveFavorite("Test set");org.json.JSONObject set=catalog.favoriteSets().getJSONObject(0);String id=set.getString("id");
      added.opacity=100;added.saturation=1;added.inverted=false;catalog.remove(added);assertNotNull(catalog.find(added.id));assertFalse(added.visible);catalog.applyFavorite(set,false);assertTrue(added.visible);assertEquals(42,added.opacity);assertEquals(.3f,added.saturation,.0001);assertEquals(35,added.hue,.0001);assertTrue(added.inverted);assertEquals(base.id,catalog.layers.get(0).id);assertEquals(added.id,catalog.layers.get(1).id);catalog.editFavorite(id,"Renamed");assertEquals("Renamed",catalog.favoriteSets().getJSONObject(0).getString("name"));catalog.editFavorite(id,null);assertEquals(0,catalog.favoriteSets().length());assertEquals(2,catalog.layers.size());
    }
  }
  private View text(View v,String s){if(v instanceof TextView&&s.contentEquals(((TextView)v).getText()))return v;if(v instanceof ViewGroup)for(int n=0;n<((ViewGroup)v).getChildCount();n++){View found=text(((ViewGroup)v).getChildAt(n),s);if(found!=null)return found;}return null;}
  private View desc(View v,String s){if(s.equals(v.getContentDescription()))return v;if(v instanceof ViewGroup)for(int n=0;n<((ViewGroup)v).getChildCount();n++){View found=desc(((ViewGroup)v).getChildAt(n),s);if(found!=null)return found;}return null;}
}
