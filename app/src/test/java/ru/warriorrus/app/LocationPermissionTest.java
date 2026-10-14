package ru.warriorrus.app;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

/** Regression guard: map networking must never introduce location permissions. */
@RunWith(RobolectricTestRunner.class)
public final class LocationPermissionTest {
  @Test
  public void appRequestsInternetButNoLocationPermissions() throws Exception {
    Context context = RuntimeEnvironment.getApplication();
    PackageInfo info = context.getPackageManager().getPackageInfo(
        context.getPackageName(), PackageManager.GET_PERMISSIONS);
    List<String> permissions = info.requestedPermissions == null
        ? Collections.emptyList()
        : Arrays.asList(info.requestedPermissions);
    assertTrue(permissions.contains(Manifest.permission.INTERNET));
    assertFalse(permissions.contains(Manifest.permission.ACCESS_FINE_LOCATION));
    assertFalse(permissions.contains(Manifest.permission.ACCESS_COARSE_LOCATION));
    assertFalse(permissions.contains("android.permission.ACCESS_BACKGROUND_LOCATION"));
  }
}
