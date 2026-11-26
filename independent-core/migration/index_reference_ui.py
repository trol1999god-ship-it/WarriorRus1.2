"""Index menu and settings resources from a read-only Apktool decode."""
import argparse
from collections import defaultdict
from hashlib import file_digest
import json
import subprocess
import sys
import tempfile
from pathlib import Path
import xml.etree.ElementTree as ET


def sha256(path):
    with path.open("rb") as source:
        return file_digest(source, "sha256").hexdigest()


def build_index(resources, digest):
    strings = ET.parse(resources / "values-ru" / "strings.xml").getroot()
    entries = {item.attrib["name"]: item.text for item in strings.findall("string")}
    groups = defaultdict(list)
    for name in entries:
        if "_submenu_" in name or (name.startswith("settings_") and name.endswith("_title")):
            groups[name.partition("_")[0]].append(name)

    return {
        "reference": {"sha256": digest, "backup_same_sha256": True},
        "method": "Read-only export of packaged resources. IDs do not establish visibility, ordering or interaction.",
        "resource_layout_counts": {
            path.name: len(list(path.glob("*.xml")))
            for path in sorted(resources.glob("layout*"))
        },
        "ru_string_count": len(entries),
        "submenu_and_settings_ids": dict(sorted(groups.items())),
        "recognized_display_labels": {
            name: entries[name]
            for name in ("maps_submenu_display_scale_bar", "landmarks_submenu_display_labels")
            if name in entries
        },
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apktool", required=True, type=Path, help="Local Apktool JAR")
    parser.add_argument("--apk", required=True, type=Path)
    parser.add_argument("--backup", required=True, type=Path)
    args = parser.parse_args()
    digest = sha256(args.apk)
    if sha256(args.backup) != digest:
        parser.error("reference and backup have different SHA-256 digests")

    with tempfile.TemporaryDirectory(prefix="rk-reference-ui-") as directory:
        decoded = Path(directory) / "decoded"
        subprocess.run(
            ["java", "-jar", str(args.apktool), "d", "-s", str(args.apk), "-o", str(decoded)],
            stdout=sys.stderr, check=True,
        )
        print(json.dumps(build_index(decoded / "res", digest), indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
