package org.rabochaya.projects;
import org.w3c.dom.Element;
/** Immutable unsaved UI state. Never grants a newer XML token or writes a project. */
public final class ObjectEditorDraft {
 public final long project;public final String operation,key,token,text;public final int start,end;
 public ObjectEditorDraft(long project,String operation,String key,String token,String text,int start,int end){
  if(!"rename".equals(operation)&&!"description".equals(operation)&&!"create".equals(operation))throw new IllegalArgumentException("Неизвестный редактор");
  if(text==null||text.length()>100000)throw new IllegalArgumentException("Слишком большой черновик");
  this.project=project;this.operation=operation;this.key=key;this.token=token;this.text=text;this.start=Math.max(0,Math.min(start,text.length()));this.end=Math.max(0,Math.min(end,text.length()));
 }
 public boolean matches(long currentProject,Element root){
  if(project<=0||project!=currentProject||token==null||root==null)return false;
  try{if(!token.equals(ObjectTree.token(root)))return false;Element target=ObjectTree.resolve(root,key);
   if(!operation.equals("create"))return key!=null&&!key.isEmpty();
   String type=target.getLocalName();return "Document".equals(type)||"Folder".equals(type)||"kml".equals(type);
  }catch(IllegalArgumentException|IllegalStateException error){return false;}
 }
}
