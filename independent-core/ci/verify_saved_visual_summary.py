"""Revalidate a saved synthetic offlineformats result without rerunning the emulator."""
import hashlib
import json
from pathlib import Path, PurePosixPath
import sys
import tempfile
import zipfile

from visual_evidence import emit_visual_summary


def check(archive_path, source_sha, run_id):
    with zipfile.ZipFile(archive_path) as archive, tempfile.TemporaryDirectory() as temporary:
        manifest = json.loads(archive.read('_evidence_manifest.json'))
        if manifest.get('source_sha') != source_sha or manifest.get('run_id') != run_id:
            raise ValueError('Unexpected source revision or workflow run')
        files = {item['path']: item for item in manifest['files']}

        def checked(name, max_bytes):
            item = files[name]
            size = archive.getinfo(name).file_size
            if size != item['bytes'] or size > max_bytes:
                raise ValueError('Unexpected evidence size: ' + name)
            data = archive.read(name)
            if hashlib.sha256(data).hexdigest() != item['sha256']:
                raise ValueError('Evidence hash mismatch: ' + name)
            return data

        output = checked('offlineformats.txt', 2 * 1024 * 1024).decode()
        if 'stream=PASS offlineformats:' not in output or 'INSTRUMENTATION_CODE: -1' not in output:
            raise ValueError('The original instrumentation did not pass')
        root = Path(temporary)
        for name in files:
            path = PurePosixPath(name)
            if len(path.parts) == 2 and path.parts[0] == 'offlineformats' and path.name.startswith('map_mvisual-') and path.suffix == '.png':
                (root / path.name).write_bytes(checked(name, 2 * 1024 * 1024))
        emit_visual_summary(root)
        print(f'Validated archived offlineformats from {run_id} at {source_sha}', flush=True)


if __name__ == '__main__':
    check(*sys.argv[1:])
