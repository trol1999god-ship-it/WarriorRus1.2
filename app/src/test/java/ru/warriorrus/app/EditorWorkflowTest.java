package ru.warriorrus.app;

import static org.junit.Assert.*;
import android.app.AlertDialog;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import org.robolectric.android.controller.ActivityController;
import org.osmdroid.util.GeoPoint;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.geometry.*;
import ru.warriorrus.app.map.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk={23,35})
public class EditorWorkflowTest {
  @Before public void reset(){android.content.Context c=RuntimeEnvironment.getApplication();c.deleteDatabase("warrior2.db");c.getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).commit();}

  @Test public void explicitDrawModeCreatesSeparateSegmentsAndRestoresIconAndControls() throws Exception {
    Bundle state=new Bundle();
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()){
      DrawingController editor=field(c.get(),"drawing");MapWorkspace map=field(c.get(),"map");
      MapItem existing=new MapItem();existing.kind="path";existing.name="Линия";existing.visible=true;existing.opacity=1;existing.icon="builtin:star";existing.segments.add(new ArrayList<>(Arrays.asList(new Vertex(55,37),new Vertex(55.001,37))));
      editor.start(existing,"path",0,null);
      map.view.getController().setZoom(16.0);map.view.getController().setCenter(new GeoPoint(55.001,37));
      editor.toggleDrawing();assertTrue(editor.isDrawing());
      map.view.getController().setCenter(new GeoPoint(55.002,37));editor.onMapMoved();editor.onMapMoved();
      editor.toggleDrawing();assertFalse(editor.isDrawing());map.view.getController().setCenter(new GeoPoint(56,38));editor.onMapMoved();
      editor.toggleDrawing();map.view.getController().setCenter(new GeoPoint(56.001,38));editor.onMapMoved();
      EditorPanel panel=c.get().getWindow().getDecorView().findViewWithTag("drawingControls");panel.expanded(true);c.saveInstanceState(state);
      List<List<Vertex>> segments=Geometry.decode(state.getString("draftGeometry"));assertEquals(2,segments.size());assertEquals(3,segments.get(0).size());assertEquals(2,segments.get(1).size());
      assertEquals(55.002,segments.get(0).get(2).latitude,.0001);assertEquals(56,segments.get(1).get(0).latitude,.0001);
    }
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup(state).visible()){
      DrawingController editor=field(c.get(),"drawing");assertTrue(editor.isDrawing());
      EditorPanel panel=c.get().getWindow().getDecorView().findViewWithTag("drawingControls");assertTrue(panel.expanded());
      Bundle restored=new Bundle();editor.saveState(restored);assertEquals("builtin:star",restored.getString("draftIcon"));assertEquals(state.getString("draftGeometry"),restored.getString("draftGeometry"));
    }
  }

  @Test public void splitPreservesMetadataLengthAndRejectsAreaWithoutMutation(){
    MapItem item=new MapItem();item.kind="path";Vertex middle=new Vertex(0,1,15.0,"2026-10-01T00:00:00Z","Вершина","Примечание");item.segments.add(new ArrayList<>(Arrays.asList(new Vertex(0,0),middle,new Vertex(0,2))));double length=Geometry.length(item);
    Geometry.split(item,0,1);Geometry.validate(item);assertEquals(length,Geometry.length(item),.000001);assertSame(middle,item.segments.get(0).get(1));assertSame(middle,item.segments.get(1).get(0));
    String saved=Geometry.encode(item.segments);item.kind="area";try{Geometry.split(item,0,1);fail();}catch(IllegalArgumentException expected){}assertEquals(saved,Geometry.encode(item.segments));
  }

  @Test public void targetCanBeReplacedOrRemovedFromCenterMenuAndBackClosesMeasurement() throws Exception {
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()){
      MainActivity activity=c.get();MapTools tools=field(activity,"mapTools");tools.target(new Vertex(1,2));
      View root=activity.getWindow().getDecorView();desc(root,"Действия в центре карты").performClick();AlertDialog dialog=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
      assertNotNull(desc(dialog.getWindow().getDecorView(),"Перейти к цели"));desc(dialog.getWindow().getDecorView(),"Заменить цель центром карты").performClick();assertTrue(tools.hasTarget());
      desc(root,"Действия в центре карты").performClick();dialog=org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();desc(dialog.getWindow().getDecorView(),"Убрать цель").performClick();assertFalse(tools.hasTarget());
      tools.start(new Vertex(0,0));tools.add();activity.onBackPressed();assertFalse(tools.measuring);assertNull(root.findViewWithTag("measureControls"));assertFalse(activity.isFinishing());
    }
  }

  @Test public void mapViewSurvivesColdRestartWithZoomAndRotation() throws Exception {
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()){
      MapWorkspace map=field(c.get(),"map");map.view.getController().setZoom(12.0);map.view.getController().setCenter(new GeoPoint(54.2,37.6));map.view.setMapOrientation(37);c.pause();
    }
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()){
      MapWorkspace map=field(c.get(),"map");assertEquals(54.2,map.view.getMapCenter().getLatitude(),.001);assertEquals(37.6,map.view.getMapCenter().getLongitude(),.001);assertEquals(12,map.view.getZoomLevelDouble(),.001);assertEquals(37,map.view.getMapOrientation(),.001);
    }
  }

  @SuppressWarnings("unchecked") private <T>T field(Object object,String name)throws Exception{java.lang.reflect.Field f=object.getClass().getDeclaredField(name);f.setAccessible(true);return(T)f.get(object);}
  private View desc(View v,String name){if(name.equals(v.getContentDescription()))return v;if(v instanceof ViewGroup)for(int n=0;n<((ViewGroup)v).getChildCount();n++){View found=desc(((ViewGroup)v).getChildAt(n),name);if(found!=null)return found;}return null;}
}
