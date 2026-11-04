# Новый внутренний контур: текущая проба 4 ноября 2026

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
