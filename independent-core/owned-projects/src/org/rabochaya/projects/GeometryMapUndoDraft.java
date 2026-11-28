package org.rabochaya.projects;

/** In-memory configuration handoff only; contains no Activity, Bundle or file reference. */
public final class GeometryMapUndoDraft {
 private final long project;
 private final String feature,session,key,token,stamp,type;
 private final boolean hole,adding;
 private final GeometryMapState snapshot;
 public GeometryMapUndoDraft(long project,String feature,String session,String key,String token,GeometryMapState state){
  if(project<=0||feature==null||feature.isEmpty()||feature.length()>4096||session==null||session.isEmpty()||session.length()>128||key==null||key.length()>512||!key.matches("\\d+(?:\\.\\d+)*(?:/(?:outer|inner/\\d+))?")||token==null||!token.matches("[a-f0-9]{64}")||state==null||!"Polygon".equals(state.type)&&key.contains("/")||state.incompleteAllowed&&!key.endsWith("/outer"))throw new IllegalArgumentException("Недопустимая история редактирования");
  this.project=project;this.feature=feature;this.session=session;this.key=key;this.token=token;type=state.type;hole=key.contains("/inner/");adding=state.incompleteAllowed;stamp=VertexEditDraft.stamp(state.text());snapshot=state.snapshotCopy();
 }
 public GeometryMapState restore(long project,String feature,String session,String key,String expectedToken,String currentToken,String type,boolean hole,boolean adding,String main){
  if(this.project!=project||!this.feature.equals(feature)||!this.session.equals(session)||!this.key.equals(key)||!token.equals(expectedToken)||!token.equals(currentToken)||!this.type.equals(type)||this.hole!=hole||this.adding!=adding||main==null||main.length()>500000||!stamp.equals(VertexEditDraft.stamp(main)))return null;
  return snapshot.snapshotCopy();
 }
}
