---
name: ui-skill-router
description: Route UI, UX, Qt, motion, gesture, meteorological visualization, timeline, anti-slop concept-direction, and interface-audit tasks to the smallest useful set of local skills.
---

# UI Skill Router

Do not load every UI skill by default. First classify the task by user goal, stack, surface and whether the interaction concept is already settled.

## Routing

### Substantial new surface or redesign

Use `anti-slop-ui-direction` first when the task changes a primary work surface, information architecture, navigation model or visualization architecture, or when the complaint is "generic/AI-looking/dashboard/slop".

The concept gate must produce a Design Direction Contract before implementation routing. Add `design-evidence-and-intent` only if the primary job/evidence is unclear.

Do not use this route for local visual/behavioral fixes whose concept is already known.

### Existing UI audit
Use:
- `design-evidence-and-intent`
- `interaction-contracts-and-flow`
- `information-hierarchy-and-density`
- `ui-audit-and-acceptance`

Add `motion-feedback-and-microinteractions` only if motion exists or is requested. Add domain skills only for the affected surface.

### New or redesigned Qt/C++ interface after concept direction
Use:
- `qt-cpp-design-system`
- `information-hierarchy-and-density`
- `dense-controls-and-selection`
- `interaction-contracts-and-flow`
- `states-errors-and-recovery`

Add workflow/motion/gesture/domain skills as needed. Preserve any accepted Design Direction Contract.

### Meteorological workstation
Use:
- `meteorologist-workstation-ux`
- `radar-timeline-and-playback` for radar/satellite/nowcast time browsing
- `time-data-navigation` for forecast cycles/leads/history
- `viewport-map-interactions` for maps
- `meteorological-visualization` for plots
- `operator-accessibility-and-safety`

For a new/majorly redesigned meteorological work surface, run `anti-slop-ui-direction` before this set; do not load every meteorological skill if the surface only uses a subset.

### Animation or interaction feel
Use:
- `motion-feedback-and-microinteractions`
- `gesture-and-direct-manipulation`
- `interaction-contracts-and-flow`

### Complex import/setup wizard
Use:
- `workflow-and-progressive-disclosure`
- `states-errors-and-recovery`
- `interaction-contracts-and-flow`

## Hard rules

1. Never use a decorative skill to solve an information-architecture problem.
2. Never redesign components before writing the user's primary tasks and expected results.
3. For substantial redesign, do not start implementation before a defining mechanism passes the concept gate.
4. Do not use mobile gesture patterns as primary controls in desktop Qt without pointer and keyboard alternatives.
5. If data changes asynchronously, include `states-errors-and-recovery`.
6. Finish implementation work with `ui-audit-and-acceptance`.
7. Standard platform controls do not need anti-slop novelty; apply genericity tests to organizing logic and primary work surfaces.

## Output of routing

Before substantial UI work, state internally:
- primary user task;
- affected surfaces;
- whether a concept gate is required;
- selected skills;
- constraints that make other skills unnecessary.

## Anti-patterns

- loading all UI skills because the task is "design";
- invoking anti-slop for a padding/label fix;
- treating dark mode, cards or sidebar placement as a concept;
- routing directly to Qt implementation when the user is actually rejecting the product's generic information architecture.
