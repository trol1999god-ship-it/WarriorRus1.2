package org.rabochaya.projects;
import org.w3c.dom.Element;import java.util.*;
/** Compact local UI selection; XML identity and a process session guard every index. */
public final class ObjectSelectionState {
 public final long project;public final String token,session;private final int[] indices;
 public ObjectSelectionState(long project,String token,String session,int[] indices){if(indices!=null&&indices.length>10000)throw new IllegalArgumentException("Слишком большой выбор");this.project=project;this.token=token;this.session=session;this.indices=indices==null?new int[0]:indices.clone();}
 public int[] indices(){return indices.clone();}
 public static ObjectSelectionState capture(long project,String token,String session,List<ObjectTree.Row> rows,Collection<String> selected){
  Set<String> chosen=new HashSet<>(selected);int[] result=new int[chosen.size()];int n=0;for(int i=0;i<rows.size();i++)if(chosen.contains(rows.get(i).key))result[n++]=i;
  return new ObjectSelectionState(project,token,session,n==chosen.size()?result:new int[0]);
 }
 public List<String> restore(long currentProject,Element root,String currentSession){
  if(project<=0||project!=currentProject||root==null||token==null||session==null||!session.equals(currentSession))return Collections.emptyList();
  try{if(!token.equals(ObjectTree.token(root)))return Collections.emptyList();List<ObjectTree.Row> rows=ObjectTree.rows(root);Set<Integer> seen=new HashSet<>();List<String> result=new ArrayList<>();
   for(int index:indices){if(index<0||index>=rows.size()||!seen.add(index))return Collections.emptyList();result.add(rows.get(index).key);}return Collections.unmodifiableList(result);
  }catch(IllegalArgumentException|IllegalStateException error){return Collections.emptyList();}
 }
}
