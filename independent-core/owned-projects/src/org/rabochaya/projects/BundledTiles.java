package org.rabochaya.projects;
import android.content.res.AssetManager;import android.graphics.*;import java.io.*;import java.util.Locale;
/** Low-resolution world overview, read exclusively from packaged assets. XYZ rows. */
public final class BundledTiles {
 private final AssetManager assets;
 public BundledTiles(AssetManager assets){this.assets=assets;}
 public int zoomFor(int requested){return Math.max(1,Math.min(3,requested));}
 public Bitmap tile(int z,int x,int y)throws IOException{
  if(z<1||z>3||x<0||y<0||x>=(1<<z)||y>=(1<<z))return null;
  try(InputStream in=assets.open(String.format(Locale.US,"default_map/%02d/%d_%d.jpg",z,x,y))){Bitmap tile=BitmapFactory.decodeStream(in);if(tile==null)throw new IOException("Не удалось прочитать обзорную карту");return tile;}
 }
}
