package ru.warriorrus.app.media;

import android.content.Context;
import java.io.*;
import java.util.*;
import ru.warriorrus.app.data.*;

/** Immutable app-private files. Never reads location metadata, uploads, or follows URLs. */
public final class LocalMedia {
  public static final long MAX_FILE=256L*1024*1024;
  public final File root;
  public LocalMedia(Context context)throws IOException {root=new File(context.getFilesDir(),"media").getCanonicalFile();if(!root.isDirectory()&&!root.mkdirs())throw new IOException("Хранилище вложений недоступно");}
  public File resolve(String key)throws IOException {
    if(key==null||!key.matches("[A-Za-z0-9_-]+\\.[A-Za-z0-9]+"))throw new IOException("Неверный путь вложения");
    File f=new File(root,key).getCanonicalFile();if(!root.equals(f.getParentFile()))throw new IOException("Неверный путь вложения");return f;
  }
  public Attachment add(InputStream input,String name,String mime)throws IOException {
    if(mime==null||!(mime.startsWith("image/")||mime.startsWith("audio/")||mime.startsWith("video/")))throw new IOException("Выберите фото, видео или аудио");
    String ext=android.webkit.MimeTypeMap.getSingleton().getExtensionFromMimeType(mime);
    if(ext==null||!ext.matches("[A-Za-z0-9]{1,8}"))ext="bin";
    String key=UUID.randomUUID().toString()+"."+ext;File file=resolve(key);long size=0;boolean complete=false;
    try(FileOutputStream out=new FileOutputStream(file)) {
      byte[] buffer=new byte[65536];int n;while((n=input.read(buffer))!=-1){size+=n;if(size>MAX_FILE)throw new IOException("Вложение больше 256 МиБ");out.write(buffer,0,n);}out.getFD().sync();complete=true;
    }finally{if(!complete)file.delete();}
    return new Attachment(key,name==null?key:name,mime,size);
  }
  public void removeIfUnused(String key,Set<String> referenced)throws IOException {if(!referenced.contains(key))resolve(key).delete();}
  public void cleanup(Set<String> referenced){File[] files=root.listFiles();if(files!=null)for(File file:files)if(!referenced.contains(file.getName()))file.delete();}
}
