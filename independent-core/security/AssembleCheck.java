import java.io.File;
import java.nio.file.*;
import java.util.*;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.writer.builder.DexBuilder;
import com.android.tools.smali.dexlib2.writer.io.FileDataStore;
import brut.androlib.mod.SmaliMod;
class AssembleCheck {
  public static void main(String[] args) throws Exception {
    DexBuilder builder = new DexBuilder(new Opcodes(23, -1));
    List<Path> files;
    try (var walk = Files.walk(Path.of(args[0]))) {
      files = walk.filter(p -> p.toString().endsWith(".smali")).sorted().toList();
    }
    for (Path p : files) {
      if (!SmaliMod.assembleSmaliFile(p.toFile(), builder, 23))
        throw new IllegalStateException("Assembly failed: " + p);
    }
    builder.writeTo(new FileDataStore(new File(args[1])));
    System.out.println("Assembled " + files.size() + " classes. No APK built.");
  }
}
