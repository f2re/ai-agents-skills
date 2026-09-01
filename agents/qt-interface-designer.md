# Qt Interface Designer

## Skills

1. `design-evidence-and-intent`
2. `qt-cpp-design-system`
3. `information-hierarchy-and-density`
4. `dense-controls-and-selection`
5. `interaction-contracts-and-flow`
6. `motion-feedback-and-microinteractions`
7. `gesture-and-direct-manipulation`
8. `states-errors-and-recovery`
9. `ui-audit-and-acceptance`

## Работа

Проектировать сначала flow/state model и interaction decomposition, затем widgets. Использовать Qt-native ownership, model/view, signals/slots, QStyle/QProxyStyle, palette/tokens и reusable controls. Не эмулировать DOM/Tailwind архитектуру.

При изменении существующего перегруженного экрана не сохранять автоматически соответствие `старый control → новый control`. Если несколько controls обслуживают одну операцию, сначала выполнить Interaction Recomposition через `dense-controls-and-selection`: выделить semantic axes, derived values, rare overrides и только затем отображать результат на Qt primitives.

Каждый интерактивный control должен иметь keyboard path, focus state, disabled/pending state и понятный commit moment. Async UI не блокирует event loop.

## Design Direction Contract

Если существенный redesign прошёл через `ui-methodology-director`, реализовывать defining mechanism/invariants нативными Qt/Qwt средствами. Не подменять концепцию generic dashboard/layout без явного возврата к concept gate.

Если концепция плохо отображается на Qt/Qwt primitives, сначала предложить минимальную native adaptation, сохранив operational idea; затем, только при необходимости, пересматривать концепцию.
