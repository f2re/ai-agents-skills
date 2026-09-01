# Kafedra Planner document-workspace profile

This profile adapts the reusable AI Agents Skills design system to `f2re/kafedra-planner`. It is not a visual theme and it is not a fork of the meteorological workstation rules. It changes the **domain organizing logic** from map/time/model work to documents, plans, assignments, meetings, calendar context, provenance and evidence.

Reference snapshots used for this profile:

- `ai-agents-skills/main@5b0091bb7b40f9d3c1763821d36ddaaabff8cabf`
- `kafedra-planner/main@9b00e0d976fbd77ffd74350faa690b3574ada07d`
- tracking issue: `f2re/ai-agents-skills#8`

## Product job

A department employee should be able to answer, with little interpretation:

> What needs attention, what document or plan created it, who owns it, what is its state, and what can I do next?

The primary work object is therefore not a dashboard card. It is one of the authoritative domain objects — document, plan item, assignment, meeting, calendar entry or reportable fact — with a visible path back to source and history.

## Default surface model

Use a small set of stable surfaces:

1. **Calendar / attention surface** for time-oriented work.
2. **Operational list** for scanning documents, plans, assignments or exceptions.
3. **Inspector/detail** for the selected object's source, state, actions, links and history.
4. **Review by exception** only for unresolved ambiguity; never as a mandatory approval queue.
5. **Search/facets** that preserve context and return to the authoritative object.

Desktop usually keeps navigation + list + inspector in one spatial model. Mobile keeps the same task semantics with fixed bottom navigation, a full-detail route or sheet, and secondary metadata disclosed rather than squeezed into desktop tables.

## Core invariants

- Save immutable source before background interpretation.
- Automatically apply safe, deterministic facts; show evidence.
- Do not block a whole file, plan or import because one row is ambiguous.
- Manual correction changes the working fact without erasing machine extraction/evidence.
- A task completes with the domain action `Выполнено`; optional files do not create an approval queue.
- Calendar/search/report views are projections, not alternate sources of truth.
- Archive/restore is preferred over destructive deletion of source documents/plans.
- Repeated upload/import/materialize/save/retry operations are idempotent.
- Essential work remains usable offline and without LLM.
- Stable geometry is stronger than learned frequency. Adaptive behavior is limited to safe defaults or ranking.

## Skill routing

Start with [`kafedra-workspace-orchestrator`](../../.agents/skills/kafedra-workspace-orchestrator/SKILL.md). It combines the common Anti-Slop / Interaction Recomposition layer with Kafedra-specific skills only when the domain requires them.

Kafedra-focused skills:

- `kafedra-document-workspace`
- `kafedra-document-intake`
- `kafedra-provenance-and-inspector`
- `kafedra-action-recomposition`
- `kafedra-review-by-exception`
- `kafedra-search-and-navigation`
- `kafedra-responsive-inspector`
- `kafedra-motion-continuity`
- `kafedra-states-and-recovery`
- `kafedra-adaptive-controls`
- `kafedra-plan-calendar-continuity`
- `kafedra-template-and-structured-document-flow`
- `kafedra-ux-acceptance`

Use shared skills such as `anti-slop-ui-direction`, `dense-controls-and-selection`, `interaction-contracts-and-flow`, `information-hierarchy-and-density` and `operator-accessibility-and-safety` as support. Do not load meteorological skills for document work.

## Authority when integrated into Kafedra Planner

This library profile is reusable guidance. Inside `f2re/kafedra-planner`, repository-local instructions and skills remain authoritative, especially:

`AGENTS.md` → `docs/design.md` / `docs/UX_FLOWS.md` / `docs/ADAPTIVE_UX.md` / `docs/MOTION_DESIGN.md` → local `codex/skills/kafedra-*` → this reusable profile.

For a UI-scoped governed change, preserve the local specialist lifecycle (`kafedra-flow-intake → kafedra-design → kafedra-motion → kafedra-feature → kafedra-design-audit → kafedra-tests`) and GRACE scope/gates. This profile supplies additional interaction patterns; it does not bypass project governance.

## Read next

- [`ROUTING.md`](ROUTING.md) — task-to-skill/agent routing.
- [`REFERENCE_FLOWS.md`](REFERENCE_FLOWS.md) — canonical document, plan and assignment flows.
- [`PATTERNS_AND_ANTIPATTERNS.md`](PATTERNS_AND_ANTIPATTERNS.md) — reusable interaction patterns.
- [`ANTI_PATTERN_FLOW.md`](ANTI_PATTERN_FLOW.md) — diagnostic flow for rejecting generic/document-hostile UI designs.
