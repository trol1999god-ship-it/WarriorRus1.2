# Ozi: явный выбор кодировки .map — native проверен, CI evidence fix pending

UTF-8/ASCII остаётся значением по умолчанию. Пользователь может явно отметить
Windows-1251 в подтверждении выбранной пары .map + изображения. Выбор действует
только для этой пары и не запоминается: нет detection/fallback/перезаписи .map.
Имена выбираются явно, путь из .map не открывается; остальные CRS/affine/MSF/
basename/размеры/лимиты/NoData/старое назначение/atomic replacement/CAS прежние.
Enum allowlist UTF8/WINDOWS1251 передаётся через OziCalibration/OziRaster/OziImport,
старые публичные overloads остаются UTF8. Неверные байты отказываются с REPORT.

UI — отдельный необязательный флажок Windows-1251, Arimo, не меньше48dp,
явные «Импортировать» и «Отмена». Confirm захватывает выбранную кодировку;
Cancel не копирует файлы, не сохраняет настройку и не меняет данные.

Локально: JVM36, Ozi73 (прежние66 + explicit Cyrillic/UTF8/default refusal/
wrong-codepage/null/control-name byte); SDK23 debug QA, source79/551ownedclasses,
custom source+DEX privacy PASS, НЕ официальный Android lint.
security/ozi-encoding-qa-2026-11-12/local/ содержит исходные SHA/APK hashes/логи.
В existing offlineformats подготовлены Cyrillic pair→native pixel/source exact/
UTF8 refusal/Cancel/explicit checkbox reset/CAS/reopen/KML/assets/otherproject,
два новыхPNG. Native выполнение пока pending, не часть GIF CI43172333048.

Это ограниченная поддержка явно указанной кодировки; остальные codepage/CRS/
произвольная neatline/RMAP не угадываются. accepted0/releasegate25 прежние.

Проверена официальная ICU release-58-2 таблица ibm-5347_P100-1998.ucm
(blob123bd490ddce002fc585a4ba8f2921b82c679d99) и convrtrs.txt:
windows-1251/cp1251 — Windows Cyrillic с euro, не устаревший ibm-1251 без euro.
Литералы EA E0 F0 F2 E0 A8 = «картаЁ» проверены независимо от encoder roundtrip.
0x98 в ICU может быть C1 U+0098 (в JDK это unmappable); контрольное имя
отказывается существующим ISOControl basename guard, а не угадыванием таблицы.

Предыдущий1be9 native GIF run SUCCESS46both/offlineformats1025; его API23 BMP/GIF
prompt screenshot содержит предыдущий CAS Toast над кнопками. Только capture в
existing OziChecks теперь ждёт8000ms (две возможные LENGTH_LONG в очереди), emit
OZI_CAPTURE сохраняет время ожидания. Нативные actions/physical/Arimo/data guards
не заменены ожиданием; source production из-за screenshot не меняется.
Новые PNG требуется просмотреть, ожидание само не доказывает отсутствие overlay.

## Факты c9465df / CI43178276193

Обе job завершены FAILURE: API23 131047996797, API35 131047996752.
JVM131047722645 SUCCESS36/83136/Ozi73/GIF323/host27, обе сборки SUCCESS.
Native offlineformats1094 PASS обеAPI и45других driver records PASS; после
успешного pull emitter отверг добавленное имя map_mvisual-ozi-cp1251-*.png:
цифры запрещены действующим letters/hyphens whitelist. Это НЕgreenCI.
Source/digest/all554+557members verified; все20current rasterPNG просмотрены.
Actual checkbox Cyrillic/reset/actions/Arimo/pixels/source/Cancel/CAS/reopen/data
native PASS; на23 BMP/GIF послеToast settle buttons больше не перекрыты.
Остальные20extractedPNG/API не заявлены просмотренными.

Ограниченное исправление — только test labels ozi-cp1251→ozi-windows.
Regex/PNG signature/SHA/16frames/2MiB иproduction неизменны. На исходных кадрах
обеих API воспроизведён original-name отказ; renamed COPY проходит тотже
emit/decode10frames. Оригинальные кадры/имена/архивы сохранены без перезаписи.
Host regression security/ozi-encoding-qa-2026-11-12/name-fix-host-regression.json,
полный failure security/ozi-encoding-qa-2026-11-12/runtime-result.json.
SDK23 instrumentation повторно скомпилирован с исправленными именами.
Следующий изменённый candidate включает также новый hillshade; один обоснованный
CI проверит оба изменения. Старый run не rerun и не переобозначается success.
