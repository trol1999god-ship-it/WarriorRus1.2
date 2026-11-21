# Исторический срез до c373133

Следующие формулировки next/current/pending относятся к прежним коммитам и запускам.
Актуальная точка продолжения — CODEX_NEXT.md. Исходные failed статусы не исправлены задним числом.

KML editor a7f789a/CI43234511518: обе API FAILURE45/46, Native helper ошибочно
искал shared Style/StyleMap через feature-only byId и упал доeditor UI. Узкий test-only
DOM lookup fix собран; UI/Save/Cancel/IME пока НЕподтверждены. Named layer presets —
следующий локальный candidate0a031db, JVM40/83361/SDK23source84; Android pending.
Официальный lint84source exit1/2errors/114warnings, НЕPASS. CODEX_NEXT.md.

Компонентный KML renderer ca888b5/CI43225977674: offlineformats1228 PASS обе API,
четыре KML ичетыре HGT PNG просмотрены/source+digests проверены. API23full46 SUCCESS,
API35full45 FAILURE: partial adb pull vertexscroll после native314 PASS; НЕgreen CI.
Явный manager editor/Arimo/независимые fallback и узкий transport fix — следующий
локальный кандидат; его Android runtime pending. CODEX_NEXT/KML_COMPONENT_STYLES.md.

Последний CI43217403961 на130b522: API23 SUCCESS46/46, API35 FAILURE45/46.
Отмывка/offlineformats1202 прошла обе API (6119/3625ms); четыре новых PNG проверены.
Общий failure — выгрузка Undo PNG после native363 PASS; точный adb returncode не сохранён.
Доказательства runtime-130b-result.json, CODEX_NEXT.md. Новые компонентные KML стили
пока локальный WIP, Android не проверен; accepted0/полная приёмка открыта.

Историческая исходная проверка838 (ниже) относится к предыдущей версии:
HGT hillshade8382001/CI43186245108: API23 SUCCESS46/46/native1202, API35 FAILURE45/46
на первом UI Create (45sec ещё «Построение…»). Общий CI НЕgreen. Source/digest/all556+560members
verified, реальные prompt/saved/failure PNG просмотрены в указанной границе.
Подготовлен bounded-node performance fix: host4.85→0.92sec/1.70GB→49.7MB allocations,
вся пирамида ARGB побайтно неизменна; JVM37_83250/shade114/SDK23/source81 exact PASS.
Android исправления ещёpending; HGT_HILLSHADE.md иCODEX_NEXT.md. Не полная приёмка.

Статический GIF87a/89a через Ozi affine import реализован на1be9e3a и проверен
CI43172333048 SUCCESS46/46 обеAPI, offlineformats1025each/JVM36_83129/GIF323.
Source/digest/all552+555members verified; все16 текущих raster PNG просмотрены.
API23 BMP/GIF prompt: предыдущий CAS Toast перекрывает строку действий на кадре;
native clicks/Arimo/physical/data PASS, unobscured visual acceptance НЕзаявлена.
Точная граница проверки migration/OZI_GIF.md; full formats/26.1 acceptance открыта.
Windows1251 c9465df/CI43178276193: native1094both PASS, fullCI FAILURE45/46
из-за test PNG имени с цифрами;20rasterPNG просмотрены, checkbox/buttons читаемы,
BMP/GIF послеToast settle свободны. Test-name fix pending новым changed-codeCI;
HGT hillshade — отдельный локальный SDK81candidate, НЕэтиCI. CODEX_NEXT.md.

Ozi PNG/JPEG/BMP24/BMP32 и affine GeoTIFF проверены scoped на8d26807 /
CI43146921585 SUCCESS46/46 обеAPI: offlineformats748each, managerrotation379/373,
JVM35/82806/BMP754/Ozi66/Geo432/host27/source78/548classes. Все12 относящихся
raster prompt/saved PNG и4 profile/HGTrestart PNG просмотрены; source/digest/
innerZIP/all550/554members verified. KML/assets/source/cache/HGT/MBTiles/otherproject
и strict guards PASS. На35 реальный offline pull восстановлен sameBoot/один
readonly retry/13files0skipped; native instrumentation не повторялся.
migration/OZI_IMPORT.md, migration/OZI_BMP.md, security/ozi-bmp-qa-2026-11-12/runtime-result.json.
Это ограниченные функции, НЕполная приёмка/replacement release; accepted0.
Предыдущие90020/43134277461 иfbc/43139985094 transport failures сохранены историей.
В тот8dCI GIF ещёне входил; текущие GIF/encoding факты описаны выше. CODEX_NEXT.md,
матрица всех23id migration/IMPLEMENTATION_PLAN.md. Release gate25 не ослаблен.


## Прежний заголовок матрицы

## Актуальный ограниченный результат

HGT130b522/CI43217403961: offlineformats1202 PASS обе API, явное построение
6119/3625ms при прежних45sec. Четыре новых PNG просмотрены, all556+543members verified.
API23 SUCCESS46/46, API35 FAILURE45/46 из-за adb pull Undo PNG после native363 PASS.
Общий CI не зелёный; точный код возврата pull не сохранён. HGT_HILLSHADE.md.
Компонентные KML цвета/flags — локальный production WIP renderer+bounded resolver,
модель32 PASS; Android ещё не проверен. Все23id acceptance открыта.

