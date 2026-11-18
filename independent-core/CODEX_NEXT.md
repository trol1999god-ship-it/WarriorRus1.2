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

## Штатный доступ Git (история настройки)

Git CLI credential helper по умолчанию отсутствует. Штатный per-command
`git -c credential.helper='!gh auth git-credential' push origin HEAD:refs/heads/codex/independent-core-auto`
успешно использовал существующий GH_TOKEN; значения секретов не нужны в чате.
Обычный fast-forward push сохранил исходные0a031db/c373133/ea9ff9f вremote истории.
Прерванная API передача не меняла refs; далее не продолжать её, код уже отправлен.
Сеть/TLS/reusable environment publication не изменялись; готовностьсреды не доказывает публикацию.

## Последний a7f789a: оба completed FAILURE, подтверждён test-only блокер

CI43234511518 JVM131238174611 SUCCESS39/83317/host31.
API23 job131238606010 и35 job131238605912: по45/46; единственныйFAIL offlineformats.
Оба full logs: NPE KmlComponentStyleChecks.editor line12. Ошибочно использован
KmlProject.byId для shared Style/StyleMap: он индексирует только containers/Placemark.
Initial renderer pixels/default independence/Arimo/KMZ иHGT guards прошли ДОэтойточки;
editor UI/IME/Save/Cancel/reset/stale иfinal-data guards НЕисполнены/НЕзасчитаны.
Mode offlineformats НЕPASS, total assertions не угадывать. HGT Ready4381/3629ms.
Source/digest/all558+561members verified; шесть новых scoped KML/HGT PNG viewed,
editor/error/postedit PNG не были созданы. editor-a7-result.json/full-job logs.
Artifact pull failures в этом run не было; recovery branch не заявлена exercised.

Узкое исправление только Native helper: DOM + exact KML tag/ns/id, count==1;
оригинальные equality/data guards не сняты. SDK23 corrected instrumentation compiled,
paired source84 app сохранён; shared-definition-fix-local receipt. Production codec
ради test lookup не менялся. CI43280843162 проверил lookup, но остановился на IME; новый кандидат проверит это и подготовленную
реальную функцию именованных наборов; старый a7 не rerun вслепую и не станет PASS.

## Предыдущий ca888b5 (история, не зелёный)

Remote ca888b5e02c10828377f4d8ea4f610652810a52b / CI43225977674 FAILURE.
JVM131209140454 SUCCESS38/83282/component32; обе Android builds SUCCESS.
API23 job131209474688 SUCCESS46/46. API35 job131209473186 FAILURE45/46:
vertexscroll native314 PASS, но adb pull returncode1 после частичного PNG transfer;
следующий boot-id read explicit device offline, восстановлен sameBoot=true/retry1/rc0.
Partial PNG не превращает pull failure в успех. Native не повторялся.

Новый renderer/offlineformats1228 PASS обе API: Icon/Line/Poly/Label цвета, alpha,
fill/outline, shared StyleMap normal + inline overrides, KML/KMZ/assets/reopen/
otherproject/network0. API35 managerforms506 реально исполнен/PASS.
Отмывка HGT в этом run Ready3357/2873ms при прежних45sec; source+target CAS/
Cancel/destroy/reopen/remove/rawHGT/cache/KML/assets/foreign guards PASS.
All558+561members/source/outer/innerSHAverified. Восемь новых scoped PNG реально
просмотрены: по2KML и2HGT/API. Остальные кадры НЕзаявлены viewed.
security/kml-components-qa-2026-11-12/renderer-ca888-{api23,api35},result.json/full logs.
Старые c946/838/130b failures остаются историей, не становятся PASS задним числом.

## Подготовленный следующий production-кандидат (Android pending)

Local9a71284/095fbfa/a8ac35d: «Цвет и заливка KML» из existing manager,
4цвета/fill/outline через existing managed editor, явные Save/Cancel/blank reset.
ObjectTreeWrites transaction + исходные project/key/token; shared StyleMap/прочие
компоненты/геометрия/assets не переписываются. SVG/библиотеки значков НЕподменены.
Arimo привязан к Paint подписей карты через существующий cache, Activity ABI сохранён.

Обнаруженная source-причина: старый f.color вычислялся по первой компоненте и
связывал fallback остальных. Теперь отсутствующие компоненты независимо берут
старый базовый e6c45a; default polygon alpha45/labelwhite прежние. Новый native
IconStyle-only fixture проверяет независимые line/poly и precondition f.color.
Это не входило в ca888b5. JVM39/83317/component33/edit34 PASS; SDK23 source83exact/
563classes/app+matching tests/customprivacy PASS; independent-defaults-local receipts.
Native helper в existing offlineformats расширен UI Save/Cancel/invalid/reset/stale,
Arimo/IME/physical, all other features/geometry/shared styles/KMZ/assets/network0;
финальный main PNG после явных правок/reopen. Всего16 mvisual, лимит НЕповышен.

Transport candidate: только exact QA pull/exit1/partial-progress → immediate boot
probe. Retry разрешён лишь при ЯВНОМ device offline и прежних sameBoot/qemu/boot
checks, <=15sec включая probe, один readonly pull, partial directory сохраняется.
Exit1+online/changedboot/permanentoffline не успех; am instrument/timeout не повторять.
Host31 PASS, initial diagnostic regression failure/fix logs сохранены.
Один changed-code fullCI46 для этих изменений оправдан; слепого rerun не делать.

## Следующее действие

Оба a7 completedjob разобраны. Lookup fix/receipts сохранены в c373133; проверить origin a7f789a
и noactiveCI/root-only; push текущего кандидата с0a031db named sets +testfix, один
changed-code fullCI46. Прочитать оба completedjobs/новыеPNG, расследовать отказы.
Не считать API23 доказательством35, offline/skip/partial — успехом.
После проверенного участка — следующий функциональный gap матрицы styles/import-export,
SVG/библиотеки только по проверенному контракту, затем media/explicitshare → UI/
coordinates/compass/settings → migration26.1/приёмка. Не dialog/orphan baseline очередь.

## Следующая функция подготовлена локально, НЕвходит в CI a7f789a

MapCompositionPresets + existing Settings/MapLayers UI: имя/Save/явныеApply/Delete,
существующий состав/renderer, project owner + UUID library revision + двух snapshot CAS.
Сохранение/удаление не копирует и не меняет maps/cache/KML/assets; применениеявно
включает stack. JVM40/83361/presets44/SDK23source84exact/576classes/customprivacy PASS.
existing maplayers/reopen helper +2кадра (итого12/16, cap16 прежний), real force-stop,
IME/physical/Arimo, stale/foreign/deleted-owner/data guards. Android этой функции pending.
MAP_PRESETS.md/security/map-presets-qa-2026-11-12/local/backup сохранены.
a7f789a уже разобран: helper lookup NPE, исправлен только тест. Не приписывать ему
наборы; они входят в следующий собственный changed-code candidate.

## Незакрытые границы и сохранность

Все23id implementation/acceptance раздельно, accepted0/release gate25 прежние.
Последний официальный lint0a031db:84sources/160реальных classfiles, exit1,
MissingClass/HardcodedDebugMode/114warnings; Java-only adapter/smali gap, НЕPASS.
Custom privacy/sourceDEX НЕзаменяет Android lint. Full release/26.1 acceptance открыта.

Java17/SDK/tools сохранены: /workspace/android-toolchain/env.sh. Безlocalemu безKVM.
Stash2, GeoRasterTransform.java.pending, tiled patch и все старые artifacts/receipts/
GIF/BMP backups/исходники/QAkeys внеGit сохранены. Новые backups:
kml-editor-preserve-nt60j6qs (SHA5659e1f3…), kml-defaults-preserve-jwy0b6p2 (SHA7e5c9d5e…).
Только independent-core/existing branch; noagents/новыхветок/worktree/reset/clean/mergePR14.
Название/min23/Arimo/resources/online+cache/приватность безGPS/geo/accounts/telemetry/
cloudsync/скрытойпередачиobjects/assets; BTтолькоявно; syntheticQA/disposablekeys only.

Исследование следующего width/scale контракта: Google KML reference иOGC2.2XSD
вернули HTTP403, документы не получены, не считать спецификацию проверенной.
Сетевые ограничения/TLS не менялись; повторов нет. Это не блокирует текущий editor CI.
