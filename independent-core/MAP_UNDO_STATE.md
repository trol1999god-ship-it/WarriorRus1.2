# История Undo при настоящем пересоздании Activity

Baseline7519313 / CI41962788919: обе API прежние41 режима passed; новый42й failed.
Оба actual destroyed/recreate land/return: history1→0, canUndo false; raw/selected1/
owner/feature/process/key/token/viewport сохраняются, Cancel и отдельныйSave/fullDOM/assets PASS.
12 SHA-verified PNG before-751-api23/35 просмотрены. Это измеренный дефект, не adb offline.
Причина: GeometryEditorActivity восстанавливает текст/выбор/camera, затем openMap создаёт
новый GeometryMapState, его private Deque history пуст. История нигде не передаётся.
Production до baseline оставался0e9d47d. Исправление ещё не выполнено/не проверено.

Кандидат после baseline: независимая bounded копия истории в nonconfiguration instance,
с original project/feature/process/key/expected+currenttoken/type/hole/adding/main hash.
Копия не содержит Activity/Bundle/files, не сериализуется и не выполняет Undo/Save.
Mismatch/context/newprocess исключает перенос чужой истории; после явногоSave история свежая.
Локальные JVM25/81355, model32/driver16, instrumentation219009/API23 и QA431 own;
55sourceSHA matched, min23/INTERNET only/no legacy/native/stubs/missingrefs. Gate закрыт.
Расширенная матрица16PNG/API ещё не исполнена; нельзя считать дефект исправленным до fullCI42.
