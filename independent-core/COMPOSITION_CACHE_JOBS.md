# Область кеша для состава карт — проверенный ограниченный этап

Пункт карты «Скачать область слоёв» открывает отдельный экран с явным разрешением
сети, WGS84-границами (включая пересечение180°) и диапазоном zoom. Рассчитать→Отмена
не создаёт задания. Только «Скачать» сохраняет/запускает новое задание; «Продолжить»
запускает проверку уже сохранённого. Имеющиеся тайлы не перекачиваются.

Пользователь отдельно выбирает видимые онлайн-слои с opacity>0, не меняя состав/видимость карты. Выбранные слои разворачиваются через прежние leafs/TileDownloadPlan;
локальные карты не скачиваются. Tile identity source/z/x/y дедуплицируется, предел
20 000 уникальных тайлов. Политика источников проверяется **до** запуска, запрещённый
источник не пропускается молча и не заменяется другим. Действуют прежние ограничения
HTTPS/no-store/1MiB tile/256MiB cache data; запросы не принимают KML/вложения.

Private per-project job содержит immutable composition snapshot, область, zoom,
generation, source fingerprint и advisory progress с checksum. CAS не перезаписывает
задание другого окна. Один foreground worker на проект, без новых services/permissions.
Уход с экрана/выключение сети ставит на паузу; запуск/перезапуск ничего не скачивает.
Продолжение всегда явное и проверяет все тайлы: кеш мог быть очищен после прошлого
прохода. Изменённые выбранные слои/источники отклоняются (изменение невыбранного слоя не меняет задание); нужно рассчитать новое задание.
Ошибка записи состояния не удаляет полученный кеш. Delete project очищает только
собственный job key, общие source caches остаются.

## История подготовки до окончательного CIee7

Начальная local QA501/min23/INTERNETonly,65 source SHA совпали; JVM30/81493,
CompositionDownloadJob35. SDK23 instrumentation compiled; Androidruntime кандидата
**не проверен**, эти факты не относятся к CI экспортного code3f72957.
Реальный pause/force-stop/explicit resume/missing-only download/KML/assets сценарий
добавляется в существующие maplayers/reopen, без отдельной baseline-очереди.

Открыты runtime23/35/новыеPNG, крупные/долгие задания и ошибки хранилища/провайдеров,
восстановление повреждённой private job metadata, полный механизм кеша26.1/приёмка.
Это foreground-задания с явным продолжением, не обещание фонового Android-service.

11ноября: debug QA501/source65exact, host18, SDK23 guard tests compiled.
Реальный сценарий включает выбор одного/двух источников и двух уровней, Calc/Cancel,
partial pause, stale-CAS/foreign/selected-layer-change/replaced-job refusal, затем
actual force-stop→explicit missing-only resume и complete-job zero-request check.
Другой проект/XML/assets/cache проверяются. Runtime/новыеPNG ещё НЕзасчитаны.

CI42995231822 code97d6fa4: SUCCESS46/46each. Jobs23 130437703947/35 130437703955;
maplayers142/141, reopen37each, managerforms482/473. Strict missing-only, real
pause/force-stop/explicit resume/Cancel/stale/foreign/replaced/selected-layer-change
and KML/assets/cache/other-project guards passed. All32 newPNG SHAverified/viewed.
НО визуально подтверждено сжатие action buttons примерно до10px на обеих API
(на23 с настоящей IME; на35 даже без показанной клавиатуры). Этап не принят.
Кандидат исправления: явная48dp высота и physical/text/IME guards; новыйCI нужен
по причине реального дефекта, не blind rerun. interim-97-result.json сохраняет
исходные факты отдельно от будущего исправления.

Итог codeee7a60d / CI43001233957 SUCCESS46/46both: jobs23 130457786547/
35 130457786669, layers156/155, reopen51each, managerforms482/473 реальноPASS.
Все28 новыхPNG SHAverified/просмотрены. Кнопки48dp/полный текст/Arimo над настоящей
IME проверены физическими guards и кадрами обеихAPI; clipping97 устранён.
Все функциональные/data guards старого97 повторноPASS. final-result.json.
Это scoped synthetic evidence, не полная приёмка механизма кеша26.1/физического
телефона/реальных провайдеров/долгих задач. Requirements accepted0/releaseblocked25.
