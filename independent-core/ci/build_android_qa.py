"""Build isolated QA APKs. Never uses a user's update/signing key."""
from pathlib import Path
import argparse, hashlib, json, subprocess, urllib.request
p=argparse.ArgumentParser()
p.add_argument('--sdk',type=Path,required=True)
p.add_argument('--tools',type=Path,required=True)
p.add_argument('--out',type=Path,required=True)
a=p.parse_args();root=Path(__file__).resolve().parent.parent
sdk=a.sdk.resolve();cache=a.tools.resolve();out=a.out.resolve();cache.mkdir(parents=True,exist_ok=True);out.mkdir(parents=True,exist_ok=True)
def run(*args):subprocess.run(list(map(str,args)),check=True,cwd=root)
def get(name,url,sha):
 path=cache/name
 if not path.exists() or hashlib.sha256(path.read_bytes()).hexdigest()!=sha:
  with urllib.request.urlopen(url,timeout=60) as response:path.write_bytes(response.read())
 if hashlib.sha256(path.read_bytes()).hexdigest()!=sha:raise RuntimeError('Tool checksum mismatch: '+name)
 return path
r8=get('r8.jar','https://dl.google.com/dl/android/maven2/com/android/tools/r8/8.3.37/r8-8.3.37.jar','59753e70a74f918389cc87f1b7d66b5c0862932559167425708ded159e3de439')
apktool=get('apktool.jar','https://github.com/iBotPeaches/Apktool/releases/download/v2.11.1/apktool_2.11.1.jar','56d59c524fc764263ba8d345754d8daf55b1887818b15cd3b594f555d249e2db')
build=sdk/'build-tools/35.0.0';android=sdk/'platforms/android-23/android.jar';aapt=build/'aapt2'
for path in [aapt,android,build/'lib/apksigner.jar']:
 if not path.is_file():raise RuntimeError('Missing SDK component: '+str(path))
common=['--android-jar',android,'--aapt2',aapt]
run('python3',root/'owned-projects/verify_jvm.py')
run('python3',root/'owned-projects/build_additions.py',*common,'--r8',r8,'--apktool',apktool)
run('python3',root/'owned-projects/build_standalone.py',*common,'--apktool',apktool,'--output',out/'app-unsigned.apk')
run('python3',root/'owned-projects/build_tests.py',*common,'--r8',r8,'--output',out/'tests-unsigned.apk')
# This key is disposable; it cannot update 26.1 and is never uploaded as an artifact.
password=out/'password';password.write_text('disposable-qa-only\n');password.chmod(0o600)
key=out/'qa.p12'
if key.exists():raise RuntimeError('QA key path must be fresh')
run('keytool','-genkeypair','-alias','rabochaya-karta-review','-storetype','PKCS12','-keystore',key,'-storepass:file',password,'-keypass:file',password,'-keyalg','RSA','-keysize','2048','-validity','2','-dname','CN=Disposable Android QA')
for name in ['app','tests']:
 run('java','-cp',build/'lib/apksigner.jar',root/'security/SignReview.java',key,password,out/(name+'-unsigned.apk'),out/(name+'.apk'))
report=json.loads((root/'security/standalone-build.json').read_text())
if report['replacement_release']:raise RuntimeError('QA build must not be a replacement release')
(out/'qa-build.json').write_text(json.dumps(report,indent=2)+'\n')
print('Isolated QA APKs ready; no replacement release was produced')
