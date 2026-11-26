package org.rabochaya.projects;
import android.app.Activity;import android.graphics.*;import android.graphics.drawable.*;import android.view.*;import android.widget.*;import java.io.*;import java.util.*;
/** Own widgets using local artwork and the selected font. No external UI SDK. */
public final class WorkspaceUi {
 public static List<org.w3c.dom.Element> orderedChildren(List<org.w3c.dom.Element> children,int sort){
  if(sort<=0||sort>=ObjectListing.SORTS.length)return children;
  List<org.w3c.dom.Element> sorted=new ArrayList<>(children);
  java.text.Collator collator=ObjectListing.listingCollator();
  Map<org.w3c.dom.Element,Integer> kinds=new IdentityHashMap<>();
  Map<org.w3c.dom.Element,String> names=new IdentityHashMap<>();
  for(org.w3c.dom.Element element:children){
   if(sort==3)kinds.put(element,ObjectListing.classify(element));
   names.put(element,KmlProject.name(element));
  }
  Collections.sort(sorted,(a,b)->ObjectListing.compareEntries(collator,sort,
    sort==3?kinds.get(a):0,sort==3?kinds.get(b):0,names.get(a),names.get(b)));
  return sorted;
 }

 public static final int TEXT=0xff082e4c,PANEL=0xf2c7e1f8,MUTED=0xff427da9; // Confirmed blue palette: ReferenceMenu0b78cecc; not complete13-screen parity.
 private static Typeface font;private static final Map<String,Bitmap> icons=new HashMap<>();
 public static int dp(Activity a,float n){return (int)(a.getResources().getDisplayMetrics().density*n+.5f);}
 public static Typeface font(Activity a){return font((android.content.Context)a);}
 public static Typeface font(android.content.Context a){if(font==null)font=Typeface.createFromAsset(a.getAssets(),"fonts/Arimo-Regular.ttf");return font;}
 public static Typeface styledFont(Activity activity,Typeface current){
  Typeface family=font(activity);
  int style=current==null?Typeface.NORMAL:current.getStyle();
  switch(style){
   case Typeface.BOLD:return Typeface.create(family,Typeface.BOLD);
   case Typeface.ITALIC:return Typeface.create(family,Typeface.ITALIC);
   case Typeface.BOLD_ITALIC:return Typeface.create(family,Typeface.BOLD_ITALIC);
   default:return Typeface.create(family,Typeface.NORMAL);
  }
 }
 static void applyFont(Activity activity, View view) {
  if (view instanceof TextView) {
   TextView text = (TextView)view;
   text.setTypeface(styledFont(activity,text.getTypeface()));
  }
  if (view instanceof ViewGroup) {
   ViewGroup group = (ViewGroup)view;
   for (int i=0; i<group.getChildCount(); i++) applyFont(activity,group.getChildAt(i));
  }
 }
 public static void showDialog(Activity activity,android.app.AlertDialog.Builder builder) {
  showDialog(activity,builder.create());
 }
 static void showDialog(Activity activity,android.app.AlertDialog dialog) {
  dialog.show();
  applyFont(activity,dialog.getWindow().getDecorView());
 }
 static void systemBars(Activity activity) {
  activity.getWindow().setStatusBarColor(MapHud.BAR);
  activity.getWindow().setNavigationBarColor(MapHud.BAR);
 }
 static GradientDrawable panel(Activity activity, int color, int edge, int radius) {
  GradientDrawable background = new GradientDrawable();
  background.setColor(color);
  background.setCornerRadius(dp(activity, radius));
  background.setStroke(dp(activity, 1), edge);
  return background;
 }
 static GradientDrawable panel(Activity activity) {
  return panel(activity, PANEL, 0xff6ca7d2, 8);
 }
 static Button button(Activity activity, String title, Runnable action) {
  Button button = new Button(activity);
  button.setText(title);
  button.setAllCaps(false);
  button.setTypeface(font(activity));
  button.setTextColor(TEXT);
  button.setBackground(new RippleDrawable(android.content.res.ColorStateList.valueOf(0x30082e4c), panel(activity), null));
  button.setMinHeight(dp(activity, MapHud.TOUCH_DP));
  button.setOnClickListener(view -> action.run());
  return button;
 }
 public static ImageButton icon(Activity a,String name,String title,Runnable action){
  ImageButton b=new ImageButton(a);Bitmap image=icons.get(name);if(image==null)try(InputStream in=a.getAssets().open("workspace-icons/"+name+".png")){image=BitmapFactory.decodeStream(in);if(image==null)throw new IOException(name);icons.put(name,image);}catch(IOException e){throw new IllegalStateException("Missing local icon: "+name,e);}
  b.setImageBitmap(image);b.setColorFilter(TEXT,PorterDuff.Mode.SRC_IN);b.setScaleType(ImageView.ScaleType.FIT_CENTER);int p=dp(a,10);b.setPadding(p,p,p,p);b.setContentDescription(title);b.setBackground(panel(a));b.setOnClickListener(v->action.run());b.setOnLongClickListener(v->{Toast.makeText(a,title,Toast.LENGTH_SHORT).show();return true;});return b;
 }
 public static final class Item {
  final String title;
  final Runnable action;
  final Boolean checked;
  public Item(String title, Runnable action) { this(title, action, null); }
  private Item(String title, Runnable action, Boolean checked) {
   this.title=title;
   this.action=action;
   this.checked=checked;
  }
  static Item toggle(String title, boolean checked, Runnable action) {
   return new Item(title,action,checked);
  }
 }
 static PopupWindow menu(Activity a, View anchor, MapDock dock, String title, Item... items) {
  LinearLayout list = new LinearLayout(a);
  list.setOrientation(LinearLayout.VERTICAL);
  int margin = dp(a, 8);
  list.setPadding(margin, margin, margin, margin);
  list.setBackground(panel(a));

  TextView heading = new TextView(a);
  heading.setTypeface(font(a), Typeface.BOLD);
  heading.setText(title);
  heading.setTextSize(18);
  heading.setTextColor(TEXT);
  heading.setPadding(dp(a, 12), margin, dp(a, 12), margin);
  list.addView(heading);

  ScrollView scroll = new ScrollView(a);
  scroll.addView(list);
  PopupWindow popup = new PopupWindow(scroll, 1, 1, true);
  popup.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
  popup.setOutsideTouchable(true);
  popup.setElevation(margin);
  for (Item item : items) {
   TextView row;
   if (item.checked != null) {
    CheckBox checkable=new CheckBox(a);
    checkable.setChecked(item.checked);
    checkable.setButtonTintList(android.content.res.ColorStateList.valueOf(TEXT));
    row=checkable;
   } else row=new TextView(a);
   row.setText(item.title);
   row.setTypeface(font(a));
   row.setTextSize(16);
   row.setTextColor(TEXT);
   row.setGravity(Gravity.CENTER_VERTICAL);
   row.setPadding(dp(a, 12), dp(a, 10), dp(a, 12), dp(a, 10));
   row.setMinHeight(dp(a, MapHud.TOUCH_DP));
   row.setFocusable(true);
   row.setBackgroundResource(android.R.drawable.list_selector_background);
   list.addView(row, new LinearLayout.LayoutParams(-1, -2));
   row.setOnClickListener(view -> {
    popup.dismiss();
    item.action.run();
   });
  }

  Runnable resize = () -> {
   int width = Math.max(1, Math.min(dp(a, 320), anchor.getWidth() - 2 * margin));
   list.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
     View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
   int clearance = dock.menuClearance(anchor.getWidth());
   int height = Math.max(1, Math.min(list.getMeasuredHeight(), anchor.getHeight() - clearance - margin));
   int yOffset = -height - clearance;
   if (popup.isShowing()) {
    popup.update(anchor, margin, yOffset, width, height);
   } else {
    popup.setWidth(width);
    popup.setHeight(height);
    popup.showAsDropDown(anchor, margin, yOffset, Gravity.LEFT);
   }
  };
  View.OnLayoutChangeListener reflow = (view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
   if (right - left != oldRight - oldLeft || bottom - top != oldBottom - oldTop) resize.run();
  };
  resize.run();
  anchor.addOnLayoutChangeListener(reflow);
  popup.setOnDismissListener(() -> anchor.removeOnLayoutChangeListener(reflow));
  return popup;
 }
}
