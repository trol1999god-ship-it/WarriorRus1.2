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
from visual_evidence import emit_visual_evidence, decode_visual_log


class RunnerTests(unittest.TestCase):
    def run_modes(self, modes, failures=(), keep_going=True):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            adb = root / 'adb'
            adb.write_text('#!' + sys.executable + '\n' + '''
import sys
args = sys.argv[3:]
if args[:2] == ['shell', 'getprop']:
    print('1')
elif args[:2] == ['shell', 'dumpsys']:
    print('synthetic ' + args[2] + ' diagnostics')
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
            command = [sys.executable, str(Path(__file__).with_name('run_android_checks.py')),
                       '--adb', str(adb), '--serial', 'emulator-5554',
                       '--app', str(apk), '--tests', str(apk), '--output', str(output)]
            if keep_going:
                command.append('--keep-going')
            result = subprocess.run(command + ['--modes'] + modes,
                                    capture_output=True, text=True, timeout=30)
            records = json.loads((output / 'results.json').read_text())
            result.window_diagnostics = {
                path.name: path.read_text() for path in output.glob('*-window.txt')}
            result.activity_diagnostics = {
                path.name: path.read_text() for path in output.glob('*-activity.txt')}
            return result, records

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

    def test_default_still_stops_on_first_failure(self):
        result, records = self.run_modes(['binary', 'independence'], ['binary'], False)
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(len(records), 1)


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
