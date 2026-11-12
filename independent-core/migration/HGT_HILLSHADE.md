# HGT → отмывка рельефа — локальный функциональный кандидат

НЕвходит вc9465df/CI43178276193 (там только явная кодировка Ozi).
JVM37/83241, HgtHillshade105; SDK23 app+instrumentation/source81exact/558classes,
одноразовые QAkeys. Native runtime/PNG/data ещёpending; не приёмка26.1.

## Пользовательское действие

Карта → Карты → Подложка → Создать рельеф из DEM. Нужен установленный HGT
этого проекта. Диалог явно предупреждает о замене сохранённого локального
MBTiles; Cancel не запускает worker и не пишет файлы/настройки. Только «Создать»
строит отдельный результат на worker и после проверки публикует его атомарно.
Исходный HGT, KML/вложения, онлайн-кеш и другой проект не являются назначением.
Получается стандартный MBTiles прежнего OfflineTiles/renderer/catalog. В текущую
композицию локальный слой добавляется явно, порядок/видимость/alpha прежние.
Это НЕвторой renderer/тайловый кеш и не загрузка DEM из интернета.

Свет фиксирован: азимут315° от севера по часовой стрелке, высота45°, z-factor1.
Это явно заданное освещение, не определение положения/солнца/устройства.
Настройка освещения/коллекция DEM/multidirectional/cast shadows пока отсутствуют.

## Геометрия и ресурсы

HgtHillshade читает только HgtRaster.owned(file,project): SRTM1201²/3601²,
signed16 bigendian/WGS84/метры исходного SRTM; вертикальный datum не преобразуется.
Результат —1200²/3600² cell-centred PixelIsArea на точном одном градусе HGT,
без half-cell расширения вокруг крайних узлов; shared GeoRasterTransform4326.
На каждой ячейке средние производные билинейной поверхности по четырём углам.
Горизонтальные размеры: local tangent WGS84 ellipsoid N*cos(latitude), M,
метры на шаг градуса в центре строки. Lambert normal dot fixed light,
clamp[0,1], round255; alpha255 для валидного значения, включая чёрный0.
Любой NoData corner/вне footprint → прозрачный ARGB0. Не приписывается Horn9,
GDAL pixel equivalence или визуальная эквивалентность эталону.

Официальная GDAL documentation gdal_raster_hillshade/gdaldem проверена для
терминов azimuth/altitude315/45 и необходимости согласования горизонтальных и
вертикальных единиц. Код GDAL не используется; формула/метод описаны выше.
Географические константы WGS84 такие же, как в Coordinates/GeoRasterTransform.

Shade blocks64×64, максимум64blocks/1МиБ; HgtRaster прежний8row LRU.
Нет whole-map RGBA/grid allocation. Close очищает blocks/закрывает собственный
reader; closed access отказывает. Interruption проверяется на строках блока.
RasterMapImport/RasterExportFile прежние: native density, z≤23, ≤20ktiles,
≤512МиБ с whole-file проверкой/sync/atomic replacement. Весь HGT за пределом
WebMercator отказывается без частичного использования/порчи прежнего результата.

## Контекст и запись

UI захватывает owner/source stamp/target stamp при открытии подтверждения.
До построения проверяет исходный проект/source/target; после построения снова
source stamp+owner header, project existence, Activity disposed/owner и target CAS
под LocalRasterStore lock. Reader lifetime не держит этот lock во время I/O.
Стандартный собственный .rkdem заменяется приложением атомарно; stat CAS связывает
его inode. Это не защита от привилегированной in-place записи с обходом storage API.
Смена DEM/назначения/чужой owner/выход не публикует кандидат; удаляется только свой
временный результат. Не пишет XML/вложения и не выполняет MainSave геометрии.
Без GPS, георазрешений, HTTP/телеметрии/cloud sync/скрытой передачи данных.

## Проверки

Локально105 modelchecks: flat/одиночные slopes/light direction/literal values,
NoData/invalidlight/metric inputs, cell bounds, source/foreign owner, LRU64,
interruption, закрытие, SRTM3601 east180. Все прежние JVM suites сохранены.
Локальные sourceSHA/APK hashes/JVM/SDK receipts: security/hgt-hillshade-qa-2026-11-12/local/.

В existing offlineformats подготовлен synthetic ridge HGT1201 (20*min(x,1200-x)),
с NoData500/500: независимые контрольные grayscale203/149, native z11 и bounds
[5,10,6,11], transparent void/outside, cancel/alias/foreign/polar refusals.
Реальный menu/Cancel/explicit Create/Arimo/48dp/>80viewport, два новыхPNG;
stale-before source, stale-after source/target (после видимого prepared temporary,
то есть после prechecks), чужой header, actualdestroy queued generation,
Activity reopen/explicit DEM remove при сохранённом MBTiles/KML/assets/HGT/cache/
другом проекте/network0. Это подготовленные проверки, НЕnative PASS.
Новых mode/workflow/baseline/timeout increases нет; total12mvisualPNG≤16/2МиБ.
Отдельный force-stop именно derived fixture здесь не заявлен; общий MBTiles/DEM
restart покрыт прежними existing scenarios. НовыеPNG и оба completedjob обязательны.

Все23id implementation/acceptance отдельно, accepted0. Official Androidlint gap
НЕPASS/customprivacyНЕзамена; releasegate25/min23/Arimo/resources/name прежние.

## 8382001 / CI43186245108 — факты и ограниченное исправление

JVM131074000248 SUCCESS37/83241/shade105; обе Android builds SUCCESS.
API23 131074192684 SUCCESS46/46/offlineformats1202, обе stale-after фазы реально
прошли preparedVisible=true/busy=true; pixel/NoData/z11/bounds/Cancel/foreign/
actualdestroy/Activityreopen/DEMremove/missingDEM/KML/assets/cache/source/otherproject PASS.
API35 131074192672 FAILURE45/46: HgtHillshadeChecks.run line24,
UI missing «Локальная карта MBTiles», wait45000ms. Дерево и настоящий failurePNG
показывают foreground карту со статусом «Построение рельефа HGT…»; ANR/готовность
публикации этим не доказаны. После первого UI Create оставшиеся API35 guards
не исполнены. Общий CI НЕgreen. Source/outer/inner/all556+560members SHAverified.
API23 prompt+saved иAPI35 prompt+missing-text реально просмотрены; остальные
кадры не заявлены просмотренными. runtime-838-result.json сохраняет этот failure.

Выявлена избыточная работа: на известной сетке каждый угол ячейки повторно
проходил географическую bilinear height() и boxing, читались/создавались полные
строки. На host точная выборка всей пирамиды4849664пикселей выделяла1697192104bytes,
4.8523sec. Исправление: internal HgtRaster.readNodes ограничивает окно65×65,
читает только нужные bigendian узлы через переиспользуемые short/byte buffers;
публичный bilinear height() не меняется. Shade last-block reuse убирает boxing
на каждом соседнем outputpixel. LRU64/1МиБ прежний, scratch≈8.5КиБ, NoData/lighting/
геопривязка/owner/source-target CAS/45sec wait/480sec native/45min job прежние.

Host после0.9203sec/49680856allocatedbytes; все19398656ARGBbytes до/после
побайтноcmp равны, SHA2569fa0ab702a829c276a4d28b20349f65f871efb17f81ae6e6921282cf422751e0.
Это host, НЕAndroid результат. JVM37/83250/shade114, SDK23 app+tests/source81exact/
558classes/customprivacy PASS. Receipt window-fix-local/. Native ready timing и
при timeout bounded worker stacks добавлены только в существующий сценарий,
дедлайн не увеличен. Новый changed-code CI обязателен; 838 не rerun вслепую.
