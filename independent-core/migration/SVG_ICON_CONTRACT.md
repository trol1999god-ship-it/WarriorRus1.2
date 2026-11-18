# Следующий SVG-участок — контракт и границы (draft, не реализация/приёмка)

После фактических результатов CI44296647517. Существующий renderer пока показывает
условный круг и не читает Icon/href. Общий DOM/payload store хранит непрозрачные
вложения; отдельный SVG import/render/roundtrip runtime ещё не проверен. Этого
недостаточно, чтобы назвать SVG отображение реализованным.

Цель следующего вертикального участка: пользователь явно импортирует KML/KMZ с
локальным SVG-значком; существующий основной renderer показывает его форму/цвет,
а повторное открытие/экспорт сохраняют XML и оригинальные bytes. Затем — назначение
SVG и собственная библиотека через существующий менеджер/SAF/guarded writes.

## Подтверждённые источники и решение

W3C SVG Working Group, commit83c016c9dc186bb3cf727966a12f2b6ca31332cc:
- master/conform.bs blob66bfbd3038af9066a3a72e4b419b87555934e266,
  SHA256 b43f630624198c65e615ee0f4e1a4d8aefac73dab1d6679991ebc43f8b2a8a63.
  Secure static mode запрещает scripts/external refs/animations/interactivity.
- master/paths.bs blob6a9107ccf5f0b7243fa271faa815afd7b76adc18,
  SHA256749ded9191aabfed69ae35b9c324cb99bd0dea2e11ffa0b002c0b5a816e7c462.
  M/L/H/V/C/S/Q/T/A/Z, relative commands/reflection/subpaths; coincident arc endpoints
  omit segment, zero radii become line, negative radii become absolute, small radii expand.

Это editor draft reference, не заявление о SVG certification. Точные reference bytes
проверены по Git blob SHA и сохранены в work/resume-2026-11-18, не bundled в APK.
AOSP/AndroidX PathParser (Apache2.0, blob7de28da7a7ccf0666353a201023508f20e2294c2,
SHA256fd50db445c4cb4a2e1d1f2f672df428fd3d57af822d1fea717277c431a5a787f)
изучен как reference. Он не установлен и не добавлен dependency. Перенос всего parser
без строгой валидации непригоден: arity/finite/limits/arc degeneracy требуют guards.
Решение исполнителя: собственная bounded static модель/Android adapter, без новых
runtime libraries/библиотеки чужих значков. Визуальное совпадение с26.1 остаётся приёмкой.

## Предварительный профиль (до реализации уточнить по реальному importer)

- UTF8 XML без DTD/entities/resources. Никаких script/events/image/use/foreignObject,
  fonts/text/CSS imports/animations/network/URI loading. Неизвестные render features
  явно отвергать целиком, не показывать молча частичный SVG и не менять исходные bytes.
- Первые supported primitives: path/rect/circle/ellipse/line/polygon/polyline/groups,
  finite transforms, viewBox, solid fill/stroke, winding/even-odd, opacity.
  Gradients/patterns/masks/filters/CSS расширять отдельными подтверждёнными контрактами.
- Safety bounds — app policy, не лимиты стандарта: bytes64KiB, nodes256/depth16,
  total path segments4096, bounded finite numbers and transforms; render <=256x256.
- Существующий ProjectWrites: XML4MiB, file8MiB/project32MiB/255payloads; новый
  SVG decoder не должен обходить эти границы. Resolve только против entry и assets того же KmlProject snapshot. Никакого file/content/
  network IO по href. Feature owner Document должен совпадать с snapshot Document.
  Идентичный XML/путь другого проекта с другими bytes не должен получать чужую картинку.
- Не угадывать KML hotSpot/scale/size/relative URI semantics: проверить OGC contract
  перед integration; unsupported сохранить и явно сообщить. Не называть default circle SVG.
- Read-only decode вне UI/project locks через существующий worker; bounded per-view cache,
  lifetime/disposed guards; shape + color/tint/alpha + paint-state reset без влияния на
  линии/подписи/тайлы. Не вкладывать href/object/XML/bytes в tile requests.

## План исполнения в текущем проекте, без нового workflow/agents/worktree

1. SvgPath pure Java + реальные literal tests: grammar/absolute commands/curves/arcs,
   zero/negative radii, malformed counts/nonfinite/limits. RED→GREEN, не source scanner.
2. SvgIcon pure model + secure parse/scene/paint/transform tests; unknown features refuse
   without partial success. KmlSymbolAssets owner/entry/memory-only URI resolution tests.
3. Android adapter + existing KmlComponentStyle normal StyleMap/inline href properties;
   optional same-document asset context from LocalMapActivity to existing LocalMapView.
   Other constructors retain current behavior. Verify min23/source/DEX/privacy/lifetime.
4. Existing offlineformats fixture adds synthetic SVG control shape to existing KML
   scene/PNG slots (cap16 unchanged), actual pixels/alpha/paint-state and different-owner
   same-path controls; real import/reopen/KMZ/source/KML/assets/cache/otherproject guards.
5. Read both completed jobs/source/digest/allmembers/new PNG, commit scoped result and
   short CODEX_NEXT. Then explicit assignment/library with guarded writes, not orphan probes.

Open implementation gaps: current app does not have SvgPath/SvgIcon/asset renderer;
this document alone closes none of symbols/import-export acceptance. accepted0,
releasegate25, Arimo/resources/privacy/online+cache preserved. No Stryx/SkillUI/cloud.
