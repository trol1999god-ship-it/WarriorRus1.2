package ru.warriorrus.app;

import static org.junit.Assert.*;
import android.os.Bundle;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import org.robolectric.android.controller.ActivityController;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.geometry.*;
import ru.warriorrus.app.map.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk={23,35})
public class ProfileEditorTest {
  @Before public void reset(){android.content.Context c=RuntimeEnvironment.getApplication();c.deleteDatabase("warrior2.db");c.getSharedPreferences("MainActivity",0).edit().clear().putBoolean("mapOnline",false).commit();}
  private MapItem track(){MapItem item=new MapItem();item.kind="track";item.name="Sample";item.visible=true;item.opacity=1;item.segments.add(new ArrayList<>(Arrays.asList(new Vertex(48,11,100.0,"2026-10-21T00:00:00Z"),new Vertex(48.001,11.001,130.0,"2026-10-21T00:01:00Z"),new Vertex(48.002,11.002,110.0,"2026-10-21T00:02:00Z"))));return item;}
  @SuppressWarnings("unchecked") private <T>T field(Object object,String name)throws Exception{java.lang.reflect.Field f=object.getClass().getDeclaredField(name);f.setAccessible(true);return (T)f.get(object);}
  @Test public void cursorAndAxesSurviveRecreationAndSelectRealVertexWithoutChangingGeometry()throws Exception{
    MapItem original=track();String before=Geometry.encode(original.segments);Bundle state=new Bundle();
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()){
      DrawingController drawing=field(c.get(),"drawing");MapWorkspace workspace=field(c.get(),"map");workspace.view.getController().setZoom(17.0);drawing.start(original,"track",0,null);
      ProfilePanel profile=c.get().getWindow().getDecorView().findViewWithTag("profilePanel");profile.axes(1,1);profile.chart.select(1,true);
      MapWorkspace map=field(c.get(),"map");assertEquals(48.001,map.view.getMapCenter().getLatitude(),1e-4);assertEquals(11.001,map.view.getMapCenter().getLongitude(),1e-4);
      c.saveInstanceState(state);assertEquals(before,state.getString("draftGeometry"));assertEquals(before,Geometry.encode(original.segments));assertEquals(1,state.getInt("draftProfileValue"));assertEquals(1,state.getInt("draftProfileAxis"));assertEquals(1,state.getInt("draftProfileCursor"));
    }
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup(state).visible()){
      ProfilePanel profile=c.get().getWindow().getDecorView().findViewWithTag("profilePanel");assertEquals(1,profile.chart.selection());Bundle restored=new Bundle();DrawingController drawing=field(c.get(),"drawing");drawing.saveState(restored);
      assertEquals(before,restored.getString("draftGeometry"));assertEquals(1,restored.getInt("draftProfileValue"));assertEquals(1,restored.getInt("draftProfileAxis"));assertEquals(1,restored.getInt("draftProfileCursor"));
    }
  }
  @Test public void savedObjectProfileReopensWithAxesAndCursorAfterRotation()throws Exception{
    MapItem item=track();long id;try(ObjectStore store=new ObjectStore(RuntimeEnvironment.getApplication())){id=store.save(item);}item.id=id;Bundle state=new Bundle();
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()){
      java.lang.reflect.Method open=MainActivity.class.getDeclaredMethod("profile",MapItem.class);open.setAccessible(true);open.invoke(c.get(),item);
      android.app.Dialog dialog=field(c.get(),"profileDialog");ProfilePanel profile=dialog.getWindow().getDecorView().findViewWithTag("profilePanel");profile.axes(2,0);profile.chart.select(2,true);c.saveInstanceState(state);assertEquals(id,state.getLong("profileObjectId"));
    }
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup(state).visible()){
      org.robolectric.shadows.ShadowLooper.idleMainLooper();android.app.Dialog dialog=field(c.get(),"profileDialog");assertNotNull(dialog);ProfilePanel profile=dialog.getWindow().getDecorView().findViewWithTag("profilePanel");assertEquals(2,profile.chart.selection());Bundle restored=new Bundle();profile.save(restored,"saved");assertEquals(2,restored.getInt("savedValue"));assertEquals(0,restored.getInt("savedAxis"));
      try(ObjectStore store=new ObjectStore(c.get())){assertEquals(Geometry.encode(item.segments),Geometry.encode(store.get(id).segments));}
    }
  }
  @Test public void inspectingProfilePausesDrawingBeforeMapCanAddVertices()throws Exception{
    try(ActivityController<MainActivity> c=Robolectric.buildActivity(MainActivity.class).setup().visible()){
      MapItem item=track();item.kind="path";DrawingController drawing=field(c.get(),"drawing");drawing.start(item,"path",0,null);drawing.toggleDrawing();assertTrue(drawing.isDrawing());
      Bundle before=new Bundle();drawing.saveState(before);ProfilePanel profile=c.get().getWindow().getDecorView().findViewWithTag("profilePanel");profile.chart.select(1,true);assertFalse(drawing.isDrawing());drawing.onMapMoved();
      Bundle after=new Bundle();drawing.saveState(after);assertEquals(before.getString("draftGeometry"),after.getString("draftGeometry"));
    }
  }
}
