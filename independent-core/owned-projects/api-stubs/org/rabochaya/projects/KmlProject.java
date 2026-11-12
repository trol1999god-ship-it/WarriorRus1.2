package org.rabochaya.projects;
import java.util.List;import java.io.IOException;
/** Compile-time ABI only. Never package this class. Production implementation is preserved smali. */
public final class KmlProject {
 public static final class Feature {public org.w3c.dom.Element element;public String name;public int color;public List<Geometry> shapes;}
 public static final class Geometry {public String type;public List<List<double[]>> rings;}
 public java.util.LinkedHashMap<String,byte[]> assets;
 public String entry;
 public byte[] xml()throws IOException{throw new AssertionError("ABI stub");}
 public static String safePath(String p)throws IOException{throw new AssertionError("ABI stub");}
 public org.w3c.dom.Element root(){throw new AssertionError("ABI stub");}
 public org.w3c.dom.Element byId(String id){throw new AssertionError("ABI stub");}
 public static KmlProject parse(byte[] bytes)throws IOException{throw new AssertionError("ABI stub");}
 public static org.w3c.dom.Element child(org.w3c.dom.Element e,String name){throw new AssertionError("ABI stub");}
 public static String text(org.w3c.dom.Element e,String name){throw new AssertionError("ABI stub");}
 public List<Feature> features(boolean visible)throws IOException{throw new AssertionError("ABI stub");}
}
