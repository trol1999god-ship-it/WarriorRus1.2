package ru.warriorrus.app.map;

import android.graphics.ColorMatrix;

/** Raster-only adjustments; overlays containing user objects retain their original colors. */
public final class MapAppearance {
  private MapAppearance(){}
  public static ColorMatrix matrix(float contrast,float brightness,float saturation,float hue,boolean inverted,boolean night,float opacity){
    ColorMatrix result=new ColorMatrix();result.setSaturation(Math.max(0,Math.min(3,saturation)));
    double angle=Math.toRadians(hue);float c=(float)Math.cos(angle),s=(float)Math.sin(angle);
    ColorMatrix rotation=new ColorMatrix(new float[]{.213f+.787f*c-.213f*s,.715f-.715f*c-.715f*s,.072f-.072f*c+.928f*s,0,0,.213f-.213f*c+.143f*s,.715f+.285f*c+.140f*s,.072f-.072f*c-.283f*s,0,0,.213f-.213f*c-.787f*s,.715f-.715f*c+.715f*s,.072f+.928f*c+.072f*s,0,0,0,0,0,1,0});result.postConcat(rotation);
    float k=Math.max(0,Math.min(3,contrast)),offset=128*(1-k)+Math.max(-1,Math.min(1,brightness))*255;
    result.postConcat(new ColorMatrix(new float[]{k,0,0,0,offset,0,k,0,0,offset,0,0,k,0,offset,0,0,0,1,0}));
    if(inverted)result.postConcat(new ColorMatrix(new float[]{-1,0,0,0,255,0,-1,0,0,255,0,0,-1,0,255,0,0,0,1,0}));
    if(night)result.postConcat(new ColorMatrix(new float[]{.22f,0,0,0,0,0,.28f,0,0,0,0,0,.4f,0,0,0,0,0,1,0}));
    ColorMatrix alpha=new ColorMatrix();alpha.setScale(1,1,1,Math.max(0,Math.min(1,opacity)));result.postConcat(alpha);return result;
  }
}
