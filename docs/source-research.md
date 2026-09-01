# Исследованные источники UI/UX

Дата актуализации: 2026-09-01.

Этот документ фиксирует не ссылки «для вдохновения», а конкретные принципы, которые разрешено переносить в skills.

## UI Skills — https://ui-skills.com

Каталог design-engineering skills для разных coding agents. Важный архитектурный вывод: не нужен один монолитный «дизайнерский промпт». Нужны маршрутизируемые skills с разными обязанностями.

Переносим:
- router выбирает минимальный набор skills;
- UI audit должен опираться на доказанный design evidence, а не домыслы;
- motion audit отдельно проверяет purpose/frequency, easing/duration, physicality/origin, interruptibility, performance, accessibility, cohesion/tokens и missed opportunities;
- design-system reconstruction идёт от tokens/shared primitives/representative consumers, а не от визуальных догадок;
- high-confidence root causes важнее длинного списка мелких замечаний.

Не переносим буквально web-only CSS/React рецепты.

## TrueSpace Anti-Slop Design Director — https://truespaceai.ru/design/

Источник полезен не своим poster style, а decision-making structure: перед генерацией создаются несколько разных по идее концепций, затем generic/template варианты отбрасываются, выбирается один defining mechanism, а готовый результат проверяется против исходной идеи.

Переносим в professional UI:
- `IDEA != STYLE` переводим в `UX/INFORMATION MECHANISM != LAYOUT/THEME`;
- несколько концепций должны различаться organizing mechanism, а не palette/sidebar/cards;
- genericity test: если предметную область можно заменить несвязанной и primary work surface остаётся естественной, концепция слишком шаблонная;
- templateability test: primary surface не должна превращаться в другой продукт заменой labels/accent/data series;
- mechanism library используется как prompts for reasoning, а не как готовые templates;
- после реализации нужен regression check: defining idea может деградировать в generic component layout.

Не переносим:
- постерную visual school (гигантская типографика, risograph/print palette и т.п.) как default для профессионального desktop software;
- абсолютные bans на отдельные визуальные приёмы без учёта задачи;
- требование уникальности для стандартных dialogs/menus/combos/tables;
- правило «не задавать design questions» как универсальное: для сложного engineering workflow недостающий operational fact иногда необходимо установить.

Адаптация в этом репозитории — `anti-slop-ui-direction` + `ui-methodology-director`, работающие перед domain/Qt skills только для существенных design/redesign задач.

## shadcn/ui — https://ui.shadcn.com

Ключевая идея: composable, accessible components с thoughtful defaults, код которых принадлежит проекту и может быть изменён.

Переносим в Qt:
- shared primitive до локальной копии только когда повторяется именно контракт, а не внешний вид;
- компонент имеет все состояния и единый API;
- composition предпочтительнее огромных универсальных widgets;
- design system — рабочий код и правила, а не отдельный макет.

## coss ui — https://coss.com/ui

Полезна как современная таксономия primitives: autocomplete, combobox, command, context menu, drawer, field, input group, meter, number field, popover, progress, segmented control, skeleton, slider, spinner, tabs, toast, toggle group, toolbar.

Переносим не визуальный стиль, а выбор правильного класса контрола. Например frequent binary/mode choice → segmented control; long searchable list → combobox/autocomplete; determinate async work → progress; unknown duration → spinner/skeleton.

## Design System Checklist — https://designsystemchecklist.com

Проверены исходные checklist data проекта. Фундамент включает color semantics/accessibility/dark mode, layout units/grid/spacing, typography hierarchy/readability, elevation, motion easing/duration/reduced motion, icon semantics/naming/grid relation.

Переносим:
- единая шкала spacing (4-point/8-point family), а не случайные отступы;
- semantic tokens вместо hardcoded colors;
- состояния компонентов и keyboard behavior должны быть частью design system;
- motion имеет общие duration/easing tokens;
- иконка именуется и применяется по функции, не по геометрии.

## Beautiful UI — https://beautifului.dev

AI-native library показывает полезные компактные patterns: loading state с elapsed time, task rows с running/failed/completed, approval card, compact tool chips, recommendation confidence, records/filter tables.

Для engineering/meteorology UI переносим:
- длительная операция показывает, что именно выполняется;
- статус размещается рядом с объектом/задачей, а не только глобальным spinner;
- human-in-the-loop подтверждение должно показывать предмет решения;
- compact rows/chips предпочтительнее больших «AI cards», когда действие вторично.

## beUI — https://beui.dev

Коллекция motion-first components: searchable multi-select, file tree с keyboard navigation, modal morphing, toast stack, command palette, expandable action bar, sliders, drawers, swipeable list.

Переносим:
- motion может объяснять изменение формы/контекста;
- expandable controls помогают держать toolbar компактным;
- searchable multi-select и keyboard navigation обязательны для больших списков;
- drag/snap mechanics полезны там, где объект действительно перемещается.

Не переносим decorative tilt/glare/bounce в частые operator workflows.

## Rare UI — https://rareui.com

Небольшие single-file experimental components. Особенно полезен Duration Picker как interaction case: явный режим view → edit, autofocus, clamp invalid value, немедленная ошибка, отдельный confirm event.

Переносим принцип stateful compact editing, но не gooey styling.

## Transitions.dev — https://transitions.dev

Каталог production transitions и agent skill. Сильная идея — иметь motion token scale и отдельные `review/refine/polish` этапы вместо ad-hoc durations/keyframes.

Переносим:
- именованные motion patterns/tokens;
- происхождение анимации соответствует месту появления объекта;
- open/close должны быть пространственно согласованы;
- skeleton→content, spinner→check, state text swaps уместны только когда повышают понимание;
- motion audit ищет hardcoded durations и разрозненные transitions.

## Emil Kowalski — You Don't Need Animations

https://emilkowal.ski/ui/you-dont-need-animations

Ключевые правила:
- сначала purpose, затем animation;
- частота использования критична;
- high-frequency и keyboard-driven действия не анимировать;
- UI animation обычно должна укладываться примерно в 300 ms или быстрее;
- tooltip имеет initial delay, но переход между уже открытой группой tooltip должен быть мгновенным;
- иногда лучшая анимация — отсутствие анимации.

## Enzo Manuel Mangano demos — https://github.com/enzomanuelmangano/demos

Реальный набор React Native demos на Reanimated, Gesture Handler и Skia. Проверены gesture-driven slider/modal/wheel-picker patterns и использование haptics/press feedback.

Переносим в desktop Qt:
- direct manipulation должна следовать за pointer 1:1;
- bounds/resistance/snap должны быть понятными и interruptible;
- continuous gesture отделяется от commit event;
- press/selection feedback следует действию немедленно;
- gesture-only путь недопустим: нужна mouse/keyboard/button альтернатива;
- haptics на мобильном переводится в ясный visual state change на desktop, а не в декоративный эффект.

## Общий запрет на cargo-cult

Ни один источник не является готовым стилем продукта. Агент обязан сначала определить пользовательскую задачу, частоту действия, критичность ошибки, устройство ввода и плотность данных. Только после этого выбирается паттерн.
