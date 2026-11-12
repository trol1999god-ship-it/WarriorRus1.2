"""Attempt the real --release entry point; record a blocked gate without claiming an APK."""
from pathlib import Path
import argparse,json,subprocess,sys
p=argparse.ArgumentParser()
for name in ['sdk','tools','out']:p.add_argument('--'+name,type=Path,required=True)
a=p.parse_args();root=Path(__file__).resolve().parent.parent;a.out.mkdir(parents=True,exist_ok=True);target=a.out/'release-unsigned.apk'
if target.exists():raise RuntimeError('Fresh release attempt output required')
gate=subprocess.run([sys.executable,str(root/'security/release_gate.py')],capture_output=True,text=True);result=json.loads(gate.stdout);allowed=result['replacement_release_allowed']
command=[sys.executable,str(root/'owned-projects/build_standalone.py'),'--release','--android-jar',str(a.sdk/'platforms/android-23/android.jar'),'--aapt2',str(a.sdk/'build-tools/35.0.0/aapt2'),'--apktool',str(a.tools/'apktool.jar'),'--output',str(target)]
build=subprocess.run(command,capture_output=True,text=True);(a.out/'release-attempt.txt').write_text(build.stdout+'\n'+build.stderr)
if not allowed and (build.returncode==0 or target.exists()):raise RuntimeError('Release gate bypass detected')
if allowed and (build.returncode or not target.exists()):raise RuntimeError('Allowed unsigned release build failed')
report={'release_build':'unsigned-only' if allowed else 'blocked','apk_created':target.exists(),'published':False,'signing_key_used':False,'gate':result,'build_exit':build.returncode};(a.out/'release-profile.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n');print(json.dumps(report,ensure_ascii=False))
