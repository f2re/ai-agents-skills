---
name: ui-skill-router
description: Route UI, UX, Qt, motion, gesture, meteorological visualization, timeline, and interface-audit tasks to the smallest useful set of local skills.
---

# UI Skill Router

Do not load every UI skill by default. First classify the task by user goal, stack and surface.

## Routing

### Existing UI audit
Use:
- `design-evidence-and-intent`
- `interaction-contracts-and-flow`
- `information-hierarchy-and-density`
- `ui-audit-and-acceptance`

Add `motion-feedback-and-microinteractions` only if motion exists or is requested. Add domain skills only for the affected surface.

### New or redesigned Qt/C++ interface
Use:
- `qt-cpp-design-system`
- `information-hierarchy-and-density`
- `dense-controls-and-selection`
- `interaction-contracts-and-flow`
- `states-errors-and-recovery`

Add workflow/motion/gesture/domain skills as needed.

### Meteorological workstation
Use:
- `meteorologist-workstation-ux`
- `radar-timeline-and-playback` for radar/satellite/nowcast time browsing
- `time-data-navigation` for forecast cycles/leads/history
- `viewport-map-interactions` for maps
- `meteorological-visualization` for plots
- `operator-accessibility-and-safety`

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
3. Do not use mobile gesture patterns as primary controls in desktop Qt without pointer and keyboard alternatives.
4. If data changes asynchronously, include `states-errors-and-recovery`.
5. Finish implementation work with `ui-audit-and-acceptance`.

## Output of routing

Before substantial UI work, state internally:
- primary user task;
- affected surfaces;
- selected skills;
- constraints that make other skills unnecessary.
