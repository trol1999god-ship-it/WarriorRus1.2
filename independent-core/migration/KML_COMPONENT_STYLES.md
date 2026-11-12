# Компонентные стили KML — ограниченный импорт и отображение

KmlComponentStyle resolver читает явные IconStyle/LineStyle/PolyStyle/LabelStyle
цвета KML aabbggrr и PolyStyle fill/outline. LocalMapView применяет их раздельно:
точка, линия/контур, заливка и подпись; alpha сохраняется, прозрачная точка не
оставляет чёрное кольцо, прозрачная подпись не оставляет тень. EVEN_ODD контуры
сохраняются. При отсутствии свойства остаются прежние цвета/форма/ширина renderer.

Один DOM индексируется один раз на создание View, не в onDraw. Разрешаются только
локальные #id, StyleMap normal, inline overrides отдельных свойств, глубина8,
200000nodes/4096style definitions. Циклы/дубликаты/ambiguous normal/foreign namespace/
external refs/неподдержанный colorMode не угадываются и не загружаются из сети.
Это не SVG, не библиотека значков и не редактор назначения стиля. Width/scale/random
и highlight не заявлены реализованными. DOM/вложения renderer не переписывает.

Локально: JVM38/83282/component32, SDK23 source82 exact/app+instrumentation560classes,
custom source+DEX privacy PASS, host27 PASS. Первая test compile ошибка whitelist
сохранена в build.log; регистрация helper в существующем build_tests.py исправлена,
полная новая сборка build-complete.log PASS. Одноразовые ключи вне repo/artifacts.
Официальный lint по-прежнему exit1 MissingClass/HardcodedDebugMode, НЕPASS.

Android runtime пока pending. Сценарий подключён в existing offlineformats, без нового
mode/workflow: разные компонентные pixels/alpha/flags, shared StyleMap + inline merge,
KML и KMZ roundtrip/вложения, реальный main reopen/две новые PNG, другой проект и
network0. Строгий лимит кадров16/2МиБ, deadlines и guards не менялись.
Приёмка символов/всего переноса открыта, accepted0/release gate прежние.

## Следующий локальный кандидат: явное редактирование

После ca888b5 подготовлен «Цвет и заливка KML» в существующем менеджере. Шесть
свойств открывают тот же managed editor, с исходными project/key/token/raw/cursor.
Save явный, Cancel не пишет; используется существующая транзакция ObjectTreeWrites
и ProjectWrites.savePreservingAssets. Пусто снимает только своё свойство и наследует
shared StyleMap, не меняет его и другие объекты. Для явного цвета задаётся normal;
собственные color/colorMode выбранного компонента снимаются при reset; width/scale/
Icon href/геометрия/unknown XML сохраняются. Папки не принимаются как Placemark.

В исходнике LocalMapView обнаружено отсутствие setTypeface у Paint подписей;
добавлено использование существующего Arimo cache. WorkspaceUi.font(Activity)
сохранён как совместимый overload, Context overload не удерживает Context.
Локально JVM39/83316/edit34, SDK23 source83exact/app+tests/customprivacy PASS.
Native проверка расширяет existing helper явными Save/Cancel/invalid/Reset/stale,
exact shared/other geometry/KMZ/assets/network0 и двумя IME кадрами; итого16,
лимит не увеличен. Этот кандидат ещё НЕпроверен Android CI и не отправляется,
пока CI43225977674 первого renderer-кандидата работает. Backup/receipts сохранены.
