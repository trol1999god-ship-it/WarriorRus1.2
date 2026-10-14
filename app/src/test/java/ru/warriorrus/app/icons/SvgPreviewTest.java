package ru.warriorrus.app.icons;

import static org.junit.Assert.*;

import android.graphics.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SvgPreviewTest {
  @Test
  public void rendersSvgGeometryAndTint() throws Exception {
    String svg =
        "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 10 10'><rect x='2' y='2' width='6'"
            + " height='6'/></svg>";
    Bitmap bitmap =
        SvgPreview.render(RuntimeEnvironment.getApplication().getResources(), svg, Color.RED, 100)
            .getBitmap();
    assertEquals(Color.RED, bitmap.getPixel(50, 50));
    assertEquals(0, Color.alpha(bitmap.getPixel(0, 0)));
  }

  @Test
  public void refusesExternalAndActiveContent() throws Exception {
    String[] bad = {
      "<!DOCTYPE svg [<!ENTITY x SYSTEM 'https://example.com'>]><svg>&x;</svg>",
      "<svg><script/></svg>",
      "<svg><image href='https://example.com/a.png'/></svg>",
      "<svg><use href='file:///sdcard/a.svg'/></svg>",
      "<svg><style>@import 'https://example.com';</style></svg>",
      "<svg><rect style='fill:url(https://example.com)'/></svg>",
      "<svg onload='run()'/>",
      "<html/>"
    };
    for (String svg : bad) {
      try {
        SvgPreview.parse(svg);
        fail(svg);
      } catch (Exception expected) {
      }
    }
  }

  @Test
  public void allowsLocalUseAndRejectsOversizedFiles() throws Exception {
    SvgPreview.parse(
        "<svg xmlns='http://www.w3.org/2000/svg'><defs><linearGradient id='g'/></defs><rect"
            + " width='10' height='10' fill='url(#g)'/></svg>");
    SvgPreview.parse(
        "<svg xmlns='http://www.w3.org/2000/svg'><defs><path id='p' d='M0 0 L10 10'/></defs><use"
            + " href='#p'/></svg>");
    try {
      SvgPreview.read(new java.io.ByteArrayInputStream(new byte[SvgPreview.MAX_BYTES + 1]));
      fail();
    } catch (java.io.IOException expected) {
    }
  }
}
