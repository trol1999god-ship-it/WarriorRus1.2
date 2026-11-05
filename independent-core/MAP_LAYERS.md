# Композиция карт и слоёв

Production-кандидат добавляет «Карты → Слои карты» в существующий основной экран.
Менеджер использует существующий каталог; «Добавить слой» позволяет добавить источник
или фиксированный набор каталога, настроенный XYZ, текущий MBTiles проекта либо обзорную
карту. Сохраняемый список показывает верхний слой первым: видимость, «Выше/Ниже»,
непрозрачность0–100 и подтверждённое удаление меняют только композицию этого проекта.
Удаление не удаляет карты/кеш/объекты. До16слоёв; импорт новых MBTiles остаётся в прежнем меню.

`MapComposition` — immutable bottom-to-top model, checksum/owner/bounds-validated binary
persistence. `MapCompositionSettings` хранит project-scoped snapshot; stale-window save
отказывает вместо перезаписи другого состава. Настройки повреждённого состава не стираются.
Отдельный переключатель позволяет вернуться к одиночной подложке, сохранив состав.
Явный прежний выбор одиночной карты также приостанавливает, а не удаляет композицию.
Каталог в layer-pick режиме не меняет single-map selection/network flag.

`LocalMapView` повторно использует OnlineTiles/OfflineTiles/BundledTiles и общую проекцию.
Каждый видимый слой рисуется в сохранённом порядке; alpha применяется к целому набору
leafs через Canvas group, не отдельно к каждому входящему слою. Hidden/alpha0 не открывают
readers/не запрашивают тайлы. Кеши сохраняют прежние leaf source IDs. Тот же renderer
использован GeometryMapCanvas, без отдельного дублирующего tile pipeline.
Объекты/вложения не передаются TileSource.url, network choice остаётся явным.

Локально JVM28/81449 (MapComposition33), host16, QA479 own/min23/INTERNETonly,
60sourceSHAexact/no legacy/native/stubs/missingrefs. App unsigned
`a70a196e1b607d6a0919bb4f99654c81cabad94e69816f117e591737ede14c32`;
последняя instrumentation237599/API23 compiled. Android runtime ещё НЕ проверен.

Два относящихся к функции сценария maplayers→maplayersreopen проверяют реальные controls,
opacity touch, renderer pixels для порядка/alpha/visibility, Cancel remove, XYZ/catalog,
приостановку/включение без потери состава, KML/assets/MBTiles/source-cache/other-project
сохранность и exact composition после реального force-stop. Шесть PNG/API, прежние
регрессии не ослабляются. Никаких дополнительных orphan/dialog baseline.

Границы: это ещё не полная приёмка слоя/набора26.1. Именованные библиотеки наборов,
несколько импортированных offline-файлов, новые форматы/DEM, compose-aware area jobs и
экспорт фактической пользовательской композиции — следующие функциональные пункты плана.
Старые single-source online/cache/export операции сохранены; их нельзя называть экспортом
нового пользовательского состава. GateFalse25/0accepted; внутренний APK не готовый выпуск.
