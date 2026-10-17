package ru.warriorrus.app.exchange;

import android.content.*;
import android.database.*;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import java.io.*;

/** Read-only, URI-granted access to one explicit export or attachment. No directory access. */
public final class LocalFilesProvider extends ContentProvider {
  @Override public boolean onCreate(){return true;}
  private File resolve(Uri uri) throws FileNotFoundException {
    try {
      String name=uri.getLastPathSegment();if(name==null||name.contains("/")||name.contains("\\")||name.equals(".")||name.equals(".."))throw new IOException();
      File root=new File(getContext().getFilesDir(),"shared").getCanonicalFile();File file=new File(root,name).getCanonicalFile();
      if(!file.getParentFile().equals(root)||!file.isFile())throw new IOException();return file;
    }catch(IOException e){throw new FileNotFoundException("Файл недоступен");}
  }
  @Override public ParcelFileDescriptor openFile(Uri uri,String mode)throws FileNotFoundException {
    if(!"r".equals(mode))throw new FileNotFoundException("Только чтение");return ParcelFileDescriptor.open(resolve(uri),ParcelFileDescriptor.MODE_READ_ONLY);
  }
  @Override public Cursor query(Uri uri,String[] projection,String selection,String[] args,String sort) {
    try {File f=resolve(uri);String[] columns=projection==null?new String[]{OpenableColumns.DISPLAY_NAME,OpenableColumns.SIZE}:projection;
      MatrixCursor c=new MatrixCursor(columns);Object[] row=new Object[columns.length];for(int n=0;n<columns.length;n++)row[n]=OpenableColumns.DISPLAY_NAME.equals(columns[n])?f.getName():OpenableColumns.SIZE.equals(columns[n])?f.length():null;c.addRow(row);return c;
    }catch(FileNotFoundException e){return null;}
  }
  @Override public String getType(Uri uri){return "application/vnd.google-earth.kmz";}
  @Override public Uri insert(Uri uri,ContentValues values){throw new UnsupportedOperationException();}
  @Override public int update(Uri uri,ContentValues values,String where,String[] args){throw new UnsupportedOperationException();}
  @Override public int delete(Uri uri,String where,String[] args){throw new UnsupportedOperationException();}
}
