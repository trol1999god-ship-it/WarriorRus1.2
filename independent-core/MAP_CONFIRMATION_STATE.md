# Подтверждение удаления вершины на карте — baseline 5 ноября 2026

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
