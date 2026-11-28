#!/usr/bin/env bash
set -euo pipefail
rk_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
command -v python3 >/dev/null
command -v java >/dev/null
java -version
rk_sdk="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}"
if [[ -z "$rk_sdk" ]]; then
  echo 'Android SDK not configured: set ANDROID_HOME to an installed SDK.' >&2
  exit 2
fi
rk_manager="$rk_sdk/cmdline-tools/latest/bin/sdkmanager"
if [[ ! -x "$rk_manager" ]]; then
  echo 'Install Android command-line tools in the cloud environment first.' >&2
  exit 2
fi
"$rk_manager" 'platforms;android-23' 'build-tools;35.0.0' 'platform-tools' 'emulator'
cd "$rk_root"
python3 owned-projects/verify_jvm.py
echo 'SDK setup and JVM checks complete. Run Android QA separately; emulator results are not implied.'
