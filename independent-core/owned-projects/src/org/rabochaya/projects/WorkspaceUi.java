package org.rabochaya.projects;
import android.app.Activity;import android.graphics.*;import android.graphics.drawable.*;import android.view.*;import android.widget.*;import java.io.*;import java.util.*;
/** Own widgets using local artwork and the selected font. No external UI SDK. */
public final class WorkspaceUi {
 private static Typeface font;private static final Map<String,Bitmap> icons=new HashMap<>();
 public static int dp(Activity a,float n){return (int)(a.getResources().getDisplayMetrics().density*n+.5f);}
 public static Typeface font(Activity a){if(font==null)font=Typeface.createFromAsset(a.getAssets(),"fonts/Arimo-Regular.ttf");return font;}
 public static GradientDrawable panel(){GradientDrawable bg=new GradientDrawable();bg.setColor(0xee232d1d);bg.setCornerRadius(8);bg.setStroke(1,0xff536047);return bg;}
 public static ImageButton icon(Activity a,String name,String title,Runnable action){
  ImageButton b=new ImageButton(a);Bitmap image=icons.get(name);if(image==null)try(InputStream in=a.getAssets().open("workspace-icons/"+name+".png")){image=BitmapFactory.decodeStream(in);if(image==null)throw new IOException(name);icons.put(name,image);}catch(IOException e){throw new IllegalStateException("Missing local icon: "+name,e);}
  b.setImageBitmap(image);b.setScaleType(ImageView.ScaleType.FIT_CENTER);int p=dp(a,10);b.setPadding(p,p,p,p);b.setContentDescription(title);b.setBackground(panel());b.setOnClickListener(v->action.run());b.setOnLongClickListener(v->{Toast.makeText(a,title,Toast.LENGTH_SHORT).show();return true;});return b;
 }
 public static final class Item {final String title;final Runnable action;public Item(String t,Runnable r){title=t;action=r;}}
 public static PopupWindow menu(Activity a,View anchor,String title,Item...items){
  LinearLayout list=new LinearLayout(a);list.setOrientation(1);list.setPadding(dp(a,8),dp(a,8),dp(a,8),dp(a,8));list.setBackground(panel());TextView heading=new TextView(a);heading.setTypeface(font(a),Typeface.BOLD);heading.setText(title);heading.setTextSize(18);heading.setTextColor(-1);heading.setPadding(dp(a,12),dp(a,8),dp(a,12),dp(a,8));list.addView(heading);
  ScrollView scroll=new ScrollView(a);scroll.addView(list);int width=Math.min(dp(a,320),a.getResources().getDisplayMetrics().widthPixels-dp(a,16));PopupWindow popup=new PopupWindow(scroll,width,Math.min(dp(a,52*(items.length+1)),Math.max(dp(a,48),anchor.getHeight()-dp(a,16))),true);popup.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));popup.setOutsideTouchable(true);popup.setElevation(dp(a,8));
  for(Item item:items){TextView row=new TextView(a);row.setText(item.title);row.setTypeface(font(a));row.setTextSize(16);row.setTextColor(-1);row.setGravity(Gravity.CENTER_VERTICAL);row.setPadding(dp(a,12),dp(a,10),dp(a,12),dp(a,10));row.setMinHeight(dp(a,48));row.setFocusable(true);row.setBackgroundResource(android.R.drawable.list_selector_background);list.addView(row,new LinearLayout.LayoutParams(-1,-2));row.setOnClickListener(v->{popup.dismiss();item.action.run();});}
  popup.showAtLocation(anchor,Gravity.BOTTOM|Gravity.LEFT,dp(a,8),dp(a,64));return popup;
 }
}
