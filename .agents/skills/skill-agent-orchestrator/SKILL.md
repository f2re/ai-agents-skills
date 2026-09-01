---
name: skill-agent-orchestrator
description: Routes multi-area UI/UX and interaction-design tasks to the smallest relevant set of skills and specialized agents. Use when a task spans several concerns or benefits from independent audit/design workstreams; do not use for a single obvious skill or trivial edit.
---

# Skill and agent orchestrator

The job is routing, not doing every specialist's work in the parent context.

## Progressive disclosure

1. Read task intent and the installed skill names/descriptions.
2. Do not open every `SKILL.md`.
3. Choose one primary skill and only the supporting skills needed to resolve actual task dimensions.
4. Load a specialist agent only when its workstream is independent enough to return a useful bounded result.
5. Keep requirements, cross-cutting decisions and final integration in the parent thread.

## Route by task shape

| Task signal | Primary route | Common support |
|---|---|---|
| Existing UI audit, complaints, screenshots | `ui-ux-auditor` | `design-evidence-and-intent`, `interaction-contracts-and-flow`, `ui-audit-and-acceptance` |
| Qt/C++ interface design or implementation | `qt-interface-designer` | `qt-cpp-design-system`, `information-hierarchy-and-density`, `dense-controls-and-selection` |
| Radar/satellite/forecast workstation | `meteo-workstation-designer` | `radar-timeline-and-playback`, `time-data-navigation`, `viewport-map-interactions`, `meteorological-visualization` |
| Animation, gestures, sliders, direct manipulation | `motion-interaction-reviewer` | `motion-feedback-and-microinteractions`, `gesture-and-direct-manipulation` |
| Loading, stale, partial, recovery | direct skill | `states-errors-and-recovery` |
| Wizard/import/complex staged flow | direct skill | `workflow-and-progressive-disclosure` |
| Selection/filter/combo overload | direct skill | `dense-controls-and-selection` |

## Delegation budget

- Small, sequential, single-file task: work directly; no subagent.
- Medium task with one specialist concern: use one specialist or a small skill set.
- Complex task with independent read-heavy concerns: use 2–4 specialists in parallel, then merge findings.
- Avoid parallel write-heavy agents touching the same files.
- A specialist must receive a bounded question, relevant files/evidence, expected output and non-goals.

## Parent integration contract

After delegated work returns:

1. Deduplicate findings.
2. Resolve contradictions against user intent and repository constraints.
3. Preserve evidence and file references.
4. Produce one coherent implementation plan or patch rather than concatenating agent reports.
5. Run `ui-audit-and-acceptance` after material UI changes.

## Project design context

If `DESIGN.md` exists, read it only for UI/design/product-interaction tasks. Treat it as project-specific constraints that can override generic recommendations without overriding correctness, accessibility or safety requirements.

## Patterns

- Metadata-first routing.
- One primary skill plus a small number of supporting skills.
- Parallelize exploration/audit more readily than overlapping implementation.
- Explicitly say when no specialist skill is needed.

## Anti-patterns

- Loading every skill "just in case".
- Spawning agents for a one-line or one-file fix.
- Delegating the same ambiguous task to several agents without distinct scopes.
- Returning five separate specialist answers instead of one integrated decision.
- Treating `DESIGN.md` as mandatory context for backend/infrastructure work.
- Letting a decorative/motion specialist redefine product semantics or domain data rules.
