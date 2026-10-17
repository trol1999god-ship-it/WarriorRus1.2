package ru.warriorrus.app.exchange;

import android.content.Context;
import android.graphics.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.*;
import org.json.*;
import ru.warriorrus.app.data.*;
import ru.warriorrus.app.icons.*;
import ru.warriorrus.app.media.LocalMedia;

/** Standard doc.kml plus local media and a lossless private-metadata manifest inside KMZ. */
public final class BundleExchange {
  private BundleExchange() {}
  public static void write(Context context,List<MapItem> items,OutputStream out,String format)throws Exception {
    if(!"kmz".equals(format)){PlacemarkFiles.write(items,out,format);return;}
    LocalMedia media=new LocalMedia(context);IconLibrary library=IconLibrary.open(context);
    ZipOutputStream zip=new ZipOutputStream(out);Map<Long,String> icons=new HashMap<>(),descriptions=new HashMap<>();
    List<MapItem> portable=ObjectJson.decode(ObjectJson.encode(items));Set<Long> ids=new HashSet<>();for(MapItem i:portable)ids.add(i.id);for(MapItem i:portable)if(!ids.contains(i.parent))i.parent=0;Set<String> included=new HashSet<>();
    for(MapItem i:portable) {
      if(!i.isFolder()) {
        String svg=i.icon.startsWith("builtin:")?IconLibrary.builtinText(i.icon):library.text(i.icon);
        String svgName="icons/object-"+i.id+".svg",pngName="icons/object-"+i.id+".png";
        put(zip,svgName,svg.getBytes(StandardCharsets.UTF_8));
        android.graphics.drawable.Drawable drawable=SvgPreview.render(context.getResources(),svg,i.color,96);
        Bitmap bitmap=Bitmap.createBitmap(96,96,Bitmap.Config.ARGB_8888);drawable.setBounds(0,0,96,96);drawable.draw(new Canvas(bitmap));
        zip.putNextEntry(new ZipEntry(pngName));bitmap.compress(Bitmap.CompressFormat.PNG,100,zip);zip.closeEntry();bitmap.recycle();
        icons.put(i.id,pngName);i.icon=svgName;
      }
      StringBuilder description=new StringBuilder(i.description);
      for(Attachment a:i.attachments) {
        File file=media.resolve(a.key);if(!file.isFile())throw new IOException("Не найдено вложение: "+a.name);
        if(included.add(a.key)){zip.putNextEntry(new ZipEntry("media/"+a.key));try(InputStream in=new FileInputStream(file)){copy(in,zip,LocalMedia.MAX_FILE);}zip.closeEntry();}
        description.append("\n<p><a href=\"media/").append(a.key).append("\">").append(escape(a.name)).append("</a></p>");
        if(a.mime.startsWith("image/"))description.append("<img src=\"media/").append(a.key).append("\" width=\"480\"/>");
      }
      descriptions.put(i.id,description.toString());
    }
    zip.putNextEntry(new ZipEntry("doc.kml"));PlacemarkFiles.writeKmlDocument(items,zip,icons,descriptions);zip.closeEntry();
    JSONObject manifest=new JSONObject();manifest.put("version",1);manifest.put("objects",new JSONArray(ObjectJson.encode(portable)));
    put(zip,"workmap.json",manifest.toString().getBytes(StandardCharsets.UTF_8));zip.finish();zip.flush();
  }
  private static String escape(String text){return text.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;");}
  private static void put(ZipOutputStream zip,String name,byte[] bytes)throws IOException {zip.putNextEntry(new ZipEntry(name));zip.write(bytes);zip.closeEntry();}
  private static long copy(InputStream in,OutputStream out,long limit)throws IOException {
    byte[] b=new byte[65536];long size=0;int n;while((n=in.read(b))!=-1){size+=n;if(size>limit)throw new IOException("Слишком большой файл");out.write(b,0,n);}return size;
  }
  public static List<MapItem> read(Context context,InputStream input)throws Exception {
    BufferedInputStream in=new BufferedInputStream(input);in.mark(4);int a=in.read(),b=in.read();in.reset();
    if(a!='P'||b!='K')return PlacemarkFiles.read(in);
    File staging=new File(context.getCacheDir(),"kmz-"+UUID.randomUUID());if(!staging.mkdirs())throw new IOException("Нет места для импорта");
    LocalMedia media=new LocalMedia(context);List<String> createdFiles=new ArrayList<>();boolean success=false;
    try {
      ZipInputStream zip=new ZipInputStream(in);ZipEntry entry;long total=0;int count=0;
      Map<String,File> files=new HashMap<>();
      while((entry=zip.getNextEntry())!=null) {
        if(++count>3000)throw new IOException("Слишком много файлов в KMZ");if(entry.isDirectory())continue;
        String path=entry.getName().replace('\\','/');if(path.startsWith("/")||Arrays.asList(path.split("/")).contains("..")||files.containsKey(path))throw new IOException("Неверный путь KMZ");
        File target=new File(staging,path).getCanonicalFile();if(!target.getPath().startsWith(staging.getCanonicalPath()+File.separator))throw new IOException("Неверный путь KMZ");
        if(!target.getParentFile().isDirectory()&&!target.getParentFile().mkdirs())throw new IOException("Нет места для импорта");
        try(OutputStream output=new FileOutputStream(target)){total+=copy(zip,output,LocalMedia.MAX_FILE);}
        if(total>1024L*1024*1024)throw new IOException("Распакованный KMZ больше 1 ГиБ");files.put(path,target);
      }
      List<MapItem> items;File manifestFile=files.get("workmap.json");
      if(manifestFile==null) {
        File kml=files.get("doc.kml");if(kml==null)for(Map.Entry<String,File> e:files.entrySet())if(e.getKey().toLowerCase(Locale.ROOT).endsWith(".kml")){kml=e.getValue();break;}
        if(kml==null)throw new IOException("В KMZ нет KML");try(InputStream xml=new FileInputStream(kml)){items=PlacemarkFiles.read(xml);}
      } else {
        JSONObject manifest;try(InputStream json=new FileInputStream(manifestFile)){manifest=new JSONObject(new String(PlacemarkFiles.bounded(json,25*1024*1024),StandardCharsets.UTF_8));}
        if(manifest.getInt("version")!=1)throw new IOException("Неподдерживаемая версия данных KMZ");items=ObjectJson.decode(manifest.getJSONArray("objects").toString());
        IconLibrary library=IconLibrary.open(context);Map<String,Attachment> imported=new HashMap<>();Map<String,String> iconKeys=new HashMap<>();
        for(MapItem i:items) {
          i.trashed=false;
          if(!i.isFolder()&&!i.icon.startsWith("builtin:")) {
            String previous=iconKeys.get(i.icon);if(previous==null){File svg=files.get(i.icon);if(svg==null)throw new IOException("В KMZ нет значка объекта");
              try(InputStream image=new FileInputStream(svg)){previous=library.importSvg("","import-"+UUID.randomUUID()+".svg",image);}iconKeys.put(i.icon,previous);}
            i.icon=previous;
          }
          List<Attachment> replaced=new ArrayList<>();
          for(Attachment original:i.attachments) {
            Attachment next=imported.get(original.key);
            if(next==null){File f=files.get("media/"+original.key);if(f==null)throw new IOException("В KMZ нет вложения: "+original.name);
              try(InputStream file=new FileInputStream(f)){next=media.add(file,original.name,original.mime);}createdFiles.add(next.key);imported.put(original.key,next);}
            replaced.add(new Attachment(next.key,original.name,original.mime,next.size));
          }i.attachments.clear();i.attachments.addAll(replaced);
        }
      }
      if(items.isEmpty())throw new IOException("В файле нет объектов");success=true;return items;
    }finally {
      deleteTree(staging);
      if(!success)for(String key:createdFiles)media.resolve(key).delete();
    }
  }
  private static void deleteTree(File file){File[] children=file.listFiles();if(children!=null)for(File child:children)deleteTree(child);file.delete();}
}
