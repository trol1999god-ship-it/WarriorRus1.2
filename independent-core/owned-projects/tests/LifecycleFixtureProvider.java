package org.rabochaya.maptests;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

/** Synthetic, fixed files for returning SAF results on disposable emulators. */
public final class LifecycleFixtureProvider extends ContentProvider {
 static final Uri SVG = uri("lifecycle.svg");
 static final Uri PHOTO = uri("lifecycle-photo.png");
 static final Uri KMZ = uri("lifecycle-export.kmz");

 private static Uri uri(String name) {
  return Uri.parse("content://org.rabochaya.maptests.lifecycle/" + name);
 }

 @Override public boolean onCreate() {return true;}

 @Override public String getType(Uri uri) {
  if(SVG.equals(uri))return "image/svg+xml";
  if(PHOTO.equals(uri))return "image/png";
  if(KMZ.equals(uri))return "application/vnd.google-earth.kmz";
  throw new IllegalArgumentException("Unknown synthetic fixture");
 }

 @Override public synchronized ParcelFileDescriptor openFile(Uri uri,String mode)throws FileNotFoundException {
  File file=new File(getContext().getCacheDir(),name(uri));
  try {
   if(KMZ.equals(uri)){
    return ParcelFileDescriptor.open(file,ParcelFileDescriptor.parseMode(mode));
   }
   if(!"r".equals(mode))throw new FileNotFoundException("Fixture is read-only");
   if(!file.exists())try(FileOutputStream out=new FileOutputStream(file)){
    if(SVG.equals(uri)){
     out.write(("<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24'>"
       +"<circle cx='12' cy='12' r='10' fill='#2166a9'/></svg>").getBytes(StandardCharsets.UTF_8));
    }else{
     Bitmap bitmap=Bitmap.createBitmap(24,24,Bitmap.Config.ARGB_8888);
     try{
      bitmap.eraseColor(Color.BLUE);
      if(!bitmap.compress(Bitmap.CompressFormat.PNG,100,out))throw new IOException("Fixture encoding failed");
     }finally{bitmap.recycle();}
    }
   }
   return ParcelFileDescriptor.open(file,ParcelFileDescriptor.MODE_READ_ONLY);
  }catch(IOException e){throw new FileNotFoundException(e.getMessage());}
 }

 private String name(Uri uri) {
  getType(uri);
  return uri.getLastPathSegment();
 }

 @Override public Cursor query(Uri uri,String[] projection,String selection,String[] args,String order) {
  String name=name(uri);
  String[] fields=projection==null?new String[]{OpenableColumns.DISPLAY_NAME,OpenableColumns.SIZE}:projection;
  Object[] values=new Object[fields.length];
  for(int i=0;i<fields.length;i++){
   if(OpenableColumns.DISPLAY_NAME.equals(fields[i]))values[i]=name;
   else if(OpenableColumns.SIZE.equals(fields[i]))values[i]=new File(getContext().getCacheDir(),name).length();
  }
  MatrixCursor cursor=new MatrixCursor(fields);
  cursor.addRow(values);
  return cursor;
 }

 @Override public Uri insert(Uri uri,ContentValues values){throw new UnsupportedOperationException();}
 @Override public int update(Uri uri,ContentValues values,String where,String[] args){throw new UnsupportedOperationException();}
 @Override public int delete(Uri uri,String where,String[] args){throw new UnsupportedOperationException();}
}
