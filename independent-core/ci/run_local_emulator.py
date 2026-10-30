"""Boot a fresh disposable AVD and run QA in the same process/network context.

Requires an installed emulator, platform-tools and default system image in --sdk.
APKs must already have been signed with the same disposable QA key.
"""
from pathlib import Path
import argparse, hashlib, json, os, signal, subprocess, tempfile, time

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--sdk', type=Path, required=True)
p.add_argument('--app', type=Path, required=True)
p.add_argument('--tests', type=Path, required=True)
p.add_argument('--output', type=Path, required=True)
p.add_argument('--api', type=int, default=23)
p.add_argument('--abi', choices=['x86', 'x86_64'])
p.add_argument('--boot-timeout', type=int, default=720)
p.add_argument('--install-timeout', type=int, default=180)
p.add_argument('--no-streaming', action='store_true')
p.add_argument('--modes', nargs='+', choices=['binary', 'independence', 'offlineformats', 'cachewrites', 'cacheexport', 'launcher', 'coordinates', 'catalogscreen', 'geometryedit','geometrymap','geometrymapreopen','objectmanager','objectmanagerreopen','clipboard','clipboardreopen','managerfilters','managerfiltersreopen','managervisibility','managervisibilityreopen','managerdates','managerdatesreopen','managerdescription','managerdescriptionreopen','managercontext','managercontextreopen'])
a = p.parse_args()
sdk, out = a.sdk.resolve(), a.output.resolve()
abi = a.abi or ('x86' if a.api == 23 else 'x86_64')
adb, emulator = sdk/'platform-tools/adb', sdk/'emulator/emulator'
image = sdk/f'system-images/android-{a.api}/default/{abi}'
for f in [adb, emulator, image/'system.img', a.app, a.tests]:
    if not f.is_file(): p.error('Missing required file: '+str(f))
if a.boot_timeout <= 0: p.error('--boot-timeout must be positive')
if a.install_timeout <= 0: p.error('--install-timeout must be positive')
out.mkdir(parents=True, exist_ok=True)
if (out/'local-run.json').exists(): p.error('Use a fresh output directory to retain earlier results')
report = {'api': a.api, 'abi': abi, 'hardware_acceleration': False,
          'boot_completed': False, 'tests_started': False,
          'app_sha256': hashlib.sha256(a.app.read_bytes()).hexdigest(),
          'tests_sha256': hashlib.sha256(a.tests.read_bytes()).hexdigest()}
result = 1

def stop(child):
    if child is None: return
    # The launcher may spawn QEMU. Stop only this launcher's private process group.
    try: os.killpg(child.pid, signal.SIGTERM)
    except ProcessLookupError: return
    try: child.wait(timeout=15)
    except subprocess.TimeoutExpired:
        try: os.killpg(child.pid, signal.SIGKILL)
        except ProcessLookupError: pass
        child.wait()

with tempfile.TemporaryDirectory(prefix='rk-avd-', dir=out) as folder:
    work = Path(folder); avd = work/'avds/localqa.avd'; avd.mkdir(parents=True)
    (avd.parent/'localqa.ini').write_text(f'avd.ini.encoding=UTF-8\npath={avd}\ntarget=android-{a.api}\n')
    (avd/'config.ini').write_text(f'''avd.ini.encoding=UTF-8
AvdId=localqa
abi.type={abi}
hw.cpu.arch={abi}
hw.cpu.ncore=2
hw.ramSize={1536 if a.api == 23 else 2048}
hw.lcd.width=480
hw.lcd.height=800
hw.lcd.density=160
hw.keyboard=yes
hw.mainKeys=no
hw.sdCard=no
hw.audioInput=no
hw.audioOutput=no
hw.camera.back=none
hw.camera.front=none
disk.dataPartition.size=1536M
image.sysdir.1={image}/
tag.id=default
fastboot.forceColdBoot=yes
''')
    env = os.environ.copy()
    env.update(ANDROID_AVD_HOME=str(avd.parent), ANDROID_SDK_ROOT=str(sdk), ANDROID_USER_HOME=str(work/'android-home'), ANDROID_I_WANT_MY_TCG='yes')
    (work/'android-home').mkdir()
    def command(*args, timeout=15):
        try:
            r = subprocess.run([str(adb), '-s', 'emulator-5554', *args], stdin=subprocess.DEVNULL, env=env, text=True, capture_output=True, timeout=timeout)
            return r.returncode, (r.stdout+r.stderr).strip()
        except subprocess.TimeoutExpired: return -1, 'adb timeout'
        except OSError as error: return -1, str(error)
    child = server = None
    with (out/'emulator.log').open('w') as log, (out/'adb-server.log').open('w') as serverlog:
        try:
            server = subprocess.Popen([str(adb), 'nodaemon', 'server'], env=env, stdout=serverlog, stderr=subprocess.STDOUT, start_new_session=True)
            time.sleep(1)
            if server.poll() is not None: raise RuntimeError('Private adb server did not start; use an isolated context')
            child = subprocess.Popen([str(emulator), '-avd', 'localqa', '-no-window', '-no-audio', '-no-snapshot', '-no-boot-anim', '-accel', 'off', '-gpu', 'swiftshader', '-port', '5554', '-no-metrics'], env=env, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
            started = time.monotonic(); last = -1
            while time.monotonic()-started < a.boot_timeout:
                if child.poll() is not None: raise RuntimeError('Emulator exited '+str(child.returncode))
                code, state = command('get-state')
                if code == 0 and state == 'device':
                    code, boot = command('shell', 'getprop', 'sys.boot_completed')
                    if code == 0 and boot == '1':
                        report.update(boot_completed=True, boot_seconds=round(time.monotonic()-started, 1)); break
                elapsed = int(time.monotonic()-started)
                if elapsed//30 != last:
                    last = elapsed//30; print(f'BOOT {elapsed}s: {state}', flush=True)
                time.sleep(5)
            else: raise RuntimeError('Android did not finish booting before the timeout')
            print('Android boot completed', flush=True)
            report['tests_started'] = True
            args = ['python3', str(Path(__file__).with_name('run_android_checks.py')), '--adb', str(adb), '--serial', 'emulator-5554', '--app', str(a.app.resolve()), '--tests', str(a.tests.resolve()), '--output', str(out/'scenarios'), '--install-timeout', str(a.install_timeout)]
            if a.no_streaming: args += ['--no-streaming']
            if a.modes: args += ['--modes', *a.modes]
            result = subprocess.call(args, env=env)
            report['test_driver_exit_code'] = result
        except KeyboardInterrupt:
            report['error'] = 'Interrupted'; result = 130
        except Exception as error:
            report['error'] = str(error); print(str(error), flush=True)
        finally:
            for args, name in [(('shell', 'getprop'), 'properties.txt'), (('logcat', '-d', '-t', '1500'), 'logcat.txt')]:
                _, text = command(*args); (out/name).write_text(text)
            stop(child); stop(server)
            (out/'local-run.json').write_text(json.dumps(report, indent=2)+'\n')
raise SystemExit(result)
