# Anti-Slop UI methodology

## Purpose

The repository uses anti-slop as a **decision-making layer**, not as an aesthetic preset. The goal is to prevent substantial UI work from starting with a generic component/dashboard template and then being cosmetically polished.

The method is deliberately separated from implementation skills so it does not become a monolithic prompt.

## System position

```text
user task
   ↓
AI Skills Orchestrator / UI Skill Router
   ↓
substantial concept change?
   ├─ no → focused skill / specialist directly
   └─ yes
       ↓
UI Methodology Director
anti-slop-ui-direction
       ↓
Design Direction Contract
       ↓
meteorology / Qt / interaction specialists
       ↓
implementation
       ↓
anti-slop regression
       ↓
ui-audit-and-acceptance
```

## What the methodology director owns

The director owns only the bounded concept question:

- primary user job;
- primary work object;
- three genuinely different interaction/information mechanisms;
- genericity, templateability, domain-truth and implementation-reality tests;
- selected defining mechanism;
- concept invariants and non-goals;
- recommended smallest downstream skill set.

It does not own the entire task, codebase or every visual detail.

## Design Direction Contract

The contract is the handoff boundary between concept and implementation:

```text
PRIMARY JOB
PRIMARY WORK OBJECT
DEFINING MECHANISM
CONCEPTS CONSIDERED
SELECTED / WHY
ANTI-SLOP TESTS
INVARIANTS
NON-GOALS
PRIMARY SKILLS
SUPPORTING SKILLS
NOT NEEDED
```

Downstream Qt/meteo/motion specialists may refine how the concept works, but they must not silently replace it. When target-stack or domain evidence invalidates the concept, they return the conflict so the concept gate can be reopened explicitly.

## Why the genericity test is scoped

The genericity test is intentionally applied to the **primary work surface and organizing logic**, not every platform widget.

A `QDialog`, `QTableView`, menu, toolbar or searchable combo box may and often should look conventional. Forcing novelty into familiar controls increases learning cost and implementation risk without making the product more domain-specific.

The question is instead: if the domain labels and data were replaced with an unrelated business domain, would the same main screen and interaction still make equal sense?

## Constraint levels

Anti-slop constraints are classified rather than flattened into a ban list:

- **FORBIDDEN** — correctness, safety, accessibility or explicit domain-contract violation;
- **REJECT BY DEFAULT** — common AI/template default without a task justification;
- **ALLOW WITH JUSTIFICATION** — potentially useful pattern whose functional purpose must be stated.

This prevents the methodology from degenerating into another rigid visual style.

## How existing skills participate

`anti-slop-ui-direction` asks **why this interface should be organized this way**.

Other skills remain authoritative for their dimensions:

- `design-evidence-and-intent` — what is known vs assumed;
- `interaction-contracts-and-flow` — action/state flow;
- `information-hierarchy-and-density` — density/grouping/hierarchy;
- `dense-controls-and-selection` — control choice and click tax;
- `meteorologist-workstation-ux` — operational meteorological semantics;
- `meteorological-visualization` — plots, uncertainty, aerology;
- `qt-cpp-design-system` — native Qt implementation architecture;
- `states-errors-and-recovery` — async and degraded states;
- `ui-audit-and-acceptance` — final behavioral and concept-regression gate.

The methodology director does not copy these rules into its own prompt. It routes to them after a concept is selected.

## SLOP → DECENT → PROFESSIONAL references

The anti-slop skill contains optional references for:

- meteorological workstation;
- radar/satellite timeline;
- forecast model comparison;
- Qwt temporal plots and aerology.

`DECENT` is intentionally a separate level. A clean, consistent interface can still be generic. `PROFESSIONAL` means the primary interaction/information architecture directly expresses the operator's real task and domain semantics.

## Regression gate

A concept may be strong in planning and still degrade during implementation into a generic layout. Therefore material UI work performs an explicit regression check before normal acceptance:

- defining mechanism survived;
- primary work object still dominates;
- domain invariants remain visible/correct;
- no component/card/dashboard fallback replaced the organizing concept;
- native implementation constraints are respected;
- decoration has purpose.

Only after that does `ui-audit-and-acceptance` approve behavior, async states, keyboard operation, accessibility and domain semantics.
