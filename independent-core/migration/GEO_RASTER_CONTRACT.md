# Следующий форматный участок: геопривязка растров

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
