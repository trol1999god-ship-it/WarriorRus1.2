Дополнение: доступность длинных сообщений с открытой IME теперь реально проверена touch-scroll на обеих API;15 новых PNG просмотрены. Подробности/границы — VERTEX_SCROLL_STATE.md. Историческое ограничение «жест ещё не проверен» ниже относится к прежнему этапу.

# Восстановление raw-формы отдельной вершины — проверенный ограниченный результат

Код66cb8ca, CI41818076658 attempt2 SUCCESS. API23/API35 по33/33, vertexrotation369/364; JVM23 набора/81259 утверждений, QA-driver12.426 ownclasses, minSdk23, INTERNET only.32 финальных SHA-проверенных PNG фактически просмотрены: security/vertex-form-qa-2026-11-04/final-66-api23/35; final-result.json и final-66-api*-trace.json содержат source/job/метаданные.

Baseline0b574a2 доказал потерю valid/invalid raw-формы обеими API после настоящего уничтожения/пересоздания Activity. Теперь Bundle хранит ограниченные raw-текст/выделение/ошибку с исходными project/feature/process/part/token и хешем основного ввода. Само восстановление ничего не применяет. Чужое намерение отклоняется, устаревший main/geometry блокирует Apply. Explicit Apply меняет только основной UI-ввод; отдельный Save транзакционно меняет выбранную вершину. Cancel и отказы сохраняют XML/вложения; более новый объект не перезаписывается. Проверены оба поворота с old.isDestroyed, реальная IME, физические границы поля/кнопок, полный диалог после hideIME, no ghost, stale-before/after/main-changed и чужой проект с тем же XML/другой feature.

Native errorPopup перекрывал действия: заменён inline-ошибкой, Arimo применён к форме/selector. API35 floating-dialog frame не учитывал IME (616 против Activity381 на экране640), затем отдельные layout-события оставляли форму некомпактной/не возвращали заголовок. Layout использует frame Activity и наблюдает оба окна; оба слушателя удаляются при закрытии.100px IME predicate сохранён, добавлены реальные screen-coordinate guards.

Первая API35 попытка этого кода завершилась failure: paste instrumentation908 passed, PNG pull не удался, chooser adb offline до старта. Один повтор API35 на неизменном source прошёл все33; прежняя неудача сохранена отдельно. Успех редактора не использовался для сокрытия failure полного job.

Границы: в landscape API35 с IME доступно82px; поле и действия видны, длинная ошибка/предупреждение вне текущего scroll viewport. Полное сообщение реально просмотрено после hideIME; настоящий жест прокрутки к нему с IME ещё не проверен. Только Point/LineString part0 replace имеет эту новую Android-приёмку; before/after, другой индекс/часть и внутренние контуры требуют отдельных проб. Нет заявления одновременной видимости всего текста, полного эталонного UI, Android16/телефона или миграции. Gate false25, requirements0accepted.

Следующий участок: реальная прокрутка длинного сообщения в82px; затем сначала baseline открытых подтверждений удаления вершины/внутреннего контура при recreate. Эти пробы ещё не запускались.

---

История подготовки (pending ниже относится к прежним кандидатам):

# Raw vertex editor recreation

Baseline 0b574a2 / CI41800304932: both API23/API35 lost valid and invalid open raw coordinate forms after real destroyed/recreate. Main draft and KML/assets remained intact. All eight baseline PNGs reviewed; native error popup covered action buttons, modal text lacked Arimo. Evidence: security/vertex-form-qa-2026-11-04/before-*.

Candidate saves bounded raw text (8192 UTF-16 chars), selection endpoints and validation error (2048), original project/feature/process, XML part key/token, operation/index and SHA256 of original main input. No KML or attachments enter the Bundle. Foreign identity drops the form; stale original geometry/main input retains raw text with Apply disabled. Apply rechecks identity and changes only editor input; explicit main Save remains separately transactional. Cancel clears the modal intention without modifying main input or KML/assets. Inline validation and compact landscape layout retain action access with IME; Arimo is applied to modal and selector.

Local candidate: JVM23/81259, QA driver12, compile425 own classes, minSdk23, INTERNET only, no legacy/native/stubs/missing references. Current Android candidate acceptance is PENDING full CI33 and new actual PNG review. Baseline failure is not a successful candidate test. Release gate and requirements remain unchanged; this is not complete migration acceptance.

841843a CI41809524186: API23 all33/348 vertex assertions and16 actual PNGs reviewed. API35 previous32 pass but raw test stopped before rotation on a faulty floating-dialog frame metric. Diagnostic352d74c CI41812277514 proved Activity frame ends at IME381 while floating dialog frame ends616 on physical320x640. Candidate now uses Activity visible frame for compact layout/IME reduction;100px threshold retained, physical action/field bounds against actual IME added. Final dual-API acceptance remains pending.
