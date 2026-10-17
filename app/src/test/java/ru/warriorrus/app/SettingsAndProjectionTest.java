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
import ru.warriorrus.app.settings.*;
import ru.warriorrus.app.data.Vertex;
import ru.warriorrus.app.geometry.Geometry;

@RunWith(RobolectricTestRunner.class)
@Config(sdk={23,35})
public class SettingsAndProjectionTest {
  @Before public void clean(){RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");RuntimeEnvironment.getApplication().getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).commit();}
  @Test public void sk42MatchesIndependentProjReferenceAndRoundTrips(){
    // PROJ/pyproj 3.7, explicit seven-parameter EPSG-catalog definition from Proj4J 1.4.0.
    double[][] rows={{55.75,37.62,7413462.157872518,6181692.6888735015},{60,39,7500118.00439343,6654174.688572059},{45,41.5,7697228.926096968,4988086.598760495}};
    for(double[] row:rows){double[] p=ProjectionMath.project("EPSG:28407",row[0],row[1]);assertEquals(row[2],p[0],.05);assertEquals(row[3],p[1],.05);Vertex back=ProjectionMath.inverse("EPSG:28407",p[0],p[1]);assertTrue(Geometry.distance(new Vertex(row[0],row[1]),back)<.1);}
    Vertex parsed=Coordinates.parse("СК42 X=6181692.69 Y=7413462.16");assertTrue(Geometry.distance(new Vertex(55.75,37.62),parsed)<.1);
    parsed=Coordinates.parse("EPSG:28407 7413462.16 6181692.69");assertTrue(Geometry.distance(new Vertex(55.75,37.62),parsed)<.1);
    assertTrue(Coordinates.format(5,55.75,37.62).contains("Y = 7413462.2"));assertEquals(7,ProjectionMath.sk42Zone(55.75,37.62));assertEquals(8,ProjectionMath.sk42Zone(55.75,42));
    double[] web=ProjectionMath.project("EPSG:3857",0,1);assertEquals(111319.490793,web[0],.001);assertEquals(0,web[1],.001);
    try{ProjectionMath.name("EPSG:9999999");fail();}catch(RuntimeException expected){}
  }
  @Test public void unitsUseExactInternationalConversions(){DisplayUnits u=new DisplayUnits();u.distanceMode=2;assertEquals("1.00 mi",u.distance(1609.344));assertEquals("100.00 ft",u.height(30.48));u.distanceMode=8;assertEquals("1.00 nmi",u.distance(1852));assertEquals("1.00 kn",u.speed(1852.0/3600));u.areaMode=2;assertEquals("1.00 га",u.area(10000));u.angleMode=6;assertEquals("1600.00 mil",u.bearing(90));assertEquals(90,u.degrees(1600),1e-9);u.angleMode=1;assertEquals("-90.00 °",u.bearing(270));u.slopeMode=0;assertEquals("100.00 %",u.slope(45));u.pressureMode=1;assertEquals("760.00 mmHg",u.pressure(1013.250014));}
  @Test public void settingsPersistPrimarySecondaryAndUnitsWithoutChangingObjects()throws Exception {
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup()){
      java.lang.reflect.Method method=MainActivity.class.getDeclaredMethod("settingsMenu");method.setAccessible(true);method.invoke(c.get());Dialog dialog=org.robolectric.shadows.ShadowDialog.getLatestDialog();View root=dialog.getWindow().getDecorView();
      ((Spinner)root.findViewWithTag("primaryCoordinates")).setSelection(5);((Spinner)root.findViewWithTag("secondaryCoordinates")).setSelection(5);((Spinner)root.findViewWithTag("Формат расстояния")).setSelection(2);((Spinner)root.findViewWithTag("Азимут")).setSelection(6);text(root,"Применить").performClick();
      assertEquals(5,c.get().getPreferences(0).getInt("primaryCoordinates",0));assertEquals(4,c.get().getPreferences(0).getInt("secondaryCoordinates",0));assertEquals(2,DisplayUnits.load(c.get()).distanceMode);
    }
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup()){
      assertEquals(6,DisplayUnits.load(c.get()).angleMode);try(ru.warriorrus.app.data.ObjectStore store=new ru.warriorrus.app.data.ObjectStore(c.get())){assertTrue(store.all().isEmpty());}
    }
  }
  private View text(View v,String value){if(v instanceof TextView&&value.contentEquals(((TextView)v).getText()))return v;if(v instanceof ViewGroup)for(int n=0;n<((ViewGroup)v).getChildCount();n++){View found=text(((ViewGroup)v).getChildAt(n),value);if(found!=null)return found;}return null;}
}
