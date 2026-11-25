"""Runs only on a disposable emulator. A failed instrumentation result fails CI."""
from pathlib import Path
import argparse,hashlib,json,subprocess,time,re
from visual_evidence import emit_visual_evidence,emit_visual_summary
p=argparse.ArgumentParser()
p.add_argument('--adb',type=Path,required=True)
p.add_argument('--serial',required=True)
p.add_argument('--app',type=Path,required=True)
p.add_argument('--tests',type=Path,required=True)
p.add_argument('--output',type=Path,required=True)
p.add_argument('--install-timeout',type=int,default=180,help='Package installation timeout for software emulators')
p.add_argument('--debug-qa',action='store_true',help='Expect the explicit disposable debug profile in the installed app')
p.add_argument('--keep-going',action='store_true',help='Collect independent failures; skip reopen scenarios whose fixture failed; still exit nonzero')
p.add_argument('--no-streaming',action='store_true',help='Push APKs before installation when streamed install is unreliable')
p.add_argument('--transport-wait',type=float,default=15,help='Bounded same-boot adb readiness wait (0 < seconds <= 15); never reruns instrumentation')
modes=['binary','independence','offlineformats','ozf2','ozidata','iconlibrary','cachewrites','cacheexport','launcher','coordinates','catalogscreen','geometryedit','geometrymap','geometrymapreopen','objectmanager','objectmanagerreopen','clipboard','clipboardreopen','objectformats','objectformatsreopen','managerfilters','managerfiltersreopen','managervisibility','managervisibilityreopen','managerdates','managerdatesreopen','managerdescription','managerdescriptionreopen','managercontext','managercontextreopen','managervisual','managerrotation','managerforms','managermove','managerconfirm','managerpasteconfirm','managerchooser','vertexrotation','vertexscroll','geometryvertexconfirm','geometryholeconfirm','vertexinsertion','geometrynewhole','geometrynewholeguards','mapvertexconfirm','mapholeconfirm','mapundorotation','mappartconfirm','geometrycloseconfirm','maplayers','maplayersreopen','markerlifecycle','markerlifecyclereopen']
p.add_argument('--visual-log-modes',nargs='*',choices=modes+['acceptance','acceptance-resume'],default=['cacheexport','maplayersreopen'],help='Full console PNG previews for these modes; every visual mode still validates and retains all PNG artifacts')
p.add_argument('--modes',nargs='+',choices=modes+['svg','acceptance','acceptance-resume'],default=modes,help='Run the selected scenarios in this order; default: full suite')
a=p.parse_args();out=a.output.resolve();out.mkdir(parents=True,exist_ok=True)
if any(out.iterdir()):p.error('Output must be fresh; existing artifacts are preserved, never inherited')
if not 0<a.transport_wait<=15:p.error('--transport-wait must be positive and at most 15 seconds')
if len(a.modes)!=len(set(a.modes)):p.error('Duplicate modes would reuse artifact paths; use a fresh run instead')
for i,mode in enumerate(a.modes):
 if mode=='managercontextreopen' and (i==0 or a.modes[i-1]!='managercontext'):p.error('managercontextreopen must immediately follow managercontext')
 if mode=='managerdescriptionreopen' and (i==0 or a.modes[i-1]!='managerdescription'):p.error('managerdescriptionreopen must immediately follow managerdescription')
 if mode=='managerdatesreopen' and (i==0 or a.modes[i-1]!='managerdates'):p.error('managerdatesreopen must immediately follow managerdates')
 if mode=='managervisibilityreopen' and (i==0 or a.modes[i-1]!='managervisibility'):p.error('managervisibilityreopen must immediately follow managervisibility')
 if mode=='markerlifecyclereopen' and (i==0 or a.modes[i-1]!='markerlifecycle'):p.error('markerlifecyclereopen must immediately follow markerlifecycle')
 if mode=='managerfiltersreopen' and (i==0 or a.modes[i-1]!='managerfilters'):p.error('managerfiltersreopen must immediately follow managerfilters')
 if mode=='objectformatsreopen' and (i==0 or a.modes[i-1]!='objectformats'):p.error('objectformatsreopen must immediately follow objectformats')
 if mode=='clipboardreopen' and (i==0 or a.modes[i-1]!='clipboard'):p.error('clipboardreopen must immediately follow clipboard')
 if mode=='objectmanagerreopen' and (i==0 or a.modes[i-1]!='objectmanager'):p.error('objectmanagerreopen must immediately follow objectmanager')
 if mode=='geometrymapreopen' and (i==0 or a.modes[i-1]!='geometrymap'):p.error('geometrymapreopen must immediately follow geometrymap')
if 'maplayersreopen' in a.modes and (a.modes.index('maplayersreopen')==0 or a.modes[a.modes.index('maplayersreopen')-1]!='maplayers'):p.error('maplayersreopen must immediately follow maplayers')
if a.install_timeout<=0:p.error('--install-timeout must be positive')
if not a.serial.startswith('emulator-'):raise SystemExit('Only a disposable emulator serial is accepted')
boot_id=None;context_error=None;transport_events=[]
BOOT='/proc/sys/kernel/random/boot_id'
def save_transport(): (out/'adb-transport.json').write_text(json.dumps(transport_events,indent=2)+'\n')
def raw_adb(args,timeout):
 return subprocess.run([str(a.adb),'-s',a.serial,*map(str,args)],stdin=subprocess.DEVNULL,capture_output=True,text=True,timeout=timeout)
def safe_retry(args):
 return (args[:3] in [('shell','am','force-stop'),('shell','pm','clear')] and args[3:]==('org.rabochaya.karta',)) or args[0]=='logcat' or args[:2] in [('shell','getprop'),('shell','dumpsys')] or args==('shell','cat',BOOT) or (len(args)==3 and args[0]=='pull' and args[1]=='/sdcard/Android/data/org.rabochaya.karta/files' and Path(args[2]).parent==out and Path(args[2]).name in a.modes)
def invalidate(message):
 global context_error
 context_error=message
 raise RuntimeError(message)
def recover_transport(args,rejection,deadline=None):
 event={'mode':globals().get('mode'),'command':list(map(str,args[:3])),'retry':1,'same_boot':False,'first_rejection':rejection[-16384:]};transport_events.append(event)
 print('ADB_TRANSPORT_WAIT '+json.dumps(event),flush=True);save_transport();deadline=time.monotonic()+a.transport_wait if deadline is None else deadline
 try:
  def probe(*command):
   remaining=deadline-time.monotonic()
   if remaining<=0:raise RuntimeError('adb transport readiness deadline exceeded')
   result=raw_adb(command,min(3,remaining));return result.stdout.strip() if result.returncode==0 else ''
  while time.monotonic()<deadline:
   if probe('get-state')=='device':
    current=probe('shell','cat',BOOT)
    if current and current!=boot_id:invalidate('Emulator boot identity changed; refusing old evidence/context')
    if current==boot_id and probe('shell','getprop','ro.kernel.qemu')=='1' and probe('shell','getprop','sys.boot_completed')=='1':
     event['same_boot']=True;save_transport();print('ADB_TRANSPORT_RESUMED sameBoot=true retry=1',flush=True);return event
   time.sleep(min(.25,max(0,deadline-time.monotonic())))
  raise RuntimeError('adb transport readiness deadline exceeded')
 except Exception as error:
  event['error']=str(error);save_transport();raise
def adb(*args,timeout=60,required=True):
 try:
  if context_error and required:raise RuntimeError(context_error)
  r=raw_adb(args,timeout)
  text=r.stdout+r.stderr
  recovery_deadline=None
  # Some adb sync failures report only listing or partial progress, with exit1; the very
  # next read reports offline. Progress/exit1 alone never authorizes a retry.
  # Require an immediate explicit offline boot read, on this exact QA pull.
  if r.returncode==1 and boot_id and not context_error and args[0]=='pull' and safe_retry(args) and re.search(r'(?m)^(?:pull: building file list\.\.\.[ \r]*$|\[\s*\d+%\]\s+/sdcard/Android/data/org\.rabochaya\.karta/files/)',text) and 'device offline' not in text.lower():
   recovery_deadline=time.monotonic()+a.transport_wait
   try:
    probe=raw_adb(('shell','cat',BOOT),min(3,a.transport_wait));probe_text=probe.stdout+probe.stderr
    text+='\nPOST_PULL_BOOT_PROBE pull_returncode=1 probe_returncode='+str(probe.returncode)+'\n'+probe_text
    if probe.returncode==0 and probe.stdout.strip()!=boot_id:invalidate('Emulator boot identity changed after partial pull; refusing old evidence/context')
   except (subprocess.TimeoutExpired,OSError) as error:text+='\nPOST_PULL_BOOT_PROBE '+str(error)
  # Only explicit transport rejection of idempotent preparation/reads. Never
  # repeat am instrument (including an unknown/partial result) or a timeout.
  if r.returncode and 'device offline' in text.lower() and boot_id and not context_error and safe_retry(args):
   event=recover_transport(args,text,recovery_deadline)
   if args[0]=='pull':
    destination=Path(args[-1]);partial=destination.with_name(destination.name+'-offline-partial')
    if destination.exists():
     if partial.exists():raise RuntimeError('Partial artifact backup already exists; refusing overwrite')
     destination.rename(partial)
   r=raw_adb(args,timeout)
   text=r.stdout+r.stderr
   event['retry_returncode']=r.returncode;event['retry_output']=(r.stdout+r.stderr)[-16384:];save_transport()
 except (subprocess.TimeoutExpired,OSError) as error:
  if required:raise
  return str(error)
 except RuntimeError as error:
  if required:raise
  return str(error)
 if required and (r.returncode or 'Failure [' in text):raise RuntimeError('adb returncode='+str(r.returncode)+'\n'+text)
 return text
if adb('shell','getprop','ro.kernel.qemu').strip()!='1':raise SystemExit('Refusing to clear data on a physical device')
if adb('shell','getprop','sys.boot_completed').strip()!='1':raise SystemExit('Android has not finished booting')
boot_id=adb('shell','cat',BOOT).strip()
if not re.fullmatch(r'[0-9a-f]{8}(?:-[0-9a-f]{4}){3}-[0-9a-f]{12}',boot_id):raise SystemExit('Cannot establish emulator boot identity')
def same_boot():
 if adb('shell','cat',BOOT).strip()!=boot_id:invalidate('Emulator boot identity changed; refusing old evidence/context')
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
  same_boot()
  # Fixtures and settings never come from a personal installation.
  adb('shell','am','force-stop','org.rabochaya.karta')
  if mode not in ['geometrymapreopen','objectmanagerreopen','clipboardreopen','objectformatsreopen','managerfiltersreopen','managervisibilityreopen','managerdatesreopen','managerdescriptionreopen','managercontextreopen','maplayersreopen','markerlifecyclereopen']:adb('shell','pm','clear','org.rabochaya.karta')
  elif not records or records[-1]['mode']!=({'markerlifecyclereopen':'markerlifecycle','maplayersreopen':'maplayers','managercontextreopen':'managercontext','managerdescriptionreopen':'managerdescription','managerdatesreopen':'managerdates','geometrymapreopen':'geometrymap','objectmanagerreopen':'objectmanager','clipboardreopen':'clipboard','objectformatsreopen':'objectformats','managerfiltersreopen':'managerfilters','managervisibilityreopen':'managervisibility'}[mode]) or not records[-1]['passed']:raise RuntimeError('Missing successful map-edit handoff')
  adb('logcat','-c')
  text=adb('shell','am','instrument','-w','-r','-e','mode',mode,'-e','sha',sha,'-e','version','27','-e','debug_qa','true' if a.debug_qa else 'false','org.rabochaya.maptests/org.rabochaya.maptests.MapAndroidChecks',timeout=480)
  same_boot()
  passed=('PASS '+mode+':' in text and 'INSTRUMENTATION_CODE: -1' in text and 'FAIL\n' not in text and 'INSTRUMENTATION_FAILED' not in text)
 except Exception as error:text+=str(error)
 finally:
  (out/(mode+'.txt')).write_text(text)
  (out/(mode+'-logcat.txt')).write_text(adb('logcat','-d','-t','1000',required=False))
  if not passed:
   # Retain the actual foreground/focused windows; a missing accessibility
   # label alone does not distinguish an app defect from the wrong window.
   for service, detail in [('window','windows'), ('activity','activities')]:
    (out/(mode+'-'+service+'.txt')).write_text(adb('shell','dumpsys',service,detail,timeout=15,required=False))
  # The emulator contains synthetic QA data only. Do not pull private databases.
  try:pull_result=adb('pull','/sdcard/Android/data/org.rabochaya.karta/files',out/mode);pull_ok=True
  except Exception as error:pull_result=str(error);pull_ok=False
  (out/(mode+'-artifact-pull.txt')).write_text(pull_result[-16384:])
  actions={
   'acceptance-resume':[(step,'after') for step in ('accept-08-projects', 'accept-09-card', 'accept-11-routes', 'accept-12-exchange', 'accept-13-settings')],
   'acceptance':[(step,'after') for step in ('accept-01-map','accept-02-coordinates','accept-03-tools','accept-04-menu','accept-05-layers','accept-06-catalog','accept-07-objects','accept-08-projects','accept-09-card','accept-10-icons','accept-11-routes','accept-12-exchange','accept-13-settings')],
   'launcher':[(step,phase) for step in ('zoom-in','zoom-out','menu','maps','orientation','files','collapse','marks','search') for phase in ('before','after')],
   'markerlifecycle':[(step,phase) for step in ('marker-create','marker-edit','marker-svg','marker-photo') for phase in ('before','after')]+[('marker-reopen','before')],
   'markerlifecyclereopen':[('marker-reopen','after')]+[(step,phase) for step in ('marker-export','marker-import') for phase in ('before','after')],
   'objectmanager':[(step,phase) for step in ('manager-folder','manager-move','manager-delete') for phase in ('before','after')]+[('manager-reopen','before')],
   'objectmanagerreopen':[('manager-reopen','after')],
   'managerfilters':[(step,phase) for step in ('manager-filter','manager-select') for phase in ('before','after')],
   'clipboard':[(step,phase) for step in ('manager-cross-copy','manager-cross-move') for phase in ('before','after')],
   'maplayers':[(step,phase) for step in ('layers-source','layers-opacity','layers-order','layers-visibility') for phase in ('before','after')]+[('layers-reopen','before')],
   'maplayersreopen':[('layers-reopen','after')],
  }
  if mode in actions:
   trace=adb('logcat','-d','-s','RK_MAP_UI:I','*:S',required=False)
   (out/(mode+'-map-actions.log')).write_text(trace)
   for step,phase in actions[mode]:
    stem=f'dock-{step}-{phase}'
    if f'{step} {phase} target=' not in trace or not all(
      path.is_file() and path.stat().st_size for path in (out/mode/f'map_{stem}.png',out/mode/f'{stem}.xml')):
     passed=False
     print(f'MAP_ACTION_EVIDENCE_MISSING {stem}',flush=True)
  if mode=='managerchooser':
   layout=adb('logcat','-d','-s','RK_CHOOSER:D','*:S',required=False)
   (out/'managerchooser-layout.txt').write_text(layout)
   print('CHOOSER_LAYOUT_DIAGNOSTICS\n'+'\n'.join(layout.splitlines()[-256:])[-32768:],flush=True)
  if mode in ('offlineformats','cacheexport','managervisual','managerrotation','managerforms','managermove','managerconfirm','managerpasteconfirm','managerchooser','vertexrotation','vertexscroll','geometryvertexconfirm','geometryholeconfirm','vertexinsertion','geometrynewhole','geometrynewholeguards','mapvertexconfirm','mapholeconfirm','mapundorotation','mappartconfirm','geometrycloseconfirm','maplayers','maplayersreopen'):
   if not pull_ok:passed=False;print('ARTIFACT_PULL_FAILED '+mode,flush=True)
   if mode in a.visual_log_modes or not passed:print(text,flush=True)
   else:print("\n".join(line for line in text.splitlines() if "INSTRUMENTATION_RESULT:" in line),flush=True)
   try:
    if mode in a.visual_log_modes or not passed:emit_visual_evidence(out/mode)
    else:emit_visual_summary(out/mode)
   except Exception as error:
    passed=False;print('VISUAL_EVIDENCE_FAILED '+str(error),flush=True)
    print('ARTIFACT_PULL_DIAGNOSTICS '+mode+'\n'+pull_result[-4096:],flush=True)
  records.append({'mode':mode,'passed':passed,'seconds':round(time.monotonic()-started,2)})
  (out/'results.json').write_text(json.dumps(records,indent=2)+'\n')
 print(('PASS ' if passed else 'FAIL ')+mode,flush=True)
 if not passed:
  print(text,flush=True)
  if not a.keep_going:raise SystemExit('Android scenario failed: '+mode)
failed=[r['mode'] for r in records if not r['passed']]
if failed:raise SystemExit('Android scenarios failed or skipped: '+', '.join(failed))
print('All selected Android scenarios passed; this is not full 26.1 acceptance')
