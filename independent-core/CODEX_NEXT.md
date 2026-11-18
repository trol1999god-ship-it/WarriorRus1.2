# Продолжение — 18 ноября WORK: полный перенос26.1; b11 технический прототип

## Новый приоритет владельца после реальной проверки Fold5

b11 установлен/открыт на Samsung Galaxy Z Fold5: владелец сообщил значительное отставание
практически всего UI/функций от26.1. Это технический прототип, не почти готовый продукт.
Первый APK приоритет выполнен. Следующий APK — только существенный пользовательский блок
с реальным23/35 runtime/data/PNG; не модель/косметика. Полный перенос без redesign/упрощения.
Необходимый доступный аудит: migration/FULL_PARITY_AUDIT_2026-11-18.md,
security/full-parity-audit-2026-11-18/requirements-audit.json (23id)/branches.json (11веток).
Library referenceAPK26.1/backupZIP и13screens недоступны агенту, bytes/hash НЕпроверены;
inventory1222bytes НЕ13screens. Найден другой reference_ui.zip из0b78cecc:826PNG/261SVG,
проверен byte/Git SHA; branch audit связывает его с2.3.8b, не26.1. Не смешивать эталоны.
Других document sessions нет; чужое незапушенное недоступно, merge запрещён.
Существующий SVG WIP сохранён; реальный gap href→renderer подтверждён. Сейчас production
vertical slice через существующий owner KML/StyleMap/renderer/import/export, не model-only очередь.
UI13/Arimo/resources/insets/Fold width — стандарт каждого блока; не отложенный финальный этап.
Точное13-screen layout acceptance блокировано отсутствующими originals, функции не блокировать.

## Проверенный результат

Проверенный код b11f6b635707010dfd5869a058245faf7338ecdb / push CI44296647517 SUCCESS.
JVM134775298776:40/83425, host31. API23 job134775584554 и API35 job134775584477:
по46/46, FAIL0/SKIP0; offlineformats1361, maplayers330/reopen77 each.
Inline error fix Cancel99d3cbf и width/label scale29a43cc+844fe6e проверены:
real IME/raw/cursor1..4/physical Save+Cancel/Arimo, реальные Canvas pixels,
StyleMap/inline/alpha/fill/outline/KMZ/reopen/stale/owner/data guards PASS.
Primary preset name/list и restarted-manager проверены. Source/outer/inner/all564+567
members сверены; по7 scoped original PNG каждой API просмотрены. Унаследованные
копии не считаются новыми кадрами. Это ограниченный результат, не полная приёмка.
Evidence: security/kml-components-qa-2026-11-18/final-b11-result.json.

PR run44296655197 intentionally SKIPPED duplicate push; не SUCCESS. Recovery job skipped
без evidence-only — штатное условие. Повторять зелёный CI без новой причины нельзя.

## Отдельная тестовая установка (не replacement26.1)

Артефакт API23 id14427555390:
https://github.com/trol1999god-ship-it/WarriorRus1.2/actions/runs/44296647517/artifacts/14427555390
В ZIP выбрать rk-qa/app.apk. package org.rabochaya.karta, versionCode27,
versionName27-independent-core, min23/target33, debug-qa/debuggable, Disposable Android QA.
APK SHA256 63ef99c33641936f50b346927c5fc05e41d9ccbd1c0016f6272ba5367bec6563.
Cert SHA256 9871e3594870114076205c565781dfe8de30ecba8c37a62ba582267cc3e8af9d.
Apksigner v1/v2/v3 verified. Архив7members без приватных ключей; APK inventory проверен.
Запуск/исходная+вторая явная метка/save/reopen/map/layers/KMLKMZ/privacy/data прошли
на синтетических эмуляторах23/35. Это не проверка телефона, всех13 экранов или26.1 migration.
Не устанавливать поверх основного приложения; использовать синтетические проекты.
Одноразовый сертификат не гарантирует будущие обновления этой TEST установки.
Receipt: security/kml-components-qa-2026-11-18/test-install-b11/receipt.json.

## Следующая пользовательская функция

SVG/import-export по migration/SVG_ICON_CONTRACT.md (draft, ещё не реализация):
локальный bounded static SVG из своего KML/KMZ snapshot → existing renderer →
reopen/экспорт с точными bytes и отказом unsupported/external features.
Затем явное назначение/библиотека; media/explicitshare → UI13/coordinates/compass/settings
→ safe26.1migration по матрице. Не возвращаться к orphan/dialog baseline.

## Локальный SVG WIP после TEST выдачи (не входит в b11 APK)

SvgPath49/SvgIcon34/KmlSymbolAssets17:100 новых model checks; полный JVM43 suites PASS.
Три модели компилируются с настоящим android-23.jar как bootclasspath.
SAX lexical-handler отвергает DTD до entities; только memory snapshot исходного Document,
32 SVG/2MiB, file64KiB, отказ external/foreign/traversal/unsupported features.
Текущий профиль уже: primitives/paths/solid paint/inheritance; transforms/group opacity,
CSS/text/gradients/external features явно отвергаются, а не частично отображаются.
Это НЕ renderer/пользовательская SVG-функция: owner asset context ещё не подключён к
LocalMapActivity/LocalMapView; KML href/scale/hotspot contract и Android pixels/runtime
впереди. Model source/tests/verify_jvm остаются локальным незакоммиченным WIP, специально
не приписаны CI44296647517; generated overlay/APK b11 не перегенерированы.
Private snapshot: /workspace/work/manager-confirm/resume-2026-11-18/svg-model-preserve/;
final JVM log svg-model-final-jvm.log. Первый strict bootclasspath compile с lambda
дал javac CompletionFailure MethodHandles.Lookup; заменён anonymous EntityResolver,
финальная SDK23 model compile exit0. Compiler args artifact сохранён, не удалён.
Следующий шаг — проверить OGC KML Icon/href/scale/hotSpot и подключить bounded adapter
в existing renderer/asset lifetime, затем existing offlineformats pixels/reopen/KMZ/data.
Не запускать fullCI для отдельно неинтегрированной модели ради отчёта.

## Сохранённые ограничения

7faed6d:5 official offline XSD/roundtrip кейсов порядка новых Style/color/ExtendedData PASS.
Исторический b99/CI44287853086 FAILURE45/46 both: native error popup блокировал Cancel;
это не retroactive PASS. Новое успешное доказательство — только b11/CI44296647517.
Fresh official Android lint84/160realclassfiles: exit1 MissingClass/HardcodedDebugMode/
114warnings; smali bodies не анализируются, custom scanner не замена. НЕPASS.
All23 acceptance0/releasegate25 неизменны. TEST APK не выпущенный replacement.
Та же Cloud Environment; Java17/SDK сохранены, это не исправление reusable publication.
Stash2/pending/toolchain/backups/старые WIP сохранены. Нет reset/clean/newbranch/worktree/
merge/cleanup/переноса репозиториев. rabochaya-karta не объединять: другие недоступные
сессии ещё не проверены на незапушенное. PR14 draft не сливать.

История: migration/STATUS_HISTORY_EA9_2026-11-18.md и STATUS_HISTORY_BEFORE_C373.md;
точные b99 failed receipts сохранены отдельно. Документальный итог не требует нового fullCI
для byte-identical проверенного application/test кода.
