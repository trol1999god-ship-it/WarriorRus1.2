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
