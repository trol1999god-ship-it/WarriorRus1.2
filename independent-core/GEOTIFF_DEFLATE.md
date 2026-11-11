# GeoTIFF Deflate — локальный кандидат продолжения

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

Android runtime изменённого кода7230cec / CI43035041730 attempt1:
API23 job130571810995 SUCCESS46/46, offlineformats68 PASS; API35
job130571811069 offlineformats68 PASS, но позднее adb device offline при
выгрузке geometrycloseconfirm и до maplayers; reopen не исполнялся. Это НЕполный
успех API35. Только сбойный API35 повторён без изменения кода/таймаута:
attempt2 job130593252640 ещё выполняется. API23 16новыхPNG SHAverified/viewed,
включая compressed import prompt/result. Полная эталонная приёмка открыта.
CI43007479633 code48ca40b содержит только предыдущий raw GeoTIFF и HGT DEM;
Deflate в нём не проверялся. PNG budget16, новых режимов/библиотек нет.
