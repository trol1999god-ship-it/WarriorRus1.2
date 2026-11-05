# Pending delete, visibility and clipboard confirmations

Baseline40c4d1c / CI41160073360 reproduced loss of all five confirmations on
API23 and API35 after actual destroyed/recreate. Existing29 modes passed on both;
the new probe failed as expected. XML, assets, applied preferences and clipboard
fingerprint remained unchanged. All20 baseline PNGs were SHA256-verified and
reviewed; security/manager-confirm-qa-2026-10-31 contains the originals.

ObjectConfirmationDraft now keeps original project/process/XML token, compact
full-tree source indices, action, destination/label, original preview and buffer
fingerprint. It never applies an operation. Visibility retains ancestor and child
indices separately. Foreign project/process does not open the confirmation;
changed XML or clipboard disables the explicit button without rebinding addresses.
Initial and restored confirmations use the same transaction with the old token;
failed confirmation remains available for explicit Cancel. Paste checks the
captured fingerprint again inside the existing SQLite transaction.

A separate JVM reproduction proved that old content-only fingerprints did not
distinguish fresh identical captures. Clipboard format2 adds a generation UUID.
Format1 remains readable and re-encodes byte-for-byte, with a stable fingerprint;
reads do not rewrite old buffers. New captures and copy-paste refreshes get fresh
generations. The checksum and1MiB cap remain unchanged.

Candidate checks are split between managerconfirm and managerpasteconfirm in the
full CI31, keeping the existing480s/16PNG caps. They require both actual rotations,
explicit confirmation/Cancel, stale-before/stale-after, identical-content buffer
replacement and clear before/after recreation, foreign project with the same
XML and its own stored view, plus separate own-visibility writes for a selected
parent and child. Assets and cancelled/rejected XML are compared byte-for-byte;
successful operations compare full expected DOM tokens, with only new copy IDs
and namespace-declaration placement normalized for clone comparison.

Local:22 JVM suites /81190 assertions (model60, clipboard63), host12, QA415 own
classes, source SHA256 matched build_result. Final Android results are recorded
below. This is scoped QA, not full reference UI/process-death/device/
migration acceptance. No requirements are accepted and release gate is unchanged.

The first candidate91cbee / CI41162028421 passed30 modes on each API. All16
copy/cut cancellation/confirmation/staleness/recapture/clear cases passed, but
foreign-pastecopy failed: the confirmation and selection were correctly rejected,
yet onCreate adopted folder0 from the source Bundle into the other project's
stored root view because their XML tokens matched. Both failure PNGs were reviewed.
The62 intermediate frames and observations are retained as failure evidence,
not a claim that every intermediate frame was visually accepted.

de2fb84 scopes Bundle folder/token to viewProject, retaining the target project's
own stored view as fallback. Its QA unsigned SHA256 is
eaa19f35e57da137b0dfe979c4574c6f069aaad8c0ed8be918833066addb637c.
Full CI41163805624 was run with the same strict foreign-project assertions.

Final de2fb84 / CI41163805624: JVM and both Android jobs succeeded;31/31 modes
on API23 and35, no skips. managerconfirm709/706 and managerpasteconfirm910/908
assertions respectively. All foreign cases preserve their own view/settings; all
Cancel/explicit action/stale/replace/clear scenarios passed.64 final PNGs were
SHA256-verified and retained with observations;20 representative final PNGs were
actually reviewed (exact names in final-result.json). Visible text Arimo verified
in all64 observations. This does not claim visual reference acceptance of every
frame, process-death restoration, device/migration or the whole application.
