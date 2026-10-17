package ru.warriorrus.app.map;

import static org.junit.Assert.*;
import android.view.*;
import android.widget.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.osmdroid.util.GeoPoint;
import ru.warriorrus.app.MainActivity;
import ru.warriorrus.app.data.Vertex;
import ru.warriorrus.app.geometry.Geometry;

@RunWith(RobolectricTestRunner.class)
@Config(sdk={23,35})
public class MapToolsTest {
  @Before public void setup(){RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");RuntimeEnvironment.getApplication().getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).commit();}
  @Test public void distancesBearingsAndProjectionCrossDateLineWithoutLocation(){
    Vertex from=new Vertex(0,179.5),to=new Vertex(0,-179.5);
    assertEquals(90,Geometry.bearing(from,to),1e-8);assertEquals(270,Geometry.bearing(to,from),1e-8);
    assertEquals(111195.08,Geometry.distance(from,to),0.1);Vertex projected=Geometry.project(from,90,Geometry.distance(from,to));
    assertEquals(to.latitude,projected.latitude,1e-8);assertEquals(to.longitude,projected.longitude,1e-8);
    try{Geometry.project(from,Double.NaN,1);fail();}catch(IllegalArgumentException expected){}
  }
  @Test public void measurementDraftAndTargetSurviveActivityRecreation()throws Exception {
    try(ActivityController<MainActivity> controller=Robolectric.buildActivity(MainActivity.class).setup().visible()){
      MainActivity activity=controller.get();java.lang.reflect.Field field=MainActivity.class.getDeclaredField("mapTools");field.setAccessible(true);MapTools tools=(MapTools)field.get(activity);
      tools.target(new Vertex(1,1));tools.start(new Vertex(0,0));tools.add();tools.removeLast();assertTrue(tools.hasTarget());
      // Live map-center movement is checked on Android, not Robolectric's scroll stub.

    }
    try(ActivityController<MainActivity> controller=Robolectric.buildActivity(MainActivity.class).setup().visible()){
      java.lang.reflect.Field field=MainActivity.class.getDeclaredField("mapTools");field.setAccessible(true);MapTools tools=(MapTools)field.get(controller.get());assertTrue(tools.hasTarget());assertTrue(tools.measuring);
      assertNotNull(controller.get().getWindow().getDecorView().findViewWithTag("measureControls"));tools.finish();assertFalse(tools.measuring);tools.target(null);assertFalse(tools.hasTarget());
    }
  }
  private org.osmdroid.views.MapView find(View v){if(v instanceof org.osmdroid.views.MapView)return(org.osmdroid.views.MapView)v;if(v instanceof ViewGroup)for(int n=0;n<((ViewGroup)v).getChildCount();n++){org.osmdroid.views.MapView result=find(((ViewGroup)v).getChildAt(n));if(result!=null)return result;}return null;}
}
