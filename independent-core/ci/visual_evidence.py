"""Bounded previews of the explicit synthetic manager QA scenario via CI logs.

Full PNGs remain artifacts. This connector-readable copy permits review without
requiring the worker to download an artifact ZIP. Never called for other modes.
"""
from pathlib import Path
import base64
import hashlib
import re


def emit_visual_evidence(directory):
    files = sorted(Path(directory).rglob('map_mvisual-*.png'))
    if not files:
        raise RuntimeError('No manager visual screenshots were collected')
    if len(files) > 16 or sum(p.stat().st_size for p in files) > 2 * 1024 * 1024:
        raise RuntimeError('Synthetic visual evidence exceeds the log limit')
    for path in files:
        if not re.fullmatch(r'map_mvisual-[a-z-]+\.png', path.name):
            raise RuntimeError('Unexpected visual evidence name')
        data = path.read_bytes()
        if not data.startswith(b'\x89PNG\r\n\x1a\n'):
            raise RuntimeError('Visual evidence is not PNG')
        print(f'RK_VISUAL_BEGIN {path.name} {hashlib.sha256(data).hexdigest()}', flush=True)
        encoded = base64.b64encode(data).decode('ascii')
        for start in range(0, len(encoded), 1000):
            print('RK_VISUAL_DATA ' + encoded[start:start+1000], flush=True)
        print('RK_VISUAL_END ' + path.name, flush=True)
