package org.rabochaya.projects;
import android.database.sqlite.SQLiteDatabase;import java.io.IOException;import java.util.List;
/** Load, compare, mutate and replace under one SQLite write transaction. */
public final class ObjectTreeWrites {
 private ObjectTreeWrites(){}
 public static KmlProject apply(ProjectStore store,long id,String operation,List<String> keys,String value,String expected)throws IOException{
  SQLiteDatabase db=store.getWritableDatabase();db.beginTransaction();
  try{KmlProject p=store.load(id);
   if("create".equals(operation))ObjectTree.createFolder(p.root(),keys.get(0),expected,value);
   else if("rename".equals(operation))ObjectTree.rename(p.root(),keys.get(0),expected,value);
   else if("description".equals(operation)){if(keys==null||keys.size()!=1)throw new IllegalArgumentException("Выберите один объект");if(!ObjectDescription.apply(p.root(),keys.get(0),expected,value)){db.setTransactionSuccessful();return p;}}
   else if("move".equals(operation))ObjectTree.move(p.root(),keys,value,expected);
   else if("delete".equals(operation))ObjectTree.delete(p.root(),keys,expected);
   else if("show".equals(operation)||"hide".equals(operation)){ObjectVisibility.Preview change=ObjectVisibility.apply(p.root(),keys,"show".equals(operation),expected);if(change.changed==0){db.setTransactionSuccessful();return p;}}
   else throw new IllegalArgumentException("Неизвестное действие");
   ObjectTree.normalizeRoot(p.root());ProjectWrites.savePreservingAssets(store,id,p);db.setTransactionSuccessful();return p;
  }finally{db.endTransaction();}
 }
}
