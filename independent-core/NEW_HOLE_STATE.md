# Новый внутренний контур: текущая проба 4 ноября 2026

ПРОВЕРЕННЫЙ итог code70cc7c5 / CI41892245044 success attempt2: API23/API35
по39/39, main275 each, guards445/444; JVM24/81315, host13.56 финальных PNG
SHA-verified и все просмотрены (API23 первая попытка, API35 вторая); ещё28PNG
первой API35 сохранены/просмотрены. final-result.json содержит IDs и точные границы.
Production unchanged1fc6b8f: потери состояния/неверной записи в этом участке
не обнаружено, предварительных исправлений приложения не было.

Оба настоящих destroyed/recreate сохраняют raw/selection/error/main/addingHole и
исходный context. Cancel не пишет KML/assets; explicit Apply только меняет ввод;
отдельный Save добавляет третье кольцо без изменений outer/двух прежних колец.
Stale-before/after/main-changed/foreign и stale Save блокируются с сохранением данных.
Ошибка QA-имён исправлена; пропажу PNG нельзя было считать успехом. Новый драйвер
сохраняет16K chars pull output, печатает4K chars при отказе; строгий13-й host test.
Диагностика первой попытки70 показала adb offline в4 старых modes; один повтор
только API35 на том же коде прошёл все39, включая ранее неисполненные modes.

Ограничения: same-process only; selector продолжает показывать outer-якорь нового
контура; тесный landscape может требовать прокрутки длинной ошибки (новый собственный
scroll probe здесь не заявлен). Полный UI/геометрический паритет, process-death,
физическое устройство/Android16, миграция/основная подпись не приняты.0 accepted.

Исторические неуспешные попытки, не текущий статус:


Текущий исправленный test14984ab / CI41886801966 failure: API23 success39/39,
main275/guards445,28PNG collected. API35 main275 passed, guards439 instrumentation
passed, но0PNG collected; managermove не выполнен из-за adb offline. Причина pull
неизвестна: старый драйвер отбрасывал ответ. Новый diagnostic-only driver79f9c07
сохраняет cap16KiB pull output и печатает cap4KiB при visual failure;13host tests
passed, включая instrumentation PASS + pull offline => FAILED. Повтор или исправление
инфраструктуры пока не подтверждены. Все подробности — probe-149-result.json:
44PNG decoded,16reviewed (12API23guards+4API35main),28непросмотрены.

Историческая первая попытка и ошибка имени:


Production остаётся 1fc6b8f; предполагаемых изменений приложения не было.
Проба d2ddc5851ca56b9c99887dfcdc2d229e2d611e43 / CI41881298679 failure:
JVM24/81315 и host12 passed, обе Android-сборки passed, обе API38/39 wrapper pass.
geometrynewhole275 each passed; geometrynewholeguards instrumentation445/444 passed,
но сбор PNG завершился Unexpected visual evidence name. Нельзя считать весь CI успешным.

Причина в новом тесте: guard-invalid--1/0/1 использует цифровой код поворота,
а существующий строгий allowlist имени допускает только буквы и дефисы.
Исправлены только имена на before/land/return; allowlist/лимиты/проверки не изменены.
Нужен новый полный CI39 с исправленными именами и просмотром всех guards PNG.

Сценарии: несохранённый addingHole=true для исходного outer0/outer; raw before/after
с выделением1..3, реальной IME и обеими actual destroyed/recreate; подтверждение
удаления выбранной вершины; Cancel без KML/asset write; Apply меняет только ввод,
отдельный MainSave добавляет ровно третье кольцо0/inner/2 и сохраняет остальной DOM.
Guards: stale-before/after, main-changed raw+delete; stale MainSave, foreign sameXML
project/другая feature; invalid/error/selection после обоих actualrecreate.
Owner/feature/process/key/token/main stamp/addingHole остаются исходными.

42 доступных PNG SHA-verified и все просмотрены: probe-d2-main-api23/35 (16each),
probe-d2-partial-guards-api23/35 (5each). Observations включает12guards/API,
но7guardsPNG/API отсутствуют из-за остановки сборщика. Не подменять их просмотром
JSON. Сценарий не принят полностью до исправленного CI.

Следующий prepared-only baseline: подтверждение удаления вершины на самой карте
через реальное касание и оба destroyed/recreate; другой путь, чем список координат.
Production до фактов не менять. Все ограничения приватности/ресурсов/min23 и gate
сохранены; весь перенос/физическая/эталонная/миграционная приёмка не завершены.
