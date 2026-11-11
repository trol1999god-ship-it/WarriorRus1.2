# Точка продолжения — 11 ноября 2026

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

4. Export завершён в scoped объёме: production3f72957 +QAfixc230680,
   CI42074949288 SUCCESS46/46each, cacheexport69each, jobs23 127412862356/
   35 127412862334. Bounds/TMS/+180/alpha/order/visibility/mixedzoom/roundtrip/
   Cancel/UI-save/early-failure/source/cache/localMBTiles/other-project/KML/assets passed.
   Все8 original exportPNG SHAverified/просмотрены после readonly recovery42989065292;
   originalarchive digest проверен, НЕТrebuild/retest. Факты в final-result.json.
   ПолнаяприёмкаSAF/форматов/release открыта; успешныйCI не повторять.
5. Cachejobs97d6fa4 / CI42995231822 SUCCESS46/46each, jobs23 130437703947/
   35 130437703955; layers142/141/reopen37each, managerforms482/473. Все32 PNG
   SHAverified/viewed. Functional/data guards passed, НО визуально кнопки10px
   на обеих API, этап не принят. Fix48dp+physical/IME/text guards подготовлен;
   новыйCI обоснован этим дефектом. interim-97-result.json/COMPOSITION_CACHE_JOBS.md.
   096ed40 — debug/release/privacy QA. --release реальноblocked25/noAPK;
   officiallintprobe3errors94warnings integrationgap, неPASS; ci/QA.md/rootAGENTS.
6. Следующий форматныйучасток — GeoTIFF по migration/MAP_FORMATS.md и
   GEO_RASTER_CONTRACT.md; /workspace/work/manager-confirm/GeoRasterTransform.java.pending
   сохранён, SHA06958dec760d8bb79289953468be1d12458657492138129ecf7ae523c35e7294.
   Локальный WIP GeoTiffRaster/GeoRasterTransform/GeoTiffImport + явный пункт
   Подложка→ИмпортGeoTIFF, CAS local-map, GEOTIFF_IMPORT.md. JVM35 новыхchecks;
   весьJavaSDK23 compiled, instrumentation252776bytes compiled. QA build
   geotiff-ui-debug-2026-11-11 PASS source69exact/512classes/JVM31_81528/host18/privacy. НЕ входит в CI97, Androidruntime не засчитан.
   Сначала завершить CIcachejobs, затем runtime/pixel/UI import/Cancel/data guards
   новогоформата; не считать grayscale DEM и не выдавать subset за полныйGeoTIFF.

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
