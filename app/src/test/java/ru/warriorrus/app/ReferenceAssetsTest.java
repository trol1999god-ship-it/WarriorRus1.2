package ru.warriorrus.app;

import static org.junit.Assert.*;
import android.content.Context;
import android.graphics.drawable.Drawable;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import ru.warriorrus.app.icons.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk={23,35})
public class ReferenceAssetsTest {
  @Test public void referenceArtworkMatchesProvidedApkAndHasAllSymbolCategories()throws Exception{
    Context c=RuntimeEnvironment.getApplication();int count=0;boolean checked=false;
    try(ZipInputStream in=new ZipInputStream(c.getAssets().open("reference_ui.zip"))){ZipEntry entry;byte[] block=new byte[4096];while((entry=in.getNextEntry())!=null){count++;if(entry.getName().equals("mdpi/maps_mainmenu_icon_48.png")){ByteArrayOutputStream out=new ByteArrayOutputStream();int n;while((n=in.read(block))!=-1)out.write(block,0,n);assertEquals("b39b93a188fb41939715f83fc26d8318ea06b793b69a259e8c1795925c518f3d",hex(MessageDigest.getInstance("SHA-256").digest(out.toByteArray())));checked=true;}}}
    assertTrue(checked);assertEquals(1087,count);assertEquals(261,ReferenceAssets.symbolNames(c).size());
    for(String name:new String[]{"maps_mainmenu_icon_48","orientation_mainmenu_icon_48","app_action_search_24","atk_toolkit_canvas_tile_error_16"}){Drawable d=ReferenceAssets.drawable(c,name,24,true);assertNotNull(name,d);assertEquals(Math.round(24*c.getResources().getDisplayMetrics().density),d.getIntrinsicWidth());}
  }

  @Test public void allOriginalSymbolsParseAndLocalCatalogNeverOverwritesUsersChanges()throws Exception{
    Context c=RuntimeEnvironment.getApplication();File root=new File(c.getCacheDir(),"reference-symbols-"+UUID.randomUUID());assertTrue(root.mkdirs());ReferenceAssets.installSymbols(c,root);
    List<File> icons=new ArrayList<>();collect(new File(root,"Значки AlpineQuest"),icons);assertEquals(261,icons.size());
    for(File file:icons)try(InputStream in=new FileInputStream(file)){assertNotNull(file.getName(),SvgPreview.parse(SvgPreview.read(in)));}
    File changed=icons.get(0),deleted=icons.get(1);String own=IconLibrary.STAR;try(OutputStream out=new FileOutputStream(changed)){out.write(own.getBytes(StandardCharsets.UTF_8));}assertTrue(deleted.delete());
    ReferenceAssets.installSymbols(c,root);try(InputStream in=new FileInputStream(changed)){assertEquals(own,SvgPreview.read(in));}assertFalse(deleted.exists());
  }
  private void collect(File folder,List<File> result){File[] files=folder.listFiles();assertNotNull(files);for(File f:files)if(f.isDirectory())collect(f,result);else if(f.getName().endsWith(".svg"))result.add(f);}
  private String hex(byte[] bytes){StringBuilder out=new StringBuilder();for(byte value:bytes)out.append(String.format(Locale.ROOT,"%02x",value&255));return out.toString();}
}
