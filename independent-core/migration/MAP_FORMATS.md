# Реестр карт и высот: реализация отдельно от приёмки

12 ноября 2026. Источник кандидатов эталона — `reference-feature-candidates.json`:
он прямо предупреждает, что строки/changelog не доказывают runtime-поддержку26.1.
Форматы нельзя объявлять полностью перенесёнными на основании расширения имени.

| Семейство | Сейчас в independent-core | Следующий результат / критерий | Приёмка |
|---|---|---|---|
| Raster MBTiles, TMS/XYZ | `OfflineTiles`, приватный импорт, стандартный `tiles` и нормализованные `map/images`; PNG/JPEG/WebP через ограниченный Android decode. `offlineformats` проверяет валидные/отклоняемые контрольные SQLite. | Сохранить read-only вход, CRS EPSG:3857 и схемы строк; перечень контрольных файлов/zoom/границ, отсутствие замены прежнего файла при ошибке. | Сторонние файлы/программы и географическая сверка открыты. |
| Кеш источников и MBTiles-снимок | `OnlineTiles`, `CacheExport`; online cache EPSG:3857/3395; экспорт в3857/TMS. Composition-aware export code3f72957/c230680, CI42074949288 SUCCESS46both/cacheexport69/8originalPNG reviewed; jobs ee7/CI43001233957 SUCCESS46both/actualforce-stop→explicit missing-only resume. | Явный экспорт фактического состава/alpha/order/visibility без сети и объектов; сохранить явные pause/resume jobs, затем проверить реальные провайдеры/объёмы/ошибки хранения. | Реальные политики провайдеров, объёмы/прерывания и совместимость открыты. |
| GeoTIFF, включая NoData | Bounded TIFF6→existing MBTiles/catalog/renderer: raw/Deflate8/32946/predictor1/2, RGB/gray8/alpha/NoData; strips/tiles. EPSG4326/3857/AreaPoint. Tiled3c875+1254/CI43114388829 SUCCESS46both/native200/64PNG reviewed. Affine34264 code90020f3/CI43134277461: native391both, API23full46success/API35full44failure(adb offline delivery/before managerrotation),44PNG/allmember SHAverified. GEOTIFF_IMPORT/DEFLATE/TILED/AFFINE.md. | Следующие подтверждённые layouts/CRS/overview/palette/DEM только с bounded контрактом; сохранить отказ неподдержанного, extent/native pixels/Cancel/data. | Synthetic control georeference проверена scoped; все реальные форматы/файлы26.1 и проекции не приняты. |
| CompeGPS RMAP | Кандидат из changelog; reader отсутствует. | Проверяемая спецификация/контрольный файл и bounded metadata/tile reader, интеграция каталога/состава без переписывания оригинала. | Runtime эталона/форматная совместимость открыты. |
| OziExplorer `.map` + JPEG/PNG/BMP/GIF | PNG/JPEG explicit pair/Version2.2/UTF8/WGS84 affine/shared importer/region LRU: fbc64ea/CI43139985094 native581both/API23full46success/API35full41failure(adb offline);4newOziPNG viewed/all548+538member SHAverified; migration/OZI_IMPORT.md. Raw BMP24/32 localcandidate JVM754/source78/SDK23; runtime pending OZI_BMP.md. GIF/другие CRS/codepages/neatline отсутствуют. | Парсер calibration/projection, безопасное разрешение соседнего изображения через явный import, контроль координат/поворота/границ. | Датумы/калибровка и реальные файлы эталона открыты. |
| DEM/height rasters | Signed16 HGT1201²/3601², private owner/CAS install/remove, manual centre, coverage и read-only профиль raw геометрии. HGT_DEM.md/DEM_PROFILE.md. После test-helper root-task fix7230 и scoped graph ancestor:1254/CI43114388829 SUCCESS46both; code90020/CI43134277461 профиль/data PASS обеAPI, весь run failure44на35. | Следующие реально подтверждённые height форматы/геопривязка/no-data/interpolation, hillshade/визуализация/collection; без GPS, координаты/высоты объектов не менять автоматически. | Вертикальный datum исходного SRTM без преобразования; форматный реестр эталона/участки/погрешности/совместимость открыты. |

Общие зависимости: CRS/extent/zoom и отсутствие данных должны быть явными;
недостоверную геопривязку следует отклонять, а не угадывать. Файлы оригинала,
действующий состав, KML/assets и кеш сохраняются при неудаче. Readers используют
ограниченные размеры/количество элементов; импортированный SQLite не исполняет
произвольные views/virtual tables. Набор форматов и пользовательские действия
расширяются вертикально, с renderer/catalog integration, а не только тестами.

Affine34264 — локальный следующий кандидат существующего importer: GEOTIFF_AFFINE.md,
JVM33/81986/Geo432/SDK23/source73; Androidruntime pending, НЕ1254CI.

Affine code90020f3/CI43134277461: offlineformats391 PASS обеAPI; API23full46
SUCCESS, API35full44/46 FAILURE (adb offline: managervisual screenshot pull /
managerrotation доinstrumentation). Это НЕполный green CI. Все44 относящихся
PNG просмотрены, source/outer/inner/allmembers546/534SHA verified; scoped bounds/
native pixels/Cancel/refusals/data PASS. GEOTIFF_AFFINE.md. Следующая проверка
изменённого Ozi включает все46 и исходные GeoTIFF guards, не blindrerun90020.
