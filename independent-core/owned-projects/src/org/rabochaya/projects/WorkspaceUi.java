package org.rabochaya.projects;
import android.app.Activity;import android.graphics.*;import android.graphics.drawable.*;import android.view.*;import android.widget.*;import java.io.*;import java.util.*;
/** Own widgets using local artwork and the selected font. No external UI SDK. */
public final class WorkspaceUi {
 public static final int TEXT=0xff082e4c,PANEL=0xf2c7e1f8,MUTED=0xff427da9; // Confirmed blue palette: ReferenceMenu0b78cecc; not complete13-screen parity.
 private static Typeface font;private static final Map<String,Bitmap> icons=new HashMap<>();
 public static int dp(Activity a,float n){return (int)(a.getResources().getDisplayMetrics().density*n+.5f);}
 public static Typeface font(Activity a){return font((android.content.Context)a);}
 public static Typeface font(android.content.Context a){if(font==null)font=Typeface.createFromAsset(a.getAssets(),"fonts/Arimo-Regular.ttf");return font;}
 public static GradientDrawable panel(){GradientDrawable bg=new GradientDrawable();bg.setColor(PANEL);bg.setCornerRadius(8);bg.setStroke(1,0xff6ca7d2);return bg;}
 public static ImageButton icon(Activity a,String name,String title,Runnable action){
  ImageButton b=new ImageButton(a);Bitmap image=icons.get(name);if(image==null)try(InputStream in=a.getAssets().open("workspace-icons/"+name+".png")){image=BitmapFactory.decodeStream(in);if(image==null)throw new IOException(name);icons.put(name,image);}catch(IOException e){throw new IllegalStateException("Missing local icon: "+name,e);}
  b.setImageBitmap(image);b.setColorFilter(TEXT,PorterDuff.Mode.SRC_IN);b.setScaleType(ImageView.ScaleType.FIT_CENTER);int p=dp(a,10);b.setPadding(p,p,p,p);b.setContentDescription(title);b.setBackground(panel());b.setOnClickListener(v->action.run());b.setOnLongClickListener(v->{Toast.makeText(a,title,Toast.LENGTH_SHORT).show();return true;});return b;
 }
 public static final class Item {final String title;final Runnable action;public Item(String t,Runnable r){title=t;action=r;}}
 public static PopupWindow menu(Activity a,View anchor,String title,Item...items){
  LinearLayout list=new LinearLayout(a);list.setOrientation(1);list.setPadding(dp(a,8),dp(a,8),dp(a,8),dp(a,8));list.setBackground(panel());TextView heading=new TextView(a);heading.setTypeface(font(a),Typeface.BOLD);heading.setText(title);heading.setTextSize(18);heading.setTextColor(TEXT);heading.setPadding(dp(a,12),dp(a,8),dp(a,12),dp(a,8));list.addView(heading);
  ScrollView scroll=new ScrollView(a);scroll.addView(list);int width=Math.max(1,Math.min(dp(a,320),anchor.getWidth()-dp(a,16)));
  int height=Math.max(1,Math.min(dp(a,52*(items.length+1)),anchor.getHeight()-dp(a,72)));
  PopupWindow popup=new PopupWindow(scroll,width,height,true);popup.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));popup.setOutsideTouchable(true);popup.setElevation(dp(a,8));
  for(Item item:items){TextView row=new TextView(a);row.setText(item.title);row.setTypeface(font(a));row.setTextSize(16);row.setTextColor(TEXT);row.setGravity(Gravity.CENTER_VERTICAL);row.setPadding(dp(a,12),dp(a,10),dp(a,12),dp(a,10));row.setMinHeight(dp(a,48));row.setFocusable(true);row.setBackgroundResource(android.R.drawable.list_selector_background);list.addView(row,new LinearLayout.LayoutParams(-1,-2));row.setOnClickListener(v->{popup.dismiss();item.action.run();});}
  popup.showAtLocation(anchor,Gravity.BOTTOM|Gravity.LEFT,dp(a,8),dp(a,64));return popup;
 }
}
