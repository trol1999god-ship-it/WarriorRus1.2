# Продолжение — 19 ноября 2026

Рабочая ветка `codex/independent-core-auto`, черновик PR #14. Последний коммит
исправления определяй командой `git log -1 --oneline`. База `42c2ce7`, резервная
ветка на `5dd24dc`: разница между ними только в триггерах QA. В
`rabochaya-karta` есть отдельный коммит документации `2b6ec76`; прямого слияния не было.

Push CI [44358840098](https://github.com/trol1999god-ship-it/WarriorRus1.2/actions/runs/44358840098)
для `42c2ce7`: сборка, JVM и аудит APK прошли, по 45/46 на API 23 и 35. Оба
`offlineformats` упали при проверке первого пикселя SVG. PR-запуск 44358857032
пропущен по условию workflow, чтобы не дублировать запуск по push.

`LocalMapView.setSymbols` теперь передаёт декодированные изображения в главный
Looper даже до присоединения View к окну. `View.post` откладывал этот callback
до присоединения, поэтому существующая проверка Canvas видела карту без SVG.
При закрытии карты отложенный callback освобождает декодированные изображения.
Локально прошли 43 JVM-набора, 31 проверка запуска QA, сборка приложения и
инструментации с SDK 23, аудит исходников и APK. Проверки на API 23/35 обязательны.

Эталонный APK v26.1 получен, архив читается, SHA-256 совпадает с
`migration/requirements.json`. HTML-матрица описывает 13 экранов, но полного
набора эталонных снимков и сравнения на Fold5 пока нет. Прежние отметки ниже о
недоступности самого APK относятся к предыдущей сессии.

Следующий шаг после сохранения ветки:

```sh
git fetch origin codex/independent-core-auto
git log -1 --oneline FETCH_HEAD
```

В Actions открыть запуск push для найденного коммита и проверить
`offlineformats` на обеих API, включая StyleMap, прозрачность, масштаб и KMZ
повторное открытие. Затем продолжить пользовательский выбор локального SVG и
назначение его точке. Официальный Android Lint, полное сравнение v26.1 и
приёмка ещё открыты.

## Предыдущая точка продолжения — 18 ноября

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

## SVG production candidate: local checks PASS; Android runtime pending

Исходный WIP100/JVM43 сохранён в work/resume-2026-11-18/svg-model-preserve и новой
full-parity-audit snapshot, stash2/pending/toolchain untouched. Сейчас source88/591classes
matching SDK23 app+tests; JVM43 suites PASS (SvgPath49/SvgIcon44/KmlSymbolAssets17,
component52/editor84). Parser261 reference resources PASS — не runtime/26.1 acceptance.
Реальный код: SVG paths/primitives/solid paint→SvgRaster→LocalMapView worker/Canvas,
KmlComponentStyle normal StyleMap/inline href+scale/heading/hotSpot, LocalMapActivity
передаёт snapshot assets того же Document после load/explicit metadata save. Без записи KML,
без file/network URI loading; unknown SVG не частичный успех, видимое предупреждение.
Own KML/KMZ import/export уже сохраняет SVG payload; новый renderer подключён к нему.
32 отображаемых SVG/256px,256 локальных SVG/16MiB snapshot; не полная библиотека.
Main panels/menu/glyphs используют подтверждённые blue TEXT082e4c/PANELc7e1f8;
реальные native checks добавлены для контраста панелей. Компоновка13/Fold не принята.
Native existing offlineformats extended: actual shape/hole/pixels/normal StyleMap/KMZ/
same XML href foreign owner/DTD/external/script/data guards. Existing PNG slots показывают
SVG вместе с прежними component/editor frames; frame caps/physical guards unchanged.
Matching test DEX содержит финальные security checks. Android НЕисполнен локально,
следующий один changed-code fullCI existing workflow после commit/push; b11 не rerun.
Локальный host31: первый30/31 (fake-adb remainingdeadline0.018s приD8), изолированно31PASS
без изменения criteria/timeouts. Оба лога сохранены, первый FAIL не выдан за PASS.
Fresh official lint88/173actualclassfiles exit1 MissingClass/HardcodedDebugMode/
114warnings; smali bodies не анализируются, NOTPASS. Custom source+DEX privacy PASS.
Evidence: security/svg-render-qa-2026-11-18/local-candidate.json.
Далее прочитать реальные обеAPI jobs/source/digest/PNG, исправить каждый отказ. До результата
не выдавать следующий пользовательский APK. После verified SVG slice — assignment/custom
library/editor целым user block с утверждённым UI, затем media/filemanager/остальная матрица.

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
