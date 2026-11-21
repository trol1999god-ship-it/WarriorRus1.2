"""Read-only identity check for a proposed update to the reference 26.1 APK."""
import argparse
from hashlib import sha256
import json
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parent.parent


def inspect(apk, build_tools):
    badging = subprocess.check_output([build_tools / "aapt2", "dump", "badging", apk], text=True)
    package = re.search(r"(?m)^package: name='([^']+)' versionCode='(\d+)'", badging)
    minimum = re.search(r"(?m)^minSdkVersion:'(\d+)'", badging)
    if not package or not minimum:
        raise ValueError("Unable to determine package, versionCode or minSdk")
    # Require signature verification on the entire supported API range starting at 23.
    certs = subprocess.check_output(
        [build_tools / "apksigner", "verify", "--min-sdk-version", "23", "--print-certs", apk],
        text=True,
    )
    signers = sorted(set(re.findall(r"(?m)^Signer #\d+ certificate SHA-256 digest: ([a-f0-9]{64})$", certs)))
    if not signers:
        raise ValueError("APK signing certificate could not be verified")
    return {"package": package[1], "version_code": int(package[2]), "minimum_sdk": int(minimum[1]),
            "signer_sha256": signers}


def compare(baseline, candidate):
    return {
        "same_package": baseline["package"] == candidate["package"],
        "same_signers": baseline["signer_sha256"] == candidate["signer_sha256"],
        "higher_version_code": candidate["version_code"] > baseline["version_code"],
        "supports_api_23": candidate["minimum_sdk"] <= 23,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--build-tools", type=Path, required=True)
    parser.add_argument("--reference", type=Path, required=True)
    parser.add_argument("--candidate", type=Path, required=True)
    args = parser.parse_args()
    try:
        contract = json.loads((ROOT / "migration/requirements.json").read_text())
        with args.reference.open("rb") as source:
            digest = sha256()
            for block in iter(lambda: source.read(1024 * 1024), b""):
                digest.update(block)
        if digest.hexdigest() != contract["reference"]["sha256"]:
            raise ValueError("Reference APK does not match the pinned v26.1 SHA-256")
        baseline = inspect(args.reference, args.build_tools.resolve())
        identity = contract["release_identity"]
        if baseline["package"] != identity["package"] or baseline["version_code"] != identity["baseline_version_code"]:
            raise ValueError("Reference APK identity conflicts with the release contract")
        candidate = inspect(args.candidate, args.build_tools.resolve())
        checks = compare(baseline, candidate)
        eligible = all(checks.values())
        print(json.dumps({"identity_eligible": eligible, "checks": checks, "reference": baseline,
                          "candidate": candidate, "data_migration_verified": False}, indent=2))
        return 0 if eligible else 1
    except (OSError, ValueError, subprocess.CalledProcessError) as error:
        print(json.dumps({"identity_eligible": False, "error": str(error)}), file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
