"""Extract SHA256-verified synthetic manager PNGs from a saved CI job log."""
from pathlib import Path
import argparse
import hashlib
import json
from visual_evidence import decode_visual_log


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--log', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    frames = decode_visual_log(args.log.read_text(encoding='utf-8-sig'))
    targets = [args.out / name for name in frames] + [args.out / 'frames.json']
    if any(path.exists() for path in targets):
        parser.error('Use a fresh output directory; existing evidence is preserved')
    args.out.mkdir(parents=True, exist_ok=True)
    manifest = []
    for name, data in frames.items():
        with (args.out / name).open('xb') as output:
            output.write(data)
        manifest.append({'name': name, 'sha256': hashlib.sha256(data).hexdigest()})
    with (args.out / 'frames.json').open('x') as output:
        json.dump(manifest, output, indent=2)
        output.write('\n')
    print(f'Extracted {len(frames)} verified PNGs; inspect images and run status separately')


if __name__ == '__main__':
    main()
