# Affine GeoTIFF — production кандидат, 12 ноября 2026

Явный import34264 использует existing GeoTiffRaster/GeoRasterTransform→GeoTiffImport→
private MBTiles→catalog/renderer. Нового renderer, фоновой сети или формата хранения нет.
OGC1.1 ModelTransformationTag: DOUBLE16 row-major; 2D матрица
[a,b,0,c; d,e,0,f; 0,0,0,0; 0,0,0,1]. Area/Point сохраняют прежнюю полупиксельную
семантику. GeoKeys явно EPSG4326/3857, longitude/latitude или easting/northing.
Спецификация/проверенные blob SHA — migration/GEO_RASTER_CONTRACT.md.

Поддержаны 2D rotation/shear/flip на raw strips и tiled raw/Deflate8/32946,
Predictor1/2, RGB/gray8/alpha/NoData прежнего поднабора. Compressed strips с matrix
допускаются только для прямого порядка строк (d=0,e<0); остальным нужен tiled TIFF.
Измерение: 10 обратных сэмплов matrix Deflate-strip с2048строками породили10 разных
inflater streams. Диагностика/source-before-guard SHA сохранены local/strip-access.
Поэтому новый ресурсный предел явно отказывает до публикации, не объявляет этот
layout готовым. Прежние scale/tiepoint/Deflate пути НЕменялись. Raw matrix читает
только нужные samples (буфер4байта), без выделения полной строки при каждом pixel.
TileLRU16MiB/128blocks и RowLRU8/блок4MiB/padded100Mpx прежние; новой spool-записи нет.

Для матрицы native scale учитывает максимальную сумму модулей коэффициентов
обратного raster/world Jacobian: max(|e|Ux+|b|Uy,|d|Ux+|a|Uy)/|ae-bd|.
Ux=360, Uy=360cos(latitude ближайшей кэкватору) для geographic; оба2πR для3857.
Это ограничивает смещение raster-пикселей при выходном world-пикселе, включая skew;
одного bbox/width недостаточно. Старый bbox scale остаётся нижним пределом.
Большеz23/20000тайлов/512MiB — отказ; full temp file limit/sync/atomic replacement
проверяет прежний RasterExportFile. Bounds — envelope всех4краёв, вне фактического
параллелограмма pixel transparent. NoData не заполняется ложным покрытием.

Невалидные type/count/offset/NaN/infinity/singular matrix, perspective/3D,
одновременные matrix и scale/tiepoint, неизвестные CRS/единицы отвергаются.
Это ограниченный 2D subset; не полная GeoTIFF26.1/3D/datum/ICC/overview поддержка.
Cancel/ошибка сохраняют source/старыйMBTiles/KML/assets/cache/другойпроект;
отдельное явное Import остаётся обязательным, MainSave геометрии не вызывается.

Локально:33JVM/81986, GeoTIFF432 (прежние215 сохранены); II/MM/Area/Point/rotation/
shear/flip/literalpixels/NoData/alpha/extent/native density/refusal controls.
SDK23 debug app+instrumentation compiled, source73exact/535classes, host20;
custom source+DEX privacy PASS (НЕAndroidlint). local/receipt.json.
Новые native cases добавлены только в existing offlineformats: pixel/roundtrip,
metadata bounds/native zoom, transparent footprint, raw gray/strip, forward Deflate,
Cancel/unsupported CRS/transform/resolution/row access и oldtarget/source guards.
UI fixture теперь sheared matrix, прежние2PNG/strict16/2MiB budget сохранены.
Android runtime ещё НЕисполнен. accepted0/releasegate не меняются.
