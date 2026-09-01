# Исследованные источники UI/UX

Дата актуализации: 2026-09-01.

Здесь фиксируются не ссылки «для вдохновения», а принципы, которые разрешено переносить в skills.

## UI Skills — https://ui-skills.com

Архитектурный вывод: вместо одного монолитного designer prompt нужны маршрутизируемые skills с разными обязанностями.

Переносим metadata-first routing, evidence-based audit, отдельный motion audit, reconstruction от tokens/shared primitives/representative consumers и приоритет high-confidence root causes.

Не переносим буквально web-only CSS/React recipes.

## TrueSpace Anti-Slop Design Director — https://truespaceai.ru/design/

Полезен decision-making structure, а не poster style: несколько разных по идее концепций → generic/template rejection → defining mechanism → regression review.

Переносим:
- `IDEA != STYLE` → `UX/INFORMATION MECHANISM != LAYOUT/THEME`;
- concepts различаются organizing mechanism, не palette/sidebar/cards;
- genericity/templateability tests для primary work surface;
- mechanism library как reasoning prompts, не templates;
- regression check после реализации.

Не переносим poster visual school, абсолютные bans без задачи, уникальность стандартных controls и универсальный запрет design questions.

Адаптация: `anti-slop-ui-direction` + `ui-methodology-director` только для существенных macro redesign.

## Apple Human Interface Guidelines — https://developer.apple.com/design/human-interface-guidelines/

Используем HIG как источник **семантики desktop interactions**, а не как визуальную тему macOS.

Актуальные разделы:
- Design principles — https://developer.apple.com/design/human-interface-guidelines/design-principles
- Designing for macOS — https://developer.apple.com/design/human-interface-guidelines/designing-for-macos
- Segmented controls — https://developer.apple.com/design/human-interface-guidelines/segmented-controls
- Tab views — https://developer.apple.com/design/human-interface-guidelines/tab-views
- Popovers — https://developer.apple.com/design/human-interface-guidelines/popovers
- Pop-up buttons — https://developer.apple.com/design/human-interface-guidelines/pop-up-buttons
- Toolbars — https://developer.apple.com/design/human-interface-guidelines/toolbars
- Sliders — https://developer.apple.com/design/human-interface-guidelines/sliders

Переносим в professional Qt desktop:
- сначала purpose/user intent, затем visual/interface decisions;
- большие desktop displays используются для большего объёма meaningful content с меньшим количеством nested levels/modality, но с комфортной плотностью;
- segmented control — небольшая группа closely related choices/actions; не перегружать десятками сегментов;
- на macOS main-area related pane switching ближе по семантике к tab view, а segmented control естественнее в toolbar/inspector;
- tab view показывает связанные mutually-exclusive content panes и делает choices непосредственно видимыми;
- popover подходит для небольшого набора временно нужных related controls и экономит постоянную площадь;
- pop-up/combo — компактный выбор из flat mutually-exclusive options, когда все варианты не должны быть постоянно видны;
- toolbar содержит deliberately chosen frequent commands, сгруппированные логически, а не весь feature catalog;
- slider представляет реальный ordered min→max range; произвольные categories не превращаются в slider ради современного вида;
- keyboard/pointer precision и familiar platform behavior сохраняются.

Итоговая адаптация называется **Interaction Recomposition** в `dense-controls-and-selection`: группа controls сначала пересматривается как одна пользовательская операция, затем маппится на native Qt primitives. `Apple-like` не означает копировать Liquid Glass, capsules или whitespace.

## shadcn/ui — https://ui.shadcn.com

Переносим composable accessible primitives, shared component только при повторяемом contract, полный state API и design system как рабочий код. Не копируем React/Tailwind architecture в Qt.

## coss ui — https://coss.com/ui

Полезна таксономия autocomplete/combobox/command/context menu/drawer/field/meter/popover/progress/segmented/slider/tabs/toast/toggle/toolbar. Переносим semantic control choice, но теперь option count считается ограничением, а не главным правилом.

## Design System Checklist — https://designsystemchecklist.com

Переносим semantic colors, spacing rhythm, typography hierarchy, motion tokens, icon semantics, component states и keyboard behavior.

## Beautiful UI — https://beautifului.dev

Переносим локальный status рядом с объектом/задачей, понятный human-in-the-loop предмет решения и compact rows/chips вместо больших AI cards для вторичных действий.

## beUI — https://beui.dev

Переносим searchable multi-select, keyboard navigation, expandable/contextual controls и drag/snap только там, где объект действительно перемещается. Decorative tilt/glare/bounce в operator workflows не переносим.

## Rare UI — https://rareui.com

Duration Picker полезен как case compact stateful editing: view → edit, autofocus, validation/clamp, immediate error, explicit confirm. Gooey styling не переносим.

## Transitions.dev — https://transitions.dev

Переносим named motion tokens/patterns, origin-aware transitions и отдельный review/refine этап. Motion не должен задерживать готовый result.

## Emil Kowalski — You Don't Need Animations

https://emilkowal.ski/ui/you-dont-need-animations

Переносим purpose-before-animation, frequency rule, отсутствие заметной animation на keyboard/high-frequency actions и идею, что иногда лучшая animation — её отсутствие.

## Enzo Manuel Mangano demos — https://github.com/enzomanuelmangano/demos

Переносим 1:1 direct manipulation, понятные bounds/resistance/snap, separation continuous preview vs commit и обязательную mouse/keyboard alternative на desktop.

## Общий запрет на cargo-cult

Ни один источник не является готовым стилем продукта. Сначала user job, frequency, criticality, semantic axes, input devices, density и domain truth; только потом выбирается pattern.
