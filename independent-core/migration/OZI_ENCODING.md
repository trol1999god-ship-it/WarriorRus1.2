# Ozi: явный выбор кодировки .map — локальный кандидат

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
