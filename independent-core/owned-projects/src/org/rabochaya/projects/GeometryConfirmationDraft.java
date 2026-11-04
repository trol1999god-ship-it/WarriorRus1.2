package org.rabochaya.projects;
/** Immutable bounded deletion intent; never contains XML or performs an action. */
public final class GeometryConfirmationDraft {
 public final long project;public final String feature,session,key,token,mainStamp,type,kind;public final boolean addingHole,hole;public final int index;
 public GeometryConfirmationDraft(long project,String feature,String session,String key,String token,String mainStamp,String type,String kind,boolean addingHole,int index){
  if(project<=0||feature==null||feature.isEmpty()||feature.length()>4096||session==null||session.isEmpty()||session.length()>128||key==null||key.length()>512||!key.matches("\\d+(?:\\.\\d+)*(?:/(?:outer|inner/\\d+))?")||token==null||!token.matches("[a-f0-9]{64}")||mainStamp==null||!mainStamp.matches("[a-f0-9]{64}")||!("LineString".equals(type)||"Polygon".equals(type))||"LineString".equals(type)&&key.contains("/")||!("vertex".equals(kind)||"hole".equals(kind))||"vertex".equals(kind)&&(index<0||index>=10000)||"hole".equals(kind)&&(index!=-1||!"Polygon".equals(type)||!key.contains("/inner/")||addingHole)||addingHole&&(!"vertex".equals(kind)||!"Polygon".equals(type)||!key.endsWith("/outer")))throw new IllegalArgumentException("Недопустимое намерение удаления геометрии");
  this.project=project;this.feature=feature;this.session=session;this.key=key;this.token=token;this.mainStamp=mainStamp;this.type=type;this.kind=kind;this.addingHole=addingHole;this.hole=key.contains("/inner/");this.index=index;
 }
 public boolean inSession(long project,String feature,String session){return this.project==project&&this.feature.equals(feature)&&this.session.equals(session);}
 public boolean matches(long project,String feature,String session,String key,String token,String type,boolean hole,boolean addingHole,String main){return inSession(project,feature,session)&&this.key.equals(key)&&this.token.equals(token)&&this.type.equals(type)&&this.hole==hole&&this.addingHole==addingHole&&main!=null&&main.length()<=500000&&mainStamp.equals(VertexEditDraft.stamp(main));}
}
