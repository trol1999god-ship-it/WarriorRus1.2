"""Scoped privacy/manifest/forbidden-SDK audit. This is NOT Android lint."""
from pathlib import Path
import argparse, json, re, sys, xml.etree.ElementTree as ET, zipfile
p=argparse.ArgumentParser();p.add_argument('--apk',type=Path);p.add_argument('--report',type=Path,required=True);a=p.parse_args();root=Path(__file__).resolve().parent.parent
ns='{http://schemas.android.com/apk/res/android}';manifest=ET.parse(root/'independent-app/AndroidManifest.xml').getroot();failures=[]
def check(value,message):
 if not value:failures.append(message)
check(manifest.find('uses-sdk').get(ns+'minSdkVersion')=='23','minSdk23 required')
permissions={x.get(ns+'name') for x in manifest.findall('uses-permission')};check(permissions=={'android.permission.INTERNET'},'Unexpected permissions; Bluetooth additions require explicit reviewed implementation')
for feature in manifest.findall('uses-feature'):check(not feature.get(ns+'name','').startswith('android.hardware.location'),'GPS/location hardware feature forbidden')
app=manifest.find('application')
for name in ['allowBackup','fullBackupContent','usesCleartextTraffic','debuggable']:check(app.get(ns+name)=='false','Production manifest must keep '+name+' false')
check(app.get(ns+'label')=='Рабочая карта','Application name changed')
for activity in app.findall('activity'):
 if activity.get(ns+'name')!='org.rabochaya.projects.OwnedHomeActivity':check(activity.get(ns+'exported')=='false','Unexpected exported activity')
forbidden=['java/net/Socket','java/net/DatagramSocket','java/nio/channels/SocketChannel','android/location/','android/accounts/','com/google/android/gms/location','com/google/firebase/','io/sentry/','com/segment/','com/amplitude/','com/mixpanel/','com/appsflyer/','io/supabase/','com/supabase/','net/psyberia/']
sources=sorted((root/'owned-projects/src').rglob('*.java'))
for file in sources:
 text=file.read_text();normalized=text.replace('.','/')
 for package in forbidden:check(package not in normalized,'Forbidden API/SDK in '+file.name+': '+package)
 if re.search(r'new\s+URL\s*\(|\.openConnection\s*\(',text):check(file.name=='OnlineTiles.java','Unreviewed network entry point: '+file.name)
 check(not re.search(r'setDoOutput\s*\(\s*true|setRequestMethod\s*\(\s*"(POST|PUT|PATCH|DELETE)"',text),'Upload-capable transport in '+file.name)
transport=(root/'owned-projects/src/org/rabochaya/projects/OnlineTiles.java').read_text()
for required in ['HttpsURLConnection','setDoOutput(false)','setRequestMethod("GET")','setInstanceFollowRedirects(false)']:check(required in transport,'Missing tile transport restriction: '+required)
if a.apk:
 with zipfile.ZipFile(a.apk) as z:
  check(not any(n.startswith('lib/') and n.endswith('.so') for n in z.namelist()),'Native runtime libraries require review')
  for name in z.namelist():
   if name.endswith('.dex'):
    data=z.read(name)
    for package in forbidden:check(package.encode() not in data,'Forbidden DEX API/SDK: '+package)
report={'kind':'custom scoped privacy audit; not Android lint','passed':not failures,'source_files':len(sources),'permissions':sorted(permissions),'apk_checked':bool(a.apk),'checks':['production manifest','source network entry points','GET-only no-output tile transport','forbidden SDK/API references','DEX SDK strings and native inventory when APK supplied'],'limits':['not a complete dynamic data-flow proof','local-storage and object/attachment retention also require existing runtime scenarios','Android lint and physical-device acceptance separate'],'failures':failures};a.report.parent.mkdir(parents=True,exist_ok=True);a.report.write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n');print(json.dumps(report,ensure_ascii=False));sys.exit(bool(failures))
