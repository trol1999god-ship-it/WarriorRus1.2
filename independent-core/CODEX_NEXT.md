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
2. `migration/IMPLEMENTATION_PLAN.md`: все23id ровноодинраз, реализация/приёмка
   разделены, доказательства/пробелы/зависимости/критерии. Сохранить вместе с closeproof.
3. Production слои УЖЕ написаны локально: MapComposition/Settings/MapLayersActivity,
   каталог layer-pick, LocalMapActivity/View composer + GeometryMapCanvas reuse.
   Функции add/remove/visible/order/opacity и per-project persistence реализованы,
   удаление строки не удаляет карты/кеш/KML. Существующий single-map choice сохраняет
   состав отключённым, каталог в add-mode не меняет network/single-map prefs.
   До16слоёв, текущий MBTiles проекта + каталог/XYZ/обзорная карта.
   Финальная local QA479/min23/INTERNETonly/no legacy/native/stubs/missingrefs,
   sourceSHA60 exact, unsigneda70a196e1b607d6a0919bb4f99654c81cabad94e69816f117e591737ede14c32.
   JVM28/81449 (MapComposition33), host16, tests237599 compiled,
   SHA55fdbfd0086731e62e4e7c7079bbc1de648933e3c9b3671bd441a5a8c24c505d.
   Androidruntime слоёв ЕЩЁНЕПРОВЕРЕН. Нужен candidatecommit/fullCI46:
   maplayers→maplayersreopen (реальный force-stop, безpmclear второго режима),
   UI/actual opacity touch/pixel order+alpha+visibility, source cache/localMBTiles/
   KML/assets/otherProject сохранность, exact composition restart. Только6PNG/API,
   новая возможность вместоизолированныхдиалоговыхbaseline.
   Candidateготов к сохранению/push для обоснованногоfullCI46; не объявлять runtime слоёв принятым до completedjobs/pixels/restart/новыхPNG.

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
