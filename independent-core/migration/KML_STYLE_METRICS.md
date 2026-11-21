# KML style metrics — bounded next functional slice (WIP)

Existing matrix: symbols/import-export. Continue inline in the same branch; no new
agent/worktree/dependency. Current CI44287853086 evaluates b99, NOT this WIP.

Contract: OGC KML2.2 Style/StyleMap normal + inline property inheritance already
exists; pinned official XSD defines LineStyle/width and LabelStyle/scale as double.
Add explicit physical-pixel line/outline width and relative label scale. Preserve
absent-property legacy defaults (3dp stroke, 14sp Arimo label), all other DOM/assets,
existing resolver limits and local-only references. Zero explicitly suppresses the
corresponding stroke/text (Android width=0 hairline must not be used). Polygon fill
and independent component colors remain independent. This is NOT icon/SVG support.

Application safety limits (not claimed as KML specification limits): width0..256px,
label scale0..16, finite decimal/exponent only. Unsupported imported values are
left unchanged in XML and ignored for display; editor refuses unsafe values before
write. Blank removes only that inline metric and inherits the shared value/default.
No guessing units/CRS, no remote resources or new cloud/network paths.

Implementation/check sequence (existing files/scenarios only):
- [x] Existing component/edit JVM tests first: missing operation/read/merge, bounds,
  shared definitions/other geometry, explicit edit/reset, offline XSD and roundtrip.
- [x] KmlComponentStyle adds independent nullable width/labelScale fields; existing
  resolver merges properties. KmlComponentStyleEdit adds guarded metric operations;
  ObjectManagerActivity exposes them with clear units/limits and existing Save/Cancel.
- [x] LocalMapView consumes stroke width/relative text scale, explicitly skips zero;
  label layout and paint are reset for every feature; approved Arimo retained.
- [ ] Existing offlineformats helper measures actual raster stroke and label extent,
  zero/default/override; uses existing KML editor Save/Cancel + KMZ/data guards, new PNG
  within unchanged frame cap. SDK23/matching tests/privacy and necessary host checks.
- [ ] After current candidate facts, commit bounded result and one justified changed-code
  CI; both APIs/source/digests/PNG/data guards before claiming runtime support.

Acceptance remains separate and open for all23 IDs. No release-gate/lint suppression.

Local implementation WIP: missing operation baseline failed at editor59 before code.
After implementation JVM40/83425 (editor84/component47) and SDK23 source84 matching
app/tests compile, custom source+DEX privacy passed. New runtime pixel/UI assertions
are prepared in existing offlineformats; not executed on Android and not attributed
to b99 CI44287853086. No new PNG slot/workflow/mode/dependency was added.
