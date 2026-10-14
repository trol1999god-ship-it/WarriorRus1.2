package ru.warriorrus.app.icons;

import static org.junit.Assert.*;

import android.content.*;
import android.view.*;
import android.widget.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = {23, 35},
    shadows = IconsActivityTest.MediaContext.class)
public class IconsActivityTest {
  // Robolectric does not provision a real external media volume. Supply a mounted
  // media directory while exercising the real library, UI and manifest permissions.
  @org.robolectric.annotation.Implements(
      className = "android.app.ContextImpl",
      isInAndroidSdk = false)
  public static class MediaContext extends org.robolectric.shadows.ShadowContextImpl {
    @org.robolectric.annotation.Implementation
    protected java.io.File[] getExternalMediaDirs() {
      java.io.File base =
          new java.io.File(
              org.robolectric.RuntimeEnvironment.getApplication().getFilesDir(), "shared-media");
      return new java.io.File[] {new java.io.File(base, "Android/media/ru.warriorrus.app")};
    }
  }

  @Test
  public void usesPublicAppMediaWithoutBroadStoragePermissions() throws Exception {
    try (org.robolectric.android.controller.ActivityController<IconsActivity> controller =
        Robolectric.buildActivity(IconsActivity.class).setup()) {
      IconsActivity a = controller.get();
      IconLibrary library = IconLibrary.open(a);
      assertTrue(
          library
              .root
              .getAbsolutePath()
              .replace('\\', '/')
              .endsWith("Android/media/ru.warriorrus.app/icons"));
      android.content.pm.PackageInfo pkg =
          a.getPackageManager()
              .getPackageInfo(
                  a.getPackageName(), android.content.pm.PackageManager.GET_PERMISSIONS);
      Set<String> permissions =
          pkg.requestedPermissions == null
              ? Collections.emptySet()
              : new HashSet<>(Arrays.asList(pkg.requestedPermissions));
      assertTrue(permissions.contains("android.permission.INTERNET"));
      assertFalse(permissions.contains("android.permission.READ_EXTERNAL_STORAGE"));
      assertFalse(permissions.contains("android.permission.WRITE_EXTERNAL_STORAGE"));
      assertFalse(permissions.contains("android.permission.MANAGE_EXTERNAL_STORAGE"));
      assertFalse(permissions.contains("android.permission.ACCESS_FINE_LOCATION"));
      assertFalse(permissions.contains("android.permission.ACCESS_COARSE_LOCATION"));
      find(a.getWindow().getDecorView(), "Встроенные 🔒").performClick();
      assertNotNull(find(a.getWindow().getDecorView(), "🔒 pin"));
      find(a.getWindow().getDecorView(), "Пользовательские").performClick();
      java.io.File usbFolder = new java.io.File(library.root, "USB");
      assertTrue(usbFolder.mkdir());
      try (java.io.FileOutputStream out =
          new java.io.FileOutputStream(new java.io.File(usbFolder, "usb.svg"))) {
        out.write(IconLibrary.PIN.getBytes(java.nio.charset.StandardCharsets.UTF_8));
      }
      Shadows.shadowOf(android.os.Looper.getMainLooper())
          .idleFor(3, java.util.concurrent.TimeUnit.SECONDS);
      assertNotNull(find(a.getWindow().getDecorView(), "📁 USB"));
      find(a.getWindow().getDecorView(), "📁 USB").performClick();
      assertNotNull(find(a.getWindow().getDecorView(), "usb.svg"));
      find(a.getWindow().getDecorView(), "Импорт SVG").performClick();
      Intent intent = Shadows.shadowOf(a).getNextStartedActivityForResult().intent;
      assertEquals(Intent.ACTION_OPEN_DOCUMENT, intent.getAction());
      assertTrue(intent.getBooleanExtra(Intent.EXTRA_ALLOW_MULTIPLE, false));
    }
  }

  private View find(View v, String text) {
    if (v instanceof TextView && ((TextView) v).getText().toString().equals(text)) return v;
    if (v instanceof ViewGroup) {
      ViewGroup g = (ViewGroup) v;
      for (int n = 0; n < g.getChildCount(); n++) {
        View result = find(g.getChildAt(n), text);
        if (result != null) return result;
      }
    }
    return null;
  }
}
