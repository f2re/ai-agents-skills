---
name: ui-audit-and-acceptance
description: Perform a complete evidence-based UI/UX audit of layout, hierarchy, user expectations, interactions, states, motion, accessibility and domain semantics; prioritize root causes and produce testable acceptance criteria.
---

# UI Audit and Acceptance

This is the final quality gate for substantial UI work and a standalone read-only audit skill.

## Audit sequence

### 1. Evidence and tasks
Read `design-evidence-and-intent`. Identify top user jobs, frequency and criticality.

### 2. Screen hierarchy
Check primary object/action, grouping, spacing rhythm, typography, density, persistent secondary UI and responsive/DPI behavior.

### 3. Interaction contracts
For each top flow compare:

| Step | User expects | UI does | Gap |
|---|---|---|---|
| trigger | | | |
| acknowledgement | | | |
| pending | | | |
| result | | | |
| failure/recovery | | | |

Measure avoidable click tax and context switches.

### 4. State coverage
Check normal, hover, focus, pressed, selected, disabled, loading, refreshing, stale, partial, empty, error, offline/cancelled as applicable.

### 5. Motion/gesture
Audit purpose/frequency, duration, origin, interruptibility, direct manipulation, trackpad/mouse semantics and reduced motion.

### 6. Accessibility/operator safety
Keyboard path, focus, non-color status, hit areas, destructive actions, high DPI, light/dark/high contrast where supported.

### 7. Domain semantics
For meteorology specifically verify valid time, run/cycle/lead, observed/forecast, source/model, unit, freshness, uncertainty and missing-data semantics.

## Severity

- `P0`: can cause materially wrong operational interpretation, destructive action or unusable core workflow.
- `P1`: blocks/seriously slows a primary task, hides critical state or creates strong expectation mismatch.
- `P2`: recurring friction, hierarchy/density inconsistency, incomplete state handling.
- `P3`: polish with low task impact.

Prioritize root cause by `impact × frequency × reach ÷ correction cost` rather than visual novelty.

## Evidence confidence

- HIGH: explicit design/product contract or directly reproducible behavior.
- MEDIUM: strong pattern evidence but runtime/intent not fully verified.
- LOW: visual hypothesis requiring screenshot/runtime/user validation.

Do not present LOW confidence as fact.

## Anti-pattern audit checklist

Explicitly look for:
- frequent binary mode buried in combo;
- map/plot squeezed by rare controls;
- internal IDs as user labels;
- anonymous loading spinner;
- blank surface during refresh;
- missing time/cycle/unit;
- old async response overwriting current selection;
- hover-only core actions;
- animated keyboard navigation;
- fixed large timeline;
- gaps in observations visually compressed;
- excessive cards/borders/pills;
- inconsistent spacing/control heights;
- secondary information with primary visual weight.

## Output

Report a concise table:

| Severity | Surface | User expectation | Actual problem | Evidence | Correction | Acceptance |
|---|---|---|---|---|---|---|

One row per root cause. Group all affected locations under that row.

Then provide:
- top 3 improvements by leverage;
- items not verified;
- acceptance test sequence.

## Approval rule

Do not say an interface is “done” because screenshots look polished. Approve only when primary flows, async states and keyboard behavior have been exercised or explicitly marked unverified.
