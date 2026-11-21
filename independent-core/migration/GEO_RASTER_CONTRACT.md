# Контракт ограниченной геопривязки растров

Контракт реализован ограниченным GeoTIFF reader (GEOTIFF_IMPORT.md), не полная
приёмка26.1. Raw GeoTIFF/cachejobs ee7/CI43001233957 SUCCESS46both;
Deflate code7230/CI43035041730 SUCCESS46both/offlineformats68each,32PNG reviewed.
Матрица IMPLEMENTATION_PLAN и MAP_FORMATS отделяют поддержанное от пробелов.

Официальная спецификация: [OGC GeoTIFF](https://github.com/opengeospatial/geotiff/tree/master/GeoTIFF_Standard/standard).
Прочитаны clause7 (`6c8a8ba393f864acb8bb539f03d759108ff262a2`) и annexB
(`0361f3690bd597756163180bc7f74e4ddf1ae742`), blob SHA на5ноября2026.
Не использовать реализацию legacy-приложения и не угадывать привязку по имени файла.

- GeoKeys имеют отдельное пространство от TIFF tags; inline SHORT при TagLocation0
  отличается от индекса в массиве другого тега. Проверять type/count/offset/overflow,
  ограничивать все чтения реальным размером файла.
- ModelTiepoint33922 связывает raster I/J/K и model X/Y/Z. Без scale/transform набор
  tiepoints не разрешает автоматически предполагать линейную интерполяцию между ними.
- ModelPixelScale33550 и ModelTransformation34264 — альтернативные способы задания
  привязки. Одновременно их не принимать. Ориентацию/знак scale нельзя молча игнорировать.
- RasterPixelIsArea: координаты0/0 относятся к верхнему левому углу ячейки, extent
  N×M. RasterPixelIsPoint:0/0 — центр первой точки, последняя N−1/M−1; при отображении
  ячеек край находится на−0.5. Не допускать смещения на полпикселя.
- Для Model tags порядок geographic координат longitude/latitude, projected — east/north,
  независимо от формального порядка осей EPSG. CRS должен быть явным; неизвестный
  datum/projection/transform отклонять, а не подменять3857.
- Первый ограниченный reader целесообразно строить вокруг документированных TIFF6
  raster/strip и EPSG4326/3857 с контрольными точками. Unsupported compression,
  BigTIFF/extra IFD/palette/mask/NoData нельзя принимать как обычную картинку.
- NoData/alpha сохраняются как прозрачность, без ложного покрытия. DEM требует отдельного
  типа samples, vertical units/datum и контрольных высот; grayscale не объявлять DEM.

Вертикальный результат: явный import контрольного файла → безопасный private reader/
conversion → существующий каталог/renderer → географическая сверка и restart. Ошибка
или отмена сохраняет исходный файл, прежнюю карту/состав, кеш, KML и вложения. Предыдущие
MBTiles readers и онлайн-карты не заменяются новым непроверенным парсером.

## Affine геопривязка — scoped native проверка

Подключена ограниченная реализация: code90020f3/CI43134277461, native391 PASS
обеAPI; API23full46 success/API35full44failure из-за adb offline, НЕполный green.
GEOTIFF_AFFINE.md отделяет runtime/доставку/приёмку. OGC GeoTIFF1.1:
`clause_7_requirements.adoc` blob6c8a8ba393f864acb8bb539f03d759108ff262a2;
`requirements_class_ModelTransformationTag.adoc`
blob49c4f58ee32c2388baed6f630fef72cb1d985311: tag34264, DOUBLE16, row-major.
`annex-b.adoc` blob0361f3690bd597756163180bc7f74e4ddf1ae742 задаёт
2D matrix [a,b,0,d; e,f,0,h; 0,0,0,0; 0,0,0,1]. Это raster→model,
не обратная матрица; Area/Point полпикселя остаётся прежним. Scale+matrix
не совмещаются. Perspective/3D/нечисловая/вырожденная/противоречивая привязка
должны явно отклоняться. Поддержка не должна угадывать datum/CRS.

Пользовательский результат: повёрнутая/скошенная локальная карта через тот же
importer→MBTiles→renderer; прозрачность вне реального footprint, корректный
extent и ограниченное разрешение/количество тайлов, Cancel/ошибка сохраняют
предыдущий файл. Общий GeoRasterTransform inverse-affine; прежний importer использовал только
разрешение из bounding box. Кандидат добавляет inverse-Jacobian row bounds для
действительного шага пикселей, включая skew, и сохраняет прежние caps.
Для compressed strips требуется прямой порядок строк; иначе явный отказ/нужныtiles.
Нельзя только разрешить tag34264 и объявить поддержку готовой. Independent literal pixel/
half-pixel/rotation/shear/NoData controls и прежние data guards обязательны.
Этот общий результат нужен и будущей Ozi-калибровке, без второго renderer;
полная приёмка GeoTIFF/Ozi26.1 остаётся открытой.

Последующая scoped регрессия: 8d26807/CI43146921585 SUCCESS46both,
offlineformats748each/source78/548classes/host27;16scopedPNG/source/all550+554
members verified. Ozi PNG/JPEG/BMP+affine/data PASS; sameBoot readonly transport
recovery реально выполнен на35 безповтораnative. Предыдущие failure остаются
историей; приёмка/officiallint/release gate не заменяются CI.
