"""Refuse a replacement release until the full 26.1 parity contract is accepted.
Development APKs may still be compiled for isolated testing.
"""
from pathlib import Path
import json,sys,xml.etree.ElementTree as ET
root=Path(__file__).resolve().parent.parent
contract=json.loads((root/'migration/requirements.json').read_text())
manifest=ET.parse(root/'independent-app/AndroidManifest.xml').getroot();a='{http://schemas.android.com/apk/res/android}'
failures=[]
if manifest.get('package')!=contract['release_identity']['package']:failures.append('install identity differs from 26.1; safe update and migration not established')
if int(manifest.get(a+'versionCode','0'))<=contract['release_identity']['baseline_version_code']:failures.append('replacement versionCode must exceed the baseline')
for item in contract['requirements']:
 if item['status']!='accepted':failures.append(item['id']+': '+item['title'])
 elif not item.get('evidence'):failures.append(item['id']+': acceptance evidence missing')
for p in manifest.findall('uses-permission'):
 if 'LOCATION' in p.get(a+'name',''):failures.append('location permission forbidden')
result={'replacement_release_allowed':not failures,'reference':contract['reference'],'blocked_by':failures}
print(json.dumps(result,ensure_ascii=False,indent=2))
sys.exit(1 if failures else 0)
