package ru.warriorrus.app.map;

import static org.junit.Assert.*;
import android.graphics.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=35) @GraphicsMode(GraphicsMode.Mode.NATIVE)
public class MapAppearanceTest {
  @Test public void colorRemovalHonorsToleranceAndPreservesSourcePixels(){
    int[] original={0xffffffff,0xfffafafa,0xff204080,0x80ffffff};Bitmap source=Bitmap.createBitmap(original,4,1,Bitmap.Config.ARGB_8888);Bitmap exact=RasterTilesOverlay.erase(source,Color.WHITE,0);assertEquals(0,Color.alpha(exact.getPixel(0,0)));assertEquals(255,Color.alpha(exact.getPixel(1,0)));assertEquals(0xff204080,exact.getPixel(2,0));assertEquals(0,Color.alpha(exact.getPixel(3,0)));Bitmap tolerant=RasterTilesOverlay.erase(source,Color.WHITE,5);assertEquals(0,Color.alpha(tolerant.getPixel(1,0)));assertEquals(0xff204080,tolerant.getPixel(2,0));for(int n=0;n<4;n++)assertEquals(original[n],source.getPixel(n,0));
  }
  @Test public void inversionOpacityAndNightApplyOnlyToPaintedRaster(){
    Bitmap source=Bitmap.createBitmap(new int[]{0xff2050a0},1,1,Bitmap.Config.ARGB_8888);Bitmap destination=Bitmap.createBitmap(1,1,Bitmap.Config.ARGB_8888);Paint paint=new Paint();paint.setColorFilter(new ColorMatrixColorFilter(MapAppearance.matrix(1,0,1,0,true,false,.5f)));new Canvas(destination).drawBitmap(source,0,0,paint);int pixel=destination.getPixel(0,0);assertEquals(128,Color.alpha(pixel),1);assertEquals(223,Color.red(pixel),2);assertEquals(175,Color.green(pixel),2);assertEquals(95,Color.blue(pixel),2);assertEquals(0xff2050a0,source.getPixel(0,0));
    paint.setColorFilter(new ColorMatrixColorFilter(MapAppearance.matrix(1,0,1,0,false,true,1)));destination.eraseColor(Color.TRANSPARENT);new Canvas(destination).drawBitmap(source,0,0,paint);pixel=destination.getPixel(0,0);assertEquals(7,Color.red(pixel),1);assertEquals(22,Color.green(pixel),1);assertEquals(64,Color.blue(pixel),1);
  }
}
