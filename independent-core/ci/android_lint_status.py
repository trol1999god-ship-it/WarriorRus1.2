"""Report official Android lint support honestly for the current nonGradle project."""
from pathlib import Path
import argparse,json
p=argparse.ArgumentParser();p.add_argument('--sdk',type=Path,required=True);p.add_argument('--report',type=Path,required=True);a=p.parse_args()
tool=a.sdk/'cmdline-tools/latest/bin/lint'
report={'tool':'official Android lint','executed':False,'passed':None,'sdk_launcher_present':tool.is_file(),'reason':'NonGradle Java/smali/resource build has no validated Android lint project adapter; custom privacy audit is separate, not lint','remaining':'Integrate official lint with the real manifest/source/resource/compile classpath and record its actual report before claiming lint coverage'}
a.report.parent.mkdir(parents=True,exist_ok=True);a.report.write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
