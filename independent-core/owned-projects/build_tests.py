"""Build unsigned instrumentation for a disposable API23 emulator."""
from pathlib import Path
import subprocess,tempfile,zipfile,argparse,os
p=argparse.ArgumentParser()
for n in ('android-jar','r8','aapt2','output'):p.add_argument('--'+n,required=True,type=Path)
p.add_argument("--target-package",default="org.rabochaya.karta");a=p.parse_args();here=Path(__file__).resolve().parent
with tempfile.TemporaryDirectory(prefix='map-checks-') as d:
 w=Path(d);classes=w/'classes';classes.mkdir();api=w/'api';api.mkdir();dex=w/'dex';dex.mkdir();compiler=w/'Compile.java';compiler.write_text('class Compile {public static void main(String[] a){int c=javax.tools.ToolProvider.getSystemJavaCompiler().run(null,System.out,System.err,a);if(c!=0)System.exit(c);}}')
 def run(c):subprocess.run(list(map(str,c)),check=True)
 compile=['java',compiler,'-source','8','-target','8','-encoding','UTF-8','-bootclasspath',a.android_jar.resolve()]
 # Java 8 lambda signatures for the compiler only, exactly as in the production overlay.
 run(compile+['-d',api]+sorted((here/'api-stubs/java/lang/invoke').glob('*.java')))
 run(compile+['-cp',api,'-d',classes,here/'tests/UiText.java',here/'tests/ManagerVisualChecks.java',here/'tests/ManagerRotationChecks.java',here/'tests/MapAndroidChecks.java'])
 jar=w/'tests.jar'
 with zipfile.ZipFile(jar,'w',zipfile.ZIP_DEFLATED) as z:
  for f in classes.rglob('*.class'):
   assert f.relative_to(classes).as_posix().startswith('org/rabochaya/maptests/')
   z.write(f,f.relative_to(classes).as_posix())
 run(['java','-cp',a.r8.resolve(),'com.android.tools.r8.D8','--min-api','23','--lib',a.android_jar.resolve(),'--classpath',api,'--output',dex,jar])
 manifest=w/'AndroidManifest.xml';manifest.write_text(f'<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="org.rabochaya.maptests"><uses-sdk android:minSdkVersion="23" android:targetSdkVersion="33"/><instrumentation android:name="org.rabochaya.maptests.MapAndroidChecks" android:targetPackage="{a.target_package}"/><application android:label="Offline map checks" android:allowBackup="false"/></manifest>')
 out=a.output.resolve();run([a.aapt2.resolve(),'link','-I',a.android_jar.resolve(),'--manifest',manifest,'-o',out])
 with zipfile.ZipFile(out,'a',zipfile.ZIP_DEFLATED) as z:
  z.write(dex/'classes.dex','classes.dex')
  for fixture in sorted((here/'tests/fixtures').glob('*')):
   if fixture.is_file():z.write(fixture,'assets/'+fixture.name)
 with out.open('rb') as f:os.fsync(f.fileno())
 print('Test APK ready',out.stat().st_size)
