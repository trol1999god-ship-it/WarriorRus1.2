# Ozi raw BMP — следующий локальный функциональный кандидат

12 ноября2026: НЕвходит в fbc64ea/CI43139985094. Тотrun проверяет предыдущий
PNG/JPEG Ozi и ещё выполняется. Локальный BMP-кандидат подключён к тому же
OziCalibration/OziRaster→OziImport/RasterMapImport→private MBTiles/renderer.
Не второй импортёр/каталог и не приёмка всего BMP/Ozi26.1.

Основание: официальные MicrosoftDocs/win32 `desktop-src/gdi/bitmap-storage.md`
(blob56561e1d3bfa8b8ed3c49d633e27d5a0899e4123) и MicrosoftDocs/sdk-api:
`wingdi/ns-wingdi-bitmapfileheader.md` (blob929ca9cea78a1c3798e9610661ca7fd8753ad01f),
`wingdi/ns-wingdi-bitmapinfoheader.md` (blob6d5fcaec7d6762baa11c8b5cdcd81aaa06f98efe).
Подтверждены: BM/file size/offset, reserved=0, INFOHEADER40, planes=1,
BI_RGB=0,24/32bpp, signed height top-down/bottom-up, DWORD row stride.
32bpp BI_RGB high byte НЕalpha: он не используется; результат всегда opaque.
Код и контрольные fixtures написаны самостоятельно, без legacy/стороннего SDK.

Поддержан raw BGR24/BGRx32 INFOHEADER40, обе ориентации, padding и допустимый
gap перед пикселями. DPI не заменяет калибровку `.map`. Произвольные path/CRS
по-прежнему не угадываются; пользователь явно выбирает .map+BMP и отдельно
подтверждает импорт. Вне affine footprint прозрачно, исходный BMP opaque.

Сначала проверяются весь файл≤512МиБ, сторона≤20k,100Mpx, advertised file size,
offset/stride/full span и biSizeImage=0 либо точный span; нет giant allocation
по непроверенному заголовку. V4/V5/CORE, palette, RLE/bitfields/embedded PNGJPEG,
16/8/4/1bpp, неверные/обрезанные/лишние данные явно отказываются. Это subset,
а не подмена этих форматов обычным RGB. Собственного checksum в raw BMP нет;
source exact проверяется отдельно, он не объявляется format CRC.

BmpRaster read-only RandomAccessFile, блоки≤256², LRU≤64/16МиБ pixel buffers
плюс один подготавливаемый блок/row≤1024байт и небольшой служебный overhead.
Нет целого bitmap в памяти, stream replay, spool или сети. Reader synchronized
pixel/close; close очищает LRU/закрывает файл, дальнейшее чтение отказывает.
OziRaster использует BMP reader только после сигнатурыBM; PNG/JPEG regional
decoder остаётся прежним. Все z23/20ktiles/512МиБ всего результата/atomic File/
CAS/project/disposed/Cancel/source/KML/assets/cache/otherproject guards сохранены.

Локально: BMP754 model assertions, Ozi66/Geo432 сохранены, JVM35/82806;
SDK23 app/source78/548classes и instrumentation compilation. Существующий
offlineformats расширен BMP24/32×top/bottom×rotation/shear, literal pixels,
reserved alpha/stride/padding/opaque/transparent footprint, source exact,
Cancel/unsupported layout/size/old map guards. Прежний PNG/JPEG UI остаётся;
добавлена BMP UI-ветка той же проверки явного menu/picker/Confirm/Cancel/CAS/
Arimo/actions/reopen/KML/assets/otherproject. Дополнительные2BMP PNG не заменяют
старые2Ozi PNG; strict16/2МиБ budget не меняется. Runtime BMP ещёНЕисполнен. Transportfix990fc80/host27 идёт в томже
следующем changed-code CI, без повторного am instrument/ослабления guards.
Фактические APK/source/test hashes — security/ozi-bmp-qa-2026-11-12/local/receipt.json
после завершения текущей локальной проверки. Только synthetic/disposable keys;
accepted0/releasegate/официальный Android lint gap неизменны.
