# Подтверждение закрытия редактора геометрии

Baseline d4bd78b / CI41991451307: JVM и обе сборки successful.
API23 127124520817: прежние43pass, только новый geometrycloseconfirm failure.
API35 127124520804: прежние42pass; managerforms adb offline до instrumentation,
не проверен; новый close сценарий реально исполнился и failed.
Обе API: actual destroyed/recreate land+return restored=false; исходные raw,
Undo1, selected1, owner/feature/process/key/token/viewport/KML/assets сохранены.
Cancel, явные SaveDraft и Discard с повторным открытием прошли без KML write.
14 before-d4 PNG SHA-verified и просмотрены. Native Arimo=false обеAPI;
API23 landscape SaveDraft вне видимого окна, Continue обрезано.
Причина — local onBackPressed AlertDialog без сохранения исходного намерения,
default native font/window width. До фактов production не менялся (c1a55df).

API35 managerforms inherited rotation-named16PNG сохранены отдельно; не являются
снимками исполнившейся формы и не засчитываются её успешной проверкой.
Полный исходный job log сохранён в рабочей области, visual blocks выделены по
исходным mode/prefix и каждый проверен неизменным строгим decoder/cap16/SHA.

Следующий шаг: bounded original-context dialog restoration, без автоматического
закрытия/сохранения/удаления; проверенные Cancel, explicit SaveDraft/Discard,
mainChanged/foreign/owned private draft guards, Arimo/три полностью видимые кнопки.
Проверенный part-choice43 и Undo42 не повторять вслепую; полный CI44 кандидата
должен реально выполнить обе API/managerforms, а не засчитать offline за успех.

Кандидат после baseline: managed bounded original-context metadata, только диалог;
явные локальные SaveDraft/Discard проверяют own private draft атомарно под существующим
GeometryDraft.class lock. Несовпадение main/foreign/replacement блокирует старое действие.
Stale KML не меняет expected token и не пишет KML через Close; отдельный stale MainSave
должен отказать. Завершённое явное действие не дублируется lifecycle persist.
Arimo/landscape fullwidth. JVM27/81416 (Close model29), Android runtime ещё не принят.
Исходный missing-part/orphan native Close путь сохранён без изменения: его отдельный
actual baseline — следующий пробел; этот кандидат не объявляет его исправленным.

Финальная локальная QA443/min23/INTERNETonly,57sourceSHAexact; unsignedb2db0651077aa682be63f4108d4d38af1e319becc35f29f56edbcdd7c8c1a925. JVM27/81416, host16, instrumentation231188 compiled. GateFalse25/0accepted; Android runtime кандидата ещё не принят.
