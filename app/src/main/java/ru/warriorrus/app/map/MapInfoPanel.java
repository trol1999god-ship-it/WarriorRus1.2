package ru.warriorrus.app.map;

import android.content.*;
import android.graphics.*;
import android.view.*;
import android.widget.*;
import org.osmdroid.api.IGeoPoint;
import org.osmdroid.views.MapView;
import ru.warriorrus.app.ReferenceMenu;
import ru.warriorrus.app.data.Vertex;
import ru.warriorrus.app.geometry.Geometry;
import ru.warriorrus.app.settings.DisplayUnits;

/** Map title, physical scale, native zoom level and linear ruler at the screen center. */
public final class MapInfoPanel extends LinearLayout {
  private final TextView title,scale;private final View ruler;private final MapView map;private final SharedPreferences prefs;
  private double metersPerPixel=1,rulerMeters=100;private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
  public MapInfoPanel(Context context,MapView map){super(context);this.map=map;prefs=context.getSharedPreferences("MainActivity",0);setTag("mapInfoPanel");setOrientation(VERTICAL);setPadding(dp(5),dp(2),dp(5),dp(2));setBackground(new ReferenceMenu(context).background());title=text();scale=text();addView(title);addView(scale);ruler=new View(context){@Override protected void onDraw(Canvas c){super.onDraw(c);paint.setColor(ReferenceMenu.TEXT);paint.setStrokeWidth(dp(1));float right=(float)Math.min(getWidth()-dp(3),rulerMeters/metersPerPixel);c.drawLine(dp(2),dp(4),right,dp(4),paint);c.drawLine(dp(2),dp(4),dp(2),dp(10),paint);c.drawLine(right,dp(4),right,dp(10),paint);paint.setTextSize(dp(9));c.drawText(DisplayUnits.load(getContext()).distance(rulerMeters),dp(4),dp(21),paint);}};addView(ruler,new LayoutParams(dp(140),dp(24)));}
  private int dp(int n){return Math.round(n*getResources().getDisplayMetrics().density);}
  private TextView text(){TextView t=new TextView(getContext());t.setTextColor(ReferenceMenu.TEXT);t.setTextSize(11);return t;}
  public void update(MapCatalog catalog){boolean showTitle=prefs.getBoolean("mapInfoName",false),showScale=prefs.getBoolean("mapInfoScale",true),showRuler=prefs.getBoolean("mapInfoRuler",true);setVisibility(showTitle||showScale||showRuler?VISIBLE:GONE);title.setVisibility(showTitle?VISIBLE:GONE);scale.setVisibility(showScale?VISIBLE:GONE);ruler.setVisibility(showRuler?VISIBLE:GONE);
    int max=19;String name="";if(catalog!=null)for(MapCatalog.Layer layer:catalog.layers)if(layer.visible&&layer.opacity>0){name=layer.name;max=layer.max;}title.setText(name);
    if(map.getWidth()>0&&map.getHeight()>0){IGeoPoint a=map.getProjection().fromPixels(map.getWidth()/2-25,map.getHeight()/2),b=map.getProjection().fromPixels(map.getWidth()/2+25,map.getHeight()/2);double value=Geometry.distance(new Vertex(a.getLatitude(),a.getLongitude()),new Vertex(b.getLatitude(),b.getLongitude()))/50;if(value>0&&!Double.isNaN(value)&&!Double.isInfinite(value))metersPerPixel=value;}
    double target=metersPerPixel*dp(130),base=Math.pow(10,Math.floor(Math.log10(target)));rulerMeters=base*(target/base>=5?5:target/base>=2?2:1);double denominator=metersPerPixel*getResources().getDisplayMetrics().xdpi/.0254;scale.setText(String.format(java.util.Locale.ROOT,"1:%,d   %.0f/%d",Math.round(denominator),map.getZoomLevelDouble(),max).replace(',',' '));ruler.invalidate();
  }
}
