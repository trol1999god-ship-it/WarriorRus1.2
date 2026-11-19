import json
import os
from pathlib import Path
import sqlite3
import struct
import tempfile
import unittest
import zlib
from zipfile import ZipFile

from project_backup import create, restore, MAP, MANIFEST, PROJECT


def png_tile():
    def chunk(kind, data):
        return struct.pack(">I", len(data)) + kind + data + struct.pack(">I", zlib.crc32(kind + data))
    pixels = (b"\x00" + b"\x20\x60\xA0" * 256) * 256
    return (b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", 256, 256, 8, 2, 0, 0, 0))
            + chunk(b"IDAT", zlib.compress(pixels)) + chunk(b"IEND", b""))


class PortableProjectBackupTests(unittest.TestCase):
    def setUp(self):
        self.work = tempfile.TemporaryDirectory()
        self.addCleanup(self.work.cleanup)
        self.root = Path(self.work.name)
        self.project = self.root / "export.kmz"
        self.raster = self.root / "offline.mbtiles"
        self.backup = self.root / "backup.zip"
        self.output = self.root / "restored"
        tile = png_tile()
        with ZipFile(self.project, "w") as archive:
            archive.writestr(
                "nested/doc.kml",
                "<kml xmlns='http://www.opengis.net/kml/2.2'><Document>"
                "<Placemark><name>Local point</name><Style><IconStyle><Icon>"
                "<href>icons/custom.svg</href></Icon></IconStyle></Style>"
                "<Point><coordinates>37,55</coordinates></Point></Placemark></Document></kml>",
            )
            archive.writestr("nested/attachments/image.png", tile)
            archive.writestr("nested/icons/custom.svg",
                             "<svg width='32' height='32'><rect width='32' height='32' fill='#0070ff'/></svg>")
        connection = sqlite3.connect(self.raster)
        with connection:
            connection.execute("CREATE TABLE tiles(zoom_level,tile_column,tile_row,tile_data)")
            connection.execute("CREATE UNIQUE INDEX tile_index ON tiles(zoom_level,tile_column,tile_row)")
            connection.execute("CREATE TABLE metadata(name TEXT, value TEXT)")
            connection.execute("INSERT INTO metadata VALUES('format', 'png')")
            connection.execute("INSERT INTO tiles VALUES(0,0,0,?)", (tile,))
        connection.close()

    def test_roundtrip_bytes(self):
        create(self.project, self.raster, self.backup)
        restore(self.backup, self.output)
        self.assertEqual((self.output / PROJECT).read_bytes(), self.project.read_bytes())
        self.assertEqual((self.output / MAP).read_bytes(), self.raster.read_bytes())
        if os.name == "posix":
            self.assertEqual(self.backup.stat().st_mode & 0o077, 0)
            self.assertEqual(self.output.stat().st_mode & 0o077, 0)

    def test_objects_only_and_no_overwrite(self):
        create(self.project, None, self.backup)
        restore(self.backup, self.output)
        self.assertEqual({p.name for p in self.output.iterdir()}, {PROJECT})
        with self.assertRaises(FileExistsError):
            create(self.project, self.raster, self.backup)
        with self.assertRaises(FileExistsError):
            restore(self.backup, self.output)

    def test_rejects_tampered_member_before_writing_output(self):
        create(self.project, self.raster, self.backup)
        tampered = self.root / "tampered.zip"
        with ZipFile(self.backup) as original, ZipFile(tampered, "w") as modified:
            manifest = json.loads(original.read(MANIFEST))
            payload = bytearray(original.read(PROJECT))
            payload[-1] ^= 1
            modified.writestr(MANIFEST, json.dumps(manifest))
            modified.writestr(PROJECT, payload)
            modified.writestr(MAP, original.read(MAP))
        with self.assertRaisesRegex(ValueError, "checksum"):
            restore(tampered, self.output)
        self.assertFalse(self.output.exists())

    def test_rejects_extra_unsafe_path(self):
        create(self.project, None, self.backup)
        with ZipFile(self.backup, "a") as modified:
            modified.writestr("../unrelated", "unsafe path")
        with self.assertRaisesRegex(ValueError, "Unexpected"):
            restore(self.backup, self.output)
        self.assertFalse(self.output.exists())


if __name__ == "__main__":
    unittest.main()
