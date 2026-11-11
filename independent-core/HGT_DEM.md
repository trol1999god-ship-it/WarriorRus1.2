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

Локально: HGT32 JVM assertions (sign/endian/corners/bilinear/void/coverage,
1201/3601, filename/length/foreign owner/source preservation), общий JVM32/81563,
debugQA source71exact/527classes, SDK23 tests259072 bytes compiled;
source/DEX privacy audit passed (собственный сканер, НЕ Android lint).
Android runtime НЕ выполнен. CI43001233957 codeee7a60d не содержит DEM.

Новый сценарий включён в существующие maplayers/reopen: selection→Cancel,
explicit install/remove, stale foreign replacement/cleanup refusal, ручной центр,
KML/assets/другой проект/source exact, actual force-stop/reopen. Два console PNG
import-ready/restarted, вместе с GeoTIFF2 и layer/cachejob12 =16; старый cap не изменён.
SAF результат синтетический, provider/реальный HGT/эталонная приёмка отдельно.
До реальных API23/35/новых PNG функциональный этап не засчитан.

Дополнительная подтверждённая численная регрессия: old HGT7 assertion failed на
валидном узле (499,500) рядом с void(500,500). Ненулевой вес порядка double-error
ошибочно давал NoData. Точечный fix нормализует только ошибку представления
(32ULP координаты/сопоставимый ULP raster index) на границах/точных узлах.
Настоящий void/interpolation/outside остаются NaN, не заполняются/не extrapolate.
Новые node/MapMath-roundtrip-corner controls и все прежние32 suites PASS81563;
boundary-reproduction.log/boundary-fixed-jvm.log/boundary-local-candidate.json.

## Реальный отказ cold reopen и ограниченное исправление сценария

CI43007479633/code48ca40b: JVM/build23/build35 success; по45 PASS, только
maplayersreopen timedout480s. maplayers190each подтвердил pre-restart install/
Cancel/foreign/height/data guards, НЕcold-restart. Кадр dem-restarted отсутствует.
Readonly recovery43033297900 прочёл исходные архивы с digest/SHA48ca, НЕrerun.
Логи/документы/PNG сохранены в failed-48-api23/35 и failed-48-result.json.

После успешного cachejob resume сценарий запускает DEM map поверх оставшегося
LocalMapActivity root task: NEW_TASK переиспользует его. API35 log resultcode3;
API23 второйSTART без новогоDisplayed, прежняяActivity RESUMED/idle. Нет факта
зависания DEM reader/slowIO/owner-lock/remove — эти действия ещё не достигнуты.
AOSP Instrumentation.startActivitySync ждёт ActivityWaiter callback создания
нового экземпляра, отсутствующий при reuse существующего root, без своего timeout.

Fix только instrumentation DemChecks.main: NEW_TASK|MULTIPLE_TASK, строгие owner
projectId/Intent checks и фазы RK_DEM/DEM_PHASE до/после launch/height/remove.
Обычная production-навигация/DEM parser/lock/CAS/lifetime и timeout480 не изменены.
Настоящий force-stop driver сохранён; новый экземпляр не подменяет cold process
restart. SDK23 instrumentation261102bytes compiled. Новый CI текущего кандидата
обязан подтвердить все data/physical guards и новый restarted PNG на обеих API;
сохранённый Deflate12bcdb0 проверяется тем же прогоном, отдельно от старого48ca.

## Следующая функция: явный переход к покрытию (локальный кандидат)

В «Ориентирование» добавлено «Показать область DEM». Только явное действие
подбирает центр/zoom текущего собственного HGT; нет автоперехода при импорте.
Свежий owned-reader и существование проекта проверяются под LocalRasterStore
lock, чужая замена отклоняется; KML/DEM/cache не записываются. Незавершённый
рисунок блокирует переход. Покрытие пересекается с ±85.05112878 Web Mercator;
полностью заполярное покрытие отклоняется, частичное показывается честно.
HGT38/все32_81617 JVM, host18, source71exact/debugQA529/customPrivacy PASS;
SDK23 app+instrumentation собраны. Runtime новой команды ЕЩЁ НЕисполнен,
НЕвходит в CI7230. Расширен существующий DemChecks: реальный выбор меню,
возврат из внеобласти, foreign replacement exact viewport/bytes, исходные
Cancel/install/remove/restart/KML/assets guards сохранены.
coverage-candidate/ содержит локальные receipts, НЕприёмку.
