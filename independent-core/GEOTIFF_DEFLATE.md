# GeoTIFF Deflate — проверенный ограниченный импорт

Расширен тот же явный импорт GeoTIFF→MBTiles: Compression8 (Adobe Deflate) и
legacy32946, Predictor1/2 для interleaved unsigned RGB/gray8/alpha. Это не новая
очередь режимов/экранов. Утверждённые цвета/Arimo/ресурсы, EPSG4326/3857,
PixelIsArea/Point, NoData, ограничения input512МиБ/100Mpx/output20k/512МиБ и
предыдущий файл при Cancel/error сохраняются. Tiled/LZW/JPEG/BigTIFF/DEM TIFF,
ICC/rotation/иные CRS по-прежнему явно отклоняются.

Константы формата подтверждены в OSGeo/gdal (только источник документации;
GDAL/libtiff код и runtime в приложение не включены):

- frmts/gtiff/libtiff/tiff.h, blob510d195132e342f83b3447ec56a0936c11a27b79:
  Compression259, AdobeDeflate8/legacyDeflate32946, Predictor317/none1/horizontal2.
- doc/source/drivers/raster/gtiff.rst, blob063760901cf445e30c90a5f4144c719ff4c3d49c:
  Deflate и horizontal predictor для8bit; floating-point predictor3 другой формат.

Каждый inflater получает только ограниченный range своего strip. До конвертации
все strips проверяются на checksum/точный decoded размер, включая строки, которые
проекция могла бы не выбрать. Избыточный/короткий decoded output отклоняется;
максимум задаётся прежними width/height/samples (до400МБ логически, без такого
буфера в памяти). RowLRU8 и один streaming decoder, bounded buffers. Перемотка
запускает decoder заново. Predictor сбрасывается на каждой строке/канале и
восстанавливает bytes modulo256. Используется штатный java.util.zip; default
InflaterInputStream владеет native inflater и закрывает его. Файл/old map не
публикуются до успешной полной сборки; нет сети/KML/вложений/новых permissions.

Локально: GeoTIFF/transform86 JVM assertions, все32 suites/81611 PASS, debugQA
source71exact/528classes/min23/INTERNETonly, custom source+DEX privacy PASS
(не Androidlint). Latest SDK23 tests260537bytes compiled; UI сценарий теперь
выбирает synthetic Deflate/Prediction2 TIFF, pixels/Cancel/stale/data guards старые.
В существующий offlineformats добавлены обеCRS/predictors/literal RGB70/60/100
roundtrip и checksum refusal с точной сохранностью предыдущего MBTiles.
Gray/white-is-zero/alpha, II/MM, legacy tag, LRU restart, corrupt checksum,
decoded overflow/shortness/unsupported predictor проверены JVM.

Android runtime code7230cec / CI43035041730 SUCCESS: API23 attempt1
130571810995 и API35 attempt2 130593252640 по46/46, offlineformats68each.
Literal pixel RGB70/60/100, обеCRS/predictors, checksum refusal/old MBTiles/source/
KML/assets/otherproject guards прошли; actual compressed UI import prompt/result
виден на обеихAPI. Все32 текущих layer/GeoTIFF/DEM/cachejob PNG SHAverified/viewed.
Первый35 attempt был adbOffline после более раннего успешного offlineformats;
повторён только сбойный job, не API23/JVM. final-7230-result.json.
CI43007479633 code48ca40b НЕсодержит Deflate. Полная эталонная приёмка открыта,
tiled/LZW/JPEG/BigTIFF/DEM-TIFF не поддержаны. Cap16PNG/2МиБ прежний.
