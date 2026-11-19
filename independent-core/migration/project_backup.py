"""Back up portable KMZ and optional exported MBTiles without touching app-private data."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import sqlite3
import sys
import tempfile
from zipfile import BadZipFile, ZipFile, ZIP_STORED

FORMAT = "rabochaya-karta-portable-project/1"
MANIFEST = "manifest.json"
PROJECT = "project.kmz"
MAP = "map.mbtiles"


def copy(source, destination):
    digest = hashlib.sha256()
    size = 0
    for block in iter(lambda: source.read(1024 * 1024), b""):
        destination.write(block)
        digest.update(block)
        size += len(block)
    return {"size": size, "sha256": digest.hexdigest()}


def validate_exports(project, raster):
    with ZipFile(project) as archive:
        if not any(not item.is_dir() and item.filename.lower().endswith(".kml") for item in archive.infolist()):
            raise ValueError("KMZ export contains no KML entry")
    if raster is not None:
        if any(Path(str(raster) + suffix).exists() for suffix in ("-wal", "-journal")):
            raise ValueError("Use a finished MBTiles export without a SQLite journal")
        connection = sqlite3.connect(raster.resolve().as_uri() + "?mode=ro&immutable=1", uri=True)
        try:
            tables = {row[0] for row in connection.execute("SELECT name FROM sqlite_master WHERE type='table'")}
            if not ("tiles" in tables or {"map", "images"} <= tables):
                raise ValueError("MBTiles export has no tile tables")
            if connection.execute("PRAGMA quick_check").fetchone() != ("ok",):
                raise ValueError("SQLite quick_check failed for exported MBTiles")
        finally:
            connection.close()


def create(project, raster, output):
    if output.exists():
        raise FileExistsError(output)
    validate_exports(project, raster)
    inputs = [(PROJECT, project)]
    if raster is not None:
        inputs.append((MAP, raster))
    with tempfile.TemporaryDirectory(dir=output.parent, prefix=".rk-backup-") as directory:
        staged = Path(directory) / "backup.zip"
        with ZipFile(staged, "w", compression=ZIP_STORED) as archive:
            files = {}
            for name, path in inputs:
                with path.open("rb") as source, archive.open(name, "w", force_zip64=True) as target:
                    files[name] = copy(source, target)
            archive.writestr(MANIFEST, json.dumps({"format": FORMAT, "files": files}))
        # Publish a complete archive and refuse to replace an existing path.
        os.link(staged, output)


def restore(backup, output):
    if output.exists():
        raise FileExistsError(output)
    with tempfile.TemporaryDirectory(dir=output.parent, prefix=".rk-restore-") as directory:
        staged = Path(directory)
        with ZipFile(backup) as archive:
            names = archive.namelist()
            expected = {MANIFEST, PROJECT, MAP} if MAP in names else {MANIFEST, PROJECT}
            if len(names) != len(expected) or set(names) != expected:
                raise ValueError("Unexpected or duplicate backup entries")
            if any(item.compress_type != ZIP_STORED for item in archive.infolist()):
                raise ValueError("Unexpected backup compression")
            with archive.open(MANIFEST) as source:
                raw = source.read(8193)
            if len(raw) > 8192:
                raise ValueError("Backup manifest is too large")
            manifest = json.loads(raw)
            files = manifest.get("files") if isinstance(manifest, dict) else None
            if not isinstance(files, dict) or set(files) != expected - {MANIFEST} or manifest.get("format") != FORMAT:
                raise ValueError("Invalid backup manifest")
            for name, details in files.items():
                if not isinstance(details, dict) or details.get("size") != archive.getinfo(name).file_size:
                    raise ValueError("Invalid backup member size: " + name)
                with archive.open(name) as source, (staged / name).open("xb") as destination:
                    actual = copy(source, destination)
                if actual != details:
                    raise ValueError("Backup checksum mismatch: " + name)
        validate_exports(staged / PROJECT, staged / MAP if MAP in files else None)
        output.mkdir()
        published = []
        try:
            for name in files:
                target = output / name
                os.link(staged / name, target)
                published.append(target)
        except OSError:
            for target in published:
                target.unlink()
            try:
                output.rmdir()
            except OSError:
                pass
            raise


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    subcommands = parser.add_subparsers(dest="operation", required=True)
    backup = subcommands.add_parser("create")
    backup.add_argument("--kmz", type=Path, required=True)
    backup.add_argument("--mbtiles", type=Path)
    backup.add_argument("--out", type=Path, required=True)
    recovery = subcommands.add_parser("restore")
    recovery.add_argument("--backup", type=Path, required=True)
    recovery.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()
    try:
        if args.operation == "create":
            create(args.kmz, args.mbtiles, args.out)
        else:
            restore(args.backup, args.out)
    except (OSError, ValueError, RuntimeError, BadZipFile, sqlite3.Error) as error:
        parser.exit(1, str(error) + "\n")
    print(args.out)


if __name__ == "__main__":
    sys.exit(main())
