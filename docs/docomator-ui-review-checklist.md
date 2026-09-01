# Docomator UI review checklist

Использовать после material UI implementation и при read-only аудите Docomator-подобного документного рабочего места.

Не считать screenshot polish доказательством готовности. Проверяется interaction contract, document/data truth, recovery, reflow, accessibility и offline boundary.

## 1. Контекст и иерархия

- [ ] За 5 секунд понятно, где находится пользователь и какое пространство выбрано.
- [ ] Primary work object очевиден: документ/template canvas, generation plan, extraction result или result register.
- [ ] `Данные → Шаблон → Выпуск → Результат` читается как navigation/readiness spine, а не как декоративный progress bar.
- [ ] Пользователь видит одно доминирующее next action.
- [ ] Secondary/rare controls не конкурируют с primary action.
- [ ] Diagnostics/UUID/SHA/OOXML coordinates не занимают primary hierarchy.
- [ ] Нет marketing hero, KPI-card dashboard, decorative gradients/glass/AI sparkles.
- [ ] Пространство не превращено в повторяемый wizard step.

## 2. Быстрый доступ и control recomposition

- [ ] Для каждого frequent cluster из 3+ controls записан user intent.
- [ ] Derived values не предлагаются как независимые editable selectors.
- [ ] Large named sets используют searchable human labels.
- [ ] Frequent action не спрятан в overflow ради визуальной чистоты.
- [ ] Entry from template/group/result переносит уже известный context.
- [ ] Нет лишней последовательности `open dropdown → select → close` для одного intent.
- [ ] `Apply/Refresh` существует только при реальной semantic необходимости.
- [ ] Recomposition уменьшает ненужные decisions, не сливая независимые axes.

## 3. Visual Template Studio

- [ ] Document/template canvas доминирует над chrome.
- [ ] Inspector contextual/selection-driven и не съедает большую часть canvas без необходимости.
- [ ] Выбор text/cell/row/range/block имеет понятный visible highlight не только цветом.
- [ ] Field chooser показывает human labels first, machine keys скрыты.
- [ ] Текущий binding виден рядом с выбранным document region.
- [ ] Persisted binding использует server-validated Document IR coordinate, не DOM selector/pixel rectangle.
- [ ] Browser HTML/CSS не сериализуется обратно в Office как source of truth.
- [ ] Formatting/headers/footers/tables/images показываются только в заявленной степени fidelity.
- [ ] Unsupported/uncertain construction получает limitation, а не ложную точность.
- [ ] Server error сохраняет selection и pending choice.
- [ ] Stale visual-layout/trial response не может переписать новый selection/revision.

## 4. Repeat rows / collections

- [ ] Пользователь может выбрать row/block и получить действие уровня задачи: `Повторять эту строку по списку`.
- [ ] Collection выбирается по human name.
- [ ] Cells/places сопоставляются с fields без machine keys.
- [ ] Auto row number представлен как derived option, не редактируемое DB field.
- [ ] Empty behavior явно определён.
- [ ] Trial показывает N rows и проходит reverse-read/structural validation по product contract.
- [ ] Unsupported nested repeat не имитируется в UI.
- [ ] Data editor поддерживает keyboard path для add/edit/reorder/delete; drag не единственный способ reorder.

## 5. Создание документов

- [ ] Template/audience/output mode показаны компактно и однозначно.
- [ ] До launch виден exact expected result count.
- [ ] Human summary вроде `27 сотрудников → 27 документов` не требует знания backend enum.
- [ ] Preflight привязан к input revision/fingerprint.
- [ ] Изменение template/audience/mode/relevant data немедленно инвалидирует stale preflight.
- [ ] Blocking problem ведёт прямо к affected entity/row/field.
- [ ] Correction не сбрасывает template/audience/mode.
- [ ] Server correction error сохраняет введённые значения.
- [ ] Double submit/idempotency не создаёт duplicate launch.
- [ ] Running persisted job позволяет уйти со страницы и найти тот же job позже.
- [ ] Progress использует реальные stage/status, не fake percentage.
- [ ] Partial success сохраняет successful results.
- [ ] Failed-only retry используется, если domain contract его поддерживает.
- [ ] Completed result имеет очевидный open/download/ZIP path и остаётся в history.

## 6. Extraction/import

- [ ] Есть visible file picker и drag&drop.
- [ ] После анализа сначала показан automatic proposal, а не пустой обязательный mapping wizard.
- [ ] `Готово / Нужно проверить / Не определено` или эквивалентные states ведут к разным действиям.
- [ ] Automatic result immutable; user corrections сохраняются отдельно.
- [ ] Source field/row/cell можно связать с extracted result через validated source context.
- [ ] Structured error имеет `code`, scope/blocking effect, physical row, column/cell/property, raw value, severity, action/repair params по применимому contract.
- [ ] UI не восстанавливает row/field semantics regexp-ом из русского message.
- [ ] Problem row/cell/value визуально выделен и имеет concrete repair action.
- [ ] Mapping/corrections/file state сохраняются после error.
- [ ] Simple repair выполняется в preview без re-upload.
- [ ] Blank imported value не очищает confirmed stored value без explicit clear.
- [ ] Preview/read не создаёт property/entity ownership.
- [ ] New property создаётся только explicit guided mutation.
- [ ] Current-space matching не использует fields другого space с тем же name/key.
- [ ] Explicit `Импортировать/Применить` отделяет analysis/preview от mutation.
- [ ] Batch 1/10/100 documents показывает status каждого без card sprawl.

## 7. State/recovery

Для каждой длительной/local async operation проверены применимые states:

- [ ] initial/idle;
- [ ] pending/loading;
- [ ] loaded/current;
- [ ] refreshing;
- [ ] stale/previous but usable;
- [ ] partial;
- [ ] empty-valid;
- [ ] warning/degraded;
- [ ] error;
- [ ] cancelled;
- [ ] retry scheduled;
- [ ] disabled with reason.

Для error copy:

- [ ] что произошло;
- [ ] что сохранено/доступно;
- [ ] что делать дальше;
- [ ] diagnostics/correlation доступны вторично, если нужны.

## 8. Motion

- [ ] Keyboard navigation/selection instant.
- [ ] Document/row/cell highlight instant.
- [ ] Routine transition использует project motion tokens.
- [ ] Inspector/popover motion короткий, origin-consistent и interruptible, если вообще нужен.
- [ ] Result появляется сразу после готовности, без animation gate.
- [ ] Нет button scale/bounce, staged page entrance, page flip, paper flying, pulsing logo/document, decorative shimmer.
- [ ] Нет global `transition: all`.
- [ ] Быстрые повторные действия сходятся к latest state без queued animations.
- [ ] `prefers-reduced-motion` удаляет необязательное spatial motion.

## 9. Responsive/reflow/accessibility

Проверить отдельно:

- [ ] 320 px;
- [ ] 768 px;
- [ ] 1440 px;
- [ ] 200% text zoom;
- [ ] long Russian labels/values;
- [ ] light theme;
- [ ] dark theme;
- [ ] reduced motion;
- [ ] keyboard only.

Дополнительно:

- [ ] page-level horizontal overflow отсутствует;
- [ ] bounded horizontal scroll есть только внутри genuine table/document two-dimensional surface;
- [ ] action groups wrap/recompose;
- [ ] `min-width:0`/shrink rules не блокируют reflow;
- [ ] global `nowrap`/`flex-shrink:0` не ломают narrow/zoom layout;
- [ ] visible focus не удалён;
- [ ] dialog/popover focus возвращается trigger;
- [ ] custom searchable/list/table/canvas controls имеют documented keyboard path;
- [ ] state не передаётся только цветом;
- [ ] targets соответствуют project 44×44 contract;
- [ ] fixed bottom navigation учтена content padding.

## 10. Offline/security boundary

- [ ] Runtime UI не делает запросов к CDN/remote fonts/analytics/external assets.
- [ ] Project token source остаётся единственным canonical visual token set.
- [ ] Document-derived text рендерится как untrusted data, не trusted HTML.
- [ ] Нет eval/Function/model-generated executable code/path/SQL/OOXML.
- [ ] Browser state не заменяет persisted backend truth для long-running jobs.
- [ ] Space context передаётся explicit там, где он определяет data boundary.
- [ ] Read/preview не делает implicit ownership mutation.
- [ ] Visual simplification не ослабляет backend cross-space checks.

## 11. Regression tests

Material UI change должно иметь автоматизированную проверку первопричины или наиболее устойчивого observable contract.

Минимально по применимости:

- [ ] static JS/CSS/CSP/canonical UI checks;
- [ ] user-facing language check;
- [ ] browser flow на 320/768/1440;
- [ ] 200% reflow regression;
- [ ] keyboard/focus regression;
- [ ] reduced-motion behavior;
- [ ] slow/error API with preserved form/context;
- [ ] stale-response race;
- [ ] real-stack document flow for binding/generation/import when changed;
- [ ] negative two-space test when data/template/import boundary is touched;
- [ ] deterministic Office fixture/reverse-read when renderer/binding behavior changes.

## 12. Approval

Approve only when:

- primary work object and next action are obvious;
- defining document-workbench mechanism remains visible;
- document/data truth is not weakened for visual minimalism;
- correction/retry preserves user context;
- motion is purposeful and cheap;
- narrow/reflow/keyboard/offline contracts pass;
- unverified parts are explicitly listed rather than assumed.
