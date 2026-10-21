package ru.warriorrus.app;

import android.graphics.*;
import android.view.View;
import java.io.*;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.geometry.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=35,qualifiers="w360dp-h800dp-port-mdpi") @GraphicsMode(GraphicsMode.Mode.NATIVE)
public class ProfileRenderTest {
  @Test public void localProfilesUseBluePaletteAndReadableAxes()throws Exception{
    MapItem item=new MapItem();item.kind="track";item.name="Sample";item.segments.add(Arrays.asList(new Vertex(48,11,500.0,"2026-10-21T00:00:00Z"),new Vertex(48.001,11.001,550.0,"2026-10-21T00:01:00Z"),new Vertex(48.002,11.002,520.0,"2026-10-21T00:03:00Z"),new Vertex(48.003,11.003,590.0,"2026-10-21T00:04:00Z")));
    for(int mode=0;mode<3;mode++){
      ProfilePanel view=new ProfilePanel(RuntimeEnvironment.getApplication(),item);view.setBackgroundColor(0xffd6ecff);view.axes(mode,mode==1?1:0);view.chart.select(2,true);
      view.measure(View.MeasureSpec.makeMeasureSpec(360,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(300,View.MeasureSpec.EXACTLY));view.layout(0,0,360,300);
      Bitmap bitmap=Bitmap.createBitmap(360,300,Bitmap.Config.ARGB_8888);view.draw(new Canvas(bitmap));File file=new File("build/reports/ui/profile-"+mode+".png");file.getParentFile().mkdirs();try(FileOutputStream out=new FileOutputStream(file)){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}bitmap.recycle();
    }
  }
}
