# Именованные наборы слоёв — следующий функциональный кандидат

Кнопка «Наборы слоёв» находится в существующем MapLayersActivity. «Сохранить
показанный состав» записывает имя и существующий MapComposition; не применяет
его и не меняет карты/кеш/KML/вложения/legacy single-map choice. Явное «Применить»
восстанавливает UUID/order/visibility/opacity/sources и включает композицию.
Подтверждённое «Удалить» удаляет только сохранённый набор, не активные слои.
Cancel нигде не меняет библиотеку или текущий состав. Имена не перезаписываются
молча: дубликат отвергается. Набор local ссылается на установленный сейчас MBTiles
своего проекта, не хранит копию файла; это явно объясняется перед применением.

Используется тот же renderer/каталог/MapComposition codec, без параллельного
механизма карт. Метаданные — existing MODE_PRIVATE map-compositions preferences,
key presets_<project>, binary version/owner/SHA256; inner composition owner/checksum
проверяются. 16 наборов, имя80 UTF16 chars без внутренних control chars,512KiB
encoded metadata. Повреждённые/foreign/version/truncated/trailing data не очищаются
автоматически. Нет чтения/передачи user KML/assets или новых сетевых путей.

MapCompositionSettings проверяет существование владельца. Библиотека имеет
отдельную случайную revision, обновляемую при add/delete: старое подтверждение
не удаляет повторно созданное одноимённое содержимое. Save проверяет исходные
library+composition snapshots; Apply проверяет оба; Delete — library snapshot.
ProjectStore использует AUTOINCREMENT, cleanupDeletedProject удаляет presets key.
Нет долгого DEM/raster IO или DB-write transaction под composition settings lock;
проверка owner — короткое чтение через существующий ProjectStore.

Локально JVM40/83361/presets44, SDK23 source84exact/576classes/app+matching tests,
custom source+DEX privacy PASS. Первый oversized fixture не превышал лимит:
исправлен fixture + size precondition, production cap не менялся; исходный failure
log сохранён. receipt/backup: security/map-presets-qa-2026-11-12/local.

Android runtime пока pending. Helper добавлен в existing maplayers/maplayersreopen,
без нового mode/workflow: actual UI Save/Cancel/duplicate/Apply/Delete, stale library/
composition, foreign/deleted owner, exact layers и настоящий force-stop. Caller
сохраняет строгие pixels/KML/assets/local MBTiles/cache/otherproject guards.
Два новых кадра name+real IME/list: исходные10/14 mvisual станут12/16, лимит16/2MiB
НЕувеличен. Текущий CI43234511518 относится к KML editor a7f789a, НЕк наборам.
Полная layers/26.1 приёмка остаётся открытой, accepted0/release gate прежние.

Последний официальный read-only lint0a031db:84sources/160actualclassfiles, exit1,
MissingClass/HardcodedDebugMode/114warnings. Smali gap остаётся, НЕPASS/customaudit
НЕзамена. Предыдущий editor CI a7f789a завершён failure из-за Native definition lookup,
исправление test-only включается в следующую проверку вместе с наборами. Наборы
ещё не исполнялись на Android; локальная компиляция не заменяет runtime/приёмку.
