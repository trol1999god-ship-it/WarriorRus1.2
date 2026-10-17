package ru.warriorrus.app.data;

import java.util.*;
import org.json.*;
import ru.warriorrus.app.geometry.Geometry;

/** Shared, versioned representation for local history and portable KMZ metadata. */
public final class ObjectJson {
  private ObjectJson() {}
  public static String attachments(List<Attachment> attachments) {
    JSONArray array=new JSONArray();
    try { for(Attachment a:attachments)array.put(new JSONObject().put("key",a.key).put("name",a.name).put("mime",a.mime).put("size",a.size)); }
    catch(JSONException e){throw new IllegalArgumentException(e);}return array.toString();
  }
  public static List<Attachment> attachments(String text) {
    List<Attachment> result=new ArrayList<>();
    try {JSONArray array=new JSONArray(text);for(int n=0;n<array.length();n++){JSONObject a=array.getJSONObject(n);result.add(new Attachment(a.getString("key"),a.getString("name"),a.getString("mime"),a.optLong("size",0)));}}
    catch(JSONException e){throw new IllegalArgumentException("Повреждены вложения",e);}return result;
  }
  public static String encode(List<MapItem> items) {
    JSONArray result=new JSONArray();
    try {for(MapItem i:items)result.put(new JSONObject().put("id",i.id).put("parent",i.parent).put("name",i.name).put("kind",i.kind)
      .put("lat",i.latitude).put("lon",i.longitude).put("visible",i.visible).put("position",i.position).put("color",i.color).put("opacity",i.opacity)
      .put("icon",i.icon).put("description",i.description).put("geometry",new JSONArray(Geometry.encode(i.segments)))
      .put("attachments",new JSONArray(attachments(i.attachments))).put("created",i.created).put("updated",i.updated).put("trashed",i.trashed));}
    catch(JSONException e){throw new IllegalArgumentException(e);}return result.toString();
  }
  public static List<MapItem> decode(String text) {
    List<MapItem> result=new ArrayList<>();
    try {JSONArray array=new JSONArray(text);if(array.length()>10000)throw new IllegalArgumentException("Слишком много объектов");
      for(int n=0;n<array.length();n++){JSONObject o=array.getJSONObject(n);MapItem i=new MapItem();i.id=o.getLong("id");i.parent=o.getLong("parent");i.name=o.getString("name");i.kind=o.getString("kind");
        if(!Arrays.asList("folder","set","point","route","path","track","area").contains(i.kind))throw new IllegalArgumentException("Неизвестный тип объекта");
        i.latitude=o.getDouble("lat");i.longitude=o.getDouble("lon");new Vertex(i.latitude,i.longitude);i.visible=o.getBoolean("visible");i.position=o.optInt("position");i.color=o.getInt("color");i.opacity=(float)o.getDouble("opacity");
        if(Float.isNaN(i.opacity)||i.opacity<0||i.opacity>1)throw new IllegalArgumentException("Неверная прозрачность");
        i.icon=o.optString("icon","builtin:pin");i.description=o.optString("description","");i.segments.addAll(Geometry.decode(o.getJSONArray("geometry").toString()));
        i.attachments.addAll(attachments(o.optJSONArray("attachments")==null?"[]":o.getJSONArray("attachments").toString()));i.created=o.optLong("created",0);i.updated=o.optLong("updated",0);i.trashed=o.optBoolean("trashed",false);
        if(i.isGeometry())Geometry.validate(i);result.add(i);
      }
    }catch(JSONException e){throw new IllegalArgumentException("Повреждены данные объектов",e);}return result;
  }
}
