package org.rabochaya.maptests;

import java.util.Locale;

/** Test-only adapter for Android Button's all-caps accessibility text. */
public final class UiText {
 public static boolean matches(CharSequence actual,CharSequence widgetClass,String expected,boolean exact,Locale locale){
  if(actual==null)return false;
  String value=actual.toString();
  if(exact?value.equals(expected):value.contains(expected))return true;
  // Do not normalize object names, descriptions, text fields or arbitrary case.
  if(!"android.widget.Button".contentEquals(widgetClass==null?"":widgetClass))return false;
  String rendered=expected.toUpperCase(locale);
  return exact?value.equals(rendered):value.contains(rendered);
 }
}
