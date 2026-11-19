"""Run the SDK's official lint for the independent Java/smali application."""
from collections import Counter
from pathlib import Path
import argparse
import hashlib
import json
import os
import re
import subprocess
import tempfile
import xml.etree.ElementTree as ET
import zipfile

ROOT = Path(__file__).resolve().parent.parent
PROJECTS_ACTIVITY = "Lorg/rabochaya/projects/ProjectsActivity;"


def check_projects_activity(sdk, apk, work):
    """Validate the manifest-facing ABI before supplying it to lint's JVM frontend."""
    matches = []
    dexdump = sdk / "build-tools/35.0.0/dexdump"
    with zipfile.ZipFile(apk) as archive:
        for name in archive.namelist():
            if not re.fullmatch(r"classes\d*\.dex", name):
                continue
            dex = work / name
            dex.write_bytes(archive.read(name))
            result = subprocess.run([dexdump, dex], check=True, capture_output=True, text=True)
            for block in re.split(r"(?m)^Class #\d+\s+-", result.stdout):
                descriptor = re.search(r"(?m)^  Class descriptor\s+: '([^']+)'", block)
                if descriptor and descriptor[1] == PROJECTS_ACTIVITY:
                    matches.append(block)
    if len(matches) != 1:
        raise ValueError("Expected exactly one ProjectsActivity in the compiled APK")
    body = matches[0]
    flags = re.search(r"(?m)^  Access flags\s+: 0x([a-fA-F0-9]+)", body)
    constructor = re.search(
        r"(?m)^      name\s+: '<init>'\n"
        r"      type\s+: '\(\)V'\n"
        r"      access\s+: 0x([a-fA-F0-9]+)", body,
    )
    if (not flags or int(flags[1], 16) != 0x11
            or not re.search(r"(?m)^  Superclass\s+: 'Landroid/app/Activity;'$", body)
            or not constructor or int(constructor[1], 16) != 0x10001):
        raise ValueError("Compiled ProjectsActivity no longer matches its manifest-facing ABI")


def run_lint(sdk, apk, report_path):
    sdk, apk, report_path = (path.resolve() for path in (sdk, apk, report_path))
    report_path.parent.mkdir(parents=True, exist_ok=True)
    issues_path = report_path.with_name(report_path.stem + "-issues.xml")
    log_path = report_path.with_name(report_path.stem + ".log")
    lint = sdk / "cmdline-tools/latest/bin/lint"
    report = {
        "tool": "official Android lint",
        "executed": False,
        "passed": False,
        "compile_sdk": 23,
        "scope": ["production manifest", "Android resources", "owned Java sources and classfiles"],
        "smali_coverage": "ProjectsActivity manifest-facing ABI verified against the compiled APK. Lint does not inspect smali method bodies.",
    }
    try:
        report["apk_sha256"] = hashlib.sha256(apk.read_bytes()).hexdigest()
        report["version"] = subprocess.check_output([lint, "--version"], text=True).strip()
        with tempfile.TemporaryDirectory(prefix="rk-lint-") as temporary:
            work = Path(temporary)
            check_projects_activity(sdk, apk, work)
            # Compile-only declaration. The signed APK always carries the original smali implementation.
            manifest_abi = work / "ProjectsActivity.java"
            manifest_abi.write_text(
                "package org.rabochaya.projects;\n"
                "public final class ProjectsActivity extends android.app.Activity {}\n",
                encoding="utf-8",
            )
            abi = work / "abi"
            classes = work / "classes"
            abi.mkdir()
            classes.mkdir()
            owned = ROOT / "owned-projects"
            source, app = owned / "src", ROOT / "independent-app"
            android = sdk / "platforms/android-23/android.jar"
            javac = ["javac", "-source", "8", "-target", "8", "-encoding", "UTF-8", "-bootclasspath", android]
            stubs = sorted((owned / "api-stubs").rglob("*.java"))
            subprocess.run(javac + ["-d", abi, *stubs, manifest_abi], check=True)
            sources = sorted(source.rglob("*.java"))
            subprocess.run(javac + ["-cp", abi, "-d", classes, *sources], check=True)
            command = [
                lint, "--offline", "--quiet", "--exitcode", "--compile-sdk-version", "23",
                "--sdk-home", sdk, "--sources", source, "--resources", app / "res",
                "--classpath", classes, "--libraries", abi, "--xml", issues_path, app,
            ]
            with log_path.open("w") as log:
                result = subprocess.run(command, env={**os.environ, "ANDROID_HOME": str(sdk)},
                                        stdout=log, stderr=subprocess.STDOUT)
            report.update(executed=True, exit_code=result.returncode, source_files=len(sources))
            severities = Counter(issue.attrib["severity"] for issue in ET.parse(issues_path).findall("issue"))
            report.update(errors=severities["Error"] + severities["Fatal"], warnings=severities["Warning"])
            report["passed"] = result.returncode == 0 and report["errors"] == 0
    except (OSError, ValueError, ET.ParseError, subprocess.CalledProcessError, zipfile.BadZipFile) as error:
        report["failure"] = str(error)
    report_path.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False))
    return 0 if report["passed"] else 1


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sdk", type=Path, required=True)
    parser.add_argument("--apk", type=Path, required=True)
    parser.add_argument("--report", type=Path, required=True)
    args = parser.parse_args()
    raise SystemExit(run_lint(args.sdk, args.apk, args.report))
