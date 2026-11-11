# Постоянная QA-практика самостоятельного ядра

Инструкции: корневой AGENTS.md. Единственный workflow — independent-core-qa.yml.
Рабочая ветка проверяется по push; её PR-event не дублирует сборки. Другие PR и явный
workflow_dispatch сохраняют проверки. Evidence-only режим читает старые артефакты
с run/SHA/digest и проверяет allowlist коммита; сборки/тесты он не запускает.

## Фактическая сборка и release

Это nonGradle Java8→D8 + собственный smali + aapt2, Java17/SDK23/build-tools35.
`build_standalone.py --debug` меняет debuggable только во временном manifest;
профиль `debug-qa`, signing — одноразовый QA key. Обычный development профиль
остаётся nondebug; его нельзя называть принятым release. `--debug` и `--release`
взаимоисключаются. Реальный `--release` сначала выполняет неизменённый release_gate.
Сейчас он блокируется25 причинами, APK не создаётся и не публикуется, основные ключи
не используются. `check_release_profile.py` фиксирует этот реальный отказ.

JVM/unit выполняется в обязательном job один раз; Android build может использовать
`--skip-jvm` только после его успеха. Локальный QA по умолчанию запускает JVM.
Host driver tests проверяют fail/skip/artifact handling; они не заменяют Android.

## Пользовательские операции и security

Используется существующая Instrumentation + platform UiAutomation/accessibility:
несколько объектов и restart, папки, слои/карты, импорт/экспорт и геометрия.
Это не отдельная очередь Espresso/UIAutomator-библиотек. Icons/SVG и остальные
операции дополняются вместе с production-функцией; не объявляются проверенными заранее.
Только disposable эмуляторы и synthetic fixtures, никогда личный телефон.

`privacy_audit.py` — собственный ограниченный manifest/source/DEX-аудит, **не Android lint**.
Он проверяет min23/name/backup/exported/perms, forbidden API/SDK, network entrypoints,
GET/no-output/no-redirect, DEX/native inventory. Runtime сетевые fixture guards и
точная сохранность KML/assets/cache/другого проекта дополняют его; полного доказательства
всех dynamic flows статический сканер не даёт. Новые сетевые/storage пути требуют
разбора кода и относящейся регрессии. Supabase/телеметрия/accounts/cloudsync запрещены.

## Реальный статус Android lint

11ноября официальный SDK lint9.4.0-rc01 действительно запускался offline с source65,
manifest/resources/compileSDK23. Получено3 ошибки и94 предупреждения: нет classfile
classpath, ProjectsActivity существует только в owned smali и не виден frontend,
HardcodedDebugMode конфликтует с явными ручными профилями nonGradle. Это **не PASS**.
Отчёт сохранён; blanket suppressions/baseline не добавлены. Нужен валидированный
адаптер реальных classfiles/compile-only ABI/вариантов и явная граница покрытия smali.
`android_lint_status.py` в CI честно записывает этот integration gap, а не запускает
собственный сканер под названием Android lint. Полная lint-приёмка остаётся открытой.

## Фиксация результата

Ошибка→причина→исправление→регрессия. Фиксировать source commit, jobs/API, реальные
assertions/PNGs и ограничения. Offline/skip/старые кадры не PASS; закрытый release gate
не обходить, accepted без эталона/приёмки не выставлять. Playwright только для реальной
web-части; Stryx/SkillUI не нужны без проверки происхождения/необходимости.
