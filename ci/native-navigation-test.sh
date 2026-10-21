#!/usr/bin/env bash
set -u
navigation_mode="$1"
adb shell cmd overlay enable-exclusive --category "com.android.internal.systemui.navbar.${navigation_mode}" || exit 1
adb shell settings put secure immersive_mode_confirmations confirmed || exit 1
gradle connectedDebugAndroidTest
native_test_status=$?
mkdir -p app/build/native-screens
if ! adb pull /data/local/tmp/rabochaya-screens app/build/native-screens; then
  if [ "$native_test_status" -eq 0 ]; then native_test_status=1; fi
fi
exit "$native_test_status"
