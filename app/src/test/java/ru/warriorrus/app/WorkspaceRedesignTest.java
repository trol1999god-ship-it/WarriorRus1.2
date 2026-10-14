package ru.warriorrus.app;

import static org.junit.Assert.*;
import android.app.AlertDialog;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.data.ObjectStore;

@RunWith(RobolectricTestRunner.class)
@Config(sdk={23,35})
public class WorkspaceRedesignTest {
  private View find(View v,String title) {
    if(v instanceof TextView && title.equals(((TextView)v).getText().toString())) return v;
    if(v instanceof ViewGroup) {
      ViewGroup group=(ViewGroup)v;
      for(int i=0;i<group.getChildCount();i++) {
        View found=find(group.getChildAt(i),title);
        if(found!=null)return found;
      }
    }
    return null;
  }
  @Test public void creatingTwoPointsRefreshesTwoMapMarkersAndPersistsAcrossReopen() {
    RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");
    try (ObjectStore store = new ObjectStore(RuntimeEnvironment.getApplication())) {
      try (org.robolectric.android.controller.ActivityController<MainActivity> controller =
          Robolectric.buildActivity(MainActivity.class).setup()) {
        store.create(0, "Точка один", "point", 50.1, 30.1);
        store.create(0, "Точка два", "point", 50.2, 30.2);
        ru.warriorrus.app.map.MapWorkspace workspace =
            new ru.warriorrus.app.map.MapWorkspace(controller.get(), p -> {});
        workspace.refresh(store);
        int markers = 0;
        for (org.osmdroid.views.overlay.Overlay overlay : workspace.view.getOverlays())
          if (overlay instanceof org.osmdroid.views.overlay.Marker) markers++;
        assertEquals(2, markers);
      }
    }
    try (ObjectStore reopened = new ObjectStore(RuntimeEnvironment.getApplication())) {
      assertEquals(2, reopened.all().size());
    }
  }

  @Test public void newMapToolsAreReachableAndDoNotAlterObjects() {
    RuntimeEnvironment.getApplication().deleteDatabase("warrior2.db");
    try(ObjectStore store=new ObjectStore(RuntimeEnvironment.getApplication())) {
      store.create(0,"Первая","point",1,2);
      store.create(0,"Вторая","point",3,4);
      try(org.robolectric.android.controller.ActivityController<MainActivity> controller=
          Robolectric.buildActivity(MainActivity.class).setup()) {
        View root=controller.get().getWindow().getDecorView();
        assertNotNull(find(root,"◇ Маршруты"));
        assertNotNull(find(root,"▱ Области"));
        find(root,"◇ Маршруты").performClick();
        AlertDialog dialog=ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull(dialog);
        assertTrue(((TextView) dialog.findViewById(android.R.id.message)).getText().toString().contains("Редактор геометрии"));
        dialog.dismiss();
        assertEquals(2,store.all().size());
      }
    }
  }
}
