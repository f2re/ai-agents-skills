---
name: skill-agent-orchestrator
description: Routes multi-area UI/UX, interaction-design, document-workspace and repository-integration tasks to the smallest relevant skills and specialized agents; delegates focused UI skill selection to ui-skill-router rather than duplicating its routing table.
---

# Skill and Agent Orchestrator

The job is **multi-area routing, delegation and synthesis**, not detailed UI pattern selection.

## Progressive disclosure

1. Read task intent and available skill/agent metadata.
2. Do not open every `SKILL.md`.
3. Resolve special gates first: existing-project onboarding and substantial concept direction.
4. Detect explicit domain profiles (for example Kafedra/document workspace) before generic implementation routing.
5. For focused UI work, invoke `ui-skill-router` and use its smallest recommended skill set.
6. Load a specialist agent only when its bounded workstream adds value.
7. Keep requirements, cross-cutting decisions and final integration in the parent thread.

## Gate 1 — existing-project onboarding

If the task installs, migrates, reconciles or integrates this catalog into an established repository with project instructions/design docs/skills/agents/rules, route first to `existing-project-integration` / `project-integration-architect`.

Do not treat onboarding as normal UI design. Project-local authority wins over reusable defaults.

## Gate 2 — substantial UI concept direction

If a task materially changes a **primary work surface**, information architecture, navigation model or visualization architecture, or explicitly rejects a generic/AI-looking/dashboard-like product concept, activate `anti-slop-ui-direction` or delegate the bounded concept question to `ui-methodology-director`.

The gate returns a Design Direction Contract. Downstream work preserves its defining mechanism/invariants unless evidence explicitly reopens the gate.

Do not invoke the methodology director for a local cluttered control cluster when the main product concept is already valid. Route that focused problem through `ui-skill-router` → Interaction Recomposition.

## Domain profile — Kafedra / document workspace

When the task is explicitly about Kafedra Planner or a document-centric department workspace with plans, assignments, calendar projections, provenance/evidence and review-by-exception, route multi-surface work through `kafedra-workspace-orchestrator`.

Inside an existing Kafedra Planner repository, project-local `kafedra-*` roles and governance remain authoritative. The library profile supplies reusable interaction patterns; it must not replace local workflow/design/motion/audit roles.

Do not load meteorological skills merely because they exist in the same library.

## Focused UI route

For audits, control simplification, Qt implementation, document workspace, meteorology, maps, plots, motion, gestures, states and workflows, use `ui-skill-router` as the canonical detailed router.

Typical specialist choice **after** focused routing:

| Bounded workstream | Specialist |
|---|---|
| Existing-interface evidence, flow, control fragmentation and acceptance | `ui-ux-auditor` |
| Kafedra/document-workspace multi-surface routing | `kafedra-workspace-orchestrator` |
| Kafedra/document list, intake, inspector and navigation design | `document-workspace-designer` |
| Native Qt/C++ implementation | `qt-interface-designer` |
| Meteorological domain semantics / radar / time / scientific visualization | `meteo-workstation-designer` |
| Motion, scrub/drag and gesture behavior | `motion-interaction-reviewer` |
| Primary-surface concept direction | `ui-methodology-director` |
| Existing-repository onboarding | `project-integration-architect` |

## Delegation budget

- Small, sequential, single-file task: work directly.
- Focused UI task: usually direct skills or one specialist after `ui-skill-router`.
- Complex independent read-heavy concerns: 2–4 specialists, then synthesize.
- Existing-project onboarding starts sequentially with the integration architect.
- Concept direction is normally sequential before implementation specialists diverge.
- Domain orchestrators are used only for their domain; do not stack them by default.
- Avoid parallel write-heavy agents touching the same files.

A specialist receives a bounded question, evidence/files, expected output and non-goals.

## Parent integration contract

After delegated work:

1. deduplicate findings;
2. resolve contradictions against user intent, project authority and domain constraints;
3. preserve evidence/file references;
4. preserve repository authority during integration;
5. preserve an accepted Design Direction Contract unless explicitly reopened;
6. synthesize one implementation/plan rather than concatenating specialist reports;
7. run `ui-audit-and-acceptance` or the domain-specific acceptance skill after material UI changes.

## Project design context

Read project design memory only for relevant UI/product work. Do not create/rewrite `DESIGN.md` as a registration mechanism. During onboarding follow `existing-project-integration`.

Store only durable product mechanisms/invariants, not rejected brainstorming or transient widget choices.

## Patterns

- Metadata-first routing.
- Project-first authority mapping during onboarding.
- Macro concept gate only for macro design changes.
- Domain profile routing only when the domain is explicit.
- `ui-skill-router` as the single focused-UI routing authority.
- One primary skill plus minimal support.
- Read-heavy delegation before overlapping implementation.

## Anti-patterns

- Repeating the entire focused UI routing table here and in `ui-skill-router`.
- Loading every skill “just in case”.
- Installing every library agent before inspecting an existing project's roles.
- Using methodology director for a one-line fix or local control cleanup.
- Loading meteorological skills for Kafedra/document work because they are available.
- Spawning implementation specialists before a required concept gate is settled.
- Treating five separate specialist reports as the final answer.
- Letting motion/decorative concerns redefine product/domain semantics.
