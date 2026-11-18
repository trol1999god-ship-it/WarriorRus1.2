# Продолжение — 18 ноября: b99 проверен; исправление перекрытия Cancel + metrics candidate

## Последний завершённый CI

Проверенный источник b99f9e637aa80523162c63e0103f89af0b5acc70, CI44287853086 FAILURE.
JVM134745064603 SUCCESS40/83385/host31. Android23 job134745452435 и35 job134745452398:
по45/46, только offlineformats FAIL. Никаких skip/transport failures в этом run.
Source/outer/inner/all564+567members verified; по6 scoped PNG каждой API реально viewed.

Именованные наборы0a031db: maplayers331/330, reopen77 both PASS. Save/Cancel/duplicate/
DeleteCancel/Apply/staleLibrary/staleComposition/foreign/deletedOwner и реальный force-stop
прошли с исходными XML/assets/maps/cache/otherproject guards. Свежие primary preset name
с IME/list и restarted-manager PNG reviewed. Дубликаты preset PNG в reopen архиве —
унаследованные из maplayers; не считать их новыми reopen кадрами. Не полная приёмка layers.

KML editor: IME observation теперь проходит. Error/raw/bounds/Arimo пройдены до реального
Cancel. Обе API независимо показывают native EditText error popup поверх Save/Cancel;
касание Cancel не достигает кнопки, active tree остаётся в редакторе с ff00ffff.
Последующие Save/reset/stale/final-editor data guards НЕисполнены. Не editor PASS.
Evidence: security/kml-components-qa-2026-11-18/b99-result.json + оба full jobs/PNGs.

## Подготовленный changed-code кандидат (Android pending)

Production7faed6d исправляет порядок Style/color/fill/ExtendedData; пять до/после KML
и официальные pinned offline XSD сохранены. Все пять valid originals и emitted/roundtrip
после fix проходят схему, external schema access disabled. Старые invalid outputs сохранены.

Production99d3cbf — узкий fix только KML component editor: ошибка — inline TextView в существующем
ScrollView, не native popup над действиями. Существующие name/description ветки неизменны.
Явные Save/Cancel, real touch/IME/raw/cursor/owner/token/data guards сохранены/усилены.
Новый runtime пока pending; не объявлять перекрытие исправленным до фактического CI.

Следующая функция уже реализована local29a43cc+844fe6e: KML width0..256 физических px,
label scale0..16 через existing StyleMap/inline/editor/render/KMZ; zero скрывает stroke/text,
не Android hairline; width не меняет Point outline. SVG/icon library этим не подменяется.
JVM40/83425/editor84/component47; SDK23 matching source84/578classes app+tests,
customprivacy PASS. Official lint84/160realclassfiles: exit1 MissingClass/
HardcodedDebugMode/114warnings, smali bodies не анализируются — НЕPASS.

Следующее: после сохранения кандидата/проверки HEAD и отсутствия activeCI отправить
один changed-code fullCI existingworkflow для inline-error fix + metrics + прежних guards.
Прочитать оба completedjobs/source/digest/allmembers и реальные новые PNG; каждый отказ
расследовать. После этого SVG/import-export по проверенному контракту → media/явнаяпередача
→ UI/coordinates/compass/settings → migration26.1, с зависимостями IMPLEMENTATION_PLAN.
Не dialog/orphan baseline. All23 acceptance0/releasegate25, не выпуск приложения.

Сохранены stash2/pending/toolchain/backup/старые artifacts; reset/clean/newbranch/worktree/
merge/перенос репозиториев не делались. Git sandbox не достигает proxy:8080; штатный
per-command gh credential helper вне sandbox прошёл push b99 без изменения сети/TLS.
Это та же Cloud Environment; готовность инструментов не доказывает публикацию reusable среды.

История: migration/STATUS_HISTORY_EA9_2026-11-18.md и STATUS_HISTORY_BEFORE_C373.md.
