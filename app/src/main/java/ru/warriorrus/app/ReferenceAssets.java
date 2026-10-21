package ru.warriorrus.app;

import android.content.Context;
import android.graphics.*;
import android.graphics.drawable.*;
import android.widget.TextView;
import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Lossless interface artwork from the supplied reference APK; no executable APK content. */
public final class ReferenceAssets {
  private static Map<String,byte[]> files;
  private static final Map<String,Bitmap> bitmaps=new HashMap<>();
  private ReferenceAssets(){}

  private static synchronized Map<String,byte[]> files(Context context)throws IOException{
    if(files!=null)return files;
    Map<String,byte[]> loaded=new LinkedHashMap<>();int total=0;
    try(ZipInputStream in=new ZipInputStream(context.getAssets().open("reference_ui.zip"))){
      ZipEntry entry;byte[] buffer=new byte[8192];
      while((entry=in.getNextEntry())!=null){
        if(entry.isDirectory())continue;
        ByteArrayOutputStream out=new ByteArrayOutputStream();int n;
        while((n=in.read(buffer))!=-1){out.write(buffer,0,n);total+=n;if(total>16*1024*1024)throw new IOException("Превышен размер каталога оформления");}
        loaded.put(entry.getName(),out.toByteArray());
      }
    }
    files=Collections.unmodifiableMap(loaded);return files;
  }

  public static Drawable drawable(Context context,String name,int size,boolean tint){
    try{
      float density=context.getResources().getDisplayMetrics().density;
      String bucket=density>=2.75f?"xxhdpi":density>=1.75f?"xhdpi":density>=1.25f?"hdpi":"mdpi";
      String path=bucket+"/"+name+".png";byte[] data=files(context).get(path);
      if(data==null){path="mdpi/"+name+".png";data=files(context).get(path);}
      if(data==null)return null;
      int pixels=Math.max(1,Math.round(size*density));String key=path+":"+pixels;Bitmap bitmap;
      synchronized(bitmaps){
        bitmap=bitmaps.get(key);
        if(bitmap==null){Bitmap decoded=BitmapFactory.decodeByteArray(data,0,data.length);if(decoded==null)return null;bitmap=Bitmap.createScaledBitmap(decoded,pixels,pixels,true);bitmap.setDensity(context.getResources().getDisplayMetrics().densityDpi);bitmaps.put(key,bitmap);}
      }
      BitmapDrawable result=new BitmapDrawable(context.getResources(),bitmap);
      if(tint)result.setColorFilter(ReferenceMenu.TEXT,PorterDuff.Mode.SRC_IN);
      result.setBounds(0,0,pixels,pixels);return result;
    }catch(IOException unavailable){return null;}
  }

  private static String name(int icon,int size){
    if(icon==R.drawable.ui_menu)return "app_mainmenu_icon_48";
    if(icon==R.drawable.ui_map)return size>=40?"maps_mainmenu_icon_48":"app_action_map_24";
    if(icon==R.drawable.ui_pin)return size>=40?"landmarks_mainmenu_icon_48":"app_action_landmark_24";
    if(icon==R.drawable.ui_compass)return size>=40?"orientation_mainmenu_icon_48":"app_action_compass_24";
    if(icon==R.drawable.ui_plus)return "canvas_zoom_plus_48";
    if(icon==R.drawable.ui_minus)return "canvas_zoom_minus_48";
    if(icon==R.drawable.ui_layers)return "app_action_maps_layers_24";
    if(icon==R.drawable.ui_settings)return "app_action_settings_24";
    if(icon==R.drawable.ui_folder)return "app_action_landmarks_browse_24";
    if(icon==R.drawable.ui_hide)return "app_action_hide_24";
    if(icon==R.drawable.ui_lock)return "app_action_lock_24";
    if(icon==R.drawable.ui_exit)return "app_action_exit_24";
    if(icon==R.drawable.ui_focus)return "app_action_landmarks_target_24";
    if(icon==R.drawable.ui_info)return "atk_dialog_icon_information_24";
    if(icon==R.drawable.ui_search)return "app_action_search_24";
    if(icon==R.drawable.ui_more)return "app_action_menu_24";
    if(icon==R.drawable.ui_check)return "app_action_accept_24";
    if(icon==R.drawable.ui_close)return "app_action_close_24";
    return null;
  }

  public static void apply(TextView view,int icon,int size){
    String name=name(icon,size);Drawable drawable=name==null?null:drawable(view.getContext(),name,size,icon!=R.drawable.ui_plus&&icon!=R.drawable.ui_minus);
    if(drawable==null)view.setCompoundDrawablesRelativeWithIntrinsicBounds(icon,0,0,0);
    else view.setCompoundDrawablesRelative(drawable,null,null,null);
  }

  public static void applyNamed(TextView view,String name,int size,boolean tint){
    Drawable drawable=drawable(view.getContext(),name,size,tint);
    if(drawable!=null)view.setCompoundDrawablesRelative(drawable,null,null,null);
  }

  public static void row(TextView view,String title,int icon){
    String name=null;
    if(title.equals("Все метки"))name="app_action_landmarks_browse_24";
    else if(title.equals("Новая метка"))name="app_action_landmarks_create_24";
    else if(title.equals("Доступные карты"))name="app_action_maps_browse_24";
    else if(title.equals("Сохранить участок карты"))name="app_action_maps_storearea_24";
    else if(title.equals("Поиск на карте"))name="app_action_search_24";
    if(name==null)apply(view,icon,24);else applyNamed(view,name,24,true);
  }

  public static void glyph(TextView view,String value){
    String name;
    switch(value){
      case "×":name="app_action_close_24";break;
      case "+":name="app_action_create_24";break;
      case "⋮":name="app_action_menu_24";break;
      case "▣":name="app_action_clipboard_24";break;
      case "✎":name="app_action_edit_24";break;
      case "⌃":name="app_action_expand_less_24";break;
      case "⌄":name="app_action_expand_more_24";break;
      case "i":name="app_action_details_view_24";break;
      case "?":name="app_action_help_online_24";break;
      case "!":name="app_action_landmarks_fastpoint_24";break;
      case "↗":name="app_action_jump_to_24";break;
      case "⊙":name="app_action_landmarks_target_24";break;
      default:return;
    }
    Drawable drawable=drawable(view.getContext(),name,24,true);
    if(drawable!=null){view.setText("");view.setCompoundDrawablesRelative(drawable,null,null,null);}
  }

  /** Seed editable local copies once; subsequent starts never overwrite user edits or deletions. */
  public static synchronized void installSymbols(Context context,File root)throws IOException{
    File marker=new File(root,".reference-symbols-238b");
    if(!marker.getCanonicalFile().equals(marker.getAbsoluteFile()))throw new IOException("Недопустимая ссылка каталога значков");
    if(marker.isFile())return;
    Map<String,String> groups=new HashMap<>();
    String[] codes={"acco","amen","food","health","man","nat","power","shop","sport","tour","transp","water","worship","geocaching","sym"};
    String[] titles={"Жильё","Быт","Питание","Здоровье","Сооружения","Природа","Энергия","Покупки","Спорт","Туризм","Транспорт","Вода","Вероисповедание","Геокэшинг","Символы"};
    for(int n=0;n<codes.length;n++)groups.put(codes[n],titles[n]);
    for(Map.Entry<String,byte[]> entry:files(context).entrySet()){
      if(!entry.getKey().startsWith("svg/icon_")||!entry.getKey().endsWith(".svg"))continue;
      String filename=entry.getKey().substring(4);String[] parts=filename.split("_");String group=parts.length>2?groups.get(parts[1]):"Символы";
      File folder=new File(new File(root,"Значки AlpineQuest"),group==null?"Символы":group);
      if(!folder.getCanonicalFile().equals(folder.getAbsoluteFile()))throw new IOException("Недопустимая ссылка каталога значков");
      if(!folder.isDirectory()&&!folder.mkdirs())throw new IOException("Не удалось подготовить каталог значков");
      File output=new File(folder,filename);if(output.exists())continue;
      File temp=File.createTempFile(".reference-",".tmp",folder);
      try{try(FileOutputStream stream=new FileOutputStream(temp)){stream.write(entry.getValue());}if(!temp.renameTo(output))throw new IOException("Не удалось сохранить значок");}finally{temp.delete();}
    }
    try(FileOutputStream out=new FileOutputStream(marker)){out.write(1);}
  }

  public static List<String> symbolNames(Context context)throws IOException{
    List<String> result=new ArrayList<>();for(String path:files(context).keySet())if(path.startsWith("svg/"))result.add(path.substring(4));return result;
  }
}
