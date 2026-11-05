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
3. Production слои code17ac3f9d12198a7dbd8db06085219df38db6958f /CI42028003488 completed:
   API35job127247171605 SUCCESS46/46, layers88/reopen16. Все6 interimPNG просмотрены;
   renderer order/alpha/visibility, actualforce-stop/exact composition, KML/assets/MBTiles/
   cache/otherProject passed. API23job127247171704: old44pass, новыйmaplayers failed
   "real slider applies partial opacity"; reopenSKIP НЕpassed, новыхPNG доassertionнет.
   QA events не задавали SOURCE_TOUCHSCREEN, в отличие от проверенного mapTouch.
   Не менятьproduction наосновании этого жеста; исправить тест explicit touchscreen+
   drag/90ms, before/after diagnostics/PNG доassert, строгий partialopacity сохранить.
   Затем обоснованный fullCI46 изменённого test. Никакого blindrerun.
   Модель/Store/менеджер/каталог/общийrenderer+GeometryMapCanvas ужеproductionкод.
   LocalQA479/sourceSHA60/min23/INTERNETonly, JVM28/81449/host16 passed;
   подробности MAP_LAYERS.md/local-build.json. GateFalse25/0accepted.
   Следующий production участок после проверки обеихAPI — compose-aware cache/export,
   не orphan/dialog baseline. Сохранённые stashes/toolchain/артефакты не трогать.

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
