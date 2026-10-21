package ru.warriorrus.app.map;

import android.content.Context;
import android.graphics.*;
import android.graphics.drawable.*;
import android.util.LruCache;
import org.osmdroid.tileprovider.MapTileProviderBase;
import org.osmdroid.views.overlay.TilesOverlay;

/** Tile-local color keying and blending, before the independently drawn placemarks. */
public final class RasterTilesOverlay extends TilesOverlay {
  private final ReferenceTileStatus status;
  private final MapCatalog.Layer layer;private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG|Paint.FILTER_BITMAP_FLAG);
  private static final String[] MODES={"Обычный","Умножение","Экран","Наложение","Темнее","Светлее","Сложение"};
  private static final PorterDuff.Mode[] BLENDS={PorterDuff.Mode.SRC_OVER,PorterDuff.Mode.MULTIPLY,PorterDuff.Mode.SCREEN,PorterDuff.Mode.OVERLAY,PorterDuff.Mode.DARKEN,PorterDuff.Mode.LIGHTEN,PorterDuff.Mode.ADD};
  private static final class Key {final Drawable drawable;final int color,tolerance;Key(Drawable d,int c,int t){drawable=d;color=c;tolerance=t;}@Override public int hashCode(){return System.identityHashCode(drawable)*31+color*7+tolerance;}@Override public boolean equals(Object o){if(!(o instanceof Key))return false;Key k=(Key)o;return drawable==k.drawable&&color==k.color&&tolerance==k.tolerance;}}
  private static final LruCache<Key,Bitmap> MASKS=new LruCache<Key,Bitmap>(8*1024*1024){@Override protected int sizeOf(Key key,Bitmap bitmap){return bitmap.getByteCount();}};
  public RasterTilesOverlay(MapTileProviderBase provider,Context context,MapCatalog.Layer layer){super(provider,context);this.layer=layer;status=new ReferenceTileStatus(context,provider);}
  public void indicators(boolean enabled){setLoadingDrawable(enabled?status:null);}
  public static String[] modes(){return MODES.clone();}
  public void appearance(ColorFilter filter){setColorFilter(filter);paint.setColorFilter(filter);paint.setXfermode(new PorterDuffXfermode(BLENDS[Math.max(0,Math.min(BLENDS.length-1,layer.blend))]));}
  @Override protected void onTileReadyToDraw(Canvas canvas,Drawable drawable,Rect bounds){if(!(drawable instanceof BitmapDrawable)){super.onTileReadyToDraw(canvas,drawable,bounds);return;}Bitmap bitmap=((BitmapDrawable)drawable).getBitmap();if(bitmap==null||bitmap.isRecycled())return;if(layer.erase){Key key=new Key(drawable,layer.eraseColor,layer.eraseTolerance);Bitmap masked=MASKS.get(key);if(masked==null){masked=erase(bitmap,layer.eraseColor,layer.eraseTolerance);MASKS.put(key,masked);}bitmap=masked;}canvas.drawBitmap(bitmap,null,bounds,paint);}
  public static Bitmap erase(Bitmap source,int color,int tolerance){int width=source.getWidth(),height=source.getHeight();int[] pixels=new int[width*height];source.getPixels(pixels,0,width,0,0,width,height);int red=Color.red(color),green=Color.green(color),blue=Color.blue(color),threshold=Math.max(0,Math.min(255,tolerance));for(int n=0;n<pixels.length;n++){int p=pixels[n];if(Math.abs(Color.red(p)-red)<=threshold&&Math.abs(Color.green(p)-green)<=threshold&&Math.abs(Color.blue(p)-blue)<=threshold)pixels[n]=p&0x00ffffff;}return Bitmap.createBitmap(pixels,width,height,Bitmap.Config.ARGB_8888);}
}
