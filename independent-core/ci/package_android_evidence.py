"""Package existing synthetic Android results; never rebuild or reinterpret tests."""
from pathlib import Path
import argparse
import hashlib
import json
import zipfile


def package(source, target, source_sha, run_id):
    source, target = Path(source).resolve(), Path(target).resolve()
    if not source.is_dir() or target.is_relative_to(source):
        raise ValueError('Evidence source must exist and exclude the destination')
    if len(source_sha) != 40 or any(c not in '0123456789abcdef' for c in source_sha):
        raise ValueError('Full source SHA required')
    records = json.loads((source / 'results.json').read_text())
    if (source / '_evidence_manifest.json').exists():
        raise ValueError('Reserved evidence manifest name already exists')
    files = []
    for path in sorted(source.rglob('*')):
        if path.is_symlink():
            raise ValueError('Evidence must not contain symlinks')
        if path.is_file():
            data = path.read_bytes()
            files.append((path, path.relative_to(source).as_posix(), len(data), hashlib.sha256(data).hexdigest()))
    manifest = {'source_sha': source_sha, 'run_id': str(run_id), 'records': records,
                'files': [{'path': name, 'bytes': size, 'sha256': digest} for _, name, size, digest in files]}
    # Exclusive creation preserves prior evidence; all original diagnostic files remain.
    with zipfile.ZipFile(target, 'x', compression=zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
        archive.writestr('_evidence_manifest.json', json.dumps(manifest, indent=2) + '\n')
        for path, name, _, _ in files:
            archive.write(path, name)
    with zipfile.ZipFile(target) as archive:
        for _, name, size, digest in files:
            data = archive.read(name)
            if len(data) != size or hashlib.sha256(data).hexdigest() != digest:
                raise RuntimeError('Packaged evidence differs: ' + name)
    print(json.dumps({'source_sha': source_sha, 'run_id': str(run_id), 'files': len(files),
                      'bytes': target.stat().st_size, 'archive_sha256': hashlib.sha256(target.read_bytes()).hexdigest(),
                      'passed': sum(r.get('passed') is True for r in records), 'records': len(records),
                      'failed_or_skipped': [r['mode'] for r in records if not r.get('passed')]}), flush=True)
    return manifest


if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('--source', type=Path, required=True)
    p.add_argument('--target', type=Path, required=True)
    p.add_argument('--source-sha', required=True)
    p.add_argument('--run-id', required=True)
    a = p.parse_args()
    package(a.source, a.target, a.source_sha, a.run_id)
