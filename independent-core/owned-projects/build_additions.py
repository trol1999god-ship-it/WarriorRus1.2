"""Compile only v23 additions; keep the verified v22 implementation intact."""
from pathlib import Path
import argparse,subprocess,tempfile,zipfile,shutil,json,hashlib,os
p=argparse.ArgumentParser()
for n in ('android-jar','r8','apktool','aapt2'):p.add_argument('--'+n,required=True,type=Path)
a=p.parse_args();here=Path(__file__).resolve().parent;app=here.parent/'independent-app'
def run(c):subprocess.run(list(map(str,c)),check=True)
with tempfile.TemporaryDirectory(prefix='owned-additions-') as tmp:
 w=Path(tmp);api=w/'api';api.mkdir();classes=w/'classes';classes.mkdir();dex=w/'dex';dex.mkdir()
 compiler=w/'Compile.java';compiler.write_text('class Compile {public static void main(String[] a){int c=javax.tools.ToolProvider.getSystemJavaCompiler().run(null,System.out,System.err,a);if(c!=0)System.exit(c);}}')
 base=['java',compiler,'-source','8','-target','8','-encoding','UTF-8','-bootclasspath',a.android_jar.resolve()]
 run(base+['-d',api]+sorted((here/'api-stubs').rglob('*.java')))
 sources=sorted((here/'src').rglob('*.java'));run(base+['-cp',api,'-d',classes]+sources)
 # ABI stubs have a distinct output directory and are explicitly excluded here.
 jar=w/'additions.jar'
 with zipfile.ZipFile(jar,'w',zipfile.ZIP_DEFLATED) as z:
  for f in classes.rglob('*.class'):z.write(f,f.relative_to(classes).as_posix())
 run(['java','-cp',a.r8.resolve(),'com.android.tools.r8.D8','--min-api','23','--lib',a.android_jar.resolve(),'--classpath',api,'--output',dex,jar])
 manifest=w/'AndroidManifest.xml';manifest.write_text('<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="org.rabochaya.buildtmp"><uses-sdk android:minSdkVersion="23"/><application/></manifest>');apk=w/'additions.apk'
 run([a.aapt2.resolve(),'link','-I',a.android_jar.resolve(),'--manifest',manifest,'-o',apk])
 with zipfile.ZipFile(apk,'a',zipfile.ZIP_DEFLATED) as z:z.write(dex/'classes.dex','classes.dex')
 run(['java','-jar',a.apktool.resolve(),'d','-r',apk,'-o',w/'decoded'])
 added=w/'decoded/smali/org/rabochaya/projects';target=app/'smali/org/rabochaya/projects'
 files=list(added.glob('*.smali'));assert files
 assert not any(f.name.startswith(('KmlProject','ProjectStore','ProjectsActivity','DocumentRouter','ProjectMapView')) for f in files),'ABI stubs entered production DEX'
 # Remove previous outputs of these Java modules before copying new DEX classes.
 # D8 can renumber/remove lambda classes when listeners change; stale classes must not ship.
 previous_path=here/'build_result.json'
 previous=json.loads(previous_path.read_text()) if previous_path.exists() else {}
 module_names={f.stem for f in sources}|{Path(n).stem for n in previous.get('sources',{})}
 protected={'KmlProject','ProjectStore','ProjectsActivity','DocumentRouter','ProjectMapView'}
 assert not module_names&protected,'Baseline smali cannot be removed by the Java overlay'
 removed=[]
 for old in target.glob('*.smali'):
  if any(old.stem==name or old.stem.startswith(name+'$') for name in module_names):
   removed.append(old.name);old.unlink()
 for f in files:shutil.copyfile(f,target/f.name)
 report={'added_classes':len(files),'generated_files':sorted(f.name for f in files),'replaced_classes':len(removed),'min_sdk':23,'api_stubs_packaged':False,'sources':{str(f.relative_to(here)):hashlib.sha256(f.read_bytes()).hexdigest() for f in sources}}
 (here/'build_result.json').write_text(json.dumps(report,indent=2));print('Added',len(files),'classes; previous implementation preserved')
