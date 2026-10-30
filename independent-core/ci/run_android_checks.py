"""Runs only on a disposable emulator. A failed instrumentation result fails CI."""
from pathlib import Path
import argparse,hashlib,json,subprocess,time
p=argparse.ArgumentParser()
p.add_argument('--adb',type=Path,required=True)
p.add_argument('--serial',required=True)
p.add_argument('--app',type=Path,required=True)
p.add_argument('--tests',type=Path,required=True)
p.add_argument('--output',type=Path,required=True)
p.add_argument('--install-timeout',type=int,default=180,help='Package installation timeout for software emulators')
p.add_argument('--keep-going',action='store_true',help='Collect independent failures; skip reopen scenarios whose fixture failed; still exit nonzero')
p.add_argument('--no-streaming',action='store_true',help='Push APKs before installation when streamed install is unreliable')
modes=['binary','independence','offlineformats','cachewrites','cacheexport','launcher','coordinates','catalogscreen','geometryedit','geometrymap','geometrymapreopen','objectmanager','objectmanagerreopen','clipboard','clipboardreopen','managerfilters','managerfiltersreopen','managervisibility','managervisibilityreopen','managerdates','managerdatesreopen','managerdescription','managerdescriptionreopen','managercontext','managercontextreopen']
p.add_argument('--modes',nargs='+',choices=modes,default=modes,help='Run the selected scenarios in this order; default: full suite')
a=p.parse_args();out=a.output.resolve();out.mkdir(parents=True,exist_ok=True)
for i,mode in enumerate(a.modes):
 if mode=='managercontextreopen' and (i==0 or a.modes[i-1]!='managercontext'):p.error('managercontextreopen must immediately follow managercontext')
 if mode=='managerdescriptionreopen' and (i==0 or a.modes[i-1]!='managerdescription'):p.error('managerdescriptionreopen must immediately follow managerdescription')
 if mode=='managerdatesreopen' and (i==0 or a.modes[i-1]!='managerdates'):p.error('managerdatesreopen must immediately follow managerdates')
 if mode=='managervisibilityreopen' and (i==0 or a.modes[i-1]!='managervisibility'):p.error('managervisibilityreopen must immediately follow managervisibility')
 if mode=='managerfiltersreopen' and (i==0 or a.modes[i-1]!='managerfilters'):p.error('managerfiltersreopen must immediately follow managerfilters')
 if mode=='clipboardreopen' and (i==0 or a.modes[i-1]!='clipboard'):p.error('clipboardreopen must immediately follow clipboard')
 if mode=='objectmanagerreopen' and (i==0 or a.modes[i-1]!='objectmanager'):p.error('objectmanagerreopen must immediately follow objectmanager')
 if mode=='geometrymapreopen' and (i==0 or a.modes[i-1]!='geometrymap'):p.error('geometrymapreopen must immediately follow geometrymap')
if a.install_timeout<=0:p.error('--install-timeout must be positive')
if not a.serial.startswith('emulator-'):raise SystemExit('Only a disposable emulator serial is accepted')
def adb(*args,timeout=60,required=True):
 try:r=subprocess.run([str(a.adb),'-s',a.serial,*map(str,args)],stdin=subprocess.DEVNULL,capture_output=True,text=True,timeout=timeout)
 except (subprocess.TimeoutExpired,OSError) as error:
  if required:raise
  return str(error)
 text=r.stdout+r.stderr
 if required and (r.returncode or 'Failure [' in text):raise RuntimeError(text)
 return text
if adb('shell','getprop','ro.kernel.qemu').strip()!='1':raise SystemExit('Refusing to clear data on a physical device')
if adb('shell','getprop','sys.boot_completed').strip()!='1':raise SystemExit('Android has not finished booting')
print('INSTALL application and instrumentation',flush=True)
install=['install','-r']+(['--no-streaming'] if a.no_streaming else [])
adb(*install,a.app.resolve(),timeout=a.install_timeout);adb(*install,a.tests.resolve(),timeout=a.install_timeout)
sha=hashlib.sha256(a.app.read_bytes()).hexdigest();records=[]
for mode in a.modes:
 if a.keep_going and mode.endswith('reopen') and (not records or not records[-1]['passed']):
  records.append({'mode':mode,'passed':False,'skipped':True,'reason':'Preceding fixture failed','seconds':0})
  (out/'results.json').write_text(json.dumps(records,indent=2)+'\n')
  print('SKIP '+mode+': preceding fixture failed',flush=True)
  continue
 print('RUN '+mode,flush=True)
 started=time.monotonic();passed=False;text=''
 try:
  # Fixtures and settings never come from a personal installation.
  adb('shell','am','force-stop','org.rabochaya.karta')
  if mode not in ['geometrymapreopen','objectmanagerreopen','clipboardreopen','managerfiltersreopen','managervisibilityreopen','managerdatesreopen','managerdescriptionreopen','managercontextreopen']:adb('shell','pm','clear','org.rabochaya.karta')
  elif not records or records[-1]['mode']!=({'managercontextreopen':'managercontext','managerdescriptionreopen':'managerdescription','managerdatesreopen':'managerdates','geometrymapreopen':'geometrymap','objectmanagerreopen':'objectmanager','clipboardreopen':'clipboard','managerfiltersreopen':'managerfilters','managervisibilityreopen':'managervisibility'}[mode]) or not records[-1]['passed']:raise RuntimeError('Missing successful map-edit handoff')
  adb('logcat','-c')
  text=adb('shell','am','instrument','-w','-r','-e','mode',mode,'-e','sha',sha,'-e','version','27','org.rabochaya.maptests/org.rabochaya.maptests.MapAndroidChecks',timeout=480)
  passed=('PASS '+mode+':' in text and 'INSTRUMENTATION_CODE: -1' in text and 'FAIL\n' not in text and 'INSTRUMENTATION_FAILED' not in text)
 except Exception as error:text+=str(error)
 finally:
  (out/(mode+'.txt')).write_text(text)
  (out/(mode+'-logcat.txt')).write_text(adb('logcat','-d','-t','1000',required=False))
  # The emulator contains synthetic QA data only. Do not pull private databases.
  adb('pull','/sdcard/Android/data/org.rabochaya.karta/files',out/mode,required=False)
  records.append({'mode':mode,'passed':passed,'seconds':round(time.monotonic()-started,2)})
  (out/'results.json').write_text(json.dumps(records,indent=2)+'\n')
 print(('PASS ' if passed else 'FAIL ')+mode,flush=True)
 if not passed:
  print(text,flush=True)
  if not a.keep_going:raise SystemExit('Android scenario failed: '+mode)
failed=[r['mode'] for r in records if not r['passed']]
if failed:raise SystemExit('Android scenarios failed or skipped: '+', '.join(failed))
print('All selected Android scenarios passed; this is not full 26.1 acceptance')
