# Orchestration model

## Goal

Give coding agents deep UI/UX knowledge without making every request carry the entire design corpus, one giant designer prompt or a swarm of subagents, and integrate that capability into mature repositories without replacing their existing agent architecture.

The architecture uses four layers:

1. **Discovery metadata** — skill names and descriptions answer “is this relevant?”
2. **Focused gates when needed** — `existing-project-integration` answers “how does this fit the current repository?”, while `anti-slop-ui-direction` answers “what operational idea should organize this substantial UI?”
3. **Focused instructions** — selected `SKILL.md` bodies answer “how should this concern be handled?”
4. **Specialist agents** — optional bounded roles for independent analysis/implementation when delegation adds value.

## Routing contract

The parent agent classifies the request along these axes:

- task class: normal development vs existing-repository onboarding/integration;
- user intent: audit, design, implementation, repair, review;
- concept status: settled local behavior vs substantial new/redesigned work surface;
- stack: Qt/C++, web, generic desktop;
- domain: general UI, meteorology, radar/satellite, scientific visualization;
- interaction: selection, navigation, time, map, loading, gesture, motion;
- complexity: small sequential edit vs independent workstreams.

Then it chooses the smallest sufficient toolset.

## Existing-project integration gate

When the task is to install or reconcile this library with a repository that already has project memory, skills, agents, rules, design docs or role conventions, use `existing-project-integration` / `project-integration-architect` **before** normal role delegation.

The integration gate:

1. inventories current instruction scopes and extension surfaces;
2. builds an authority map in which project-local artifacts outrank generic library defaults;
3. preserves same-name local skills/agents as `SHADOW_LIBRARY`;
4. prefers native discovery over always-loaded prompt injection;
5. maps library capabilities into existing project roles where possible;
6. performs only the smallest justified semantic merge.

Do not start by installing all library roles into the project. That would make role duplication a filesystem side effect rather than an architectural decision.

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
| Integrate this catalog into an established repository | Project Integration Architect → authority map → native additions / minimal semantic merge |
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
- **1 specialist**: one meaningful expert dimension or a bounded methodology/integration question.
- **2–4 specialists**: complex task with independent evidence streams after project authority/concept direction is coherent.
- existing-project onboarding begins with one integration architect; do not fan out competing role systems before its authority map;
- avoid two agents editing the same files in parallel;
- prefer read-heavy specialists and one integration owner;
- the parent agent keeps requirements, product decisions and final patch ownership.

The methodology director is usually sequential because downstream implementation should share one accepted concept rather than race on competing concepts.

## Synthesis requirement

The user should not receive contradictory specialist reports. The parent agent must:

1. merge duplicate findings;
2. distinguish evidence from preference;
3. resolve conflicts against project authority and domain constraints;
4. preserve or explicitly reopen the Design Direction Contract;
5. turn recommendations into one coherent interaction model;
6. implement/plan the change;
7. run anti-slop regression when applicable and final acceptance criteria.

## DESIGN.md

`DESIGN.md` is project memory for durable interaction/product decisions when the project already uses that file or intentionally adopts it. It is not a package registration target.

During existing-project integration, preserve the repository's current design-memory structure. Do not create or rewrite `DESIGN.md` automatically. If the integration architect later identifies a real durable missing project decision, add it in the project's existing structure and vocabulary.

For normal UI/product work, read existing design memory when relevant. Store only accepted stable design direction/invariants, interaction contracts and domain decisions. Do not store rejected concept brainstorming or load design docs reflexively for unrelated backend work.

## Anti-patterns

- `load all skills` before every task;
- installing every library agent into an established project before inspecting existing roles;
- using root instruction files as package-registration indexes;
- creating/replacing `DESIGN.md` during deterministic installation;
- a single giant “designer” prompt with every rule;
- running the anti-slop ritual for a padding or label fix;
- treating a palette/sidebar/card choice as a defining concept;
- one agent per skill;
- specialist agents that all edit the same implementation simultaneously;
- letting implementation specialists silently replace the accepted defining mechanism;
- letting motion specialists redefine domain semantics;
- treating specialist output as final without parent synthesis;
- reading large design documents for unrelated backend changes.
