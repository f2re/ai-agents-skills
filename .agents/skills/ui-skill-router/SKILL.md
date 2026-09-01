---
name: ui-skill-router
description: Canonical focused-UI router for audit, control recomposition, document workspaces, Qt, meteorology, motion, gesture, workflow and anti-slop concept tasks; selects the smallest useful local skill set.
---

# UI Skill Router

This is the canonical router for **focused UI work**. Do not load every UI skill. Classify the user goal, surface, stack, domain and scale of redesign first.

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

Add domain/state/motion skills only when those dimensions are actually present.

### Control-cluster simplification / Apple-like rethink

Use:
- `design-evidence-and-intent`
- `interaction-contracts-and-flow`
- `dense-controls-and-selection`
- `information-hierarchy-and-density`

The required step is **Interaction Recomposition**, not one-for-one widget replacement. Map the user intent and semantic axes, remove derived/redundant controls, then choose tabs/segmented/popover/slider/scrubber/toolbars only where their semantics fit.

Add:
- `gesture-and-direct-manipulation` if the selected solution uses scrub/drag/direct manipulation;
- `states-errors-and-recovery` if control changes load data asynchronously;
- domain skills when domain semantics constrain merging.

For Kafedra/document work add `kafedra-action-recomposition` rather than applying generic control reduction without domain completion/source semantics.

Run `ui-audit-and-acceptance` or the domain-specific acceptance skill after implementation.

### Kafedra Planner / document workspace

For document-centric Kafedra work, select only the affected skills:

- `kafedra-document-workspace` — list/master-detail/attention organization;
- `kafedra-document-intake` — upload/import/materialization;
- `kafedra-provenance-and-inspector` — source/evidence/history/detail;
- `kafedra-action-recomposition` — control cluster/domain-action simplification;
- `kafedra-review-by-exception` — unresolved ambiguity queues;
- `kafedra-search-and-navigation` — search/facets/linked navigation;
- `kafedra-responsive-inspector` — desktop/mobile mapping;
- `kafedra-motion-continuity` — document/list/inspector motion decision;
- `kafedra-states-and-recovery` — async/partial/offline/retry;
- `kafedra-adaptive-controls` — stable learned/default behavior;
- `kafedra-plan-calendar-continuity` — plan/source/task/calendar/plan-fact relationships;
- `kafedra-template-and-structured-document-flow` — versioned template/mapping/generation flow;
- `kafedra-ux-acceptance` — implemented-result audit.

For a multi-surface Kafedra task, route through `kafedra-workspace-orchestrator`. Inside the actual `kafedra-planner` repository, local project rules/skills remain authoritative over this reusable profile.

Do not load meteorological skills for document work.

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
- `gesture-and-direct-manipulation`
- `interaction-contracts-and-flow`

For Kafedra/document surfaces add `kafedra-motion-continuity` so motion preserves document/list/inspector semantics and reduced-motion behavior.

### Complex import/setup wizard

Use:
- `workflow-and-progressive-disclosure`
- `states-errors-and-recovery`
- `interaction-contracts-and-flow`

For Kafedra document intake, first test whether the wizard is unnecessary: `kafedra-document-intake` defaults to safe automatic materialization plus review by exception. Use a staged wizard only when the user must make genuinely independent decisions that cannot be safely derived.

Do not use the workflow skill just to hide ordinary secondary controls in a popover/inspector; hierarchy/recomposition owns that case.

## Hard rules

1. Never use a decorative skill to solve an information-architecture problem.
2. Never redesign components before stating the user's primary task and expected result.
3. Before swapping individual controls in a frequent cluster, run Interaction Recomposition when several controls implement one user intent.
4. Do not merge semantically independent axes solely to reduce widget count.
5. For substantial primary-surface redesign, do not start implementation before the concept gate passes.
6. Standard platform controls do not need anti-slop novelty.
7. Mobile-style gestures cannot be the only path for core desktop actions.
8. If data changes asynchronously, include state/recovery behavior.
9. A domain profile cannot bypass project-local authority in an established repository.
10. Finish material implementation work with generic or domain-specific acceptance.

## Routing output

Before material UI work, state internally:
- primary user task;
- affected surface;
- domain profile if any;
- scale: local control cluster vs primary-surface concept;
- whether Interaction Recomposition or anti-slop concept gate is required;
- selected skills;
- why other skills are unnecessary.

## Anti-patterns

- loading all UI skills because the task says “design”;
- invoking anti-slop for five cluttered controls whose macro-concept is already valid;
- fixing multiple dropdowns independently without examining the cluster;
- treating Apple-like as styling rather than semantic simplification;
- loading meteorological domain skills for a document workspace;
- routing directly to widget implementation when the interaction decomposition itself is the problem.
