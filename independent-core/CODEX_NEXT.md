# Продолжение — 18 ноября: KML schema fix7faed6d, IME candidate

## Текущая точка

Remote b99f9e637aa80523162c63e0103f89af0b5acc70. Changed-code CI44287853086 RUNNING;
JVM134745064603 SUCCESS; Android23 job134745452435, Android35 job134745452398 pending runtime.
НЕpush пока активен, не rerun. Current candidate includes7faed6d production order fix +b99 IME scope.

Предыдущий ea9ff9f, CI43280843162 completed FAILURE: JVM131401369832 SUCCESS;
API23 job131401634505 —43/46, API35 job131401634481 —42/46.
Обе API: offlineformats иmaplayers failed на soft keyboard window never appeared;
maplayersreopen SKIPPED после fixture failure. Editor/sets НЕприняты.
API35 geometrycloseconfirm native завершился code-1, но pull rc1 только building file list:
нет PNG, нет explicit offline/sameBoot receipts; НЕPASS, native ради выгрузки не повторять.
All529+516members/source/outer/inner hashes verified. Только initial KML scene PNG
обе API реально просмотрены; editor/IME/preset PNG не созданы. Full logs сохранены.

Причина IME observation: новые helpers не включали FLAG_RETRIEVE_INTERACTIVE_WINDOWS;
getWindows без opt-in не доказывает отсутствие физической IME. API35 logcat содержит
onKeyboardViewShown; старые working helpers включают flag+show_ime_with_hard_keyboard.
Узкий test-only scope включает оба preconditions и восстанавливает исходные flags/setting
вfinally (включая setup failure); исходные реальная IME/physical/buttons/data guards сохранены.
SDK23 corrected instrumentation compiled; runtime pending changed-code CI, не rerun ea9.

Отдельный production commit7faed6d: новые Style/color/fill вставляются в порядке OGC
до ExtendedData/width/outline; существующий DOM не переставляется. Пять valid baseline
становились invalid; после fix full offline official XSD + serialized roundtrip PASS,
component58, JVM40/83385, host31 свежий PASS, matchingSDK23 source84/privacysource+DEX PASS.
Старый host29/31 при конкурентной компиляции сохранён: .5s fake-adb readiness timeout;
guards/timeouts не изменялись, свежий isolated host31 завершился19.088s без ошибок.
Official lint MissingClass/HardcodedDebugMode остаётся NOT PASS; acceptance0/releasegate25.

Следующее: дочитать CI44287853086 для KML editor+namedsets0a031db+XML guards;
читать оба completedjobs/source/digest/allmembers/новые PNG, расследовать отказы.
Затем функциональный gap styles/import-export/SVG по проверенному контракту, далее
media/явнаяпередача→UI/coordinates/compass/settings→migration26.1. Не orphan/dialog queue.
Все backups/stash2/pending/toolchain/WIP сохранены; reset/clean/worktree/merge не делались.

## Следующий локальный WIP: width/label scale (НЕчасть CI b99)

KML_STYLE_METRICS.md: существующие StyleMap/inline/manager/render/KMZ, width0..256px,
label scale0..16; nullable property inheritance, zero явно скрывает stroke/text,
point outline не зависит от LineStyle width. XML unsafe values не переписываются;
явный editor Save/Cancel/reset использует прежние owner/token guards.
Baseline missing operation editor59 reproduced. Локально JVM40/83425/editor84/
component47, SDK23 matching source84 app/tests, customprivacy PASS. Подготовлены
actual raster/zero/no-shadow/point independence/polygon fill pixel guards иUI операции
в existingofflineformats без новых mode/frame slots. Они НЕисполнены на Android.
Нет SVG/icon library claim; текущий CI44287853086 проверяет только b99.
Не push следующий WIP до completed результатов текущего CI; новый runtime нужен позже.


История: [EA9 и предыдущие локальные срезы](migration/STATUS_HISTORY_EA9_2026-11-18.md),
[ранние срезы](migration/STATUS_HISTORY_BEFORE_C373.md).
