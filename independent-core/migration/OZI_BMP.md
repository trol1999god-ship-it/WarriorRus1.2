# Ozi raw BMP — scoped проверено на API23/API35

Code8d26807 / CI43146921585 SUCCESS46/46 обеAPI, offlineformats748each.
JVM35/82806/BMP754/Ozi66/Geo432/host27/source78/548classes;16scopedPNG viewed,
включая все4новыхBMP и4OziPNG; source/digest/all550/554members verified.
KML/assets/source/cache/HGT/MBTiles/otherproject/Cancel/CAS/Arimo/actions/reopen
и прежние physical/80/82/raw/cursor/owner/data guards PASS. На23 BMPprompt содержит
предыдущий PNG CAS-refusal Toast ниже диалога; действия не закрыты, это не ошибка
BMP precondition. Transport990fc80 реально обработал offline readonlypull на35:
sameBoot=true/retry1/return0/13files0skipped, безповтораinstrumentation.
security/ozi-bmp-qa-2026-11-12/runtime-result.json. Full GIF/форматная приёмка открыты.

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
старые2Ozi PNG; strict16/2МиБ budget не меняется. Runtime BMP выполнен на8d/CI43146921585 SUCCESS обеAPI. Transportfix990fc80/host27 проверен в томже CI, без повторного am instrument/ослабления guards.
Фактические APK/source/test hashes — security/ozi-bmp-qa-2026-11-12/local/receipt.json
и current runtime-result.json. Только synthetic/disposable keys;
accepted0/releasegate/официальный Android lint gap неизменны.
