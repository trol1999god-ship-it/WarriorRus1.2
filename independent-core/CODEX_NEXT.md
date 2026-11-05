# Точка продолжения — 5 ноября 2026

## Текущий этап

Приоритет пользователя — production функциональные блоки, не очередь изолированных
диалоговых baseline. Новых агентов/веток/worktree не создавать, PR14 не сливать.
Только independent-core, сохранять toolchain/stash/данные/артефакты, без reset/clean.

1. Close ЗАВЕРШЁН в проверенном valid-part контексте: code e5e0e56,
   CI42020440809 SUCCESS44/44 обеAPI (jobs23 127221764336/35 127221764405),
   close563each, managerforms482/473 реальноpass. Все32 final-e5 PNG SHAverified
   и просмотрены, final-result.json. JVM27/81416, host16. Strict guards unchanged.
   Никакого rerun/baseline этого завершённого участка без новой причины.
2. `migration/IMPLEMENTATION_PLAN.md` и closeproof сохранены remote2e40e22:
   все23id ровноодинраз, реализация/приёмка разделены, доказательства/пробелы/зависимости/критерии.
3. Слои проверены: code17ac3f9 +dc16493 / CI42034901826 SUCCESS46/46 обеAPI.
   jobs23 127270591123/35 127270591391, layers89/reopen16each, managerforms482/473.
   Все16 final-dc PNG SHAverified/просмотрены. Touch45%/50%, renderer pixels/order/
   visibility, actualforce-stop/cache/MBTiles/other-project/KML/assets passed.
   MAP_LAYERS.md и final-result.json. Не повторять без новой причины; приёмка открыта.

4. Export production3f72957 / CI42067960861 completed FAILURE: JVM success,
   обе Android-сборки success,45/46each; onlycacheexport failed mixedzoom RGB.
   Подтверждена ошибка новой QA-пробы: ожидался pureblue, actualfixture onlineRaster
   задаёт25/90/220. Production fallback пока не признан дефектным/готовым.
   Поправлен только test: pinned nativeRGB, computedblend +RGB/alpha, прежнийtol2,
   source/outputPNG иhexdiagnostic ДОстрогогоassert. SDK23 tests compiled.
   Сохранить QAfix отдельно от WIPjobs/65source generated files и запустить
   обоснованный CI изменённой проверки; неblindrerun3f. Поздние Cancel/UI/data
   ещё НЕисполнены. Все16interimPNG толькослои SHAverified/просмотрены, НЕexportproof.
   interim-3f-result.json/MAP_COMPOSITION_EXPORT.md. Полная приёмка открыта.
5. Локальный НЕпроверенный WIP следующего production cache-участка:
   CompositionDownloadJob/Settings/Activity + OnlineTiles.contains + пункт карты.
   Дедуп/policy/20000tiles/project-CAS/сохранённое задание; foreground pause,
   restart только явный, resume проверяет кеш заново. Исходники не отправлены;
   local QA501/min23/INTERNETonly/JVM30_81490 (job32) passed;
   подключается реальный UI pause/force-stop/resume/missing-only cache/KML/assets
   в существующие maplayers/reopen, без нового mode/baseline. Androidruntime ещё нет.
   CI экспорта исполняет замороженный3f72957, НЕ этот WIP. Сохранять все diff.

## Production очередь

Слои: явные add/remove/visible/order/opacity, per-project persistence/restart,
существующий каталог/TileSource.leafs/кеши/MBTiles, без удаления файлов при удалении слоя.
Затем кеш/форматы/DEM → объекты/геометрия → import-export/styles/SVG → вложения/явная
передача → UI/coordinates/compass/settings → migration26.1/итоговая приёмка.
Зависимости и критерии — IMPLEMENTATION_PLAN. Подготовленный orphan-close baseline
НЕ запускать по старой очереди; файл .pending сохранён, не подключён, не исполнен.

## Сохранность и границы

minSdk23/«Рабочая карта»/Arimo/утверждённые ресурсы и online tiles/cache сохраняются.
Нет GPS/location/telemetry/cloud sync/скрытой отправки объектов; Bluetooth толькоявно.
Только synthetic QA/disposable keys, не основные ключи/данные телефона.
Строгие80/82/physical/raw/cursor/owner guards/release gate не ослаблять.
GateFalse25, requirements23/0accepted. QA APK/CI не являются готовым приложением.

Сохранённый Java17/SDK доступен; публикация reusable environment не проверена.
Предыдущие результаты и незавершённые приёмки сохранены в
[migration/CONTINUATION_HISTORY_2026-11-05.md](migration/CONTINUATION_HISTORY_2026-11-05.md)
и тематических state/evidence документах. Исторические in_progress не повторять вслепую.
