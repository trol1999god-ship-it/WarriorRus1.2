# HGT DEM — первый ограниченный кандидат, 11 ноября 2026

Путь: Ориентирование → DEM / высота центра → Открыть локальный HGT →
проверка → явное «Установить DEM». Выбор файла/Back до установки ничего
не устанавливает. «Убрать DEM» требует отдельного подтверждения; Cancel сохраняет
контейнер. Источник только читается. Нет скачивания, GPS, изменения KML-высот,
объектов/вложений, карт/слоёв/кеша или DEM другого проекта.

Поднабор: один одноградусный SRTM1/3 HGT NxxEyyy/SxxWyyy.hgt, 1201²/3601²,
signed int16 big-endian, строки с севера на юг, узлы включая края, WGS84.
Высоты исходного SRTM в метрах (обычно EGM96), вертикальный датум не преобразуется
и не доказывается одним именем произвольного файла. NoData−32768; bilinear
использует только ненулевые веса и возвращает отсутствие данных, если хотя бы
один участвующий узел void. За покрытием — нет данных, без extrapolation/fill.
ZIP, 0.5°, нестандартные сетки/типы и DEM GeoTIFF пока не поддержаны.

Проверены факты формата по официальному проекту GDAL (только документация/формат,
код и runtime GDAL не включены):

- OSGeo/gdal doc/source/drivers/raster/srtmhgt.rst, blob d42bfb365b121b877492cfa14db8c35ab1b31f62.
- OSGeo/gdal frmts/srtmhgt/srtmhgtdataset.cpp, blob acafa5214a55d7d1db03e86d3275bc9973c491aa:
  signed16/NoData/point-grid/EGM96 и порядок bytes. Поддержка GDAL шире нашего поднабора.
- [Документация](https://github.com/OSGeo/gdal/blob/master/doc/source/drivers/raster/srtmhgt.rst).

Установка пишет собственный RKHG v1 контейнер: owner project, origin, samples,
исходные bytes. Один приватный файл на проект; до~26МБ, rowLRU8. Новый файл
проверяется/синхронизируется до CAS rename. Изменение исходного target stamp
другим окном блокирует замену. Owner header другого проекта блокирует open,
Save/Remove и автоматическую cleanup; чужой контейнер не удаляется.
Формат заголовка внутренний, не объявлен внешним форматом обмена.

Карта читает установленный DEM и показывает высоту **ручного центра** в панели
координат. Перемещение центра ничего не пишет в DEM/KML. Файл сохраняется после
закрытия/перезапуска. Ошибка чтения/вне покрытия показаны явно. Рельеф/hillshade,
профиль по геометрии, коллекция DEM, преобразования вертикальных датумов и полный
список операций26.1 ещё отсутствуют. Полярная область текущего Web Mercator
не становится доступной от импорта полярного файла HGT.

Локально: HGT30 JVM assertions (sign/endian/corners/bilinear/void/coverage,
1201/3601, filename/length/foreign owner/source preservation), общий JVM32/81561,
debugQA source71exact/527classes, SDK23 tests259072 bytes compiled;
source/DEX privacy audit passed (собственный сканер, НЕ Android lint).
Android runtime НЕ выполнен. CI43001233957 codeee7a60d не содержит DEM.

Новый сценарий включён в существующие maplayers/reopen: selection→Cancel,
explicit install/remove, stale foreign replacement/cleanup refusal, ручной центр,
KML/assets/другой проект/source exact, actual force-stop/reopen. Два console PNG
import-ready/restarted, вместе с GeoTIFF2 и layer/cachejob12 =16; старый cap не изменён.
SAF результат синтетический, provider/реальный HGT/эталонная приёмка отдельно.
До реальных API23/35/новых PNG функциональный этап не засчитан.
