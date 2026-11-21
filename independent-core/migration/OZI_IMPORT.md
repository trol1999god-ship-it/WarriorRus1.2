# Ozi .map + PNG/JPEG — ограниченный локальный кандидат

История первой проверки, 12 ноября 2026: PNG/JPEG codefbc64ea/CI43139985094: nativeofflineformats581
PASS обеAPI (включая прежние391GeoTIFF). API23full46 SUCCESS; API35full41/46
FAILURE: adb offline pull после native581 и4modeдоinstrumentation. Это НЕполный
greenCI/не приёмкаOzi26.1 и не часть affineCI43134277461/90020f3.
Source/outer/inner/all548/538members SHAverified;12 scopedPNG реально просмотрены,
включая все4новых Ozi. На35 они recovered из cachewrites после его prep failure,
не засчитываются ни как успешный pull offlineformats, ни как cachewrites PASS.
security/ozi-import-qa-2026-11-12/runtime-result.json. Следующий локальный
BMPкандидат/transportfix ещёНЕвходят в этотrun (migration/OZI_BMP.md).
Официальные ссылки для формата: GDAL `OSGeo/gdal` commit
9bb42f5a7b13e9bd1b0991ec0140b71343576e04:
`gcore/gdal_misc.cpp` (blob8052713688144b29661473038a6fc0eb827a0cf3),
`frmts/map/mapdataset.cpp` (blobbaaa4be9f8644203f0db382ff2be6b10ef5627c3),
`ogr/ogr_srs_ozi.cpp`; прочитаны реальные поля/ограничения, код не копировался.

## Пользовательская возможность

«Подложка» → «Импорт Ozi (.map + PNG/JPEG)»: пользователь явно выбирает
ОДНОВРЕМЕННО два локальных документа и отдельно подтверждает импорт. Парсер
не открывает путь из `.map`: сравнивает только basename с явно выбранным
изображением. URL/UNC/`..` отклоняются. Cancel не копирует и не меняет карту.
Успешный импорт создаёт приватный MBTiles того же проекта через общий
`RasterMapImport`/`RasterExportFile` → прежний `OfflineTiles`/renderer/catalog.
Отдельного конвертера/рендерера или сетевого транспорта Ozi нет.

`OziCalibration`: Version2.2/UTF-8/ASCII (не угадывает Windows codepage), явный datum
WGS 84 без сдвигов, Latitude/Longitude без параметров другой проекции,
PolyCal/AutoCalOnly/BSBUseWPX=No, MSF=1 (по умолчанию1), IWH соответствует измеренным размерам PNG/JPEG.
От3до30 активных `PointNN` с градусами/минутами/полушариями, неколлинеарных.
Собственная affine математика выбирает устойчивый треугольник наибольшей площади,
проверяет ВСЕ контрольные точки с остатком не более0.25 исходного пикселя;
не подменяет нелинейную привязку приближением. Неизвестный CRS/датум, MSF≠1,
неустойчивость, неполные/дублированные точки и размеры явно отказываются.
Чтение `.map` ограничено128КиБ/4096строк/4096символов строки.

Координаты Ozi Point используются непосредственно как pixel/line, как в
GDALLoadOziMapFile (без добавления0.5 к GCP). Общий GeoRasterTransform Area
обрабатывает центр изображения как I+0.5/J+0.5; native resolution берётся из
inverse-Jacobian, включая rotation/shear. MMPXY — граница, не калибровка:
поддержан только полный прямоугольник по краям0/width/height либо отсутствие
границы; crop/произвольная neatline явно отказываются. Это ограниченная
совместимость, не подтверждение семантики всех файлов эталона.

`OziRaster`: проверяет сигнатуру PNG/JPEG, реальные размеры≤20000по стороне /
100Mpx, файл≤512МиБ; BitmapRegionDecoder читает блоки256, LRU≤64/16МиБ.
Явный close освобождает decoder/bitmap, закрытый reader чтение запрещает.
BMP/GIF/OZF, EXIF-поворот, другие CRS/датумы/codepages, неполная калибровка,
нелинейные и обрезанные карты в этот участок НЕ входят. JPEG читается в его
исходной encoded pixel grid, без автоматического EXIF преобразования.

## Сохранность и проверки

Оба источника копируются только после Confirm в ограниченные private temps.
Прежние caps20kтайлов/z23/512МиБ всего файла, sync/атомарная замена File,
project existence/CAS и Activity-disposed cancellation используются повторно.
Изменённая другим окном карта не заменяется устаревшим импортом; ошибка/отмена
очищает только свои temps. Нет записи KML/вложений/состава/чужой карты/тайлового
кеша и нет отправки `.map`, изображений или пользовательских объектов в сеть.

Локально: Ozi66 model checks, SDK23 app/source77exact/546classes и
instrumentation compilation PASS; host20, custom source+DEX privacy PASS
(НЕ Android lint). Фактические totals/хеши: security/ozi-import-qa-2026-11-12/final-local/receipt.json.
В СУЩЕСТВУЮЩИЙ offlineformats добавлены: PNG/rotation/shear/alpha-footprint,
JPEG solid control, literal bounds/native zoom, Cancel/unsupported datum/CRS/
MSF/neatline/имя/IWH/non-affine/oldfile/source exact, region LRU и close,
UI explicit import/Cancel/stale installer/Arimo/actions/reopen/другой проект,
KML/assets/network-request guards. Новые2PNG относятся только к новому CI.
PNG/JPEG native581/UI/data выполнены обеAPI, сквозной CI35 остаётся failure
из-за транспорта. Следующий изменённый BMP+driver обязан пройти все46 реально;
не blindrerun fbc, прошлые failure/PNG attribution сохраняются.

Следующие форматные пробелы: Ozi BMP/GIF/codepages/проекции/neatline/OZF только
с подтверждёнными контрактами и bounded readers; RMAP/прочие форматы и DEM
по общей матрице. Implementation/acceptance разделены, accepted0/release gate
не изменены, официальные Android lint ошибки не объявлены PASS.

Последующая scoped регрессия: 8d26807/CI43146921585 SUCCESS46both,
offlineformats748each/source78/548classes/host27;16scopedPNG/source/all550+554
members verified. Ozi PNG/JPEG/BMP+affine/data PASS; sameBoot readonly transport
recovery реально выполнен на35 безповтораnative. Предыдущие failure остаются
историей; приёмка/officiallint/release gate не заменяются CI.
