# AI Agents Skills catalog

Focused skills are discovered progressively instead of loading one monolithic design prompt. Project-local instructions and actual implementation stack always win over reusable defaults.

## Orchestration, integration and concept direction

- [`skill-agent-orchestrator`](skill-agent-orchestrator/SKILL.md) — multi-area routing/delegation/synthesis; delegates focused UI routing to `ui-skill-router`.
- [`existing-project-integration`](existing-project-integration/SKILL.md) — project-first onboarding, authority mapping and collision-safe integration.
- [`ui-skill-router`](ui-skill-router/SKILL.md) — canonical detailed router for focused UI work, including document automation.
- [`anti-slop-ui-direction`](anti-slop-ui-direction/SKILL.md) — macro concept gate for substantial primary-surface/IA redesigns.
- [`design-evidence-and-intent`](design-evidence-and-intent/SKILL.md) — evidence, user intent and product constraints before redesign.
- [`ui-audit-and-acceptance`](ui-audit-and-acceptance/SKILL.md) — final behavior, control-fragmentation, domain and concept-regression audit.

## Document automation / Docomator

- [`document-workstation-ux`](document-workstation-ux/SKILL.md) — document-centric navigation, hierarchy, provenance, fast access, generation/readiness truth and restrained motion.
- [`document-template-canvas-and-binding`](document-template-canvas-and-binding/SKILL.md) — visual DOCX/XLSX canvas, validated selection/binding, contextual inspector, repeats and trial/activation flow.
- [`document-generation-flow`](document-generation-flow/SKILL.md) — template/audience/mode → preflight/correction → launch/progress → partial retry/results.
- [`document-extraction-and-import-review`](document-extraction-and-import-review/SKILL.md) — automatic-first extraction/import review, structured errors, in-preview repair and explicit commit.
- [`offline-web-interface-engineering`](offline-web-interface-engineering/SKILL.md) — local offline HTML/CSS/JavaScript implementation, CSP, shared tokens, reflow/accessibility and purpose-driven motion.

For current Docomator work, these skills adapt the generic interaction principles to the actual local web stack. Do not route Docomator implementation to Qt merely because Qt skills also exist in this library.

## Base interface engineering

- [`qt-cpp-design-system`](qt-cpp-design-system/SKILL.md) — native Qt/C++ design-system rules when the actual target is Qt.
- [`information-hierarchy-and-density`](information-hierarchy-and-density/SKILL.md) — hierarchy, grouping, spacing and professional density.
- [`dense-controls-and-selection`](dense-controls-and-selection/SKILL.md) — Interaction Recomposition plus tabs/segmented/search/popover/slider/scrubber/toolbars and selection patterns.
- [`interaction-contracts-and-flow`](interaction-contracts-and-flow/SKILL.md) — `intent → trigger → feedback → pending → result → recovery`.
- [`workflow-and-progressive-disclosure`](workflow-and-progressive-disclosure/SKILL.md) — staged wizards/import/review flows; not ordinary control-panel cleanup.
- [`states-errors-and-recovery`](states-errors-and-recovery/SKILL.md) — loading/empty/stale/partial/error/retry/cancel.
- [`operator-accessibility-and-safety`](operator-accessibility-and-safety/SKILL.md) — keyboard/focus, non-color cues and operator safety.

## Meteorology

- [`meteorologist-workstation-ux`](meteorologist-workstation-ux/SKILL.md) — professional workstation structure.
- [`radar-timeline-and-playback`](radar-timeline-and-playback/SKILL.md) — radar/satellite/nowcast timeline semantics.
- [`time-data-navigation`](time-data-navigation/SKILL.md) — valid time, forecast cycles and adaptive time stepping.
- [`viewport-map-interactions`](viewport-map-interactions/SKILL.md) — map zoom/pan, semantic LOD and data requests.
- [`meteorological-visualization`](meteorological-visualization/SKILL.md) — scientific plots, crosshair, ensembles, aerology and uncertainty.

## Motion and direct manipulation

- [`motion-feedback-and-microinteractions`](motion-feedback-and-microinteractions/SKILL.md) — purposeful, frequency-aware and interruptible motion for document, Qt and other professional UI.
- [`gesture-and-direct-manipulation`](gesture-and-direct-manipulation/SKILL.md) — mouse/trackpad/wheel/drag/scrub/snap semantics and accessible alternatives.

## Routing rule

- established-repository onboarding → `existing-project-integration` / Project Integration Architect;
- complex multi-area task → `skill-agent-orchestrator`;
- focused UI task → `ui-skill-router`;
- substantial primary-surface/IA concept change → `anti-slop-ui-direction` before implementation;
- Docomator document workbench → `document-workstation-ux` + only the specific template/generation/extraction/offline-web skill needed;
- multiple controls/click tax/Apple-like simplification with valid macro concept → `dense-controls-and-selection` Interaction Recomposition, usually with UI audit;
- local fix with settled interaction concept → skip unnecessary orchestration.

## Docomator profile references

- [`docs/docomator-ui-profile.md`](../../docs/docomator-ui-profile.md) — mapping from the original Qt/meteo interaction patterns to document automation.
- [`docs/docomator-ui-review-checklist.md`](../../docs/docomator-ui-review-checklist.md) — acceptance checklist for document creation, template binding, extraction/import, reflow, offline and motion.
