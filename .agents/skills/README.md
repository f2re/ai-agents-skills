# UI/UX skills catalog

## Маршрутизация

- `ui-skill-router` — выбирает минимальный набор skills под задачу.
- `design-evidence-and-intent` — устанавливает доказанный design/interaction contract до изменений.
- `ui-audit-and-acceptance` — сквозной аудит и критерии приёмки.

## Базовый интерфейс

- `qt-cpp-design-system` — нативная дизайн-система Qt/C++.
- `information-hierarchy-and-density` — иерархия, плотность, spacing и progressive information density.
- `dense-controls-and-selection` — combo/select/search/multi-select/segmented/toolbars.
- `interaction-contracts-and-flow` — intent → action → feedback → result для каждого пользовательского действия.
- `workflow-and-progressive-disclosure` — мастера, импорт, сложные workflows и раскрытие деталей по мере необходимости.
- `states-errors-and-recovery` — loading/empty/stale/partial/error/retry/cancel.
- `operator-accessibility-and-safety` — keyboard, focus, contrast, non-color cues, operator safety.

## Метеорология

- `meteorologist-workstation-ux` — структура рабочего места метеоролога.
- `radar-timeline-and-playback` — компактный таймлайн радарных/спутниковых/nowcast данных.
- `time-data-navigation` — общая временная навигация, forecast cycles и adaptive stepping.
- `viewport-map-interactions` — map zoom/pan/LOD/data requests.
- `meteorological-visualization` — графики, crosshair, ensembles, aerology, uncertainty.

## Motion и direct manipulation

- `motion-feedback-and-microinteractions` — purposeful motion, duration/easing/tokens/interruptibility.
- `gesture-and-direct-manipulation` — mouse/trackpad/wheel/drag/swipe semantics и snap/bounds.

Обычно агент должен начинать с `ui-skill-router`, а не загружать весь каталог одновременно.
