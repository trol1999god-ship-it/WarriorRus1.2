package org.rabochaya.projects;
import org.w3c.dom.Element;import java.util.*;
/** Bounded pending intent only. No DOM mutation, preference write or clipboard replacement. */
public final class ObjectConfirmationDraft {
 public final long project;public final String action,token,session,destination,destinationLabel,fingerprint,title,message;public final int outside;private final int[] indices;
 public ObjectConfirmationDraft(long project,String action,String token,String session,int[] indices,String destination,String destinationLabel,String fingerprint,String title,String message,int outside){
  boolean paste="pastecopy".equals(action)||"pastecut".equals(action);
  if(!paste&&!"delete".equals(action)&&!"show".equals(action)&&!"hide".equals(action)||project<=0||token==null||!token.matches("[a-f0-9]{64}")||session==null||session.isEmpty()||session.length()>128||indices==null||indices.length==0||indices.length>10000||destination==null||destinationLabel==null||fingerprint==null||title==null||title.isEmpty()||title.length()>128||message==null||message.isEmpty()||message.length()>45000||outside<0||outside>indices.length)throw new IllegalArgumentException("Недопустимое подтверждение");
  if(paste){if(destination.length()>363||!destination.matches("|(?:0|[1-9][0-9]*)(/(?:0|[1-9][0-9]*))*")||destination.split("/").length>33||destinationLabel.isEmpty()||destinationLabel.length()>40000||!fingerprint.matches("[a-f0-9]{64}"))throw new IllegalArgumentException("Недопустимое назначение вставки");}else if(!destination.isEmpty()||!destinationLabel.isEmpty()||!fingerprint.isEmpty())throw new IllegalArgumentException("Лишнее назначение подтверждения");
  Set<Integer> seen=new HashSet<>();for(int index:indices)if(index<0||index>=10000||!seen.add(index))throw new IllegalArgumentException("Недопустимый выбор подтверждения");
  this.project=project;this.action=action;this.token=token;this.session=session;this.indices=indices.clone();this.destination=destination;this.destinationLabel=destinationLabel;this.fingerprint=fingerprint;this.title=title;this.message=message;this.outside=outside;
 }
 public int[] indices(){return indices.clone();}public boolean paste(){return action.equals("pastecopy")||action.equals("pastecut");}
 public boolean inSession(long currentProject,String currentSession){return project==currentProject&&session.equals(currentSession);}
 public static ObjectConfirmationDraft capture(long project,String action,String token,String session,List<ObjectTree.Row> rows,Collection<String> keys,String destination,String destinationLabel,String fingerprint,String title,String message,int outside){return new ObjectConfirmationDraft(project,action,token,session,ObjectSelectionState.capture(project,token,session,rows,keys).indices(),destination,destinationLabel,fingerprint,title,message,outside);}
 public List<String> restore(long currentProject,Element root,String currentSession,String currentFingerprint){
  if(!inSession(currentProject,currentSession)||paste()&&!fingerprint.equals(currentFingerprint))return Collections.emptyList();
  List<String> keys=new ObjectSelectionState(project,token,session,indices).restore(currentProject,root,currentSession);if(keys.isEmpty()||!paste())return keys;
  try{ObjectTree.resolve(root,destination);boolean container=destination.isEmpty();for(ObjectTree.Row row:ObjectTree.rows(root))if(row.key.equals(destination))container=row.folder;if(!container)return Collections.emptyList();for(String key:keys)if(destination.equals(key)||destination.startsWith(key+"/"))return Collections.emptyList();return keys;}catch(IllegalArgumentException|IllegalStateException e){return Collections.emptyList();}
 }
}
