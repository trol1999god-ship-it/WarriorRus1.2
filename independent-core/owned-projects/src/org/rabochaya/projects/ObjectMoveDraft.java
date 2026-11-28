package org.rabochaya.projects;
import org.w3c.dom.Element;import java.util.*;
/** A pending confirmation, never a command. Original XML identity guards every index. */
public final class ObjectMoveDraft {
 public final long project;public final String token,session,destination,label;public final int outside;private final int[] indices;
 public ObjectMoveDraft(long project,String token,String session,int[] indices,String destination,String label,int outside){
  if(project<=0||token==null||!token.matches("[0-9a-f]{64}")||session==null||session.isEmpty()||session.length()>128||indices==null||indices.length==0||indices.length>10000||destination==null||destination.length()>363||!destination.matches("|(?:0|[1-9][0-9]*)(/(?:0|[1-9][0-9]*))*")||destination.split("/").length>33||label==null||label.isEmpty()||label.length()>40000||outside<0||outside>indices.length)throw new IllegalArgumentException("Недопустимый план переноса");
  Set<Integer> seen=new HashSet<>();for(int index:indices)if(index<0||index>=10000||!seen.add(index))throw new IllegalArgumentException("Недопустимый выбор переноса");
  this.project=project;this.token=token;this.session=session;this.indices=indices.clone();this.destination=destination;this.label=label;this.outside=outside;
 }
 public int[] indices(){return indices.clone();}
 public static ObjectMoveDraft capture(long project,String token,String session,List<ObjectTree.Row> rows,Collection<String> keys,String destination,String label,int outside){return new ObjectMoveDraft(project,token,session,ObjectSelectionState.capture(project,token,session,rows,keys).indices(),destination,label,outside);}
 public boolean inSession(long currentProject,String currentSession){return project==currentProject&&session.equals(currentSession);}
 public List<String> restore(long currentProject,Element root,String currentSession){
  if(!inSession(currentProject,currentSession))return Collections.emptyList();List<String> keys=new ObjectSelectionState(project,token,session,indices).restore(currentProject,root,currentSession);if(keys.isEmpty())return keys;
  try{keys=ObjectTree.selection(root,keys,token);ObjectTree.resolve(root,destination);boolean folder=destination.isEmpty();for(ObjectTree.Row row:ObjectTree.rows(root))if(row.key.equals(destination))folder=row.folder;if(!folder)return Collections.emptyList();for(String key:keys)if(destination.equals(key)||destination.startsWith(key+"/"))return Collections.emptyList();return keys;}catch(IllegalArgumentException|IllegalStateException e){return Collections.emptyList();}
 }
}
