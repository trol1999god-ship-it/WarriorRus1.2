package org.rabochaya.projects;
import android.content.Context;
import java.io.IOException;
/** Local workspace selection. Missing bookmarks never delete existing projects. */
public final class ProjectSession {
 private ProjectSession(){}
 public static synchronized long current(Context context)throws IOException{
  ProjectStore store=new ProjectStore(context);
  try{
   long id=context.getSharedPreferences("workspace-session",0).getLong("last_project",-1);
   if(id>0&&store.exists(id))return id;
   id=context.getSharedPreferences(OwnedHomeActivity.class.getName(),0).getLong("last_project",-1);
   if(id>0&&store.exists(id)){remember(context,id);return id;}
   for(ProjectStore.Summary row:store.list())if(row.id>0&&store.exists(row.id)){remember(context,row.id);return row.id;}
   return create(context,"Рабочая карта");
  }finally{store.close();}
 }
 public static synchronized long create(Context context,String name)throws IOException{
  if(name==null||name.trim().isEmpty()||name.trim().length()>1000)throw new IllegalArgumentException("Название: от 1 до 1000 символов");
  String title=name.trim();ProjectStore store=new ProjectStore(context);
  try{
   KmlProject doc=KmlProject.parse("<kml xmlns='http://www.opengis.net/kml/2.2'><Document><name>Проект</name></Document></kml>".getBytes("UTF-8"));
   FeatureEdits.metadata(doc.root(),title,"");long id=store.insert(doc,title);remember(context,id);return id;
  }finally{store.close();}
 }
 public static void remember(Context context,long id){if(id>0)context.getSharedPreferences("workspace-session",0).edit().putLong("last_project",id).commit();}
}
