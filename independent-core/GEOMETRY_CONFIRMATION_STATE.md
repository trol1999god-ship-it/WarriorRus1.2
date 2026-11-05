# Подтверждения удаления геометрии — проверенный ограниченный результат

Code1fc6b8f / CI41852078435 SUCCESS: API23/API35 по36/36; vertexconfirm367/holeconfirm515 each. JVM24/81315 (new model56), QA driver12;431 ownclasses/minSdk23/INTERNET only, no legacy/native/stubs/missing refs.56 финальных SHA-проверенных PNG ВСЕ просмотрены, Arimo видимых собственных текстов подтверждён: security/geometry-confirmation-qa-2026-11-04/final-vertex/hole-api23/35, final-result.json и final-api*-trace.json.

После baseline потери обеих native форм сохраняется bounded immutable intent: исходные project/feature/process/key/token/main SHA/type/kind/index/adding-hole. Только восстановление диалога, без автоматического действия. Explicit confirm заново читает адресованную геометрию и повторно проверяет UI-контекст; устаревшие/чужие данные не подменяют исходный intent. Cancel очищает намерение. Geometry view Bundle также привязан к owner, чужой проект с тем же XML получает свой внешний контур вместо старой выбранной дыры.

Confirm удаления вершины меняет только основной UI-черновик. Confirm контура готовит readonly намерение; отдельный Save записывает удаление. Указание Save видно в подтверждении/статусе; MainSave и текущая проверка токена не ослаблены. Новый dirty main сохраняется, clean hole view при внешней замене может загрузить свежие координаты, но старое намерение блокируется. Формат private GeometryDraft v1 сохранён. Подготовленное удаление отменяется через «Действия»/Back; explicit Save меняет только выбранную среднюю вершину или второй внутренний контур. Остальные DOM/style/media и bytes вложений сравнены реально.

На обеих API прошли: оба actual destroyed/recreate, исходные owner/key/token/index/hash; Cancel/no ghost; explicit confirm→separate Save; stale-before/after, changed main и stale Save; другой проект с тем же XML/другая feature; staged Cancel/mainChanged/foreign/rotation. Критерии/caps/release gate сохранены. Новая проверка geometryedit ДО Save добавлена, старая selected-hole-removed проверяется ПОСЛЕ явного Save.

Границы: только same-process восстановление намерения; новый процесс его отбрасывает. Full process-death acceptance не заявляется. В landscape длинные координаты не обязательно видны целиком. Нет полной эталонной/Android16/телефонной/миграционной приёмки. Gate false25, requirements0accepted.

Следующий функциональный пробел: raw before/after index1 в не первой части MultiGeometry/втором внутреннем контуре; кандидат теста подготовлен, ещё не запускался.

---

История baseline/кандидата (pending ниже относится к прошлым состояниям):

# Подтверждения удаления геометрии: фактический baseline

Code6d5f2ce / CI41841673619 completed FAILURE на API23/API35: прежние34 режима passed, только новые geometryvertexconfirm/geometryholeconfirm failure. Выбрана средняя из3 вершин маршрута и второй из2 внутренних контуров (0/inner/1). Native Cancel не меняет main/KML/assets. После настоящего portrait→landscape old!=current && old.isDestroyed оба подтверждения отсутствуют на обеих API. Исходные main/key/token/KML/assets сохранены.8 SHA-проверенных PNG все просмотрены: security/geometry-confirmation-qa-2026-11-04/before-api23/35; before-result.json.

Подтверждённая причина: native AlertDialog создаётся в локальной переменной; onSaveInstanceState сохраняет raw vertex, но не intent подтверждения. Native message/buttons также не используют Arimo (метаданные baseline). Production до этих фактов не менялся.

Дальше: bounded owner/feature/process/key/token/main-stamp + исходный индекс/вид удаления; только восстановить диалог, без автодействия. Cancel/stale/main-changed/foreign не пишут KML/assets. Отдельно проверить explicit confirm и отдельный Save; текущий код hole-confirm непосредственно вызывает write(true), эту запись не выдавать за отсутствие Save. Post-restore функциональные проверки пока не выполнены; подтверждения НЕ приняты, полного переноса нет.

Кандидат после baseline: ограниченный owner/feature/process/key/token/main-stamp/index intent и Arimo подтверждений; явный confirm повторно читает адресованную геометрию. Вершина меняется только в основном черновике; контур только подготавливает readonly intent, KML изменяет отдельная кнопка Save. Сохранённое намерение process-scoped, после нового процесса отбрасывается; формат private GeometryDraft v1 не менялся. Новый dirty main сохраняется прежним raw draft, clean view после внешней геометрии может обновиться, но original intent остаётся заблокированным и не перепривязывается. Local JVM24/81315, QA431/min23/INTERNET only, host12, source SHA match. Android-кандидат ещё НЕ принят: нужны оба полногоCI36 и новые PNG/явные действия/отказы.
