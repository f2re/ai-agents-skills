# AI Agents Skills catalog

The catalog is intentionally split into focused skills so Codex, Claude Code and Antigravity can use progressive disclosure instead of loading one monolithic design prompt.

## Orchestration, integration and concept direction

- [`skill-agent-orchestrator`](skill-agent-orchestrator/SKILL.md) — top-level routing for complex multi-area tasks; chooses skills and optional specialist agents.
- [`existing-project-integration`](existing-project-integration/SKILL.md) — project-first onboarding into an established repository; preserves existing instructions, design docs, local skills/agents/rules and maps reusable capabilities into the existing architecture.
- [`ui-skill-router`](ui-skill-router/SKILL.md) — lightweight routing for focused UI tasks.
- [`anti-slop-ui-direction`](anti-slop-ui-direction/SKILL.md) — concept gate for substantial new/redesigned work surfaces; derives a domain-specific defining mechanism, rejects generic/template defaults and hands implementation a Design Direction Contract.
- [`design-evidence-and-intent`](design-evidence-and-intent/SKILL.md) — establishes evidence, user intent and interaction contract before redesign.
- [`ui-audit-and-acceptance`](ui-audit-and-acceptance/SKILL.md) — final behavior/design audit, anti-slop regression check and acceptance criteria.

## Base interface engineering

- [`qt-cpp-design-system`](qt-cpp-design-system/SKILL.md) — native Qt/C++ design-system rules.
- [`information-hierarchy-and-density`](information-hierarchy-and-density/SKILL.md) — hierarchy, grouping, spacing and professional density.
- [`dense-controls-and-selection`](dense-controls-and-selection/SKILL.md) — combo/search/multi-select/segmented controls and compact toolbars.
- [`interaction-contracts-and-flow`](interaction-contracts-and-flow/SKILL.md) — `intent → trigger → feedback → pending → result → recovery` for user actions.
- [`workflow-and-progressive-disclosure`](workflow-and-progressive-disclosure/SKILL.md) — wizards, imports, complex flows and staged disclosure.
- [`states-errors-and-recovery`](states-errors-and-recovery/SKILL.md) — loading/empty/stale/partial/error/retry/cancel.
- [`operator-accessibility-and-safety`](operator-accessibility-and-safety/SKILL.md) — keyboard/focus, non-color cues and operator safety.

## Meteorology

- [`meteorologist-workstation-ux`](meteorologist-workstation-ux/SKILL.md) — professional meteorological workstation structure.
- [`radar-timeline-and-playback`](radar-timeline-and-playback/SKILL.md) — compact radar/satellite/nowcast timeline, exact times, frame states and playback.
- [`time-data-navigation`](time-data-navigation/SKILL.md) — valid time, forecast cycles and adaptive time stepping.
- [`viewport-map-interactions`](viewport-map-interactions/SKILL.md) — map zoom/pan, semantic LOD and data request behavior.
- [`meteorological-visualization`](meteorological-visualization/SKILL.md) — scientific plots, crosshair, ensembles, aerology and uncertainty.

## Motion and direct manipulation

- [`motion-feedback-and-microinteractions`](motion-feedback-and-microinteractions/SKILL.md) — purposeful motion, duration/easing, feedback and interruptibility.
- [`gesture-and-direct-manipulation`](gesture-and-direct-manipulation/SKILL.md) — mouse/trackpad/wheel/drag/swipe semantics, snap and bounds.

## Routing rule

Do not load this catalog wholesale. Start from task intent and descriptions.

- onboarding/reconciling with an established repository → `existing-project-integration` / Project Integration Architect;
- complex multi-area work → `skill-agent-orchestrator`;
- focused UI task → `ui-skill-router`;
- substantial new/redesigned primary surface → `anti-slop-ui-direction` before downstream implementation;
- local fix with settled interaction concept → skip unnecessary orchestration.
