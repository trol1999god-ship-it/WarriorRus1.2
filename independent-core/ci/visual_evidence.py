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


def decode_visual_log(text):
    """Validate connector/job-log PNGs; never infer visual acceptance from them."""
    frames = {}
    current = None
    total = 0
    for line in text.splitlines():
        marker = re.search(r'RK_VISUAL_(BEGIN|DATA|END) (.*)$', line)
        if not marker:
            continue
        kind, value = marker.groups()
        if kind == 'BEGIN':
            if current is not None:
                raise ValueError('Unfinished visual frame')
            fields = value.split()
            if len(fields) != 2 or not re.fullmatch(r'map_mvisual-[a-z-]+\.png', fields[0]) or not re.fullmatch(r'[a-f0-9]{64}', fields[1]):
                raise ValueError('Invalid visual frame header')
            if fields[0] in frames or len(frames) >= 16:
                raise ValueError('Duplicate frame or frame limit exceeded')
            current = [fields[0], fields[1], '']
        elif kind == 'DATA':
            if current is None or not re.fullmatch(r'[A-Za-z0-9+/=]+', value):
                raise ValueError('Unexpected visual frame data')
            current[2] += value
            if len(current[2]) > 3 * 1024 * 1024:
                raise ValueError('Visual frame exceeds limit')
        else:
            if current is None or value != current[0]:
                raise ValueError('Visual frame end mismatch')
            data = base64.b64decode(current[2], validate=True)
            total += len(data)
            if total > 2 * 1024 * 1024 or not data.startswith(b'\x89PNG\r\n\x1a\n') or hashlib.sha256(data).hexdigest() != current[1]:
                raise ValueError('Visual PNG limit/signature/hash mismatch')
            frames[current[0]] = data
            current = None
    if current is not None or not frames:
        raise ValueError('Missing or unfinished visual evidence')
    return frames
