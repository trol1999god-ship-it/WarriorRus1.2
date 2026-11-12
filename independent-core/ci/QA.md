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

12ноября read-only official lint probe текущего8382001 source81/151real Java
classfiles действительно выполнен: exit1, MissingClass(ProjectsActivity только
owned smali) +HardcodedDebugMode(manual profile false),111warnings. НЕPASS.
security/android-lint-qa-2026-11-12/hillshade-838/; smali bodies не анализировались,
production/manifest/privacy/release gate/CIworkflow не менялись. Предыдущие3errors94
иpartial2errors108 — исторические результаты соответствующих source snapshots.

## Фиксация результата

Ошибка→причина→исправление→регрессия. Фиксировать source commit, jobs/API, реальные
assertions/PNGs и ограничения. Offline/skip/старые кадры не PASS; закрытый release gate
не обходить, accepted без эталона/приёмки не выставлять. Playwright только для реальной
web-части; Stryx/SkillUI не нужны без проверки происхождения/необходимости.

### Доставка Android-доказательств после отменённого43089751186

Обе scenario steps success, но jobs cancelled и Android artifacts отсутствуют;
logs404 BlobNotFound. Полные46/PNG/guards не подтверждены. Причина upload внутри
сервиса неизвестна без журналов; успешный шаг не заменяет сохранённые доказательства.
Существующий workflow упаковывает ВСЕ rk-results в android-evidence.zip до upload:
исходные paths/bytes и records без переоценки, manifest sourceSHA/runID/SHA256.
Artifact independent-qa-api-N теперь содержит этот ZIP; для recovery нужен
вложенный архив с обязательной сверкой manifest, а не старые PNG из другогоrun.
Upload compression0 для уже сжатогоZIP, оба upload шага ограничены3min в прежнем
job45min; failure остаётсяfailure. Это уменьшает накладные расходы/риск потери
времени доставки, но не обещает исправления удалённого artifact service.
Ни сценарии, ни physical/80/82/raw/owner/data/release guards не менялись.

## Same-boot adb transport guard — 12 ноября2026

Основание: CI43134277461/API35 и CI43139985094/API35: explicit deviceoffline
при pull и подготовке следующих modes; native offlineformats391/581 PASS. Это
не greenCI и не доказанная app regression; underlying intermittent disconnect
не установлен, adb path совпадает/server-version-mismatch в логах не найден.

Existing run_android_checks.py: после начальной qemu/boot проверки фиксирует
kernel boot UUID, проверяет его до/после native. Только explicit nonzero
`device offline` на idempotent prep/readonly transport может ждать≤15с и
повторить туже команду ОДИН раз после sameBoot/qemu/boot_completed. Без restart
adb/kernel/сети/root/TLS изменений. `am instrument`, native FAIL и timeout
НИКОГДА не повторяются. Boot change закрывает required commands/старый контекст.
Полный native480сек/job45min/modes46/80/82/physical/raw/owner/PNG16×2MiB
прежние. Fresh output/unique modes; partial pull не стирается и не входит в
проверяемый final dir. Pull failure остаётся failure даже при validpartialPNG.
Оригинальный stderr/retry result — adb-transport.json, пакет сохраняет всё.
Host27 PASS, включая неизвестный native/постоянныйoffline/чужойboot/partialPNG/
previous artifacts; реальный Android transport runtime проверен последующим8d/CI43146921585,
sameBoot readonlypull recovery на35/13files0skipped и SUCCESS46both.
Это не Androidlint, не приёмка/release gate bypass и не перевод прошлыхfailвPASS.

Последующая scoped регрессия: 8d26807/CI43146921585 SUCCESS46both,
offlineformats748each/source78/548classes/host27;16scopedPNG/source/all550+554
members verified. Ozi PNG/JPEG/BMP+affine/data PASS; sameBoot readonly transport
recovery реально выполнен на35 безповтораnative. Предыдущие failure остаются
историей; приёмка/officiallint/release gate не заменяются CI.

## Подтверждённый partial-progress pull / ca888b5

CI43225977674:23 SUCCESS46,35 FAILURE45. Новый offlineformats1228 PASS обе;
35 vertexscroll native314 PASS, но adb pull rc1 после partial progress. Следующий
boot read explicit offline, sameBoot восстановлен. Это не PASS; receipt/full logs
сохранены в kml-components-qa-2026-11-12. Не приписывать точную такую же причину
130b, где returncode старый driver не сохранил.

Узкая адаптация existing driver: exact allowed QA pull/exit1/progress недостаточны;
immediate boot probe обязан подтвердить explicit device offline. Далее те же
sameBoot/qemu/boot-complete, <=15s включая probe, один fresh readonly pull; partial
rename сохраняет исходные файлы. Online/changedboot/permanentoffline не повторяют
pull/не превращаются в успех. am instrument/native FAIL/timeout никогда не повторять.
Host31 PASS, включая положительный recovery и отрицательные guards. Android pending.
Никаких новых workflow/mode/снятия 16×2MiB/80/82/physical/raw/release guards.

Официальный read-only lint на83sources/154actualclassfiles (9a71284): exit1,
MissingClass/HardcodedDebugMode,112warnings. Smali bodies не проанализированы;
adaptergap открыт, custom source+DEX privacy audit не является Android lint.

Последний local named-presets probe0a031db: официальный lint84sources/160actualclassfiles
exit1 MissingClass/HardcodedDebugMode/114warnings. НЕPASS, reports map-presets-qa/local/official-lint.
