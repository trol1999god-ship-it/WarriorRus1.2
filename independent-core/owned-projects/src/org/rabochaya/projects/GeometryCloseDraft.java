package org.rabochaya.projects;
/** Original local close intention. A restored instance never closes or writes by itself. */
public final class GeometryCloseDraft {
 public final long project;public final String feature,session,key,token,type,mainStamp;public final boolean hole,addingHole,onMap;
 public GeometryCloseDraft(long project,String feature,String session,String key,String token,String type,boolean addingHole,boolean onMap,String mainStamp){
  if(project<=0||feature==null||feature.isEmpty()||feature.length()>4096||session==null||session.isEmpty()||session.length()>128||key==null||key.length()>512||!key.matches("\\d+(?:\\.\\d+)*(?:/(?:outer|inner/\\d+))?")||token==null||!token.matches("[a-f0-9]{64}")||mainStamp==null||!mainStamp.matches("[a-f0-9]{64}")||!("Point".equals(type)||"LineString".equals(type)||"Polygon".equals(type))||key.contains("/")&&!"Polygon".equals(type)||addingHole&&(!"Polygon".equals(type)||!key.endsWith("/outer")))throw new IllegalArgumentException("Недопустимое намерение закрытия редактора");
  this.project=project;this.feature=feature;this.session=session;this.key=key;this.token=token;this.type=type;this.addingHole=addingHole;this.onMap=onMap;this.mainStamp=mainStamp;hole=key.contains("/inner/");
 }
 public boolean inSession(long project,String feature,String session){return this.project==project&&this.feature.equals(feature)&&this.session.equals(session);}
 /** Expected editing token stays original even when KML changes: these actions affect only a private draft. */
 public boolean matches(long project,String feature,String session,String key,String expected,String type,boolean hole,boolean addingHole,boolean onMap,String main){return inSession(project,feature,session)&&this.key.equals(key)&&token.equals(expected)&&this.type.equals(type)&&this.hole==hole&&this.addingHole==addingHole&&this.onMap==onMap&&main!=null&&main.length()<=500000&&mainStamp.equals(VertexEditDraft.stamp(main));}
}
