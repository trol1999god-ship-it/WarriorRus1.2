"""Build a clean APK from owned classes and approved launcher artwork only."""
from pathlib import Path
import argparse,subprocess,tempfile,shutil,zipfile,json,re,hashlib
p=argparse.ArgumentParser()
for n in ('android-jar','aapt2','apktool','output'):p.add_argument('--'+n,required=True,type=Path)
p.add_argument("--release",action="store_true",help="Require full 26.1 replacement acceptance before building")
a=p.parse_args();root=Path(__file__).resolve().parent.parent
if a.release:subprocess.run(['python3',str(root/'security/release_gate.py')],check=True)
# The Java overlay must have been compiled from this exact source snapshot.
# Otherwise a successful APK assembly could silently ship an older UI/core.
overlay=root/'owned-projects'
record=overlay/'build_result.json'
if not record.is_file():p.error('Missing Java overlay build record; run build_additions.py first')
actual={str(f.relative_to(overlay)):hashlib.sha256(f.read_bytes()).hexdigest() for f in sorted((overlay/'src').rglob('*.java'))}
if json.loads(record.read_text()).get('sources')!=actual:
 p.error('Java sources differ from compiled overlay; run build_additions.py before APK assembly')
with tempfile.TemporaryDirectory(prefix='rk-independent-') as tmp:
 w=Path(tmp);res=w/'res';res.mkdir()
 shutil.copytree(root/'independent-app/res',res,dirs_exist_ok=True)
 manifest=w/'AndroidManifest.xml';manifest.write_text((root/'independent-app/AndroidManifest.xml').read_text())
 def run(*args):subprocess.run(list(map(str,args)),check=True)
 compiled=w/'res.zip';run(a.aapt2.resolve(),'compile','--dir',res,'-o',compiled)
 resources=w/'resources.apk';run(a.aapt2.resolve(),'link','-I',a.android_jar.resolve(),'--manifest',manifest,'-o',resources,compiled)
 dex=w/'classes.dex';run('java','-cp',a.apktool.resolve(),root/'security/AssembleCheck.java',root/'independent-app/smali/org/rabochaya/projects',dex)
 out=a.output.resolve();out.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(resources,out)
 with zipfile.ZipFile(out,'a',zipfile.ZIP_DEFLATED) as z:
  z.write(dex,'classes.dex')
  for asset in sorted((root/'independent-app/assets').rglob('*')):
   if asset.is_file():z.write(asset,'assets/'+asset.relative_to(root/'independent-app/assets').as_posix())
 # Every referenced app class must also come from the owned package.
 refs=set();defined=set()
 for f in (root/'independent-app/smali/org/rabochaya/projects').glob('*.smali'):
  code=f.read_text();refs.update(re.findall(r'L([A-Za-z_][A-Za-z_0-9/$]*);',code));defined.update(re.findall(r'^\.class.* L([^;]+);',code,re.M));assert 'ABI stub' not in code
 assert all(c.startswith('org/rabochaya/projects/') for c in defined)
 missing=sorted(c for c in refs if c.startswith('org/rabochaya/projects/') and c not in defined)
 assert not missing,missing
 unexpected=sorted(r for r in refs if not r.startswith(('android/','java/','javax/','org/w3c/','org/xml/','org/rabochaya/projects/','dalvik/')))
 assert not unexpected,unexpected
 report={'qualification':'development-only; full 26.1 parity not established','replacement_release':a.release,'package':'org.rabochaya.karta','version_code':27,'min_sdk':23,'permissions':['android.permission.INTERNET'],'legacy_app_classes':False,'unexpected_class_references':unexpected,'owned_class_count':len(defined),'missing_owned_classes':missing,'native_libraries':[],'api_stubs_packaged':False,'unsigned_sha256':hashlib.sha256(out.read_bytes()).hexdigest()}
 (root/'security/standalone-build.json').write_text(json.dumps(report,indent=2)+'\n');print('Development APK built; not an accepted 26.1 replacement:',out.stat().st_size,'bytes')
