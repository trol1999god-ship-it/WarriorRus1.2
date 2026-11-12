# Ozi static GIF — ограниченный проверенный функциональный участок

12 ноября2026: code1be9e3a/CI43172333048 SUCCESS46/46 обеAPI, offlineformats1025each, managerrotation379/373. JVM36/83129/GIF323/host27. SourceSHA/outer/inner/all552+555members verified,16raster PNG реально просмотрены. Full Ozi26.1 не принят. GIF не входил в предыдущий8d26807 CI.

Поддержка: один полный статический GIF87a/89a, global/local palette, interlace,
binary transparency89; indexed colors. OziCalibration/sharedRasterMapImport/
private MBTiles/catalog/renderer прежние. Явный .map+GIF selection/Confirm;
геопривязка только существующий explicit WGS84/LatitudeLongitude affine
контракт. Никакого угадывания CRS/codepage/neatline или соседнего файла.

Прочитаны официальные AOSP sources, tag android-6.0.1_r81:
frameworks_base docs/html/guide/appendix/media-formats.jd
blob2a908ba5fe48dd512431eb60dd96d6f4b8115f5b (GIF decoder вAPI23);
platform_external_giflib gif_lib.h blob078930c625f5d901e505d75c8ca5fceab035c814,
dgif_lib.c blob66a1d6a4149f48c749dcfc9f46e52761e69cb412.
Проверены record tags/GCE flags/endianness/interlace offsets0,4,2,1 иsteps8,8,4,2.
Реализация написана самостоятельно, код/SDK из legacy не использовались.
Реальные пиксели декодирует собственный bounded GifRaster, AOSP decoder не
пакуется и не является зависимостью. Pillow — только независимый QA oracle.

## Ограничения и ошибки

Файл≤16МиБ, ≤4 млн индексов/20kпо стороне; один full-frame без crop.
Таблица≤256цветов; индексы вне palette отказываются. LZW2…8 initial code size,
первыйCLEAR, widths≤12/dictionary4096, KwKwK, freeze/fulltable/CLEAR,
ровно width×height индексов, обязательный EOI. До2×pixels+1024 LZW codes,
1024records/65536subblocks. EOF/повреждённые block sizes/dictionary/count/
лишние данные/неизвестная версия — отказ, а не частично заполненная картинка.

Анимация/multipleframes/delay/userinput/application/plaintext/повторныйGCE/
неподдержанныйdisposal/произвольнаяneatline/неизвестные extensions/aspectratio
не поддержаны. GIF89 comments разрешены в техже budgets. Прозрачный index
нормализован в ARGB0; GIF87 opaque, полупрозрачности GIF нет.
CRC уGIF нет; source exact проверяется отдельно, format checksum не выдумывается.

Индексный buffer≤4Mbytes + bounded palette/12bitdictionary/stack/rows/255byteblock;
whole RGBA bitmap/spool не создаются. File закрыт до возврата reader; close
освобождает buffers, дальнейший pixel read отказывает. Cooperative parse/decode
deadline≤15сек, проверяется на records/blocks/codes/output; interruption — IOException.
Это срок декодирования, не всего import/SAF copy. Не меняет native480/job45 limits.

Ошибки/Cancel сохраняют previous map/source/KML/assets/cache/otherproject;
output replacement/cap512МиБ/20ktiles/z23/sync/CAS/project checks прежние.
Disposed flag volatile для worker/lifecycle; queued GIF import при настоящем
Activity.finish/destroy должен закончиться без publication. Перед записью
нужен явный Confirm; объекты/вложения не входят в raster/tile requests.

## Фактические локальные проверки

JVM36/83129, GIF323/BMP754/Ozi66/Geo432; старые suites сохранены. Включает
palette/index/EOI/count/CLEAR/KwKwK/12bit/fulltable/freeze/reset/close/deadline0/
interruption/caps/refusals.6 Pillow-generated golden streams/decodedRGBA SHA
закреплены в owned-projects/tests/fixtures/gif, проверяются verify_jvm.py.
Noise — code-width growth/fulltable/CLEAR; longrun — KwKwK; gradient/interlace.
Прежние135structure и48Pillow control artifacts сохранены.

Independent actual GifRaster vsPillow:14files/793240RGBA pixels exact; дополнительно
Pillow подтвердил2literalStream fulltable fixtures/8738pixels,5→12bits/freeze/CLEAR.
Дополнительно2 Pillow files по4млн пикселей (обычный/interlaced) дали exact8млн RGBA controls при Java heap32MiB; включая dump0.90s wall/48416KiB RSS на этом host. Fresh compilation byte-identical, sourceSHA записан в near-cap-result.json. Эти результаты — host, НЕAndroidruntime. SDK23 app+tests, source79exact/550classes,
debug QA/disposable keys/custom source+DEX privacy PASS; официальный Androidlint
adaptergap остаётся НЕPASS. Локальные receipts security/ozi-gif-qa-2026-11-12/local/.

В existing offlineformats добавлены nativeGIF87/89×local/global×interlace/
rotation/shear, literal controls/bounds/nativezoom/NoData/source exact/Cancel,
fulltable freeze/CLEAR, malformedLZW/animation/extensions/crop/EOF/deadline0/
oldtarget/source. Прежние PNG/JPEG/BMP UIветки остаются; добавлена GIFветка:
menu→synthetic explicit picker pair→Confirm/Cancel/CAS/Arimo/actions/reopen/
actual Activity destruction with queued import/KML/assets/otherproject/network0.
2новыхGIFPNG, суммарно8 mvisualPNG вofflineformats; strict16/2МиБ не меняются.
Нативное исполнение real Cancel/Confirm/CAS/queued-import finish+destroy/worker termination/reopen/source/KML/assets/otherproject/network0 PASS на23/35. Все46 guards сохранены. security/ozi-gif-qa-2026-11-12/runtime-result.json.

API23: BMP и GIF prompt PNG содержат Toast предыдущего CAS refusal поверх строки действий. Функциональные clicks/physical bounds/Arimo PASS, но свободная видимость кнопок на этих PNG НЕзаявлена. Это ограничение снимков; следующий changed-code Windows1251 CI получает кадры после Toast settle, без повторного GIF CI. На35 prompt/actions видны. Остальные20 extractedPNG/API не заявлены просмотренными.

В текущем run native-driver transport recovery не понадобилось, receipt events отсутствуют; offline на startup boot-poll не считается пропущенным native test. SameBoot guards прежние. Реальная recovery8d остаётся отдельным доказательством. Windows1251 WIP не включён в1be9.

Full GIF/Ozi26.1/allformats/реальные файлы остаются не приняты; accepted0,
releasegate25/min23/название/Arimo/resources/online+cache/privacy безGPS прежние.
