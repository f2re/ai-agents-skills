---
name: skill-agent-orchestrator
description: Routes multi-area UI/UX, document-workstation, interaction-design and repository-integration tasks to the smallest relevant skills and specialized agents; delegates focused UI skill selection to ui-skill-router rather than duplicating its routing table.
---

# Skill and Agent Orchestrator

The job is **multi-area routing, delegation and synthesis**, not detailed UI pattern selection.

## Progressive disclosure

1. Read task intent and available skill/agent metadata.
2. Do not open every `SKILL.md`.
3. Resolve special gates first: existing-project onboarding and substantial concept direction.
4. For focused UI work, invoke `ui-skill-router` and use its smallest recommended skill set.
5. Load a specialist agent only when its bounded workstream adds value.
6. Keep requirements, cross-cutting decisions and final integration in the parent thread.

## Gate 1 — existing-project onboarding

If the task installs, migrates, reconciles or integrates this catalog into an established repository with project instructions/design docs/skills/agents/rules, route first to `existing-project-integration` / `project-integration-architect`.

Do not treat onboarding as normal UI design. Project-local authority wins over reusable defaults.

For Docomator specifically, read its project-local UI requirements, architecture, branding/tokens, current implementation stack and tests before selecting reusable skills. Do not assume the reusable catalog's Qt origins describe Docomator's implementation.

## Gate 2 — substantial UI concept direction

If a task materially changes a **primary work surface**, information architecture, navigation model or visualization architecture, or explicitly rejects a generic/AI-looking/dashboard-like product concept, activate `anti-slop-ui-direction` or delegate the bounded concept question to `ui-methodology-director`.

The gate returns a Design Direction Contract. Downstream work preserves its defining mechanism/invariants unless evidence explicitly reopens the gate.

Do not invoke the methodology director for a local cluttered control cluster when the main product concept is already valid. Route that focused problem through `ui-skill-router` → Interaction Recomposition.

## Focused UI route

For audits, control simplification, document workstations, offline web, Qt implementation, meteorology, maps, plots, motion, gestures, states and workflows, use `ui-skill-router` as the canonical detailed router.

Typical specialist choice **after** focused routing:

| Bounded workstream | Specialist |
|---|---|
| Existing-interface evidence, flow, control fragmentation and acceptance | `ui-ux-auditor` |
| Native Qt/C++ implementation | `qt-interface-designer` |
| Meteorological domain semantics / radar / time / scientific visualization | `meteo-workstation-designer` |
| Motion, scrub/drag and gesture behavior | `motion-interaction-reviewer` |
| Primary-surface concept direction | `ui-methodology-director` |
| Existing-repository onboarding | `project-integration-architect` |

Document automation does not require another permanent specialist role by default. Use the focused document skills through `ui-skill-router`, and bring in UI/UX Auditor or Motion Interaction Reviewer only for bounded audit/motion work.

## Document-workstation composition

When a task spans several Docomator/document concerns, route by workstream rather than loading all document skills:

- primary navigation/readiness → `document-workstation-ux`;
- visual template selection/binding/repeat → `document-template-canvas-and-binding`;
- release/preflight/retry/results → `document-generation-flow`;
- extraction/import/correction → `document-extraction-and-import-review`;
- concrete local browser implementation/reflow/CSP → `offline-web-interface-engineering`.

Shared support such as state/recovery, workflow, interaction recomposition, motion and acceptance is added only where needed.

A document-flow specialist may refine UI structure but must not weaken deterministic Office, space-isolation, immutable-result or explicit-import boundaries defined by the project.

## Delegation budget

- Small, sequential, single-file task: work directly.
- Focused UI task: usually direct skills or one specialist after `ui-skill-router`.
- Complex independent read-heavy concerns: 2–4 specialists, then synthesize.
- Existing-project onboarding starts sequentially with the integration architect.
- Concept direction is normally sequential before implementation specialists diverge.
- Avoid parallel write-heavy agents touching the same files.

A specialist receives a bounded question, evidence/files, expected output and non-goals.

## Parent integration contract

After delegated work:

1. deduplicate findings;
2. resolve contradictions against user intent, project authority and domain constraints;
3. preserve evidence/file references;
4. preserve repository authority during integration;
5. preserve an accepted Design Direction Contract unless explicitly reopened;
6. for document work, preserve source/template/result identity and deterministic mutation boundaries;
7. synthesize one implementation/plan rather than concatenating specialist reports;
8. run `ui-audit-and-acceptance` after material UI changes.

## Project design context

Read project design memory only for relevant UI/product work. Do not create/rewrite `DESIGN.md` as a registration mechanism. During onboarding follow `existing-project-integration`.

Store only durable product mechanisms/invariants, not rejected brainstorming or transient widget choices.

## Patterns

- Metadata-first routing.
- Project-first authority mapping during onboarding.
- Macro concept gate only for macro design changes.
- `ui-skill-router` as the single focused-UI routing authority.
- Document tasks routed by primary work object rather than by technical module.
- One primary skill plus minimal support.
- Read-heavy delegation before overlapping implementation.

## Anti-patterns

- Repeating the entire focused UI routing table here and in `ui-skill-router`.
- Loading every skill “just in case”.
- Installing every library agent before inspecting an existing project's roles.
- Using methodology director for a one-line fix or local control cleanup.
- Spawning implementation specialists before a required concept gate is settled.
- Treating Docomator as Qt because the reusable catalog also contains Qt skills.
- Loading every document skill for a single local input or spacing bug.
- Treating five separate specialist reports as the final answer.
- Letting motion/decorative concerns redefine product/domain semantics.
