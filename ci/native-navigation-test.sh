#!/usr/bin/env bash
set -u
navigation_mode="$1"
adb shell cmd overlay enable-exclusive --category "com.android.internal.systemui.navbar.${navigation_mode}" || exit 1
gradle connectedDebugAndroidTest
native_test_status=$?
mkdir -p app/build/native-screens
adb exec-out run-as ru.warriorrus.app tar -C files -cf - native-screens > app/build/native-screens.tar
if [ -s app/build/native-screens.tar ]; then
  tar -xf app/build/native-screens.tar -C app/build
fi
exit "$native_test_status"
