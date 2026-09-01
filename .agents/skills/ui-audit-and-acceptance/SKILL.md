---
name: ui-audit-and-acceptance
description: Perform evidence-based UI/UX acceptance across hierarchy, flow, control fragmentation/recomposition, states, motion, accessibility, domain semantics and anti-slop regression; prioritize root causes and testable corrections.
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

Measure avoidable click tax, popup cycles and context switches.

### 4. Control fragmentation and recomposition

For every frequent cluster with 3+ nearby controls, and every sequential selector chain used to accomplish one task, ask:

- What single user intent does the cluster serve?
- Which controls represent independent semantic axes?
- Which visible values are derived metadata rather than true choices?
- Is the user operating backend decomposition instead of the work object?
- Can a rare control move to contextual disclosure without hiding current state?
- Is an ordered value better manipulated directly as a timeline/scrubber/slider?
- Would tabs, segmented modes, popover/inspector or selection-driven controls reduce decisions without conflating semantics?

Do **not** automatically recommend fewer widgets. Record `KEEP AS IS` when the controls express genuinely independent concepts clearly.

When a root issue is control fragmentation, correction should describe the **recomposed interaction**, not a shopping list of one-for-one widget replacements. Use `dense-controls-and-selection` for the detailed pass.

### 5. State coverage

Check normal, hover, focus, pressed, selected, disabled, loading, refreshing, stale, partial, empty, error, offline/cancelled as applicable.

### 6. Motion/gesture

Audit purpose/frequency, duration, origin, interruptibility, direct manipulation, trackpad/mouse semantics and reduced motion.

### 7. Accessibility/operator safety

Keyboard path, focus, non-color status, hit areas, destructive actions, high DPI, light/dark/high contrast where supported.

### 8. Domain semantics

For meteorology verify valid time, run/cycle/lead, observed/forecast, source/model, unit, freshness, uncertainty and missing-data semantics.

### 9. Anti-slop regression

If the task used `anti-slop-ui-direction` or project design memory contains a Design Direction, verify:

- defining operational idea remains visible in the primary work surface;
- primary work object dominates secondary chrome;
- implementation has not collapsed into a generic card/dashboard/template arrangement;
- genericity/templateability still pass at organizing-logic level;
- domain invariants and native implementation constraints remain intact;
- decoration has an informational/state/interaction purpose.

Concept regression is one root cause, not dozens of spacing symptoms.

## Severity

- `P0`: materially wrong operational interpretation, destructive risk or unusable core workflow.
- `P1`: blocks/seriously slows a primary task, hides critical state, destroys accepted interaction concept, or repeatedly forces unnecessary multi-control choreography in a high-frequency task.
- `P2`: recurring friction, control fragmentation, density inconsistency, incomplete states or noticeable concept regression.
- `P3`: polish with low task impact.

Prioritize root causes by `impact × frequency × reach ÷ correction cost`.

## Evidence confidence

- `HIGH`: explicit product contract or directly reproducible behavior.
- `MEDIUM`: strong pattern evidence but runtime/intent not fully verified.
- `LOW`: visual hypothesis requiring screenshot/runtime/user validation.

Do not present LOW confidence as fact.

## Anti-pattern audit checklist

Explicitly look for:
- several individually valid controls that together expose one backend workflow;
- derived state offered as an independent editable selector;
- repeated dropdown open/select/close chains;
- frequent binary mode buried in combo;
- redundant Apply/Refresh needed only to commit a selector cluster;
- tabs/segments/sliders used for the wrong semantic job;
- map/plot squeezed by rare controls;
- internal IDs as user labels;
- anonymous/global loading for local work;
- blank surface during refresh;
- missing time/cycle/unit;
- stale async response overwriting current selection;
- hover-only core actions;
- animated keyboard navigation;
- excessive cards/borders/pills;
- secondary information with primary visual weight;
- accepted defining mechanism replaced by generic implementation.

## Output

Report one row per root cause:

| Severity | Surface | User expectation | Actual problem | Evidence | Correction | Acceptance |
|---|---|---|---|---|---|---|

For a control-fragmentation root cause, include a compact before/after interaction summary: visible controls, user decisions/clicks, semantic axes preserved, controls eliminated/derived/disclosed.

Then provide:
- top 3 improvements by leverage;
- control-recomposition status for affected primary flows;
- anti-slop regression status when applicable;
- items not verified;
- acceptance test sequence.

## Approval rule

Do not approve because screenshots look polished. Primary flows, control decomposition, async states, keyboard behavior and applicable Design Direction invariants must be exercised or explicitly marked unverified.

## Anti-patterns

- approving by screenshot polish alone;
- fixing every dropdown separately when the cluster is the root cause;
- pursuing minimum widget count instead of minimum unnecessary decisions;
- applying genericity tests to standard controls rather than organizing logic;
- claiming unverified concept/control problems as facts.
