# Tiled GeoTIFF — локальный кандидат существующего importer

Расширен тот же GeoTiffRaster→GeoTiffImport→private MBTiles→каталог/renderer,
без второго importer, native библиотеки или новых сетевых путей. Поддержка TIFF6
tiles для прежних RGB/gray unsigned8, alpha/NoData, EPSG4326/3857 и Area/Point;
Compression1/8/32946, Predictor1/2 (raw остаётся только Predictor1).

Форматные факты сверены с официальным OSGeo/gdal, код не копировался в приложение:

- doc/source/drivers/raster/gtiff.rst,
  blob063760901cf445e30c90a5f4144c719ff4c3d49c: TILED/BLOCKXSIZE/BLOCKYSIZE,
  кратность16; sparse offset/count0 — отдельная GDAL extension, не универсальный TIFF.
- frmts/gtiff/libtiff/tif_tile.c,
  blobf90760940096a0d244755364e53131afd147a3b3: порядок блоков по колонкам/строкам,
  full tile row width/length и decoded size, независимо от обрезанного края изображения.

TileWidth/TileLength/Offsets/ByteCounts322–325, только planar contiguous/orientation1.
Partial right/bottom tiles имеют полный payload/padding, но extent/пиксели определяются
реальными ImageWidth/Height; padding не растягивает геопривязку. Predictor сбрасывается
на каждой строке каждого tile. Strips/tiles offsets вместе, volume/depth>1, sparse0,
LZW/JPEG/BigTIFF/ICC/DEM/неподдержанный CRS отклоняются с сохранением прежнего файла.

Прежние ограничения не снижены: input512МиБ, по20000 на ось, real image100Mpx,
metadata arrays≤20000, output≤20000tiles/512МиБ. Для tiles дополнительно:

- размеры кратны16, от16 до4096; decoded block≤4МиБ;
- суммарный padded raster≤100Mpx, не только его полезная часть;
- TileLRU≤16МиБ decoded bytes и≤128 блоков; один inflater на загрузку блока,
  закрывается после exact-size/CRC; исходный strip RowLRU8/stream сохранён;
- все compressed блоки проверяются до конвертации на exact decoded size/checksum,
  включая padding и ещё не запрошенные блоки. Затем загружается только нужный tile,
  что соответствует доступу importer по выходным тайлам. Native inflater принадлежит
  штатному InflaterInputStream и закрывается; extra native dependency отсутствует.

Это ограниченное подмножество tiled TIFF, не полный GDAL/эталон26.1. Общий heap/IO,
максимальные размеры и реальные сторонние файлы требуют отдельной приёмки; лимит
кеша не является обещанием всего heap≤16МиБ.

Локально: GeoTIFF/transform215 assertions (старые86 сохранены), все33/81769 JVM PASS;
II/MM/raw/Deflate/32946/Prediction1/2, cross-tile literal RGB, gray/alpha/NoData,
edge extent, backward reads, entry/byte eviction, padding checksum, sparse и два
decoded/padded лимита. Первый новый gray literal был неверно вычислен: raw212,
WhiteIsZero43 (20+16*50+16*10 modulo256); исправлен только тестовый literal,
production color interpretation не менялась. Ошибка и последующий PASS сохранены.

SDK23 debug app+instrumentation compiled, source73exact/535classes,
latest tests268975bytes; custom source+DEX privacy PASS (НЕAndroidlint).
Android runtime ЕЩЁ НЕисполнен. Код НЕвходит в profile CI43055495746/62794e4.
Existing offlineformats расширен conversion/literal pixel/NoData/Cancel/sparse/
unused padding checksum/old MBTiles preservation; тот же UI selection→Cancel→Import,
source/KML/assets/cache/другой проект. UI fixture tiled; PNG budget прежний16/2МиБ,
новых mode/workflow нет. Accepted не изменён, releasegate остаётся закрытым.

## Сохранение отдельно от scoped profile fix

Полная интеграция сохранена коммитом1e3e9ea. По поручению пользователя сначала
подтвердить профиль:8чистых implementation файлов временно возвращены к62794e4
через обратный patch, без reset/clean/новыхветок/удалениядокументов/receipts.
Незакоммиченный DemProfileChecks fix и все артефакты сохранены. Полный forward
patch и backup wip.tar.gz: /workspace/work/manager-confirm/
profile-scoped-preserve-lgehznjb/. Tiled НЕактивен в проверяемом profile-only коде;
после подтверждения профиля вернуть именно эту интеграцию и продолжить runtime.
