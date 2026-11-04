# Destination chooser before Move — incomplete QA

Baseline124822b / CI41166910485 validly reproduced loss on API23 and API35.
Both probes asserted settled portrait, then a different/destroyed Activity in
landscape. XML, assets, applied settings and selection stayed unchanged. Four
baseline PNGs were verified and reviewed. The earlier8b82ba6 API35 probe began
in landscape and remains invalid as reproduction evidence.

Candidate a5086b2 retains a bounded ObjectMoveDraft as chooser intent, separate
from Move confirmation: original project/process UUID/XML token/compact source
indices/hidden count. The original browsing folder/token use the project-bound
view Bundle; list position uses two bounded integers. An explicit destination
choice opens Move with the original token and sources; the existing transaction
checks the token after explicit Move. Recreation itself performs no write.

Local QA before the execution environment became unavailable:22 JVM suites,
81190 assertions, driver12,417 own classes, minSdk23, INTERNET only, no legacy/
native/stubs/missing refs. Source SHA256 matched build_result. Unsigned SHA256:
6e4554f2d5340415b546cee748e0157b06157b2496c46db157f809c956ca7c90.

CI41173465616 FAILED. API23:31 passed, managerchooser failed at the precondition
that a long list really scrolled to option6 before rotation. API35:30 passed;
managermove did not start because adb was offline; managerchooser reached option6
but failed to retain it after actual destroyed/recreate. The exact saved/restored
position and cause were not logged. Do not treat the former as an app rotation
failure, or the latter as fixed. The forms PNGs emitted after offline Move belong
to the preceding scenario and cannot prove Move execution.

On BOTH APIs the new chooser cases Cancel, destination-choice then confirmation
Cancel, explicit Move, stale-before, stale-after and foreign project with identical
XML passed, including XML/assets/settings guards. The original browsing-folder
case comes after scroll and was NOT REACHED. No complete chooser acceptance.

All25 candidate PNGs (12 API23,13 API35) were viewed and their original bytes
verified with SHA256, PNG signature, chunk CRC and dimension bounds using the
GitHub logs, since local execution was unavailable. Visible-text Arimo metadata
passed. Originals, manifests and observations are in candidate-a5086b2-api23/35;
exact scope and job/artifact references are in candidate-a5086b2-result.json.
The test time/frame caps remain480s/16PNG; no checks or release gate were relaxed.

Next: record first-visible index/adapter count and saved/restored positions around
layout and real rotations. Keep first==6; diagnose API23 setup and API35 restore
separately. Run original-folder coverage before/independently of a scroll failure,
then fix the confirmed cause, rebuild and run full CI32. The execution environment
is currently unavailable and blocks that build/fix loop. Preserve local uncommitted
CODEX_NEXT/OBJECT_CHOOSER_STATE and artifacts/toolchain when it returns; reconcile
these newer remote evidence docs without reset/clean. After chooser passes, the
next scoped investigation is unsaved vertex-coordinate subdialogs during actual
GeometryEditorActivity recreation, first reproduction rather than guessed repair.

Release gate remains false/25 blockers,0 requirements accepted. This is not full
reference UI, process-death, physical-device, migration or whole-app acceptance.
No new cloud task was created and reusable-environment publication was not repaired.

## 4 November: diagnostic cause and candidate repair

Execution restored through the standard running/connected/current status; shell
and saved Java17/SDK worked. Local docs were preserved as backup and retained
stash before fast-forward to6cf9c4a. No reset/clean or network/TLS changes.

8d0a0cf / CI41176758819: previous31 modes and original-folder passed on both
APIs. On23 the list has8px top padding: setSelectionFromTop(6,0) produced first5,
top-40, while row6 started at+8. On35 first6/top0 was correctly saved and read,
but raw setSelectionFromTop during pending show-layout reverted to first0/top0.
The numeric data and guarded intent were intact.29 diagnostic PNGs are retained;
five relevant scroll/original-folder PNGs were actually reviewed.

Candidate uses public ListView.onSaveInstanceState/onRestoreInstanceState, capped
at4096 bytes, so the framework participates in initial layout synchronization.
Only guarded unchanged XML can apply that state; no choice callback is invoked.
The numeric fallback applies after layout and subtracts list padding. The fixture
now requests absolute top0 by subtracting getListPaddingTop; first==6 remains
mandatory, with a stronger top==0 assertion before and after both real rotations.
AOSP AbsListView for android-6.0.1_r81/android-15.0.0_r1 distinguishes this native
pending-sync restoration from a raw selection request.

Local QA419 classes,22 JVM suites/81190 assertions, driver12, source hashes match.
Android verification of this candidate remains pending. Requirements/release gate
are unchanged and the full application remains unaccepted.

F5 CI41793608248 did not pass: both previous31 modes and original-folder passed,
but native restore in onShow was still discarded while layoutRequested=true.
Both APIs now correctly established first6/top0 before rotation; both then
returned to first0.30 PNGs retained,4 scroll frames reviewed. The next candidate
applies native state only once at a stable pre-draw (children present and no
pending layout), cancels that draw to request the framework sync layout, and
retains all first6/top0 checks. No timers or automatic destination action.
Local QA420 classes, source hashes match, JVM22/81190 and driver12 pass;
Android validation remains pending.
