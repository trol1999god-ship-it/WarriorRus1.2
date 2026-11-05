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
