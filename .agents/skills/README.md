# AI Agents Skills catalog

Focused skills are discovered progressively instead of loading one monolithic design prompt.

## Orchestration, integration and concept direction

- [`skill-agent-orchestrator`](skill-agent-orchestrator/SKILL.md) — multi-area routing/delegation/synthesis; delegates focused UI routing to `ui-skill-router`.
- [`existing-project-integration`](existing-project-integration/SKILL.md) — project-first onboarding, authority mapping and collision-safe integration.
- [`ui-skill-router`](ui-skill-router/SKILL.md) — canonical detailed router for focused UI work.
- [`anti-slop-ui-direction`](anti-slop-ui-direction/SKILL.md) — macro concept gate for substantial primary-surface/IA redesigns.
- [`design-evidence-and-intent`](design-evidence-and-intent/SKILL.md) — evidence, user intent and product constraints before redesign.
- [`ui-audit-and-acceptance`](ui-audit-and-acceptance/SKILL.md) — final behavior, control-fragmentation, domain and concept-regression audit.
- [`kafedra-workspace-orchestrator`](kafedra-workspace-orchestrator/SKILL.md) — Kafedra/document-workspace routing and synthesis while preserving project-local authority.

## Base interface engineering

- [`qt-cpp-design-system`](qt-cpp-design-system/SKILL.md) — native Qt/C++ design-system rules.
- [`information-hierarchy-and-density`](information-hierarchy-and-density/SKILL.md) — hierarchy, grouping, spacing and professional density.
- [`dense-controls-and-selection`](dense-controls-and-selection/SKILL.md) — Interaction Recomposition plus tabs/segmented/search/popover/slider/scrubber/toolbars and selection patterns.
- [`interaction-contracts-and-flow`](interaction-contracts-and-flow/SKILL.md) — `intent → trigger → feedback → pending → result → recovery`.
- [`workflow-and-progressive-disclosure`](workflow-and-progressive-disclosure/SKILL.md) — staged wizards/import/review flows; not ordinary control-panel cleanup.
- [`states-errors-and-recovery`](states-errors-and-recovery/SKILL.md) — loading/empty/stale/partial/error/retry/cancel.
- [`operator-accessibility-and-safety`](operator-accessibility-and-safety/SKILL.md) — keyboard/focus, non-color cues and operator safety.

## Kafedra Planner / document workspace

- [`kafedra-document-workspace`](kafedra-document-workspace/SKILL.md) — work-object-first master/detail document, plan and task surfaces.
- [`kafedra-document-intake`](kafedra-document-intake/SKILL.md) — immutable source-first upload/import, automatic safe materialization and per-file partial success.
- [`kafedra-provenance-and-inspector`](kafedra-provenance-and-inspector/SKILL.md) — inspector/source/evidence/version/history navigation and editable interpretation.
- [`kafedra-action-recomposition`](kafedra-action-recomposition/SKILL.md) — domain-action recomposition, confirmation-tax removal and contextual rare overrides.
- [`kafedra-review-by-exception`](kafedra-review-by-exception/SKILL.md) — ambiguity-only review queues rather than approval pipelines.
- [`kafedra-search-and-navigation`](kafedra-search-and-navigation/SKILL.md) — source-connected search/facets and context-preserving navigation.
- [`kafedra-responsive-inspector`](kafedra-responsive-inspector/SKILL.md) — desktop/mobile master-detail parity and table-to-detail transformation.
- [`kafedra-motion-continuity`](kafedra-motion-continuity/SKILL.md) — restrained list/inspector/processing/direct-manipulation motion and reduced-motion behavior.
- [`kafedra-states-and-recovery`](kafedra-states-and-recovery/SKILL.md) — persisted state truth, local async failures, targeted retry and capability degradation.
- [`kafedra-adaptive-controls`](kafedra-adaptive-controls/SKILL.md) — stable safe-default/rank-only/domain-derived/never-learn adaptive UX.
- [`kafedra-plan-calendar-continuity`](kafedra-plan-calendar-continuity/SKILL.md) — source row → plan item → assignment → calendar/plan-fact continuity.
- [`kafedra-template-and-structured-document-flow`](kafedra-template-and-structured-document-flow/SKILL.md) — versioned structured templates, mapping, preview/test and generation flows.
- [`kafedra-ux-acceptance`](kafedra-ux-acceptance/SKILL.md) — Kafedra-specific source-of-truth, partial, responsive, motion and idempotency audit.

Profile docs: [`profiles/kafedra-planner/README.md`](../../profiles/kafedra-planner/README.md).

## Meteorology

- [`meteorologist-workstation-ux`](meteorologist-workstation-ux/SKILL.md) — professional workstation structure.
- [`radar-timeline-and-playback`](radar-timeline-and-playback/SKILL.md) — radar/satellite/nowcast timeline semantics.
- [`time-data-navigation`](time-data-navigation/SKILL.md) — valid time, forecast cycles and adaptive time stepping.
- [`viewport-map-interactions`](viewport-map-interactions/SKILL.md) — map zoom/pan, semantic LOD and data requests.
- [`meteorological-visualization`](meteorological-visualization/SKILL.md) — scientific plots, crosshair, ensembles, aerology and uncertainty.

## Motion and direct manipulation

- [`motion-feedback-and-microinteractions`](motion-feedback-and-microinteractions/SKILL.md) — purposeful motion and interruptibility.
- [`gesture-and-direct-manipulation`](gesture-and-direct-manipulation/SKILL.md) — mouse/trackpad/wheel/drag/scrub/snap semantics.

## Routing rule

- established-repository onboarding → `existing-project-integration` / Project Integration Architect;
- complex multi-area task → `skill-agent-orchestrator`;
- Kafedra/document-workspace multi-surface task → `kafedra-workspace-orchestrator` after project-authority inventory;
- focused UI task → `ui-skill-router`;
- substantial primary-surface/IA concept change → `anti-slop-ui-direction` before implementation;
- multiple controls/click tax/Apple-like simplification with valid macro concept → `dense-controls-and-selection` Interaction Recomposition, plus `kafedra-action-recomposition` for Kafedra domain work;
- local fix with settled interaction concept → skip unnecessary orchestration.
