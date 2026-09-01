---
name: ui-audit-and-acceptance
description: Perform evidence-based UI/UX acceptance across hierarchy, flow, control fragmentation/recomposition, states, motion, accessibility, document or meteorological domain semantics and anti-slop regression; prioritize root causes and testable corrections.
---

# UI Audit and Acceptance

This is the final quality gate for substantial UI work and a standalone read-only audit skill.

## Audit sequence

### 1. Evidence and tasks

Read `design-evidence-and-intent`. Identify top user jobs, frequency, criticality, primary work object and actual implementation stack.

For an established repository, project-local requirements/design/architecture are evidence, not optional inspiration.

### 2. Screen hierarchy

Check primary object/action, grouping, spacing rhythm, typography, density, persistent secondary UI and responsive/DPI/reflow behavior.

Ask whether the real work object dominates the screen:

- document/template canvas for visual template work;
- generation plan/correction for document release;
- extracted dataset/source relationship for extraction review;
- map/plot/product for meteorology.

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
- Is direct manipulation more natural for the actual ordered/spatial object?
- Would tabs, segmented modes, searchable selection, popover/inspector or selection-driven controls reduce decisions without conflating semantics?

For document generation, specifically inspect chains such as template → audience/group → mode → validate/apply/refresh. Expected output count and preflight revision are usually derived/status, not more selectors.

For template editing, inspect whether permanent field/control panels can become a selection-driven inspector without hiding current binding state.

Do **not** automatically recommend fewer widgets. Record `KEEP AS IS` when the controls express genuinely independent concepts clearly.

When a root issue is control fragmentation, correction should describe the **recomposed interaction**, not a shopping list of one-for-one widget replacements. Use `dense-controls-and-selection` for the detailed pass.

### 5. State coverage

Check normal, hover, focus, pressed, selected, disabled, loading, refreshing, stale, partial, empty, error, offline/cancelled as applicable.

For document workflows additionally verify:

- stale preview/preflight after input revision;
- persisted long-running operation after navigation/reload;
- partial generation with successful results retained;
- correction form values preserved after server failure;
- unsupported document construction or degraded preview;
- explicit import not confused with read-only analysis/preview.

### 6. Motion/gesture

Audit purpose/frequency, duration, origin, interruptibility, direct manipulation, trackpad/mouse semantics and reduced motion.

For Docomator/document workstations:

- keyboard selection and row/cell navigation must be instant;
- routine transitions should follow project tokens and not delay state;
- no theatrical page entrances, button bounce/scale or decorative document animation;
- document selection/direct manipulation needs a non-gesture path;
- rapid state changes must converge on latest intent without queued animation.

### 7. Accessibility/operator safety

Check keyboard path, visible focus, focus restore, non-color status, hit areas, destructive actions, 200% zoom/reflow, light/dark/high contrast where supported and reduced motion.

For web UI, verify no page-level horizontal overflow at the project's required narrow width. Two-dimensional scroll is acceptable only inside the bounded component whose content genuinely requires it, such as a document/table surface.

### 8. Domain semantics

#### Document automation

Verify as applicable:

- current space/context is visible when it changes data meaning;
- template/source/version identity is unambiguous in human terms;
- browser preview is not used as Office binding/storage truth;
- selected document region maps to a validated binding coordinate;
- expected output count/mode is clear before generation;
- preflight cannot remain valid after dependent inputs change;
- immutable launched/result state is not silently mutated by later edits;
- partial success is represented honestly;
- retry preserves successful results and prepared context;
- extraction automatic result and user corrections are distinct;
- structured import errors expose row/column/raw value/action without regexp reconstruction from localized text;
- preview/read does not perform an implicit write or create fields;
- explicit import/apply boundary is visible.

#### Meteorology

When relevant, verify valid time, run/cycle/lead, observed/forecast, source/model, unit, freshness, uncertainty and missing-data semantics.

### 9. Stack and offline reality

For Docomator/local offline web work verify:

- implementation follows the actual HTML/CSS/JavaScript project rather than Qt/Web-framework assumptions;
- no CDN/remote font/analytics/runtime external asset dependency;
- project token source remains authoritative;
- document-derived text is rendered as untrusted data;
- CSP/session/network conventions are preserved;
- server/persisted operation state is not replaced by fake browser timers.

For Qt work, verify native Qt implementation constraints instead.

### 10. Anti-slop regression

If the task used `anti-slop-ui-direction` or project design memory contains a Design Direction, verify:

- defining operational idea remains visible in the primary work surface;
- primary work object dominates secondary chrome;
- implementation has not collapsed into a generic card/dashboard/template arrangement;
- genericity/templateability still pass at organizing-logic level;
- domain invariants and native implementation constraints remain intact;
- decoration has an informational/state/interaction purpose.

For Docomator, a generic card dashboard is not rescued merely by paper-colored styling. The document route, canvas, generation plan or result register must organize the interaction itself.

Concept regression is one root cause, not dozens of spacing symptoms.

## Severity

- `P0`: materially wrong interpretation, destructive/data-isolation risk, document corruption risk or unusable core workflow.
- `P1`: blocks/seriously slows a primary task, hides critical state, allows stale commit/preflight, destroys accepted interaction concept, or repeatedly forces unnecessary multi-control choreography.
- `P2`: recurring friction, control fragmentation, density inconsistency, incomplete states, reflow/accessibility defect or noticeable concept regression.
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
- redundant Apply/Refresh needed only to commit a selector cluster;
- tabs/segments/sliders used for the wrong semantic job;
- primary document/map surface squeezed by rare controls;
- internal IDs as user labels;
- anonymous/global loading for local work;
- stale async response overwriting current selection;
- hover-only core actions;
- animated keyboard navigation;
- excessive cards/borders/pills;
- secondary information with primary visual weight;
- accepted defining mechanism replaced by generic implementation;
- browser DOM/pixel selection treated as persisted Office binding truth;
- stale document preflight shown as current;
- import/extraction preview that silently writes user data;
- server error that resets file/mapping/correction/generation context;
- page-level horizontal overflow at narrow width or 200% zoom;
- remote runtime assets in an offline product.

## Output

Report one row per root cause:

| Severity | Surface | User expectation | Actual problem | Evidence | Correction | Acceptance |
|---|---|---|---|---|---|---|

For a control-fragmentation root cause, include a compact before/after interaction summary: visible controls, user decisions/clicks, semantic axes preserved, controls eliminated/derived/disclosed.

Then provide:
- top 3 improvements by leverage;
- control-recomposition status for affected primary flows;
- document/domain invariant status when applicable;
- anti-slop regression status when applicable;
- items not verified;
- acceptance test sequence.

## Approval rule

Do not approve because screenshots look polished. Primary flows, control decomposition, async states, keyboard/reflow behavior, domain boundaries and applicable Design Direction invariants must be exercised or explicitly marked unverified.

## Patterns

- Evidence-first, root-cause-first audit.
- Domain-specific acceptance layered on shared interaction/state checks.
- Actual stack/offline contract verified, not assumed.
- Control recomposition measured by decisions and flow cost.
- Design Direction verified against the implemented UI, not the mockup.

## Anti-patterns

- approving by screenshot polish alone;
- fixing every dropdown separately when the cluster is the root cause;
- pursuing minimum widget count instead of minimum unnecessary decisions;
- applying genericity tests to standard controls rather than organizing logic;
- using meteorological acceptance criteria for a document product or vice versa;
- accepting a document preview that looks right while its persisted binding contract is unsafe;
- claiming unverified concept/control problems as facts.
