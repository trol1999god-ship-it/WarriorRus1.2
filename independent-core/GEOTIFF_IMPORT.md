# GeoTIFF — ограниченный кандидат импорта, 11 ноября 2026

Пользовательский путь: Карты → Подложка → Импорт GeoTIFF → локальный системный
выбор → явное «Импортировать». Cancel до подтверждения ничего не копирует.
Конвертация читает приватную временную копию, создаёт EPSG:3857 PNG MBTiles/TMS;
существующий OfflineTiles/renderer и локальный слой менеджера используют результат.
Если включена композиция без локального слоя, его надо явно добавить в «Слои карты»;
импорт не меняет порядок/видимость/прозрачность сохранённой композиции.

Поднабор: classic TIFF6 II/MM, одна IFD, несжатые strips, unsigned RGB/gray8,
объявленная alpha, целый GDAL_NODATA0..255; явные EPSG4326/3857, PixelIsArea/Point,
Scale+один Tiepoint. Нет предположений о CRS. Palette/compression/tiled/overview/
ICC/матрицы/DEM/иные CRS явно отклоняются. Это не полная поддержка GeoTIFF26.1.
Контракт и источник спецификации — migration/GEO_RASTER_CONTRACT.md.

Пределы: вход512МиБ, до20000 по оси/100млн пикселей, выход20000 тайлов и512МиБ,
уровни0..native (не выше23), ближайший исходный пиксель по центру выходного.
Растр за пределами Web Mercator отклоняется, а не обрезается молча.
Метаданные bounds описывают исходный extent; края тайлов прозрачны вне исходника.
Чтение строк ограничено LRU8, выходной bitmap256². Нет сети/записи KML/вложений.

Предыдущий MBTiles заменяется только после полной конвертации/проверки ordinary
OfflineTiles и проверки исходного inode/размера/времени. Все собственные операции
замены/удаления подложки используют общий LocalRasterStore lock. Изменение другой
картой во время импорта приводит к отказу, подготовленный файл не применяется.
Destroy отменяет незавершённый импорт; нет автоматического resume/повторной записи.
Исходный SAF-файл только читается, другой проект/общий online cache не затрагиваются.

Факты пока локальные: GeoTIFF/transform35 JVM assertions (II/MM, CRS, Point/Area,
NoData/alpha/invalid offsets/compression/degenerate transform/source preservation),
весь Java-код с bootclasspathSDK23 скомпилирован; instrumentation252776 bytes
скомпилирован. В существующий offlineformats подключены conversion/roundtrip pixel,
Cancel/unsupported previous-file preservation и stale local-map CAS проверки.
Они ещё НЕ исполнены на Android. Полный debug QA build source69exact/512classes прошёл, JVM31/81528, host18,
source+DEX privacy passed (custom audit, НЕ Android lint);
Android CI cachejobs97d6fa4 не включает эти новые исходники.

UI проверяет явные кнопки после synthetic результата локального picker; системный
SAF provider этим не принимается. Новые два PNG включены в существующий
offlineformats; console выбирает offlineformats+maplayersreopen (14 PNG максимум),
cacheexport по-прежнему исполняется/валидирует все кадры и сохраняет artifacts.
Строгий cap16/2МиБ не изменён.

До принятия участка нужны API23/API35 runtime/pixel и явный UI import/Cancel,
KML/assets/other-project guards и новые снимки; внешние реальные TIFF и эталонная
приёмка остаются отдельно. DEM не реализован этим grayscale reader.
