"""Exercise CI failure aggregation with a fake adb, without an Android device."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
import unittest
import base64
import contextlib
import hashlib
import io
from visual_evidence import emit_visual_evidence, emit_visual_summary, decode_visual_log
from package_android_evidence import package
import zipfile


class RunnerTests(unittest.TestCase):
    def run_modes(self, modes, failures=(), keep_going=True, pull_error=False, pull_png=False,
                  offline_once=(), boot_changed=False, permanent_offline=False, partial_pull=False, existing_output=False):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            adb = root / 'adb'
            adb.write_text('#!' + sys.executable + '\n' + '''
import sys
from pathlib import Path
import base64,json
args = sys.argv[3:]
calls=Path(__file__).with_suffix('.calls')
with calls.open('a') as log:log.write(json.dumps(args)+'\\n')
marker=Path(__file__).with_suffix('.offline')
if ''' + repr(tuple(offline_once)) + ''' and tuple(args[:''' + str(len(offline_once)) + '''])==''' + repr(tuple(offline_once)) + ''' and not marker.exists():
    marker.write_text('rejected once')
    if ''' + repr(partial_pull) + ''' and args[0]=='pull':
        destination=Path(args[-1]);destination.mkdir(parents=True);(destination/'partial.txt').write_text('original partial preserved')
    print('adb: device offline',file=sys.stderr);sys.exit(1)
if args == ['get-state']:
    print('offline' if ''' + repr(permanent_offline) + ''' and marker.exists() else 'device')
elif args == ['shell','cat','/proc/sys/kernel/random/boot_id']:
    print('00000000-0000-4000-8000-00000000000'+('2' if ''' + repr(boot_changed) + ''' and marker.exists() else '1'))
elif args[:2] == ['shell', 'getprop']:
    print('1')
elif args[:2] == ['shell', 'dumpsys']:
    print('synthetic ' + args[2] + ' diagnostics')
elif args[:1] == ['pull'] and ''' + repr(pull_error) + ''':
    if ''' + repr(pull_png) + ''':
        target = Path(args[-1]); target.mkdir(parents=True, exist_ok=True)
        (target / 'map_mvisual-synthetic-failure.png').write_bytes(base64.b64decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+aLeoAAAAASUVORK5CYII='))
    print('adb: error: failed to copy synthetic screenshots: device offline', file=sys.stderr)
    sys.exit(1)
elif args[:1] == ['pull'] and ''' + repr(pull_png) + ''':
    target = Path(args[-1]); target.mkdir(parents=True, exist_ok=True)
    (target / 'map_mvisual-synthetic-failure.png').write_bytes(base64.b64decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+aLeoAAAAASUVORK5CYII='))
elif args[:3] == ['shell', 'am', 'instrument']:
    mode = args[args.index('mode') + 1]
    if mode in ''' + repr(tuple(failures)) + ''':
        print('INSTRUMENTATION_RESULT: stream=FAIL\\nsynthetic assertion')
        print('INSTRUMENTATION_CODE: 0')
    else:
        print('INSTRUMENTATION_RESULT: stream=PASS ' + mode + ': 1 assertions')
        print('INSTRUMENTATION_CODE: -1')
''')
            adb.chmod(0o755)
            apk = root / 'fixture.apk'
            apk.write_bytes(b'synthetic QA fixture')
            output = root / 'results'
            if existing_output:
                output.mkdir();(output/'previous.txt').write_text('preserve existing evidence')
            command = [sys.executable, str(Path(__file__).with_name('run_android_checks.py')),
                       '--adb', str(adb), '--serial', 'emulator-5554',
                       '--app', str(apk), '--tests', str(apk), '--output', str(output), '--transport-wait', '.5']
            if keep_going:
                command.append('--keep-going')
            result = subprocess.run(command + ['--modes'] + modes,
                                    capture_output=True, text=True, timeout=30)
            records = json.loads((output / 'results.json').read_text()) if (output/'results.json').exists() else []
            result.window_diagnostics = {
                path.name: path.read_text() for path in output.glob('*-window.txt')}
            result.activity_diagnostics = {
                path.name: path.read_text() for path in output.glob('*-activity.txt')}
            result.pull_diagnostics = {
                path.name: path.read_text() for path in output.glob('*-artifact-pull.txt')}
            result.adb_calls=[json.loads(line) for line in adb.with_suffix('.calls').read_text().splitlines()] if adb.with_suffix('.calls').exists() else []
            result.transport_events=json.loads((output/'adb-transport.json').read_text()) if (output/'adb-transport.json').exists() else []
            result.partial_files={str(path.relative_to(output)):path.read_text() for path in output.glob('*-offline-partial/partial.txt')}
            result.previous_evidence=(output/'previous.txt').read_text() if (output/'previous.txt').exists() else None
            return result, records

    def test_failed_pull_with_valid_partial_png_still_fails(self):
        result, records=self.run_modes(['cacheexport'],pull_error=True,pull_png=True)
        self.assertNotEqual(result.returncode,0)
        self.assertFalse(records[0]['passed'])
        self.assertIn('ARTIFACT_PULL_FAILED cacheexport',result.stdout)
        self.assertIn('RK_VISUAL_BEGIN',result.stdout)

    def test_existing_output_is_preserved_without_any_adb_action(self):
        result, records=self.run_modes(['binary'],existing_output=True)
        self.assertNotEqual(result.returncode,0)
        self.assertEqual(records,[])
        self.assertEqual(result.adb_calls,[])
        self.assertEqual(result.previous_evidence,'preserve existing evidence')

    def test_explicit_offline_preparation_waits_same_boot_then_runs_instrumentation_once(self):
        result, records=self.run_modes(['binary'],offline_once=('shell','am','force-stop'))
        self.assertEqual(result.returncode,0,result.stdout+result.stderr)
        self.assertTrue(records[0]['passed'])
        self.assertEqual(sum(call[:3]==['shell','am','instrument'] for call in result.adb_calls),1)
        self.assertEqual(sum(call[:3]==['shell','am','force-stop'] for call in result.adb_calls),2)
        self.assertTrue(result.transport_events[0]['same_boot'])

    def test_partial_visual_pull_is_preserved_before_fresh_read_only_retry(self):
        result, records=self.run_modes(['cacheexport'],offline_once=('pull',),pull_png=True,partial_pull=True)
        self.assertEqual(result.returncode,0,result.stdout+result.stderr)
        self.assertTrue(records[0]['passed'])
        self.assertEqual(result.partial_files,{'cacheexport-offline-partial/partial.txt':'original partial preserved'})
        self.assertEqual(sum(call[:1]==['pull'] for call in result.adb_calls),2)
        self.assertIn('RK_VISUAL_BEGIN',result.stdout)

    def test_unknown_instrumentation_result_is_not_repeated(self):
        result, records=self.run_modes(['binary'],offline_once=('shell','am','instrument'))
        self.assertNotEqual(result.returncode,0)
        self.assertFalse(records[0]['passed'])
        self.assertEqual(sum(call[:3]==['shell','am','instrument'] for call in result.adb_calls),1)
        self.assertEqual(result.transport_events,[])

    def test_new_boot_blocks_old_context_and_later_mutating_commands(self):
        result, records=self.run_modes(['binary','independence'],offline_once=('shell','am','force-stop'),boot_changed=True)
        self.assertNotEqual(result.returncode,0)
        self.assertEqual([r['passed'] for r in records],[False,False])
        self.assertEqual(sum(call[:3]==['shell','am','instrument'] for call in result.adb_calls),0)
        self.assertIn('boot identity changed',result.stdout)

    def test_persistent_offline_expires_without_running_instrumentation(self):
        result, records=self.run_modes(['binary'],offline_once=('shell','am','force-stop'),permanent_offline=True)
        self.assertNotEqual(result.returncode,0)
        self.assertFalse(records[0]['passed'])
        self.assertEqual(sum(call[:3]==['shell','am','instrument'] for call in result.adb_calls),0)
        self.assertIn('readiness deadline exceeded',result.stdout)

    def test_cacheexport_emits_saved_visual_evidence(self):
        result, records = self.run_modes(['cacheexport'], pull_png=True)
        self.assertEqual(result.returncode, 0, result.stdout)
        self.assertTrue(records[0]['passed'])
        self.assertIn('RK_VISUAL_BEGIN', result.stdout)

    def test_cacheexport_missing_visual_pull_is_not_success(self):
        result, records = self.run_modes(['cacheexport'], pull_error=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(records[0]['passed'])
        self.assertIn('VISUAL_EVIDENCE_FAILED', result.stdout)

    def test_collects_failure_and_runs_next_independent_mode(self):
        result, records = self.run_modes(['binary', 'independence'], ['binary'])
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual([r['passed'] for r in records], [False, True])
        self.assertIn('synthetic assertion', result.stdout)
        self.assertEqual(result.window_diagnostics,
                         {'binary-window.txt': 'synthetic window diagnostics\n'})
        self.assertEqual(result.activity_diagnostics,
                         {'binary-activity.txt': 'synthetic activity diagnostics\n'})

    def test_skips_reopen_after_failed_fixture_and_continues(self):
        result, records = self.run_modes(
            ['objectmanager', 'objectmanagerreopen', 'binary'], ['objectmanager'])
        self.assertNotEqual(result.returncode, 0)
        self.assertTrue(records[1]['skipped'])
        self.assertFalse(records[1]['passed'])
        self.assertTrue(records[2]['passed'])
        self.assertNotIn('RUN objectmanagerreopen', result.stdout)

    def test_successful_fixture_allows_reopen(self):
        result, records = self.run_modes(['objectmanager', 'objectmanagerreopen'])
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertTrue(all(r['passed'] for r in records))

    def test_missing_visual_pull_is_a_failure_with_transport_diagnostics(self):
        result, records = self.run_modes(['geometrynewholeguards', 'binary'], pull_error=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual([r['passed'] for r in records], [False, True])
        self.assertIn('PASS geometrynewholeguards:', result.stdout)
        self.assertIn('VISUAL_EVIDENCE_FAILED No manager visual screenshots', result.stdout)
        self.assertIn('ARTIFACT_PULL_DIAGNOSTICS geometrynewholeguards', result.stdout)
        self.assertIn('device offline', result.stdout)
        self.assertIn('device offline', result.pull_diagnostics['geometrynewholeguards-artifact-pull.txt'])
        self.assertIn('adb returncode=1', result.pull_diagnostics['geometrynewholeguards-artifact-pull.txt'])

    def test_failed_nonfocused_mode_keeps_full_verified_png_preview(self):
        result, records = self.run_modes(['vertexscroll'], ['vertexscroll'], pull_png=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(records[0]['passed'])
        self.assertIn('RK_VISUAL_BEGIN map_mvisual-synthetic-failure.png ', result.stdout)
        self.assertIn('RK_VISUAL_DATA ', result.stdout)
        self.assertIn('RK_VISUAL_END map_mvisual-synthetic-failure.png', result.stdout)
        self.assertNotIn('VISUAL_EVIDENCE_FAILED', result.stdout)

    def test_default_still_stops_on_first_failure(self):
        result, records = self.run_modes(['binary', 'independence'], ['binary'], False)
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(len(records), 1)


class PackagedEvidenceTests(unittest.TestCase):
    def test_all_diagnostics_and_failed_records_survive_exactly(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); source = root / 'results'; source.mkdir()
            records = [{'mode': 'maplayers', 'passed': False},
                       {'mode': 'maplayersreopen', 'passed': False, 'skipped': True}]
            (source / 'results.json').write_text(json.dumps(records))
            (source / 'maplayers.txt').write_bytes('raw/курсор/FAIL\n'.encode())
            (source / 'maplayers').mkdir()
            (source / 'maplayers' / 'map_mvisual-profile.png').write_bytes(VisualEvidenceTests.png)
            original = {p.relative_to(source).as_posix(): p.read_bytes() for p in source.rglob('*') if p.is_file()}
            with contextlib.redirect_stdout(io.StringIO()):
                package(source, root / 'evidence.zip', 'a' * 40, 123)
            with zipfile.ZipFile(root / 'evidence.zip') as archive:
                manifest = json.loads(archive.read('_evidence_manifest.json'))
                self.assertEqual(manifest['records'], records)
                self.assertEqual(manifest['source_sha'], 'a' * 40)
                self.assertEqual(set(archive.namelist()), set(original) | {'_evidence_manifest.json'})
                for item in manifest['files']:
                    self.assertEqual(archive.read(item['path']), original[item['path']])
                    self.assertEqual(item['sha256'], hashlib.sha256(original[item['path']]).hexdigest())
                    self.assertEqual((source / item['path']).read_bytes(), original[item['path']])
            with self.assertRaises(FileExistsError):
                package(source, root / 'evidence.zip', 'a' * 40, 123)

    def test_symlink_and_output_inside_source_are_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); source = root / 'results'; source.mkdir()
            (source / 'results.json').write_text('[]')
            with self.assertRaises(ValueError):
                package(source, source / 'nested.zip', 'a' * 40, 123)
            (source / 'outside').symlink_to(root / 'private')
            with self.assertRaises(ValueError):
                package(source, root / 'evidence.zip', 'a' * 40, 123)
            self.assertFalse((root / 'evidence.zip').exists())


class VisualEvidenceTests(unittest.TestCase):
    png = base64.b64decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+aLeoAAAAASUVORK5CYII=')

    def test_roundtrip_and_unrelated_files_are_excluded(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / 'map_mvisual-day-main.png').write_bytes(self.png)
            (root / 'private.png').write_bytes(b'unrelated must never be logged')
            output = io.StringIO()
            with contextlib.redirect_stdout(output):
                emit_visual_evidence(root)
            lines = output.getvalue().splitlines()
            self.assertEqual(lines[0], 'RK_VISUAL_BEGIN map_mvisual-day-main.png ' + hashlib.sha256(self.png).hexdigest())
            encoded = ''.join(line.removeprefix('RK_VISUAL_DATA ') for line in lines if line.startswith('RK_VISUAL_DATA '))
            self.assertEqual(base64.b64decode(encoded), self.png)
            self.assertNotIn('private', output.getvalue())

    def log_fixture(self):
        encoded = base64.b64encode(self.png).decode('ascii')
        return ('timestamp RK_VISUAL_BEGIN map_mvisual-day-main.png ' + hashlib.sha256(self.png).hexdigest() + '\n'
                'timestamp RK_VISUAL_DATA ' + encoded + '\n'
                'timestamp RK_VISUAL_END map_mvisual-day-main.png\n')

    def test_decode_roundtrip_with_job_timestamps(self):
        self.assertEqual(decode_visual_log(self.log_fixture()), {'map_mvisual-day-main.png': self.png})

    def test_decoder_rejects_corruption_and_truncation(self):
        text = self.log_fixture()
        with self.assertRaises(ValueError):
            decode_visual_log(text.replace(hashlib.sha256(self.png).hexdigest(), '0' * 64))
        with self.assertRaises(ValueError):
            decode_visual_log(text[:text.index('timestamp RK_VISUAL_END')])

    def test_decoder_rejects_duplicate_and_path_traversal(self):
        text = self.log_fixture()
        with self.assertRaises(ValueError):
            decode_visual_log(text + text)
        with self.assertRaises(ValueError):
            decode_visual_log(text.replace('map_mvisual-day-main.png', '../outside.png'))

    def test_cli_preserves_existing_evidence(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            log = root / 'job.log'
            log.write_text(self.log_fixture())
            target = root / 'map_mvisual-day-main.png'
            target.write_bytes(b'existing evidence')
            result = subprocess.run([sys.executable, str(Path(__file__).with_name('extract_visual_evidence.py')),
                                     '--log', str(log), '--out', str(root)], capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(target.read_bytes(), b'existing evidence')
            self.assertFalse((root / 'frames.json').exists())

    def test_compact_summary_preserves_exact_png_and_hash(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'map_mvisual-day-main.png'
            path.write_bytes(self.png)
            output = io.StringIO()
            with contextlib.redirect_stdout(output):
                emit_visual_summary(Path(directory))
            self.assertEqual(output.getvalue().strip(), 'VISUAL_VALIDATED ' + path.name + ' ' + hashlib.sha256(self.png).hexdigest())
            self.assertEqual(path.read_bytes(), self.png)
            self.assertNotIn('RK_VISUAL', output.getvalue())

    def test_compact_summary_keeps_missing_signature_and_size_failures(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with self.assertRaisesRegex(RuntimeError, 'No manager visual'):
                emit_visual_summary(root)
            path = root / 'map_mvisual-day-main.png'
            for data, message in [(b'bad', 'not PNG'), (self.png + b'x' * (2 * 1024 * 1024), 'limit')]:
                path.write_bytes(data)
                with self.assertRaisesRegex(RuntimeError, message):
                    emit_visual_summary(root)

    def test_missing_frames_fail(self):
        with tempfile.TemporaryDirectory() as directory:
            with self.assertRaisesRegex(RuntimeError, 'No manager visual'):
                emit_visual_evidence(Path(directory))

    def test_size_cap_fails_before_logging_payload(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'map_mvisual-day-main.png'
            path.write_bytes(self.png + b'x' * (2 * 1024 * 1024))
            output = io.StringIO()
            with contextlib.redirect_stdout(output), self.assertRaisesRegex(RuntimeError, 'limit'):
                emit_visual_evidence(Path(directory))
            self.assertEqual(output.getvalue(), '')

    def test_non_png_is_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            (Path(directory) / 'map_mvisual-day-main.png').write_bytes(b'not PNG')
            with self.assertRaisesRegex(RuntimeError, 'not PNG'):
                emit_visual_evidence(Path(directory))


if __name__ == '__main__':
    unittest.main()
