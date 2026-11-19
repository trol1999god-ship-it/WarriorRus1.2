# Продолжение — 19 ноября 2026

## Узкое окно карты и перенос выгруженного проекта

В узком окне нижняя панель прокручивается с целями не меньше 48 dp.
Кнопка сворачивания закреплена справа. Меню учитывает размеры окна.
После изменения размеров карта сохраняет живой редактор и черновик.
Редактор записывает изменения внутри SQLite-транзакции и проверяет исходный
объект перед записью. Ошибка оставляет черновик в диалоге.

API 23: `launcher` 133 проверки, `coordinates` 47. Проверено окно 290 dp,
поворот с заполненными полями, сохранение объектов и отказ от устаревшей записи.
Сборка Java 17 и SDK 23, 43 набора JVM, официальный Lint 0 ошибок / 114
предупреждений, манифест, выборочная проверка инструкций DEX и аудит APK прошли.
На API 35 оба локальных запуска на программном эмуляторе прервал системный
диалог `System UI isn't responding` до появления главного экрана. Сценарий
`coordinates` не запускался после ошибки `launcher`.
Предыдущая матрица 44547408637 для SVG прошла на обеих API.
Полная матрица новых изменений:
[44553902312](https://github.com/trol1999god-ship-it/WarriorRus1.2/actions/runs/44553902312).
Физический Fold5 остаётся отдельной проверкой.

[Проверка установки и перенос выгруженного проекта](migration/PORTABLE_PROJECT_BACKUP.md)
добавлены коммитом 0968275. Проверка эталонного APK выявила разные package
и сертификаты, а также versionCode 395 у v26.1 против 27 у QA.
Четыре теста архива проверяют KMZ с вложением и SVG, MBTiles, контрольные суммы
и отказ перезаписи. Файлы SQLite, настройки и кэш в приватном хранилище v26.1
эта копия не переносит. Release gate остаётся закрыт.

Проверены соответствия 13 разделов матрицы доступным классам. Визуальная
приёмка всех экранов открыта. У эталона доступны перечень экранов и
проверка первого экрана из прошлой сессии. Первая задача следующего
сеанса — сверить по эталону панель карты и управление слоями.
Получить актуальную базу: `git fetch origin codex/independent-core-auto`.


## Назначение локального SVG через менеджер объектов

В «Цвет и заливка KML» для выбранной метки доступен пункт
«Выбрать значок SVG». Системный выбор файлов открывает локальный документ. После
проверки статического формата приложение записывает оригинал и ссылку на него
в одной SQLite-транзакции. При смене проекта или KML пока открыт выбор сохранение
останавливается. Одинаковые SVG в одном проекте используют один файл.
Поддерживаются статические значки до 64 КиБ и 256 × 256 px. Общие стили и
существующие вложения сохраняются. Значок переносится вместе с проектом в KMZ.
Библиотека пользовательских папок SVG остаётся отдельной задачей.

Java 17: JVM 43 набора, host QA 31 проверка, приложение и инструментация
собраны с SDK 23. Подпись QA и аудит APK прошли. Сценарий
`--modes svg --debug-qa` на API 23 прошёл 51 проверку. В том числе SQLite,
отказ для устаревшего выбора, повторное открытие KMZ и пиксели значка.
Полный CI включает их в offlineformats. GitHub Actions для коммита 5484482:
[44547408637](https://github.com/trol1999god-ship-it/WarriorRus1.2/actions/runs/44547408637).
Все пять плотностей значка приложения побайтно совпадают с утверждённым ZIP.

Официальный Android Lint 8.2.0 локально: 0 ошибок и 114 предупреждений.
CI передаёт адаптеру собранный APK. Адаптер проверяет реальный класс
ProjectsActivity, суперкласс и публичный конструктор в DEX, затем добавляет
его описание в отдельный classpath Lint. Для тестового APK без этого класса
адаптер завершился ошибкой. Lint анализирует Java, ресурсы и манифест.
Инструкции smali не входят в его покрытие. Визуальная приёмка всех 13 экранов, точное
совпадение с v26.1, проверка обновления и выпуск остаются открытыми.

База PR #14: 01f3c75. Его предыдущий коммит приложения 0b64fe3 прошёл JVM
и Android QA на API 23 и API 35 в push run 44422641535. Повторный PR run
пропущен условием workflow. Проверены ветки main, rabochaya-karta, резервная
ветка от 18 ноября и Git bundle до изменений. В rabochaya-karta один отдельный
коммит документации. Git merge-tree не выявил конфликтов с базой PR.

## Предыдущая сводка

Рабочая ветка `codex/independent-core-auto`, черновик PR #14. Коммит
исправления SVG `aa85f14`, Android QA [44418167048](https://github.com/trol1999god-ship-it/WarriorRus1.2/actions/runs/44418167048).
Последний коммит приложения `0b64fe3`, полный Android QA
[44422641535](https://github.com/trol1999god-ship-it/WarriorRus1.2/actions/runs/44422641535).
В очереди GitHub Actions сохранён самый свежий запуск. Активный запуск для
`aa85f14` продолжает работу. Ожидавшие промежуточные запуски заменены новым.
База `42c2ce7`, резервная
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

В следующем коммите исправлен `HardcodedDebugMode`: отладочный флаг добавляет
только сборщик QA. Обе сборки собраны, `aapt2 dump badging` подтвердил профили,
аудит исходников и обоих APK прошёл. Официальный Lint теперь выдаёт 1 ошибку
`MissingClass` и 114 предупреждений. `dexdump` подтвердил, что
`ProjectsActivity` есть в APK. Lint не анализирует его smali-реализацию, поэтому
проверка остаётся открытой.

Ограничение скачивания для OSM теперь применяется и к эквивалентным адресам
с другим регистром или завершающей точкой. В 43 JVM-наборах прошли в том числе
7231 проверка тайлов и источников. Сборка приложения и инструментации Java 17
с SDK 23 прошла. Собранный QA APK прошёл проверку DEX и манифеста.
Один запрос с общими индексами тайла к OpenStreetMap и один к ESRI World Imagery
вернули HTTP 200 и изображения 256×256. Это проверка доступности, условия
офлайн-экспорта проверяются отдельно. 13 стандартных ArcGIS MapServer из каталога
сообщили `exportTilesAllowed=false`; перед проверкой загрузки областей уточнить
поддерживаемый Esri способ офлайн-доступа. Наборы и кэш существующих проектов
сохранены.

Эталонный APK v26.1 получен, архив читается, SHA-256 совпадает с
`migration/requirements.json`. Эталон и отдельная QA-установка запустились
в режиме полёта на API 23, 720×1280. Сопоставлен первый экран: различаются
нижняя панель, кнопки масштаба и верхние блоки. Полное сравнение 13 экранов и
проверка на Fold5 остаются открытыми. В архиве от 18 ноября проверены пять
контрольных сумм и целостность Git bundle. APK в архиве совпал с эталоном;
ветка `codex/independent-core-auto` в архиве зафиксирована на `b99f9e6`. HTML-матрица описывает 13 экранов.
Прежние отметки ниже о недоступности APK относятся к предыдущей сессии.

Первый запуск независимой карты обрезал долготу и вторую систему координат.
`LocalMapActivity.center` теперь запрашивает повторный расчёт размера панели,
если текст обновился внутри первого прохода раскладки. Реальный снимок
повторного холодного запуска на API 23 подтверждает полные строки WGS 84 и UTM.
Сценарий `coordinates` на API 23 прошёл 47 проверок, включая фактический
размер панели при первом открытии. Изолированный `SvgChecks` на API 23
прошёл 35 проверок Canvas, StyleMap, KMZ и изоляции данных. Полный
`offlineformats` на программном API 23 прервался по тайм-ауту 480 секунд.
Матрица GitHub Actions проверяет все сценарии с аппаратным ускорением.

Одна и та же ссылка SVG у нескольких меток теперь использует один Bitmap.
Лимит 32 считается по уникальным значкам одного проекта; стиль каждой метки
и проверка владельца из KML сохранены. На API 23 новый сценарий на старом APK
воспроизвёл отказ отрисовки после 32 меток. На новой сборке `SvgChecks`
прошёл 37 проверок, включая этот случай, StyleMap, масштабирование, KMZ и
изоляцию объектов. Сборка инструментации Java 17 и аудит APK прошли.
Официальный Lint по-прежнему выдаёт `MissingClass` для smali и 114 предупреждений.
На APK для `0b64fe3` прошли пять дополнительных сценариев эмулятора API 23:
`binary` (3), `independence` (711), `coordinates` (47), `cachewrites` (10)
и `cacheexport` (69). Последний проверил SQLite, повторное открытие MBTiles,
слои, экспорт и синтетические сетевые ограничения. Подпись APK v1/v2/v3
проверена, сертификат Disposable Android QA. Тестовый профиль версии
`27-independent-core`, versionCode 27, minSdk 23.

При повторном запуске эталон показывает лицензионный диалог Psyberia.
Дальнейшая визуальная сверка требует утверждённых материалов собственного
интерфейса и не должна переносить экран сторонней лицензии.

Следующий шаг после сохранения ветки:

```sh
git fetch origin codex/independent-core-auto
git log -1 --oneline FETCH_HEAD
```

В Actions открыть первоначальный запуск исправления SVG и запуск текущей ветки.
Проверить `coordinates` и `offlineformats` на обеих API, включая StyleMap, прозрачность, масштаб и KMZ
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
