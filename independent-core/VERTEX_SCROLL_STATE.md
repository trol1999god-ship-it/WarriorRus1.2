# Длинное сообщение при открытой IME: проверено реальным touch-scroll

Test code6d5f2ce / CI41841673619: предыдущие34 режима passed обе API, scroll167/314. Overall CI failure относится к двум новым baseline подтверждений, не скрывается.15 финальных SHA-verified PNG все просмотрены, final-6d-api23/35 + final-result.json.

API35: Activity frame82px, ScrollView viewport26px; строка ошибки21px и две строки warning18/19px показаны полностью ПОСЛЕДОВАТЕЛЬНО реальными MotionEvent DOWN/MOVE/UP. Keyboard остаётся открытой во всех снимках и проверках. Возврат поля проверен обратными жестами, raw text/selection1..3/error/original token неизменны; Apply/Cancel физически внутри frame, invalid Apply/Cancel нажаты настоящим touch, KML/assets/main не изменились. Arimo сохранён. Поле и длинное сообщение доступны поочерёдно; одновременная видимость всего текста в82px не обещается.

Production не требовал исправления: native ScrollView уже позволял прочитать сообщения. Первые две пробы на API23 ошибочно продолжали жесты по уже доступному полю (полный текст уже виден), нарушая cursor guard. Исправлена только цель возврата: физически видимая строка ввода вместо точного scrollY. Все raw/cursor/error/token/physical guards сохранены; кадры отказов retained probe-2042/probe-027. Это не полный эталонный UI/миграционная приёмка; requirements0accepted, gate закрыт.
