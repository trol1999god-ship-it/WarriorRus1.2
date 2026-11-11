"""Read original QA artifacts in Actions; never rebuild or rerun Android scenarios."""
from pathlib import Path, PurePosixPath
import argparse, hashlib, io, json, os, subprocess, urllib.request, urllib.error, zipfile
from visual_evidence import emit_visual_evidence

p=argparse.ArgumentParser();p.add_argument('--api',type=int,choices=[23,35],required=True);p.add_argument('--out',type=Path,required=True);a=p.parse_args()
# This exceptional evidence-only commit must contain no application changes.
allowed={'AGENTS.md','.github/workflows/independent-core-qa.yml','independent-core/ci/recover_saved_evidence.py','independent-core/ci/QA.md','independent-core/CODEX_NEXT.md'}
changed=set(subprocess.check_output(['git','diff-tree','--no-commit-id','--name-only','-r','HEAD'],text=True).splitlines())
if not changed or changed-allowed:raise RuntimeError('Evidence-only commit contains non-diagnostic changes: '+repr(sorted(changed-allowed)))
run_id=42074949288;expected_sha='c230680b2ba03080e37c82e2cdc063225efde7d2';repo=os.environ['GITHUB_REPOSITORY'];token=os.environ['GITHUB_TOKEN']
def request(path):return urllib.request.Request('https://api.github.com/repos/'+repo+path,headers={'Authorization':'Bearer '+token,'Accept':'application/vnd.github+json','X-GitHub-Api-Version':'2022-11-28','User-Agent':'independent-core-evidence-recovery'})
def api(path):
 with urllib.request.urlopen(request(path),timeout=60) as response:return json.load(response)
run=api('/actions/runs/'+str(run_id))
if run['status']!='completed' or run['conclusion']!='success' or run['head_sha']!=expected_sha:raise RuntimeError('Original run provenance differs')
artifacts=api('/actions/runs/'+str(run_id)+'/artifacts?per_page=100')['artifacts'];artifact=next(x for x in artifacts if x['name']=='independent-qa-api-'+str(a.api))
if artifact['expired']:raise RuntimeError('Original artifact expired; no replacement evidence accepted')
class NoRedirect(urllib.request.HTTPRedirectHandler):
 def redirect_request(self,*args,**kwargs):return None
try:urllib.request.build_opener(NoRedirect()).open(request('/actions/artifacts/'+str(artifact['id'])+'/zip'),timeout=60);raise RuntimeError('Expected GitHub archive redirect')
except urllib.error.HTTPError as error:
 if error.code not in (301,302,303,307,308):raise
 location=error.headers['Location']
# The signed redirect is fetched without forwarding the GitHub credential.
if not location.startswith('https://'):raise RuntimeError('Non-TLS artifact redirect')
with urllib.request.urlopen(location,timeout=60) as response:data=response.read(64*1024*1024+1)
if len(data)>64*1024*1024:raise RuntimeError('Artifact too large')
digest='sha256:'+hashlib.sha256(data).hexdigest()
if artifact.get('digest')!=digest:raise RuntimeError('Original archive digest mismatch')
a.out.mkdir(parents=True,exist_ok=False)
with zipfile.ZipFile(io.BytesIO(data)) as z:
 def read(name):
  if z.getinfo(name).file_size>1024*1024:raise RuntimeError('Oversized evidence text')
  return z.read(name)
 records=json.loads(read('results.json'));record=next(x for x in records if x['mode']=='cacheexport')
 if not record['passed'] or record.get('skipped'):raise RuntimeError('Original cacheexport did not execute successfully')
 text=read('cacheexport.txt').decode('utf-8')
 if 'PASS cacheexport:' not in text or 'INSTRUMENTATION_CODE: -1' not in text or 'FAIL\n' in text:raise RuntimeError('Original instrumentation proof invalid')
 for member in z.infolist():
  path=PurePosixPath(member.filename)
  if not path.parts or path.parts[0]!='cacheexport' or not path.name.startswith('map_mvisual-composition-') or path.suffix!='.png':continue
  if '..' in path.parts or member.file_size>2*1024*1024:raise RuntimeError('Unsafe visual entry')
  with (a.out/path.name).open('xb') as target:target.write(z.read(member))
print(json.dumps({'original_run':run_id,'source_sha':expected_sha,'artifact_id':artifact['id'],'artifact_digest':digest,'api':a.api,'cacheexport':record,'recovery_only':True}),flush=True)
print(text,flush=True);emit_visual_evidence(a.out)
