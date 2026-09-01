# Anti-pattern diagnostic flow for Kafedra Planner

Use this flow before accepting a new primary surface or a major redesign. It is intentionally fail-fast: a polished mockup that violates source-of-truth or workflow semantics is still a bad direction.

```text
START
  ↓
What real object is the user working on?
  ├─ unclear / "dashboard" / "analytics" only → REVISE: identify authoritative work object
  └─ document / plan item / assignment / meeting / calendar object / report fact
        ↓
Can the user see state + next domain action without opening configuration?
  ├─ no → REVISE: work-first hierarchy
  └─ yes
        ↓
Does the UI preserve a visible path to source/provenance/history?
  ├─ no → BLOCK: evidence-hiding anti-pattern
  └─ yes
        ↓
Does intake require confirmation for facts the system can safely apply and edit later?
  ├─ yes → REVISE: immediate materialization + review by exception
  └─ no
        ↓
Can one bad file/row/field block unrelated successful work?
  ├─ yes → BLOCK: replace with partial success + local recovery
  └─ no
        ↓
Are calendar/search/report representations editable independent copies?
  ├─ yes → BLOCK: projection must route to authoritative object
  └─ no
        ↓
Does task completion depend on an uploaded report or manager approval by default?
  ├─ yes → BLOCK unless a new explicit domain contract requires it
  └─ no
        ↓
Are several controls implementing one frequent user intent?
  ├─ yes → run Interaction Recomposition
  └─ no
        ↓
Are derived metadata exposed as independent selectors?
  ├─ yes → REVISE: derive/show context, keep rare override contextual
  └─ no
        ↓
Does adaptive behavior move geometry or override saved/current/domain-derived values?
  ├─ yes → BLOCK
  └─ no
        ↓
Does motion explain continuity, causality or direct manipulation?
  ├─ no and motion exists → REMOVE / no-motion
  └─ yes or no-motion
        ↓
Does mobile preserve the same source, state, action and recovery semantics?
  ├─ no → REVISE
  └─ yes
        ↓
Can the common path work without network/LLM/CDN?
  ├─ no → BLOCK
  └─ yes
        ↓
Run Kafedra acceptance audit
```

## Fast genericity test

Ask whether the same primary surface could be relabeled for a CRM, fitness tracker or generic project manager with only nouns changed.

If yes, the design probably has no Kafedra organizing mechanism. Rebuild around one or more real mechanisms:

- calendar ↔ source obligation continuity;
- immutable source ↔ editable working interpretation;
- source row ↔ materialized plan items;
- assignment ↔ plan/calendar/plan-fact synchronization;
- review by exception;
- evidence/provenance navigation;
- reversible archive/restore.

## Click-tax test

For the common path, count decisions rather than clicks.

Bad example:

`Upload → choose parser → choose type → Process → Review → Confirm → Apply → open created plan`

Preferred shape:

`Upload → source saved immediately → system classifies/materializes → created plan opens → user fixes only exceptions`

The goal is not zero controls. The goal is zero **unnecessary user decisions**.

## Animation-tax test

For each visible movement ask:

1. What relationship becomes clearer because of it?
2. Is the interaction frequent?
3. Does it start immediately and remain interruptible?
4. Is the static/reduced-motion state complete?

If there is no concrete answer to (1), remove the motion.

## Acceptance outcome

- **PASS** — domain object, source, next action, partial/recovery, responsive and motion contracts are coherent.
- **REVISE** — concept is usable but adds unnecessary decisions, weak hierarchy or avoidable genericity.
- **BLOCK** — source-of-truth, data preservation, ACL/completion, offline or partial-success invariants are violated.
