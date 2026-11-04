# Raw vertex editor recreation

Baseline 0b574a2 / CI41800304932: both API23/API35 lost valid and invalid open raw coordinate forms after real destroyed/recreate. Main draft and KML/assets remained intact. All eight baseline PNGs reviewed; native error popup covered action buttons, modal text lacked Arimo. Evidence: security/vertex-form-qa-2026-11-04/before-*.

Candidate saves bounded raw text (8192 UTF-16 chars), selection endpoints and validation error (2048), original project/feature/process, XML part key/token, operation/index and SHA256 of original main input. No KML or attachments enter the Bundle. Foreign identity drops the form; stale original geometry/main input retains raw text with Apply disabled. Apply rechecks identity and changes only editor input; explicit main Save remains separately transactional. Cancel clears the modal intention without modifying main input or KML/assets. Inline validation and compact landscape layout retain action access with IME; Arimo is applied to modal and selector.

Local candidate: JVM23/81259, QA driver12, compile425 own classes, minSdk23, INTERNET only, no legacy/native/stubs/missing references. Current Android candidate acceptance is PENDING full CI33 and new actual PNG review. Baseline failure is not a successful candidate test. Release gate and requirements remain unchanged; this is not complete migration acceptance.
