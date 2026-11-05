# Подтверждение удаления вершины на карте — baseline 5 ноября 2026

Кандидат после подтверждённого baseline: управляемый Activity map intent с origin-флагом,
исходными owner/process/key/token/mainStamp/index и проверкой текущего выбора. OnMap Confirm
вызывает прежний MapState act/undo/validation, изменяет лишь private main; запись KML — отдельныйSave.
Существующие list/hole intent сохраняют прежний default origin. Stale read проверяется до/после worker,
чужой контекст не получает намерение, Cancel не пишет XML/assets.
Landscape map получает одну48px строку selector+mode, убирает повторные heading/hint и лишний
vertical padding. Порог80/точныйviewport сохранён. Шрифты native confirmation/credit — прежний Arimo.
Новая матрица14PNG/API расширяет validbaseline: Cancel/actualrotate/real touch, nonzero part Save,
stale-before/after/main-changed/selected-changed/staleSave/foreign. Minimum-geometry validation и Undo
сохраняются через старый act; существующий geometrymap ожидает завершения нового guarded worker.

Локально: JVM24/81323 (GeometryConfirmation64), host15, instrumentation210467/API23 compiled,
QA430 own/min23/INTERNET only, no legacy/native/stubs/missing refs,54 source SHA match.
Unsigned6f2e47cf3d6b098bb52ed70bb261d8ea0604a024b8b976208d182bff14a105e8.
CI41941913724: новый mapvertexconfirm PASS444 на каждой API, все28 PNG SHA-verified и просмотрены
(probe-0e-api23/35). API23 полный40/40 success, API35 полный39/40 failure: vertexscroll
останавливается до снимка на strict82px precondition, фактические размеры отсутствуют.
Нельзя считать весь этап принятым; test diagnostic теперь пишет metrics/PNG до неизменного82px guard.
Production0e9d47d после этого не менялся. Release gate False25,0 accepted.
Намерение только same-process; process-death/reference/physical/full migration acceptance не заявлена.

Проверенный baseline до исправления:


Code6ee902c / CI41936120579 failure:39 прежних modes pass обе API.
Новый baseline действительно прошёл оба actual destroyed/recreate с разными Activity IDs.
Native confirmation исчезает на API23/API35 в обоих направлениях. Raw/selected/key/token/
centre+zoom/XML/assets не меняются.8PNG SHA-verified и все просмотрены в
security/map-vertex-confirm-qa-2026-11-05/before-6ee-api23 и before-6ee-api35.

Landscape surface616x31/API23 и616x7/API35 объясняет прежний map editor not laid out:
Canvas существует, видим и laid out, но фиксированный вертикальный стек оставляет
меньше строгих80px. Порог не понижался. Исчезновение диалога доказано независимо
полными before/after PNG и present=false после каждого recreate. Native dialog Arimo=false.
Причина intent loss — локальный AlertDialog callback в GeometryMapCanvas без сохранения.

Production пока прежний1fc6b8f. Следующий ограниченный fix: managed map intent с
исходными owner/process/part/token/mainStamp/index/selection, не автоматическое действие;
compact landscape layout с сохранением функций/ресурсов и исходного80px критерия.
Проверить Cancel, explicit Confirm только private main, отдельныйSave, stale/main-changed/
foreign и остальные DOM/assets. Полная приёмка/gate остаются закрыты.

80b1512/CI41907636790 не был доказанным baseline потери: API23 ранний layout timeout,
API35 старый log Transport closed и artifact workspace tunnel403, directAPI Forbidden.
Его точная причина отдельно не прочитана; текущие новые API35 факты её не подменяют.
