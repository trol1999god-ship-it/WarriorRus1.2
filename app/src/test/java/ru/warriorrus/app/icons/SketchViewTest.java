package ru.warriorrus.app.icons;

import static org.junit.Assert.*;
import android.view.MotionEvent;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk={23,35})
public class SketchViewTest {
  @Test public void touchStrokesExportVectorsAndUndoClearsThem()throws Exception {
    SketchView view=new SketchView(RuntimeEnvironment.getApplication());view.layout(0,0,256,256);
    touch(view,MotionEvent.ACTION_DOWN,40,30);touch(view,MotionEvent.ACTION_MOVE,200,200);touch(view,MotionEvent.ACTION_UP,220,40);
    String svg=view.svg();assertTrue(svg.contains("stroke='currentColor'"));assertTrue(svg.contains(" L"));
    assertNotNull(com.caverock.androidsvg.SVG.getFromString(svg));view.undo();
    try{view.svg();fail("Empty sketch must not be saved");}catch(IllegalArgumentException expected){}
    touch(view,MotionEvent.ACTION_DOWN,20,20);touch(view,MotionEvent.ACTION_UP,20,20);assertTrue(view.svg().contains("<circle"));view.clear();
    try{view.svg();fail();}catch(IllegalArgumentException expected){}
  }
  private void touch(SketchView view,int action,float x,float y){MotionEvent event=MotionEvent.obtain(1,2,action,x,y,0);view.onTouchEvent(event);event.recycle();}
}
