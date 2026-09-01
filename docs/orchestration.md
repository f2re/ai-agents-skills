# Orchestration model

## Goal

Give coding agents deep UI/UX knowledge without making every request carry the entire design corpus, one giant designer prompt or a swarm of subagents.

The architecture uses four layers:

1. **Discovery metadata** — skill names and descriptions answer “is this relevant?”
2. **Concept direction when needed** — `anti-slop-ui-direction` answers “what is the defining operational idea, and does it survive rejection tests?”
3. **Focused instructions** — selected `SKILL.md` bodies answer “how should this concern be handled?”
4. **Specialist agents** — optional bounded roles for independent analysis/implementation when delegation adds value.

## Routing contract

The parent agent classifies the request along these axes:

- user intent: audit, design, implementation, repair, review;
- concept status: settled local behavior vs substantial new/redesigned work surface;
- stack: Qt/C++, web, generic desktop;
- domain: general UI, meteorology, radar/satellite, scientific visualization;
- interaction: selection, navigation, time, map, loading, gesture, motion;
- complexity: small sequential edit vs independent workstreams.

Then it chooses the smallest sufficient toolset.

## Concept gate

Use `anti-slop-ui-direction` or the bounded `ui-methodology-director` before implementation when a task materially changes:

- a primary work surface;
- information architecture;
- navigation model;
- visualization architecture;
- a high-frequency operator workflow;
- or when the complaint is that the UI looks generic, dashboard-like, AI-generated or “slop”.

Skip it for trivial/local changes with an established interaction concept.

The gate returns a **Design Direction Contract**: primary job/work object, three considered mechanisms, selected defining mechanism, rejection-test results, invariants, non-goals and the smallest downstream route. It is not a brainstorming transcript.

### Typical routes

| Task | Route |
|---|---|
| Rename a label | main agent; no specialist |
| Fix one overloaded combo box | `dense-controls-and-selection` |
| Audit an existing screen | `design-evidence-and-intent` + `interaction-contracts-and-flow` + `ui-audit-and-acceptance`; optionally UI/UX Auditor |
| New main Qt operator screen | `ui-methodology-director` → Design Direction Contract → Qt Interface Designer + only relevant support skills |
| Redesign described as generic/AI/dashboard-like | `anti-slop-ui-direction` first; do not start with palette/cards/spacing |
| Radar timeline behavior with established concept | Meteo Workstation Designer + radar timeline/time/states; map skill only if map requests change |
| New radar workstation concept | UI Methodology Director → Meteo Workstation Designer → Qt Interface Designer as needed |
| Gesture/animation review | Motion Interaction Reviewer + motion/gesture skills |
| Large UI redesign spanning several independent concerns | AI Skills Orchestrator; settle concept sequentially, then 2–4 independent specialists where useful |

## Delegation budget

Subagents are useful when they reduce context contention or parallelize independent investigation. They are not a default ceremony.

- **0 specialists**: trivial/obvious/single-file task.
- **1 specialist**: one meaningful expert dimension or a bounded methodology direction question.
- **2–4 specialists**: complex task with independent evidence streams after concept direction is coherent.
- avoid two agents editing the same files in parallel;
- prefer read-heavy specialists and one integration owner;
- the parent agent keeps requirements, product decisions and final patch ownership.

The methodology director is usually sequential because downstream implementation should share one accepted concept rather than race on competing concepts.

## Synthesis requirement

The user should not receive contradictory specialist reports. The parent agent must:

1. merge duplicate findings;
2. distinguish evidence from preference;
3. resolve conflicts against product/domain constraints;
4. preserve or explicitly reopen the Design Direction Contract;
5. turn recommendations into one coherent interaction model;
6. implement/plan the change;
7. run anti-slop regression when applicable and final acceptance criteria.

## DESIGN.md

`DESIGN.md` is project memory for durable interaction/product decisions. It is intentionally separate from generic skills.

Use it for UI/product work when present. Store only accepted stable design direction/invariants, interaction contracts and domain decisions. Do not store rejected concept brainstorming. Do not load it by reflex for build-system, backend or unrelated code tasks.

## Anti-patterns

- `load all skills` before every task;
- a single giant “designer” prompt with every rule;
- running the anti-slop ritual for a padding or label fix;
- treating a palette/sidebar/card choice as a defining concept;
- one agent per skill;
- specialist agents that all edit the same implementation simultaneously;
- letting implementation specialists silently replace the accepted defining mechanism;
- letting motion specialists redefine domain semantics;
- treating specialist output as final without parent synthesis;
- reading large design documents for unrelated backend changes.
