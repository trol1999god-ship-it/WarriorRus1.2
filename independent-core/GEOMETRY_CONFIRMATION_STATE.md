# Подтверждения удаления геометрии: фактический baseline

Code6d5f2ce / CI41841673619 completed FAILURE на API23/API35: прежние34 режима passed, только новые geometryvertexconfirm/geometryholeconfirm failure. Выбрана средняя из3 вершин маршрута и второй из2 внутренних контуров (0/inner/1). Native Cancel не меняет main/KML/assets. После настоящего portrait→landscape old!=current && old.isDestroyed оба подтверждения отсутствуют на обеих API. Исходные main/key/token/KML/assets сохранены.8 SHA-проверенных PNG все просмотрены: security/geometry-confirmation-qa-2026-11-04/before-api23/35; before-result.json.

Подтверждённая причина: native AlertDialog создаётся в локальной переменной; onSaveInstanceState сохраняет raw vertex, но не intent подтверждения. Native message/buttons также не используют Arimo (метаданные baseline). Production до этих фактов не менялся.

Дальше: bounded owner/feature/process/key/token/main-stamp + исходный индекс/вид удаления; только восстановить диалог, без автодействия. Cancel/stale/main-changed/foreign не пишут KML/assets. Отдельно проверить explicit confirm и отдельный Save; текущий код hole-confirm непосредственно вызывает write(true), эту запись не выдавать за отсутствие Save. Post-restore функциональные проверки пока не выполнены; подтверждения НЕ приняты, полного переноса нет.
