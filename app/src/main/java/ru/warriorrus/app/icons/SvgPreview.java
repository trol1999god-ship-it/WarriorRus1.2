package ru.warriorrus.app.icons;

import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.BitmapDrawable;
import com.caverock.androidsvg.SVG;
import java.io.*;
import java.util.Locale;
import org.xmlpull.v1.*;

/** Deliberately local SVG subset: no scripts, entities, external images or CSS requests. */
public final class SvgPreview {
  public static final int MAX_BYTES = 262144;

  public static String read(InputStream input) throws IOException {
    ByteArrayOutputStream out = new ByteArrayOutputStream();
    byte[] block = new byte[8192];
    int n;
    while ((n = input.read(block)) != -1) {
      if (out.size() + n > MAX_BYTES) throw new IOException("SVG превышает 256 КиБ");
      out.write(block, 0, n);
    }
    return new String(out.toByteArray(), java.nio.charset.StandardCharsets.UTF_8);
  }

  private static boolean hasExternalUrl(String text) {
    String local = text.replaceAll("url\\s*\\(\\s*['\"]?#[^\\s)'\"]+['\"]?\\s*\\)", "");
    return java.util.regex.Pattern.compile("url\\s*\\(").matcher(local).find();
  }

  public static SVG parse(String text) throws Exception {
    if (text.getBytes(java.nio.charset.StandardCharsets.UTF_8).length > MAX_BYTES)
      throw new IOException("SVG превышает 256 КиБ");
    String low = text.toLowerCase(Locale.ROOT);
    if (low.contains("<!doctype")
        || low.contains("<!entity")
        || low.contains("@import")
        || hasExternalUrl(low)) throw new IOException("Внешние ресурсы и сущности SVG запрещены");
    javax.xml.parsers.DocumentBuilder builder =
        javax.xml.parsers.DocumentBuilderFactory.newInstance().newDocumentBuilder();
    builder.setEntityResolver(
        (publicId, systemId) -> {
          throw new org.xml.sax.SAXException("Внешние сущности запрещены");
        });
    builder.parse(new org.xml.sax.InputSource(new StringReader(text)));
    XmlPullParser p = XmlPullParserFactory.newInstance().newPullParser();
    p.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, true);
    p.setInput(new StringReader(text));
    int count = 0;
    boolean root = false;
    for (int event = p.getEventType(); event != XmlPullParser.END_DOCUMENT; event = p.next())
      if (event == XmlPullParser.START_TAG) {
        String tag = p.getName();
        if (!root) {
          if (!"svg".equals(tag)) throw new IOException("Ожидается SVG");
          root = true;
        }
        if (++count > 2000) throw new IOException("Слишком сложный SVG");
        if (tag.equalsIgnoreCase("script")
            || tag.equalsIgnoreCase("image")
            || tag.equalsIgnoreCase("foreignObject")
            || tag.startsWith("animate")
            || tag.equals("set")) throw new IOException("Неподдерживаемый активный элемент SVG");
        for (int a = 0; a < p.getAttributeCount(); a++) {
          String name = p.getAttributeName(a).toLowerCase(Locale.ROOT);
          if (name.startsWith("on")) throw new IOException("Обработчики SVG запрещены");
          if (name.equals("href") && !p.getAttributeValue(a).startsWith("#"))
            throw new IOException("Внешние ссылки SVG запрещены");
        }
      }
    if (!root) throw new IOException("Пустой SVG");
    return SVG.getFromString(text);
  }

  public static BitmapDrawable render(Resources resources, String text, int color, int size)
      throws Exception {
    SVG svg = parse(text);
    svg.setDocumentWidth(size);
    svg.setDocumentHeight(size);
    Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
    Canvas canvas = new Canvas(bitmap);
    svg.renderToCanvas(canvas);
    // A tint applies to the rendered alpha mask, preserving holes and partial transparency.
    Paint tint = new Paint();
    tint.setColor(color);
    tint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
    canvas.drawRect(0, 0, size, size, tint);
    return new BitmapDrawable(resources, bitmap);
  }
}
