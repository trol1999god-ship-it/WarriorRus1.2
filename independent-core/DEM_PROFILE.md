Текущий ограниченный результат подтверждён: code3c87557+1254a0b /
CI43114388829 SUCCESS46/46 обеAPI, offlineformats200each, профиль/данные/
managerrotation379/373; 64 новыхPNG reviewed/SHA. final-1254-result.json.
accepted0, полная эталонная приёмка и replacement release открыты.
Разделы ниже с pending/failure — история подготовки, не текущий статус.

# Read-only профиль DEM — локальный функциональный кандидат

В существующем редакторе геометрии: «Действия» → «Профиль DEM» для выбранного
маршрута либо отдельного наружного/внутреннего контура. Point не предлагается.
Снимок включает текущий валидный ввод, в том числе несохранённый; не соединяет
разные части MultiGeometry. Есть график и прокручиваемая таблица512 отсчётов.
Close закрывает просмотр, отдельное MainSave остаётся единственным действием
записи геометрии. Высоты объекта НЕ заменяются высотами DEM.

Используется только собственный установленный HGT этого проекта. Никаких GPS,
скачивания, изменения KML/вложений/кеша или экспорта из профиля. Owner/context
проверяются до работы; selected part key/type/hole и geometry token — через
существующий публичный GeometryEdits.parts до и после расчёта. File stamp
проверяется до/после чтения; замена DEM отказывает. Process/project/feature/key/
token/raw main stamp/mode/adding проверяются перед показом; изменённый ввод или
Intent не принимает старый результат. Reader закрывается в try-with-resources.

Расчёт идёт на существующем worker, не ставит редактор в busy: исходные raw,
курсор, selection и Undo не пересоздаются. UI проверяет актуальность результата;
во время другого busy-действия/управляемого подтверждения либо завершения Activity
результат не открывается. Read-only окно закрывается
при уничтожении Activity и не восстанавливается автоматически; существующие
сохранение raw/Undo и строгие write guards редактора не менялись. Для просмотра
явно скрывается клавиатура; это НЕдоказательство доступности прежних форм с IME.

Ограниченный математический контракт:

- 2–10000 входных вершин, от2 до2048 отсчётов в модели; UI использует512.
- Расстояние — сумма кратчайших сферических дуг между исходными вершинами,
  средний радиус6371008.8м; это НЕэллипсоидальная геодезия.
- Распределение отсчётов пропорционально этим длинам; положение внутри сегмента
  линейно по широте и кратчайшей разнице долгот. ±180° учтены. Для длинных
  сегментов это приближение, не обещание точного геодезического трека.
- HGT bilinear/NoData/границы — тот же HgtRaster. Пропуски разрывают линию графика;
  набор/спуск считаются только между соседними известными отсчётами. Min/max —
  экстремумы отсчётов, не гарантированные экстремумы всего рельефа.
- Исходные высоты SRTM в метрах (обычно EGM96), без преобразования вертикального
  датума. Профиль не является измерением высот устройства/объектов.

Локальная модель: DEM profile23 assertions, все33 JVM suites/81640 PASS:
известная signed height plane, reverse, NoData без ложного gain/loss, ±180°,
zero-length/невалидные координаты/лимит и точная сохранность HGT/входных высот.
Android runtime ЕЩЁ НЕпроверен. UI и относящиеся проверки дополняют существующий
maplayers/DEM, отдельного baseline/mode/workflow нет. Console DEM кадры теперь
profile/restarted, totalcap16/2МиБ прежний; coverage/ready сохранены обычными
artifact PNG. Новый код НЕвходит в CI7230 или coverage CI59fdd15.

Полная приёмка DEM/профиля26.1, hillshade/коллекции DEM, реальные исходные файлы,
полные ошибки хранения/физические устройства остаются открытыми; accepted не меняется.

## Реальный первый Android результат / относящееся исправление helper

62794e4/CI43055495746:44PASSboth; maplayers FAIL `profile has physical scroll
viewport`, maplayersreopen SKIP (НЕуспех). Новые24 PNG SHAverified, 2profilePNG
actuallyviewed: график510/512/min−900/max900 и Close полностью видны, Arimo guard
пройден. Helper выбирал первый ScrollView в AlertDialog вместо предка графика;
его rect не может принадлежать полностью видимому графику180dp, если fail80x80.
Исправляется только поиск actual graph ancestor +visibility/bounds diagnostics.
Порог80/physical/touch/raw/cursor/data guards НЕснижены. Production profile из-за
этого отказа не меняется. Close/stale/foreign/mainChanged/MainSave/reopen ЕЩЁ НЕ
исполнены. Новый SDK23 helper269208 compiled. profile-627-failure.json.

## Scoped runtime, 12 ноября

6f19feb/CI43100835572: профиль реально прошёл обеAPI (layers275/274,
reopen66each). API23 full46/46; API35 full44/46 из-за adbOffline geometrymap
и dependent reopen SKIP, поэтому CI FAILURE, НЕзелёный. Profile helper выбран
через graph parent; actual viewport288×481/457, прежний nativeScrollView hidden0×0.
Строгие >80/touch-scroll/graph/Arimo/Close/raw/cursor/owner/stale/mainChanged/
отдельныйMainSave и KML/assets/HGT/cache/otherproject guards прошли; никаких
production изменений из-за дефекта helper. Все32 новыхPNG actuallyviewed/SHA,
архивы+все546/543members SHAverified; profile-6f19-result.json. Доставка работает
на этомrun; потерянный d36run не объявляется восстановленным. Полная приёмка
и полное DEM/форматное покрытие остаются открытыми. Следующий Tiled fullCI
включает реальные geometrymap/reopen обеAPI, пропуск не засчитывается.
