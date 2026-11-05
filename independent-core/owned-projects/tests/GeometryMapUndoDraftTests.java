import org.rabochaya.projects.*;
import java.util.*;
public final class GeometryMapUndoDraftTests {
 static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("Undo handoff "+checks);}
 static final String TOKEN=String.join("",Collections.nCopies(64,"a")),OTHER=String.join("",Collections.nCopies(64,"b"));
 static GeometryMapState restore(GeometryMapUndoDraft d,String raw){return d.restore(7,"feature","process","0.1",TOKEN,TOKEN,"LineString",false,false,raw);}
 static void bad(Runnable f){boolean rejected=false;try{f.run();}catch(IllegalArgumentException e){rejected=true;}check(rejected);}
 public static void main(String[] args){
  String original="10 20 123\n11 21 -4\n12 22 7";
  GeometryMapState source=new GeometryMapState(original,"LineString",false);source.select(1);source.move(1,25,15);String first=source.text();source.insert(26,16);String second=source.text();source.delete();String third=source.text();
  GeometryMapUndoDraft draft=new GeometryMapUndoDraft(7,"feature","process","0.1",TOKEN,source);
  source.undo();source.move(0,30,20);GeometryMapState restored=restore(draft,third);
  check(restored!=null&&restored.text().equals(third)&&restored.undoCount()==3&&restored.selected()==2);
  restored.undo();check(restored.text().equals(second)&&restored.selected()==2);
  restored.undo();check(restored.text().equals(first)&&restored.selected()==1);
  restored.undo();check(restored.text().equals(original)&&restored.selected()==1&&!restored.canUndo());
  check(restore(draft,third).undoCount()==3);check(!source.text().equals(original));
  check(draft.restore(8,"feature","process","0.1",TOKEN,TOKEN,"LineString",false,false,third)==null);
  check(draft.restore(7,"other","process","0.1",TOKEN,TOKEN,"LineString",false,false,third)==null);
  check(draft.restore(7,"feature","new-process","0.1",TOKEN,TOKEN,"LineString",false,false,third)==null);
  check(draft.restore(7,"feature","process","0.0",TOKEN,TOKEN,"LineString",false,false,third)==null);
  check(draft.restore(7,"feature","process","0.1",OTHER,TOKEN,"LineString",false,false,third)==null);
  check(draft.restore(7,"feature","process","0.1",TOKEN,OTHER,"LineString",false,false,third)==null);
  check(draft.restore(7,"feature","process","0.1",TOKEN,TOKEN,"Polygon",false,false,third)==null);
  check(draft.restore(7,"feature","process","0.1",TOKEN,TOKEN,"LineString",true,false,third)==null);
  check(draft.restore(7,"feature","process","0.1",TOKEN,TOKEN,"LineString",false,true,third)==null);
  check(restore(draft,third+"\n13 23 8")==null);check(restore(draft,null)==null);
  check(restore(draft,String.join("",Collections.nCopies(500001,"x")))==null);
  GeometryMapState bounded=new GeometryMapState(original,"LineString",false);for(int i=0;i<100;i++)bounded.move(0,i%100,0);GeometryMapState copy=bounded.snapshotCopy();check(copy.undoCount()==32);for(int i=0;i<32;i++)copy.undo();check(!copy.canUndo()&&bounded.undoCount()==32);bad(()->copy.undo());
  GeometryMapState hole=new GeometryMapState("","Polygon",true);hole.insert(1,1);hole.insert(2,1);GeometryMapUndoDraft newHole=new GeometryMapUndoDraft(7,"feature","process","0/outer",TOKEN,hole);GeometryMapState newCopy=newHole.restore(7,"feature","process","0/outer",TOKEN,TOKEN,"Polygon",false,true,hole.text());check(newCopy!=null&&!newCopy.complete()&&newCopy.undoCount()==2);newCopy.undo();newCopy.undo();check(newCopy.text().isEmpty()&&hole.size()==2);
  check(newHole.restore(7,"feature","process","0/inner/0",TOKEN,TOKEN,"Polygon",true,false,hole.text())==null);
  bad(()->new GeometryMapUndoDraft(0,"feature","process","0.1",TOKEN,source));bad(()->new GeometryMapUndoDraft(7,"","process","0.1",TOKEN,source));bad(()->new GeometryMapUndoDraft(7,"feature","","0.1",TOKEN,source));bad(()->new GeometryMapUndoDraft(7,"feature","process","../x",TOKEN,source));bad(()->new GeometryMapUndoDraft(7,"feature","process","0.1","bad",source));bad(()->new GeometryMapUndoDraft(7,"feature","process","0/outer",TOKEN,source));bad(()->new GeometryMapUndoDraft(7,"feature","process","0/inner/0",TOKEN,hole));bad(()->new GeometryMapUndoDraft(7,"feature","process","0.1",TOKEN,null));
  System.out.println("PASS GeometryMapUndoDraft: "+checks+" assertions");
 }
}
