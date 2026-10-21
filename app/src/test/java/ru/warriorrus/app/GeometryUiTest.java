package ru.warriorrus.app;

import static org.junit.Assert.*;
import android.app.*;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.geometry.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk={23,35})
public class GeometryUiTest {
  @Before public void clear(){RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");RuntimeEnvironment.getApplication().getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).commit();}
  @Test public void manualRouteAndAreaSaveThroughRealUiAndSurviveReopen() {
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()) {
      View root=c.get().getWindow().getDecorView();
      for(String title:new String[]{"Маршрут","Область"}) {
        desc(root,"Действия в центре карты").performClick();AlertDialog context=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();desc(context.getWindow().getDecorView(),"Новая метка…").performClick();context=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
        for(int n=0;n<context.getListView().getCount();n++)if(title.equals(context.getListView().getItemAtPosition(n).toString()))context.getListView().performItemClick(null,n,n);
        AlertDialog properties=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
        assertNull(root.findViewWithTag("drawingControls"));
        ((EditText)properties.findViewById(android.R.id.custom).findViewWithTag("geometryName")).setText(title);
        properties.getButton(-1).performClick();org.robolectric.shadows.ShadowLooper.idleMainLooper();
        View drawing=root.findViewWithTag("drawingControls");assertNotNull(drawing);
        org.osmdroid.views.MapView map=(org.osmdroid.views.MapView)type(root,org.osmdroid.views.MapView.class);
        map.getController().setCenter(new org.osmdroid.util.GeoPoint(56.0,38.0));desc(drawing,"+ Точка").performClick();
        if(title.equals("Область")){map.getController().setCenter(new org.osmdroid.util.GeoPoint(55.0,38.0));desc(drawing,"+ Точка").performClick();}
        desc(drawing,"Сохранить").performClick();org.robolectric.shadows.ShadowLooper.idleMainLooper();assertNull(root.findViewWithTag("drawingControls"));
      }
      try(ObjectStore store=new ObjectStore(c.get())){assertEquals(2,store.all().size());assertEquals("route",store.all().get(0).kind);assertEquals("area",store.all().get(1).kind);}
    }
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()) {
      View root=c.get().getWindow().getDecorView();org.osmdroid.views.MapView map=(org.osmdroid.views.MapView)type(root,org.osmdroid.views.MapView.class);
      assertEquals(1,map.getOverlays().stream().filter(o->o instanceof org.osmdroid.views.overlay.Polygon).count());
      assertEquals(1,map.getOverlays().stream().filter(o->o instanceof org.osmdroid.views.overlay.Polyline).count());
    }
  }
  @Test public void drawingDraftSurvivesActivityRecreation() {
    Bundle state=new Bundle();
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()) {
      View root=c.get().getWindow().getDecorView();desc(root,"Действия в центре карты").performClick();AlertDialog context=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();desc(context.getWindow().getDecorView(),"Новая метка…").performClick();context=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();for(int n=0;n<context.getListView().getCount();n++)if("Маршрут".equals(context.getListView().getItemAtPosition(n)))context.getListView().performItemClick(null,n,n);
      org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog().getButton(-1).performClick();org.robolectric.shadows.ShadowLooper.idleMainLooper();
      c.saveInstanceState(state);
    }
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup(state).visible()) {assertNotNull(c.get().getWindow().getDecorView().findViewWithTag("drawingControls"));}
  }
  @Test public void cancelledPropertiesCreateNothingAndConfiguredPropertiesSurviveDrawingRecreation() {
    Bundle state=new Bundle();long folderId;
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()) {
      View root=c.get().getWindow().getDecorView();
      try(ObjectStore store=new ObjectStore(c.get())) {folderId=store.create(0,"Поход","folder",0,0);}
      MapItem properties=new MapItem();properties.kind="path";properties.name="";properties.visible=true;properties.opacity=1;properties.color=0xff3f6db5;
      try(ObjectStore store=new ObjectStore(c.get())) {
        GeometryPropertiesDialog.show(c.get(),properties,store.all(),v->fail("Cancel must not accept properties"));
      }
      org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog().getButton(-2).performClick();org.robolectric.shadows.ShadowLooper.idleMainLooper();
      try(ObjectStore store=new ObjectStore(c.get())) {assertEquals(1,store.all().size());}
      desc(root,"Действия в центре карты").performClick();AlertDialog context=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();desc(context.getWindow().getDecorView(),"Новая метка…").performClick();context=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
      for(int n=0;n<context.getListView().getCount();n++)if("Путь".equals(context.getListView().getItemAtPosition(n)))context.getListView().performItemClick(null,n,n);
      AlertDialog form=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
      ((EditText)form.getWindow().getDecorView().findViewWithTag("geometryName")).setText("Проверенный путь");
      ((Spinner)form.getWindow().getDecorView().findViewWithTag("geometryFolder")).setSelection(1);
      desc(form.getWindow().getDecorView(),"Цвет").performClick();AlertDialog colors=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();colors.getListView().performItemClick(null,2,2);
      desc(form.getWindow().getDecorView(),"Описание").performClick();AlertDialog note=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();((EditText)type(note.getWindow().getDecorView(),EditText.class)).setText("Локальная заметка");note.getButton(-1).performClick();org.robolectric.shadows.ShadowLooper.idleMainLooper();
      form.getButton(-1).performClick();org.robolectric.shadows.ShadowLooper.idleMainLooper();
      try(ObjectStore store=new ObjectStore(c.get())) {assertEquals("Drawing must remain a draft",1,store.all().size());}
      c.saveInstanceState(state);
    }
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup(state).visible()) {
      View root=c.get().getWindow().getDecorView();View drawing=root.findViewWithTag("drawingControls");assertNotNull(drawing);
      org.osmdroid.views.MapView map=(org.osmdroid.views.MapView)type(root,org.osmdroid.views.MapView.class);map.getController().setCenter(new org.osmdroid.util.GeoPoint(56,38));desc(drawing,"+ Точка").performClick();desc(drawing,"Сохранить").performClick();assertNull(root.findViewWithTag("drawingControls"));
      try(ObjectStore store=new ObjectStore(c.get())) {assertEquals(2,store.all().size());MapItem saved=store.all().get(1);assertEquals("Проверенный путь",saved.name);assertEquals(folderId,saved.parent);assertEquals(0xffdc3030,saved.color);assertEquals("Локальная заметка",saved.description);}
    }
  }
  private View desc(View v,String s){if(s.equals(v.getContentDescription()))return v;if(v instanceof ViewGroup)for(int n=0;n<((ViewGroup)v).getChildCount();n++){View r=desc(((ViewGroup)v).getChildAt(n),s);if(r!=null)return r;}return null;}
  private View type(View v,Class<?> c){if(c.isInstance(v))return v;if(v instanceof ViewGroup)for(int n=0;n<((ViewGroup)v).getChildCount();n++){View r=type(((ViewGroup)v).getChildAt(n),c);if(r!=null)return r;}return null;}
}
