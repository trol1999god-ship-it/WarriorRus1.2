# Проверка этапа 1

Команда: `gradle testDebugUnitTest lintDebug assembleDebug`.

* BUILD SUCCESSFUL.
* 14 тестов: 10 SQLite/Explorer и 4 проверки интерфейса/маркеров (Robolectric API 23 и 35). Ошибок, пропусков и падений нет.
* Android Lint: 0 ошибок, 11 предупреждений (форма существующих launcher-иконок и подготовка строк для локализации).
* Подпись debug APK: apksigner verify — успешно.
* JDK 17.0.16, Gradle 8.9, Android Platform 35, AGP 8.7.3.
* APK SHA-256: `23fa3d306fd068c0c2e938b2c1f05c0c403019935b737a5094b915896c4ea19b`.

Проверки выполнены в текущей облачной среде. На физическом Android-устройстве и в AlpineQuest приложение/совместимость ещё не проверялись. Успех GitHub Actions требуется оценивать по соответствующему запуску после отправки коммита.
