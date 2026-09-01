# Orchestration model

## Goal

Give coding agents deep UI/UX knowledge without making every request carry the entire design corpus or a swarm of subagents.

The architecture uses three layers:

1. **Discovery metadata** — skill names and descriptions answer “is this relevant?”
2. **Focused instructions** — selected `SKILL.md` bodies answer “how should this task be handled?”
3. **Specialist agents** — optional bounded roles for independent analysis when the task benefits from delegation.

## Routing contract

The parent agent classifies the request along these axes:

- user intent: audit, design, implementation, repair, review;
- stack: Qt/C++, web, generic desktop;
- domain: general UI, meteorology, radar/satellite, scientific visualization;
- interaction: selection, navigation, time, map, loading, gesture, motion;
- complexity: small sequential edit vs independent workstreams.

Then it chooses the smallest sufficient toolset.

### Typical routes

| Task | Route |
|---|---|
| Rename a label | main agent; no specialist |
| Fix one overloaded combo box | `dense-controls-and-selection` |
| Audit an existing screen | `design-evidence-and-intent` + `interaction-contracts-and-flow` + `ui-audit-and-acceptance`; optionally UI/UX Auditor |
| Redesign a Qt operator screen | Qt Interface Designer + hierarchy/controls/states skills |
| Radar timeline behavior | Meteo Workstation Designer + radar timeline/time/states; map skill only if map requests change |
| Gesture/animation review | Motion Interaction Reviewer + motion/gesture skills |
| Large UI redesign spanning all of the above | AI Skills Orchestrator, then 2–4 independent specialists if evidence collection can be parallelized |

## Delegation budget

Subagents are useful when they reduce context contention or parallelize independent investigation. They are not a default ceremony.

- **0 specialists**: trivial/obvious/single-file task.
- **1 specialist**: one meaningful expert dimension.
- **2–4 specialists**: complex task with independent evidence streams.
- avoid two agents editing the same files in parallel;
- prefer read-heavy specialists and one integration owner;
- the parent agent keeps requirements, product decisions and final patch ownership.

## Synthesis requirement

The user should not receive four contradictory specialist reports. The parent agent must:

1. merge duplicate findings;
2. distinguish evidence from preference;
3. resolve conflicts against product/domain constraints;
4. turn recommendations into one coherent interaction model;
5. implement/plan the change;
6. run acceptance criteria on the final state.

## DESIGN.md

`DESIGN.md` is project memory for durable interaction/product decisions. It is intentionally separate from generic skills.

Use it for UI/product work when present. Do not load it by reflex for build-system, backend or unrelated code tasks. This keeps project-specific design context useful rather than becoming permanent prompt overhead.

## Anti-patterns

- `load all skills` before every task;
- a single giant “designer” prompt with every rule;
- one agent per skill;
- specialist agents that all edit the same implementation simultaneously;
- delegating a tiny label/style fix;
- letting motion specialists redefine domain semantics;
- treating specialist output as final without parent synthesis;
- reading large design documents for unrelated backend changes.
