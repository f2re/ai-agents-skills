---
name: ui-skill-router
description: Canonical focused-UI router for audits, interaction recomposition, document workstations, offline web, Qt, meteorology, motion, gesture, workflow and anti-slop concept tasks; selects the smallest useful local skill set.
---

# UI Skill Router

This is the canonical router for **focused UI work**. Do not load every UI skill. Classify the user goal, primary work object, target stack and scale of redesign first.

`skill-agent-orchestrator` handles multi-area delegation and synthesis; it should defer focused UI skill selection here instead of duplicating this routing table.

## Routing

### Substantial primary-surface concept change

Use `anti-slop-ui-direction` first when the task changes a primary work surface, information architecture, navigation model or visualization architecture, or the user rejects the product as generic/AI-looking/dashboard/slop.

The concept gate returns a Design Direction Contract before implementation routing. Add `design-evidence-and-intent` only if the primary job/evidence is unclear.

Do **not** use the heavy concept ritual merely because a toolbar or small control cluster is cluttered.

### Existing UI audit

Use:
- `design-evidence-and-intent`
- `interaction-contracts-and-flow`
- `information-hierarchy-and-density`
- `ui-audit-and-acceptance`

Add `dense-controls-and-selection` when the evidence includes multiple dropdowns/toggles/buttons, sequential selectors, control clutter, click tax, “simplify”, “collapse”, “Apple-like” or a request to rethink user interaction.

Add the relevant document/meteorology/platform/state/motion skill only when that dimension is actually present.

### Control-cluster simplification / Apple-like rethink

Use:
- `design-evidence-and-intent`
- `interaction-contracts-and-flow`
- `dense-controls-and-selection`
- `information-hierarchy-and-density`

The required step is **Interaction Recomposition**, not one-for-one widget replacement. Map the user intent and semantic axes, remove derived/redundant controls, then choose tabs/segmented/popover/search/direct manipulation only where their semantics fit.

Add:
- `gesture-and-direct-manipulation` if the selected solution uses drag/direct manipulation;
- `states-errors-and-recovery` if control changes load or validate data asynchronously;
- a domain skill when domain semantics constrain merging.

Run `ui-audit-and-acceptance` after implementation.

## Document automation / Docomator routes

### Document-workstation primary surface

Use:
- `document-workstation-ux`
- `information-hierarchy-and-density`
- `interaction-contracts-and-flow`
- `states-errors-and-recovery`

Add `anti-slop-ui-direction` first if the main document route, navigation model or primary work surface itself is being redesigned.

For Docomator, preserve the domain route `Данные → Шаблон → Выпуск → Результат` as a readiness/navigation spine rather than a rigid wizard. Keep current space as persistent context, not a repeated step.

### Visual DOCX/XLSX template editor

Use:
- `document-template-canvas-and-binding`
- `document-workstation-ux`
- `dense-controls-and-selection`
- `gesture-and-direct-manipulation`
- `states-errors-and-recovery`

Add `offline-web-interface-engineering` for Docomator implementation work.

The document/template canvas is the primary work object. The inspector is contextual. Persist validated Document IR coordinates/bindings — never DOM selectors or pixel geometry as Office truth.

### Create documents / release flow

Use:
- `document-generation-flow`
- `document-workstation-ux`
- `workflow-and-progressive-disclosure`
- `states-errors-and-recovery`

Add `dense-controls-and-selection` when template/audience/mode/check/action form an overloaded selector chain. Add `offline-web-interface-engineering` for Docomator implementation.

Preserve prepared context across correction/retry. Invalidate stale preflight when any dependent input changes. Show exact expected output count before launch.

### Extraction / CSV-XLSX import review

Use:
- `document-extraction-and-import-review`
- `workflow-and-progressive-disclosure`
- `states-errors-and-recovery`
- `interaction-contracts-and-flow`

Add `document-template-canvas-and-binding` only when the flow visually links extracted results to DOCX/XLSX source regions. Add `offline-web-interface-engineering` for Docomator UI implementation.

Prefer automatic-first interpretation, focused correction, structured row/cell errors and explicit import commit. Do not rebuild error semantics from localized message text.

### Docomator/local offline web implementation

Use:
- `offline-web-interface-engineering`
- the smallest relevant document/workflow/state skill
- `ui-audit-and-acceptance` after material implementation

Do **not** route Docomator to `qt-cpp-design-system` merely because the source skill library originated around Qt. Docomator's current UI substrate is local offline HTML/CSS/JavaScript. Translate interaction principles, not platform primitives.

## Other platform/domain routes

### New or redesigned Qt/C++ interface with settled concept

Use:
- `qt-cpp-design-system`
- `information-hierarchy-and-density`
- `dense-controls-and-selection`
- `interaction-contracts-and-flow`
- `states-errors-and-recovery` when async behavior exists

Add workflow/motion/gesture/domain skills as needed. Preserve any accepted Design Direction Contract.

### Meteorological workstation

Select only the affected domain skills:
- `meteorologist-workstation-ux` for workstation semantics;
- `radar-timeline-and-playback` for radar/satellite/nowcast time browsing;
- `time-data-navigation` for forecast cycles/leads/history;
- `viewport-map-interactions` for maps;
- `meteorological-visualization` for plots;
- `operator-accessibility-and-safety` for operator-critical surfaces.

For a new/majorly redesigned primary surface, run anti-slop first. For a cluttered existing meteo toolbar/control panel, prefer the lighter Interaction Recomposition route plus only the affected domain skill.

### Animation or interaction feel

Use:
- `motion-feedback-and-microinteractions`
- `gesture-and-direct-manipulation` when direct manipulation exists
- `interaction-contracts-and-flow`

For document workstations, add the relevant document skill so motion cannot redefine binding, generation or import semantics.

### Complex import/setup wizard

Use:
- `workflow-and-progressive-disclosure`
- `states-errors-and-recovery`
- `interaction-contracts-and-flow`

Do not use the workflow skill just to hide ordinary secondary controls in a popover/inspector; hierarchy/recomposition owns that case.

For document extraction/import prefer the more specific `document-extraction-and-import-review` route above.

## Hard rules

1. Never use a decorative skill to solve an information-architecture problem.
2. Never redesign components before stating the user's primary task and expected result.
3. Before swapping individual controls in a frequent cluster, run Interaction Recomposition when several controls implement one user intent.
4. Do not merge semantically independent axes solely to reduce widget count.
5. For substantial primary-surface redesign, do not start implementation before the concept gate passes.
6. Standard platform controls do not need anti-slop novelty.
7. Mobile-style gestures cannot be the only path for core desktop actions.
8. If data changes asynchronously, include state/recovery behavior.
9. In document automation, visual browser representation never silently becomes Office/storage truth.
10. A preflight/preview result is invalid when the inputs it was computed from have changed.
11. Preserve user-entered corrections and prepared release context after recoverable errors.
12. Finish material implementation work with `ui-audit-and-acceptance`.

## Routing output

Before material UI work, state internally:
- primary user task;
- primary work object;
- affected surface;
- target stack;
- scale: local control cluster vs primary-surface concept;
- whether Interaction Recomposition or anti-slop concept gate is required;
- selected skills;
- why other skills are unnecessary.

## Patterns

- Docomator template editor → document canvas/binding + offline web, not Qt.
- Docomator generation flow → generation + workflow + state/recovery, with preflight revision truth.
- Docomator extraction → automatic-first extraction/import review + structured repair.
- Qt meteorology → Qt/domain routes only when the actual target is Qt/meteorological.
- Local control cleanup → Interaction Recomposition without invoking a macro concept ceremony.

## Anti-patterns

- loading all UI skills because the task says “design”;
- invoking anti-slop for five cluttered controls whose macro-concept is already valid;
- fixing multiple dropdowns independently without examining the cluster;
- treating Apple-like as styling rather than semantic simplification;
- routing Docomator directly to Qt widgets because the library contains Qt skills;
- carrying meteorological time/map metaphors into document UI when the document route is the real organizing model;
- treating a browser preview as an editable Office document model;
- using a generic wizard when document-specific generation or extraction contracts already exist.
