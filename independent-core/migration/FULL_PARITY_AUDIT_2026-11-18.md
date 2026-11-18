# Технический аудит полного переноса — 18 ноября 2026

Проверяемый independent HEAD6cfa36d / app b11; владелец реально установил b11 на
Samsung Galaxy Z Fold5 и сообщил значительное отставание практически всего UI/функций.
Классификация: технический прототип, не почти готовый продукт. CI46/46 обеAPI —
регрессия выбранных сценариев, НЕ26.1 parity. Новый APK только после существенного блока.
Implementation и acceptance раздельно; accepted0/23, gate25. Никакого нового проекта/ядра.

## Фактические источники и граница аудита

- Существующая среда running/connected; один root, нет других агентов/сборочных процессов.
  Checkout/branch сохранены; source WIP100 checks/JVM43, stash2, pending/toolchain/backups
  сохранены без reset/clean. Только чтение другой ветки через commit, без переключения/merge.
- API GitHub показывает11 веток: security/.../branches.json (10 other tree inventories;
  current branch проинвентаризирован через локальный git). Каждая pinned by SHA.
- Других connected document sessions нет. Незапушенное проверено только в доступном
  checkout. Другие облачные/локальные сессии недоступны; их WIP остаётся риском.
  Это НЕ разрешение объединять rabochaya-karta, PR14 или удалять какие-либо ветки.
- Library libfile_* сейчас не читаются доступными инструментами агента. Не подставлять
  эти IDs в Sediment download_file. Локальные library-files/shared downloads пусты;
  referenceAPK26.1/backupZIP/13screens здесь не найдены. Их bytes/hash не проверены.
  Владелец отдельно подтвердил search: backup101132807 bytes/APKs14598521/inventory1222.
  Это сведения владельца, не локальный SHA-аудит содержимого.
- referenceAPK expected SHA5ac3c7091cecae66942cdffee7c91ca0eb96be5eae902e85b0d6d9920643c142;
  libfile_68f2e2453a6881919494c855169e41a4 / libfile_c00a22eeb3b4819189b3936a3e78464a.
  Backup libfile_375f7b695e488191a306036195e94263. Inventory
  libfile_a7898b0c0fc08191b3333136d8595e58 — первичная опись4534files/3102SVG/7AQX,
  НЕ13screens, НЕlive/licence proof. Не придумывать отсутствующие названия/PNG13экранов.
- Найден реально доступный reference_ui.zip в fix/approved-app-branding commit
  0b78ceccaade603999f1322b424d156e42e51daf, Git blob a9d9b26e7df90a0300ddc405d08f400bce74da77,
  1402527bytes; byte/Git hash verified (reference-ui-provenance.json).1087resources:
  826PNG/261SVG, никакого DEX/сети/ключей и никаких screenshot13. Полный member inventory сохранён.
  Branch docs/reference-apk-audit.md связывает эти ресурсы с AlpineQuest2.3.8b SHA7e8c...,
  НЕ с reference26.1 SHA5ac3...; не смешивать версии и не заявлять точную26.1сверку.
  Branch README/ReferenceMenu: четыре нижние группы, blue palette TEXT082e4c/PANELc7e1f8.
  Текущий WorkspaceUi/LocalMapActivity: olive232d1d, шесть shortcut+collapse. Разрыв подтверждён кодом.

## Экран → элемент/сценарий → факт → изменение → приоритет → доказательство

| Экран/сценарий | Реальный текущий элемент/операция | Gap и production изменение | Приоритет/проверка |
|---|---|---|---|
| Главная карта | LocalMapView real gesture/tiles/composition; LocalMapActivity6shortcut+collapse/coordinates/status | Approved13 точныеbounds неизвестны; не выдумывать. Olive→подтверждённая blue palette,4section/menu structure только с достаточным эталоном; compact centre UTM/MGRS; safe navigation/Fold width | P0; b11 launcher/touch PASS, Fold owner negative |
| Карты/слои/каталог | MapCatalog54/3/7, реальные renderer/add/remove/alpha/order/presets | UI не совпадает; live/policy/provider proof отсутствует. Сохранить cache/offline/DEM, проверять legality без выдачи AQX за разрешение | P0/P1; b11 layers330/reopen77 |
| Карточка/редактор точки | Реальные name/description/geometry/edit attachments; renderer coloured circle | SVG href не читается: подключить owner memory assets→Canvas→KMLKMZ/reopen, затем назначение/library/editor. Не считать stored bytes отображением | P0-now; models100 не runtime |
| Встроенный manager | Nested folders/multiselect/in-project copy move/filters/sort | Full properties and cross-project transaction/asset relocation, exact UI | P0/P1; scoped manager PASS |
| Windows11 filemanager | Нет самостоятельного подтверждённого рабочего режима в текущем ядре | Не выдавать обычный ListView за второй режим; найти эталон/перенести поведение с owned KML storage | P0; NOT implemented |
| Geometry/editor | Part/ring/vertex/drag/Undo/drafts/CAS | Полный property/style/statistics/route/area/track user block + integrated map UI | P1; scoped runtime only |
| Export/media/transfer | KMLKMZ DOM/payload/SAF; attachments local | SVG shape/tint semantics and full package styles; text/capture/explicit share/BT | P1 after symbol/data contract |
| Settings/compass | Per-feature prefs + standalone CompassActivity | Approved panels/settings/calibration/units and resize, не GPS | P1; sensors physical not accepted |
| Остальные13 утверждённыхэкранов | Исходные13снимков не найдены в доступных источниках | Ни одной выдуманной visual acceptance; screen-by-screen pixel/layout mapping blocked only on missing originals, functional code continues | Evidence gap, not whole-project stop |

## Все23id: implementation / gap / изменение / dependencies / completion / acceptance

Подробные существующие зависимости/критерии остаются в IMPLEMENTATION_PLAN; текущие
кодовые ссылки/пробелы/приоритеты/границы проверок — security/full-parity-audit-2026-11-18/requirements-audit.json.
Кнопка/название/fixture/model-only не считается пользовательской реализацией.
UI13 применяется в каждом блоке; не откладывать весь UI до конца.

- **ui-map [P0]**: Interactive map/touch/viewport/panels exist; olive palette,6 shortcuts+collapse versus late branch4 sections; not26.1 parity. Gap/change: Exact13-screen layout, compact coordinates, safe system insets, Fold width; no invented acceptance. Evidence: launcher/geometrymap API23+35 b11 PASS; Fold5 owner reports prototype. Acceptance open.
- **ui-menus [P0]**: Menus call real operations but generic AlertDialogs/olive style differ. Gap/change: Restore confirmed texts/order/panels/icons per each functional block, not postpone UI. Evidence: Code + b11 scoped UI;13 reference screens unavailable. Acceptance open.
- **catalog [P0]**: 54 entries/3sets/7groups retained from AQX, real XYZ transport. Gap/change: Provider availability/license/attribution/approved live URLs; catalogue presence alone not success. Evidence: catalogscreen/TileSource scoped; no full live provider acceptance. Acceptance open.
- **layers [P1]**: Explicit add/remove/visible/order/alpha/private named sets implemented. Gap/change: Exact manager UI and reference operations/compare; broader file interoperability. Evidence: b11 maplayers330/reopen77 both. Acceptance open.
- **offline-formats [P1]**: MBTiles/PNG JPEG BMP GIF Ozi/raw Deflate tiled affine GeoTIFF bounded readers. Gap/change: RMAP and complete26.1 registry/CRS; unsupported transforms refuse; no format parity claim. Evidence: b11 offlineformats1361 both includes scoped import/pixels/data. Acceptance open.
- **cache [P1]**: Area/depth/layers foreground pause, persisted explicit resume/missing-only/policy/cap. Gap/change: Exact offline-area UI/stats/all legacy cache compatibility. Evidence: b11 maplayers/reopen scoped; not all provider policies. Acceptance open.
- **cache-export [P1]**: Explicit compose-aware MBTiles export with alpha/order/bounds/512MiB refusal. Gap/change: All reference target formats/app interoperability + import UI parity. Evidence: b11 cacheexport PASS. Acceptance open.
- **points [P0]**: Create/edit/copy/delete points, descriptions and folders exist. Gap/change: Full properties/icon/library/card actions and nested groups/Windows11 mode parity. Evidence: b11 launcher initial+second point/store and objectmanager/reopen PASS. Acceptance open.
- **geometry [P1]**: Addressed parts/rings/vertices/drag/Undo/drafts and CAS guards. Gap/change: Complete routes/areas/tracks/split merge/smoothing/statistics properties and approved editing UI. Evidence: b11 geometry/confirm/raw tests scoped; not topology/reference completeness. Acceptance open.
- **manager [P0]**: In-project nested folders/multiselect/copy/move/delete/sort/filter. Gap/change: Cross-project guarded asset transfer; both built-in/Windows11 filemanager layouts; not just list widgets. Evidence: b11 manager modes PASS; no Windows11 parity proof. Acceptance open.
- **symbols [P0-now]**: Actual component colors/fill/outline/width/label scale + StyleMap; no SVG map renderer yet. Gap/change: Finish preserved SVG asset→renderer→KMLKMZ/reopen; then assignment/library/editor and full appearance. Evidence: b11 actual metrics/editor pixels+data PASS; local SVG model100/JVM43 not runtime. Acceptance open.
- **media [P1]**: Private photo/audio/video add/open/remove and shared payload preservation. Gap/change: Text attachment/editor and confirmed capture/record + full card integration and explicit transfer. Evidence: Prior scoped media checks; b11 46 map driver not media acceptance. Acceptance open.
- **import-export [P0-now]**: KMLKMZ DOM/payload import/export/SAF exists; shared-style edits preserve exact other DOM. Gap/change: SVG visual semantics/complete styles and GPX/SHP/GeoJSON/IGC if confirmed; no opaque-byte-only implementation claims. Evidence: b11 KML component/KMZ roundtrip scoped PASS. Acceptance open.
- **filters [P1]**: Name/description/type/visibility/date/sort private prefs. Gap/change: Reference full filter fields, consistent multiple-object/group UX. Evidence: b11 filters/dates/forms/reopen scoped PASS. Acceptance open.
- **bluetooth [P1-after-export]**: No background transmission; legacy branch has explicit BundleExchange candidate. Gap/change: Safe explicit whole-package share/Bluetooth with Cancel/data/provider guards. Evidence: Not implemented/NOT accepted. Acceptance open.
- **coordinates [P0-ui/P1-CRS]**: WGS84 DD DM DMS/UTM/MGRS + manual centre conversion. Gap/change: Compact approved panel/grid/all confirmed CRS/UPS precision. Evidence: b11 coordinates scoped PASS; not all CRSs. Acceptance open.
- **dem [P1]**: HGT height/manual-centre/profile/coverage/hillshade/import/remove. Gap/change: Full DEM registry/collection/lighting tools + approved UI and height integration. Evidence: b11 existing DEM scoped regressions; not full DEM acceptance. Acceptance open.
- **compass [P1]**: Accelerometer+magnetometer without location. Gap/change: Original panel/settings/calibration/Fold sensor behavior; physical verification separate. Evidence: JVM scoped; no real sensor acceptance. Acceptance open.
- **settings [P1-throughout]**: Per-feature private settings exist. Gap/change: Consolidated exact settings scopes/menu/schemas/units, no arbitrary redesign. Evidence: Scoped reopen guards; complete settings missing. Acceptance open.
- **migration [P0-design/P2-run]**: Private guarded transactions; test package separate. Gap/change: 26.1 backup/import/rollback/identity/certificate version migration; main keys unavailable by design. Evidence: NOT replacement; no merge/phone data. Acceptance open.
- **privacy [P0-always]**: Only INTERNET; tile transport GET-only receives source,z,x,y; local owned data. Gap/change: Audit every added SVG/share/network/storage endpoint and full dependency/traffic coverage. Evidence: b11 custom source+DEX/privacy and scoped data guards; not official lint. Acceptance open.
- **independence [P0-always]**: Own Java overlay+own smali; no legacy runtime or native libraries. Gap/change: Full functional implementation/reproducibility; earlier Gradle app not substitute. Evidence: b11 binary/independence PASS. Acceptance open.
- **stability [P0-always]**: Real API23/35 emulator checks; strict physical/DOM/asset guards. Gap/change: Real lint errors MissingClass/HardcodedDebugMode; physical Fold/Fold resize and complete scenarios. Evidence: b11 push46PASS each; PR intentionally SKIPPED; lint NOT PASS. Acceptance open.

## Пригодные компоненты11веток (не merge и не подмена ядра)

| Pinned ветка/результат | Пригодное после проверки | Ограничение переноса |
|---|---|---|
| codex/independent-core-auto6cfa36d | Own KML DOM/payload/CAS/renderer/tiles/geometry; текущая база | Продолжать здесь, не legacy runtime |
| fix/approved-app-branding0b78cecc | ReferenceMenu palette/section structure, ReferenceAssets art map, SystemInsets, property/compass panels, IconLibrary, BundleExchange | Её README v22 тоже прямо отрицает fullparity; auditAPK2.3.8b не26.1. SQLite/ObjectStore другой схемы; нельзя копировать БД/включать osmdroid/AndroidSVG автоматически |
| feature/stage4-map-workspace-ui67374f2 | Panel/layout/control patterns, width-dependent Explorer | Это redesign-stage, не утверждённый13-screen эталон; нельзя объявлять accepted |
| feature/stage3-local-point-attachments9d15a34 | PointAttachments SAF/retention test cases | Переписать поверх current owned payloads, без чужих schema migrations |
| feature/map-source-foundatione220153 | MapSourceRegistry user source policy examples | Existing TileSource/MapCatalog уже больше; не дублировать |
| feature/bulk-move-folder-picker6f75b4e | Multi-selection move destination/cycle tests | Current manager guards сохранять; не заменять in-project CAS |
| codex/stage1-location-permission-regression3e225b4 | No-location negative regression intent | Current source+DEX privacy сильнее; original runtime не использовать |
| feature/warrior-2-baseline270b9bb | Old common map/store/library behavior comparison | Не baseline26.1, не самостоятельное ядро |
| main2f1c92e | Old common components provenance | Не текущая разработка |
| rename-rabochaya-karta50d6379 | Branding history | Не сертификат/identity миграции26.1 |
| rabochaya-karta2b6ec76 | Иная сохранённая working history/core snapshot | Не объединять: незапушенное других сессий неизвестно |

## Первый production блок после этого необходимого аудита

SVG приоритет подтверждён существующим реальным gap: KML Icon/href сейчас игнорируется,
а доступные261reference SVG содержат path/circle, width/height (безnamespace/viewBox),
59style declarations только fill-opacity .25/.5. Старый WIP отвергает ВСЕ эти файлы;
сначала минимально расширить безопасный parser под подтверждённые формы, затем
подключить owner-bound assets/StyleMap/Canvas в existing renderer/import/reopen/export.
Отклонённые external/DTD/script/animation/unknown features не включать ради coverage.
Все изменённые screens используют Arimo/подтверждённые ресурсы и existing guards;
готовый существенный block проходит model+SDK23+real23/35 runtime/pixels/data/newPNG.
Не выдавать ещё один APK лишь за изменение parser/model/palette. Не повторять b11 fullCI.
После SVG/library — complete object/media/filemanager blocks с UI13 внутри каждого;
карты/cache/DEM/coordinates развивать без повторной реализации уже готовых частей.

Официальный Android lint MissingClass/HardcodedDebugMode NOTPASS; не заменять customscanner.
Release gate25 и accepted0 unchanged. Недоступные Library originals/13screens/other sessions
остаются точно обозначенными рисками, не оправданием останавливать независимый functional код.
