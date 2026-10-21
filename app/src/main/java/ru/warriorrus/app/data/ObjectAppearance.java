package ru.warriorrus.app.data;

import org.json.*;

/** Per-object local style and descriptive fields. Zero sizes inherit map preferences. */
public final class ObjectAppearance {
  public float lineWidth=0, markerSize=0, labelSize=13, fillOpacity=.2f;
  public boolean fill=true, outline=true, labels=true, textObject=false, labelBold=false, labelItalic=false;
  public Integer fillColor=null, labelColor=null;
  public String dash="solid", colorMode="solid", activity="", url="", keywords="";
  public double weight=0;
  public double circleRadiusMeters=0;
  public Double circleLatitude=null,circleLongitude=null;

  public ObjectAppearance copy() { return decode(encode()); }
  public String encode() {
    try {
      return new JSONObject().put("lineWidth",lineWidth).put("markerSize",markerSize)
          .put("labelSize",labelSize).put("fillOpacity",fillOpacity).put("fill",fill)
          .put("outline",outline).put("labels",labels).put("textObject",textObject).put("labelBold",labelBold).put("labelItalic",labelItalic).put("fillColor",fillColor)
          .put("labelColor",labelColor).put("dash",dash).put("colorMode",colorMode).put("activity",activity)
          .put("url",url).put("keywords",keywords).put("weight",weight)
          .put("circleRadiusMeters",circleRadiusMeters).put("circleLatitude",circleLatitude)
          .put("circleLongitude",circleLongitude).toString();
    } catch(JSONException e) { throw new IllegalArgumentException("Неверные свойства объекта",e); }
  }
  public static ObjectAppearance decode(String text) {
    ObjectAppearance a=new ObjectAppearance();
    if(text==null||text.trim().isEmpty())return a;
    try {
      JSONObject o=new JSONObject(text);
      a.lineWidth=number(o,"lineWidth",0,0,40);a.markerSize=number(o,"markerSize",0,0,128);
      a.labelSize=number(o,"labelSize",13,6,48);a.fillOpacity=number(o,"fillOpacity",.2f,0,1);
      a.textObject=o.optBoolean("textObject",false);a.labelBold=o.optBoolean("labelBold",false);a.labelItalic=o.optBoolean("labelItalic",false);
      a.fill=o.optBoolean("fill",true);a.outline=o.optBoolean("outline",true);a.labels=o.optBoolean("labels",true);
      if(!o.isNull("fillColor"))a.fillColor=o.getInt("fillColor");
      if(!o.isNull("labelColor"))a.labelColor=o.getInt("labelColor");
      a.dash=o.optString("dash","solid");
      if(!java.util.Arrays.asList("solid","dash","dot","dashdot").contains(a.dash))a.dash="solid";
      a.colorMode=o.optString("colorMode","solid");
      if(!java.util.Arrays.asList("solid","elevation","speed","slope").contains(a.colorMode))a.colorMode="solid";
      a.activity=o.optString("activity","");a.url=o.optString("url","");a.keywords=o.optString("keywords","");
      a.weight=o.optDouble("weight",0);
      if(Double.isNaN(a.weight)||Double.isInfinite(a.weight)||a.weight<0)a.weight=0;
      a.circleRadiusMeters=o.optDouble("circleRadiusMeters",0);if(Double.isNaN(a.circleRadiusMeters)||Double.isInfinite(a.circleRadiusMeters)||a.circleRadiusMeters<0||a.circleRadiusMeters>20000000)a.circleRadiusMeters=0;
      if(!o.isNull("circleLatitude")&&!o.isNull("circleLongitude")) {
        double lat=o.getDouble("circleLatitude"),lon=o.getDouble("circleLongitude");
        if(!Double.isNaN(lat)&&!Double.isNaN(lon)&&Math.abs(lat)<=90&&Math.abs(lon)<=180){a.circleLatitude=lat;a.circleLongitude=lon;}
      }
      return a;
    }catch(JSONException e){throw new IllegalArgumentException("Повреждены свойства объекта",e);}
  }
  private static float number(JSONObject o,String key,float fallback,float min,float max) {
    double n=o.optDouble(key,fallback);
    return Double.isNaN(n)||Double.isInfinite(n)?fallback:(float)Math.max(min,Math.min(max,n));
  }
}
