---
name: skill-agent-orchestrator
description: Routes multi-area UI/UX, interaction-design and repository-integration tasks to the smallest relevant set of skills and specialized agents. Use when a task spans several concerns or benefits from independent audit/design/integration workstreams; do not use for a single obvious skill or trivial edit.
---

# Skill and agent orchestrator

The job is routing, not doing every specialist's work in the parent context.

## Progressive disclosure

1. Read task intent and the installed skill names/descriptions.
2. Do not open every `SKILL.md`.
3. Choose one primary skill and only the supporting skills needed to resolve actual task dimensions.
4. Load a specialist agent only when its workstream is independent enough to return a useful bounded result.
5. Keep requirements, cross-cutting decisions and final integration in the parent thread.

## Existing-project onboarding gate

If the task is to install, migrate, reconcile or integrate this catalog into an **existing repository that already has project instructions, design docs, skills, agents, rules or orchestration**, route first to `existing-project-integration` / `project-integration-architect`.

Do not treat onboarding as a normal UI redesign. The integration architect establishes the repository authority map before generic package roles or rules are added. Project-local artifacts win over reusable defaults.

## Concept gate for substantial UI work

Before routing implementation for a task that materially changes a primary work surface, information architecture, navigation model or visualization architecture, activate `anti-slop-ui-direction` or delegate the bounded concept question to `ui-methodology-director`.

Also use this route when the user explicitly complains that an interface is generic, dashboard-like, AI-looking or "slop". Do not try to solve a conceptual complaint by changing only colors, radii, shadows or spacing.

Skip the concept gate for local fixes whose interaction concept is already settled.

The concept gate returns a **Design Direction Contract**. Downstream specialists receive its defining mechanism, invariants and non-goals and must not silently replace them.

## Route by task shape

| Task signal | Primary route | Common support |
|---|---|---|
| Integrate skills/agents into an established repository | `project-integration-architect` | `existing-project-integration`; inspect current roles/rules before any semantic merge |
| New main screen / large redesign / generic-AI complaint | `ui-methodology-director` or `anti-slop-ui-direction` | `design-evidence-and-intent`, then only selected downstream skills |
| Existing UI audit, complaints, screenshots | `ui-ux-auditor` | `design-evidence-and-intent`, `interaction-contracts-and-flow`, `ui-audit-and-acceptance` |
| Qt/C++ interface design or implementation with settled concept | `qt-interface-designer` | `qt-cpp-design-system`, `information-hierarchy-and-density`, `dense-controls-and-selection` |
| Radar/satellite/forecast workstation | `meteo-workstation-designer` | `radar-timeline-and-playback`, `time-data-navigation`, `viewport-map-interactions`, `meteorological-visualization` |
| Animation, gestures, sliders, direct manipulation | `motion-interaction-reviewer` | `motion-feedback-and-microinteractions`, `gesture-and-direct-manipulation` |
| Loading, stale, partial, recovery | direct skill | `states-errors-and-recovery` |
| Wizard/import/complex staged flow | direct skill | `workflow-and-progressive-disclosure` |
| Selection/filter/combo overload | direct skill | `dense-controls-and-selection` |

## Delegation budget

- Small, sequential, single-file task: work directly; no subagent.
- Medium task with one specialist concern: use one specialist or a small skill set.
- Complex task with independent read-heavy concerns: use 2–4 specialists in parallel, then merge findings.
- Existing-project onboarding normally starts sequentially with the Project Integration Architect; do not spawn duplicate designer/reviewer/orchestrator roles until the authority map is known.
- Avoid parallel write-heavy agents touching the same files.
- A specialist must receive a bounded question, relevant files/evidence, expected output and non-goals.
- The methodology director is normally sequential: concept direction should be settled before implementation specialists diverge.

## Parent integration contract

After delegated work returns:

1. Deduplicate findings.
2. Resolve contradictions against user intent and repository constraints.
3. Preserve evidence and file references.
4. For repository integration, preserve the existing authority map and local role ownership.
5. Preserve an accepted Design Direction Contract or explicitly reopen the concept gate if evidence requires change.
6. Produce one coherent implementation plan or patch rather than concatenating agent reports.
7. Run `ui-audit-and-acceptance` after material UI changes.

## Project design context

If `DESIGN.md` exists, read it only for UI/design/product-interaction tasks. Treat it as project-specific constraints that can override generic recommendations without overriding correctness, accessibility or safety requirements.

Never create or rewrite `DESIGN.md` merely to register this package. During onboarding, use `existing-project-integration` and preserve the repository's current design-memory structure.

Store only durable defining mechanisms/invariants in project design memory; do not persist rejected concept brainstorming.

## Patterns

- Metadata-first routing.
- Project-first authority mapping during onboarding.
- Concept-before-components for substantial redesigns.
- One primary skill plus a small number of supporting skills.
- Parallelize exploration/audit more readily than overlapping implementation.
- Explicitly say when no specialist skill is needed.

## Anti-patterns

- Loading every skill "just in case".
- Installing every library agent into a project before inspecting existing roles.
- Replacing project instructions/design docs during onboarding.
- Running the methodology director for a one-line or one-file fix.
- Spawning implementation specialists before the primary interaction concept is settled.
- Delegating the same ambiguous task to several agents without distinct scopes.
- Returning five separate specialist answers instead of one integrated decision.
- Treating `DESIGN.md` as mandatory context for backend/infrastructure work.
- Letting a decorative/motion specialist redefine product semantics or domain data rules.
- Treating anti-slop as a visual theme or universal ban list.
