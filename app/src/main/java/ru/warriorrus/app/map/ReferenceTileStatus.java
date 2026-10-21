package ru.warriorrus.app.map;

import android.content.Context;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import org.osmdroid.tileprovider.MapTileProviderBase;
import ru.warriorrus.app.ReferenceAssets;
import ru.warriorrus.app.ReferenceMenu;

/** A tile placeholder using the reference application's original state artwork. */
final class ReferenceTileStatus extends Drawable {
  private final Drawable connecting,offline;
  private final MapTileProviderBase provider;
  private final Paint text=new Paint(Paint.ANTI_ALIAS_FLAG);
  private final int size,gap;
  ReferenceTileStatus(Context context,MapTileProviderBase provider){
    this.provider=provider;float density=context.getResources().getDisplayMetrics().density;
    size=Math.round(16*density);gap=Math.round(4*density);
    connecting=ReferenceAssets.drawable(context,"atk_toolkit_canvas_tile_online_downloading_16",16,false);
    offline=ReferenceAssets.drawable(context,"atk_toolkit_canvas_tile_online_offline_16",16,false);
    text.setColor(ReferenceMenu.MUTED);text.setTextSize(10*context.getResources().getDisplayMetrics().scaledDensity);text.setTextAlign(Paint.Align.CENTER);
  }
  @Override public void draw(Canvas canvas){
    Rect bounds=getBounds();if(bounds.width()<size*2||bounds.height()<size*2)return;
    Drawable icon=provider.useDataConnection()?connecting:offline;
    if(icon!=null){int cx=bounds.centerX(),cy=bounds.centerY()-gap;icon.setBounds(cx-size/2,cy-size/2,cx+size/2,cy+size/2);icon.draw(canvas);canvas.drawText(provider.useDataConnection()?"Соединение…":"Не загружено",cx,cy+size/2+text.getTextSize()+gap,text);}
  }
  @Override public void setAlpha(int alpha){text.setAlpha(alpha);}
  @Override public void setColorFilter(ColorFilter filter){}
  @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
}
