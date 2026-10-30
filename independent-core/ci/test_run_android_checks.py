"""Exercise CI failure aggregation with a fake adb, without an Android device."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
import unittest


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
            return result, records

    def test_collects_failure_and_runs_next_independent_mode(self):
        result, records = self.run_modes(['binary', 'independence'], ['binary'])
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual([r['passed'] for r in records], [False, True])
        self.assertIn('synthetic assertion', result.stdout)

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


if __name__ == '__main__':
    unittest.main()
