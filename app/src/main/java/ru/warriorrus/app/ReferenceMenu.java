package ru.warriorrus.app;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.*;
import android.widget.*;

/** Original-style section headings and flat action rows, using the app's blue palette. */
public final class ReferenceMenu {
  public static final int TEXT=0xff082e4c, MUTED=0xff427da9, PANEL=0xf2c7e1f8;
  private final Context context;
  public ReferenceMenu(Context context){this.context=context;}
  public int dp(int n){return Math.round(n*context.getResources().getDisplayMetrics().density);}
  public GradientDrawable background(){GradientDrawable d=new GradientDrawable();d.setColor(PANEL);d.setCornerRadius(dp(4));return d;}
  public LinearLayout panel(){LinearLayout p=new LinearLayout(context);p.setOrientation(LinearLayout.VERTICAL);p.setPadding(dp(6),dp(6),dp(6),dp(6));p.setBackground(background());return p;}
  public LinearLayout heading(LinearLayout panel,String title,String glyph,Runnable action){LinearLayout row=new LinearLayout(context);row.setGravity(Gravity.CENTER_VERTICAL);TextView text=new TextView(context);text.setText(title.toUpperCase(java.util.Locale.ROOT));text.setTextSize(11);text.setTextColor(MUTED);text.setPadding(dp(5),dp(10),dp(5),dp(10));row.addView(text,new LinearLayout.LayoutParams(-2,-2));View line=new View(context);line.setBackgroundColor(0x446ca7d2);row.addView(line,new LinearLayout.LayoutParams(0,dp(1),1));if(action!=null){Button b=action(glyph,action);b.setContentDescription(title);row.addView(b,new LinearLayout.LayoutParams(dp(40),dp(40)));}panel.addView(row);return row;}
  public Button action(String text,Runnable command){Button b=new Button(context);b.setText(text);b.setContentDescription(text);b.setTextColor(TEXT);b.setTextSize(16);b.setAllCaps(false);b.setMinWidth(0);b.setMinimumWidth(0);b.setMinHeight(dp(48));b.setPadding(dp(8),dp(4),dp(8),dp(4));b.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);android.graphics.drawable.StateListDrawable selector=new android.graphics.drawable.StateListDrawable();selector.addState(new int[]{android.R.attr.state_pressed},new android.graphics.drawable.ColorDrawable(0xff86bfee));selector.addState(new int[]{},new android.graphics.drawable.ColorDrawable(android.graphics.Color.TRANSPARENT));b.setBackground(selector);b.setOnClickListener(v->command.run());return b;}
  public Button row(LinearLayout panel,String title,int icon,Runnable command){Button b=action(title,command);if(icon!=0){b.setCompoundDrawablesRelativeWithIntrinsicBounds(icon,0,0,0);b.setCompoundDrawablePadding(dp(10));}panel.addView(b,new LinearLayout.LayoutParams(-1,-2));return b;}
  public CheckBox option(LinearLayout panel,String text,boolean checked,java.util.function.Consumer<Boolean> change){CheckBox b=new CheckBox(context);b.setText(text);b.setTextSize(15);b.setTextColor(TEXT);b.setMinHeight(dp(44));b.setChecked(checked);b.setPadding(dp(3),dp(3),dp(3),dp(3));b.setOnCheckedChangeListener((v,on)->change.accept(on));panel.addView(b,new LinearLayout.LayoutParams(-1,-2));return b;}
  public TextView note(LinearLayout panel,String value){TextView t=new TextView(context);t.setText(value);t.setTextSize(12);t.setTextColor(MUTED);t.setTypeface(null,Typeface.ITALIC);t.setPadding(dp(8),dp(8),dp(8),dp(8));panel.addView(t);return t;}
}
