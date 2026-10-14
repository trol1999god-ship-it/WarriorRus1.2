package ru.warriorrus.app.icons;

import static org.junit.Assert.*;

import java.io.*;
import java.util.*;
import org.junit.*;
import org.junit.rules.TemporaryFolder;

@org.junit.runner.RunWith(org.robolectric.RobolectricTestRunner.class)
@org.robolectric.annotation.Config(sdk = 28)
public class IconLibraryTest {
  @Rule public TemporaryFolder temporary = new TemporaryFolder();
  private IconLibrary library;

  @Before
  public void setup() throws Exception {
    library = new IconLibrary(temporary.newFolder("icons"));
  }

  private String add(String folder, String name) throws Exception {
    return library.importSvg(
        folder, name, new ByteArrayInputStream(IconLibrary.PIN.getBytes("UTF-8")));
  }

  @Test
  public void createScanAndNestedRenameMove() throws Exception {
    library.mkdir("", "A");
    library.mkdir("A", "Nested");
    String key = add("A/Nested", "pin.svg");
    assertEquals(1, library.list("A/Nested").size());
    Map<String, String> renamed = library.rename("A", "B");
    assertEquals("B", renamed.get("A"));
    assertTrue(library.resolve("B/Nested/pin.svg").isFile());
    library.mkdir("", "Dest");
    Map<String, String> moves = library.transfer(Collections.singleton("B"), "Dest", false);
    assertEquals("Dest/B", moves.get("B"));
    assertTrue(library.resolve("Dest/B/Nested/pin.svg").exists());
    assertFalse(library.resolve(key).exists());
  }

  @Test
  public void groupCopyDeduplicatesChildrenAndDeleteTree() throws Exception {
    library.mkdir("", "A");
    add("A", "pin.svg");
    library.mkdir("", "B");
    library.transfer(Arrays.asList("A", "A/pin.svg"), "B", true);
    assertTrue(library.resolve("B/A/pin.svg").exists());
    library.delete(Arrays.asList("A", "A/pin.svg"));
    assertFalse(library.resolve("A").exists());
    assertTrue(library.resolve("B/A/pin.svg").exists());
  }

  @Test
  public void invalidBatchDoesNotPartiallyMove() throws Exception {
    add("", "a.svg");
    add("", "b.svg");
    library.mkdir("", "Dest");
    add("Dest", "b.svg");
    try {
      library.transfer(Arrays.asList("a.svg", "b.svg"), "Dest", false);
      fail();
    } catch (IOException expected) {
    }
    assertTrue(library.resolve("a.svg").exists());
    assertFalse(library.resolve("Dest/a.svg").exists());
  }

  @Test
  public void folderCannotMoveIntoDescendant() throws Exception {
    library.mkdir("", "A");
    library.mkdir("A", "B");
    try {
      library.transfer(Collections.singleton("A"), "A/B", true);
      fail();
    } catch (IOException expected) {
    }
    assertEquals(1, library.list("A").size());
  }

  @Test
  public void usbFilesAreDetectedWithoutImport() throws Exception {
    File folder = new File(library.root, "USB");
    assertTrue(folder.mkdir());
    try (FileOutputStream out = new FileOutputStream(new File(folder, "usb.svg"))) {
      out.write(IconLibrary.STAR.getBytes("UTF-8"));
    }
    assertEquals("USB", library.list("").get(0).key);
    assertEquals("USB/usb.svg", library.list("USB").get(0).key);
    assertEquals(IconLibrary.STAR, library.text("USB/usb.svg"));
  }

  @Test
  public void builtinsAndRootCannotBeDeleted() throws Exception {
    for (String key : Arrays.asList("builtin:pin", "builtin:star", "")) {
      try {
        library.delete(Collections.singleton(key));
        fail();
      } catch (IOException expected) {
      }
    }
    assertEquals(2, library.list("@builtin").size());
    assertEquals(IconLibrary.PIN, library.text("builtin:pin"));
  }

  @Test
  public void pathsCannotEscapeOrOverwrite() throws Exception {
    for (String path : Arrays.asList("../escape", "/absolute", "A/../B", "a\\b")) {
      try {
        library.resolve(path);
        fail(path);
      } catch (IOException expected) {
      }
    }
    add("", "p.svg");
    try {
      add("", "p.svg");
      fail();
    } catch (IOException expected) {
    }
    assertEquals(IconLibrary.PIN, library.text("p.svg"));
  }

  @Test
  public void invalidSvgImportLeavesNoFile() throws Exception {
    try {
      library.importSvg("", "bad.svg", new ByteArrayInputStream("<svg><broken>".getBytes("UTF-8")));
      fail();
    } catch (Exception expected) {
    }
    assertTrue(library.list("").isEmpty());
  }

  @Test
  public void symlinkEscapeCannotBeCopiedOrDeleted() throws Exception {
    File outside = temporary.newFolder("outside");
    java.nio.file.Files.createSymbolicLink(
        new File(library.root, "escape").toPath(), outside.toPath());
    assertTrue(library.list("").isEmpty());
    try {
      library.delete(Collections.singleton("escape"));
      fail();
    } catch (IOException expected) {
    }
    assertTrue(outside.exists());
  }
}
