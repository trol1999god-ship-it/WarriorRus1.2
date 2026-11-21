import com.android.apksig.ApkVerifier;
import java.io.File;
class VerifySignature {
 public static void main(String[] args) throws Exception {
  ApkVerifier.Result r = new ApkVerifier.Builder(new File(args[0])).build().verify();
  System.out.println("verified=" + r.isVerified());
  System.out.println("v1=" + r.isVerifiedUsingV1Scheme() + " v2=" + r.isVerifiedUsingV2Scheme() + " v3=" + r.isVerifiedUsingV3Scheme());
  System.out.println("errors=" + r.getErrors());
  System.out.println("warnings=" + r.getWarnings());
  if (!r.isVerified()) throw new IllegalStateException("Signature verification failed");
 }
}
