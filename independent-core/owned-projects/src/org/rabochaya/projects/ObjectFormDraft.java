package org.rabochaya.projects;
/** Raw, bounded UI values. Never parses dates, applies a query, or writes preferences/XML. */
public final class ObjectFormDraft {
 public final long project;public final String kind,error;public final int focus;
 private final String[] texts;private final int[] starts,ends,choices;private final boolean[] checks;
 public ObjectFormDraft(long project,String kind,String[] texts,int[] starts,int[] ends,int focus,int[] choices,boolean[] checks,String error){
  boolean search="search".equals(kind),dates="dates".equals(kind);int count=search?1:2;
  if(project<=0||!search&&!dates||texts==null||starts==null||ends==null||choices==null||checks==null||error==null||error.length()>1024||texts.length!=count||starts.length!=count||ends.length!=count||choices.length!=(search?4:1)||checks.length!=(search?2:0)||focus< -1||focus>=count)throw new IllegalArgumentException("Недопустимый черновик формы");
  this.project=project;this.kind=kind;this.error=error;this.focus=focus;this.texts=texts.clone();this.starts=starts.clone();this.ends=ends.clone();this.choices=choices.clone();this.checks=checks.clone();
  for(int i=0;i<count;i++){if(texts[i]==null||texts[i].length()>(search?256:10))throw new IllegalArgumentException("Слишком большое поле формы");this.starts[i]=Math.max(0,Math.min(starts[i],texts[i].length()));this.ends[i]=Math.max(0,Math.min(ends[i],texts[i].length()));}
  int[] limits=search?new int[]{ObjectListing.SEARCH_FIELDS.length,ObjectListing.KINDS.length,ObjectListing.VISIBILITY.length,ObjectListing.SORTS.length}:new int[]{KmlTimeFilter.MODES.length};for(int i=0;i<limits.length;i++)if(choices[i]<0||choices[i]>=limits[i])throw new IllegalArgumentException("Недопустимый вариант формы");
 }
 public boolean appliesTo(long currentProject){return currentProject==project;}
 public String[] texts(){return texts.clone();}public int[] starts(){return starts.clone();}public int[] ends(){return ends.clone();}public int[] choices(){return choices.clone();}public boolean[] checks(){return checks.clone();}
}
