---
name: dense-controls-and-selection
description: Recompose overloaded expert-desktop control clusters and choose compact native controls by user intent and semantic axis: tabs, segmented controls, searchable selection, popovers, sliders/scrubbers, toolbars and inline editors.
---

# Dense Controls, Selection and Interaction Recomposition

Choose the **interaction model before the widget**. A screen can contain individually correct combo boxes and buttons and still be badly designed because the user is forced to operate backend concepts one field at a time.

Use this skill both for selecting one control and for **recomposing a cluster of controls** that together serve one user intent.

## First classify the semantic job

Before counting options, classify what the UI element actually does:

| Semantic job | Typical pattern |
|---|---|
| Frequent mutually exclusive mode, 2–5 choices | Segmented control / compact toggle group |
| Main-area switch between closely related content panes | Tabs / tab view |
| Infrequent single object/value selection | Combo / pop-up button |
| Large named option set | Searchable combo / autocomplete |
| Multiple values from a long set | Searchable multi-select + compact summary |
| Continuous bounded value | Slider + numeric field when precision matters |
| Ordered discrete time/frame navigation | Domain timeline/scrubber with exact identity; not an anonymous generic slider |
| Secondary filters/options needed temporarily | Popover / inspector / disclosure surface |
| Current context that is derived, not independently chosen | Read-only metadata; do not create another selector |
| Frequent commands affecting current content | Compact toolbar / actions |
| Rare contextual commands | Context menu / overflow |
| Compact value edit | Inline editor with explicit preview/commit when needed |
| Global command search | Command palette |

Option count is a constraint, not the primary semantic rule. Five related content panes are not automatically a combo box merely because there are five choices.

## Interaction Recomposition Pass

Run this pass before replacing individual controls when any of these signals appear:

- 3+ adjacent controls participate in one frequent user task;
- 2+ dropdowns are normally opened in sequence before the user can inspect the result;
- several controls expose backend decomposition such as model / run / product id / lead independently;
- a frequent workflow repeatedly uses `open → select → close → open → select → close`;
- `Apply`, `Refresh` or `Reset` exists mostly because several selectors do not form one coherent interaction;
- an editable control represents a value that can be derived from another selection;
- the user asks to simplify, collapse, rethink, make Apple-like, reduce clicks or remove UI clutter;
- an ordered value such as time, range, frame or opacity is manipulated indirectly even though direct manipulation is natural.

### 1. Name the one user intent

Complete:

`This control cluster exists so the user can ______.`

If no single intent exists, do not merge the controls merely to reduce their count.

### 2. Map semantic axes and dependencies

For every visible control mark it as one of:

- primary selection/navigation axis;
- independent secondary axis;
- mode/view switch;
- action;
- filter/scope;
- derived metadata;
- status;
- rare override.

Explicitly note dependencies such as `lead = valid time - model run`. A derived value should normally be displayed, not edited independently.

### 3. Remove accidental controls

Ask, in order:

1. Can the system infer this value safely?
2. Is this value derived from another selection?
3. Is this action only needed because changes are not committed coherently?
4. Is this control rare enough to move into a popover/inspector?
5. Is direct manipulation clearer than configuration-first selection?

Eliminate the control only when semantics remain explicit and recovery stays predictable.

### 4. Recompose the remaining interaction

Prefer a small number of mechanisms with clear roles:

- **context + direct axis**: model/run as compact context, valid time as timeline;
- **tabs + local controls**: major related panes as tabs, pane-specific settings inside the pane;
- **summary + popover**: compact layer/filter summary, detailed choices on demand;
- **segmented mode + work surface**: frequent mode visible in one click;
- **scrubber + exact value**: direct ordered manipulation with precise readout and keyboard stepping;
- **selection-driven inspector**: controls appear for the selected object instead of occupying the screen permanently.

Do not invent a custom control if standard Qt/AppKit-like desktop primitives express the contract. Custom interaction is justified mainly when the domain object itself is the manipulation surface, such as a timeline, range, map extent or scientific cursor.

### 5. Compare interaction cost

Record before/after for the top task:

- visible controls;
- clicks/keystrokes;
- popup open/close cycles;
- pointer travel/context switches;
- independently editable state variables;
- whether the primary data surface gained space.

Fewer controls is not automatically better. The target is fewer **unnecessary mechanisms and decisions**.

### 6. Preserve accessibility and precision

Every recomposed interaction still needs:

- keyboard path;
- visible focus/selection;
- exact value when precision matters;
- non-gesture alternative for core functions;
- clear preview vs commit semantics;
- local async feedback when changing data.

If recomposition selects scrub/drag/direct manipulation, add `gesture-and-direct-manipulation`. If it changes asynchronous data, add `states-errors-and-recovery`.

## Apple-like, correctly interpreted

Treat Apple-like as **semantic economy and directness**, not as a capsule/glass visual theme:

- content/work object dominates chrome;
- familiar controls remain familiar;
- closely related choices are visibly grouped;
- temporary options move to a popover/inspector rather than a permanent panel;
- tabs represent related panes; segmented controls represent compact related modes/actions;
- sliders/scrubbers represent real ordered ranges, not arbitrary categories;
- keyboard, pointer precision and discoverability remain first-class on desktop.

Do not imitate macOS styling if the target product or Qt platform requires a different visual language.

## Individual control guidance

### Segmented controls

Use for modes/view choices that users switch repeatedly. Keep labels short and selection visible without color alone. Do not mix momentary actions and persistent selection semantics in the same group.

### Searchable combo

Show human label first; secondary metadata may show resolution, center, cycle or station code. Internal IDs are not primary labels. Typing filters, Up/Down moves instantly, Enter commits, Esc closes/restores.

### Multi-select

Collapse many selected tokens to a compact summary such as `3 выбрано`; avoid token overflow that pushes the layout.

### Toolbars

Group by task. Keep frequent commands visible; secondary actions go to overflow. A toolbar is not a storage area for every available feature.

### Inline editing

Separate view/edit from commit when save cost is meaningful. Do not trigger expensive work on every keystroke without a preview/debounce contract.

## Patterns

- Replace `Model + Run + Lead + Prev/Next` with compact model/run context + one exact valid-time navigation surface when lead is derived.
- Replace a permanent wall of layer checkboxes with a compact layer summary + popover, while keeping critical active layers visible.
- Replace a frequent `Current / Archive` combo with a direct mode switch and show archive date navigation only in archive mode.
- Replace separate plot view buttons and duplicated selectors with tabs only when they genuinely represent self-contained related panes.
- Keep semantically independent dimensions separate even if merging them would look cleaner.

For worked examples, load `references/control-recomposition.md` only when a cluster needs redesign.

## Anti-patterns

- Fixing five adjacent dropdowns one by one without asking whether the five controls should exist.
- Choosing controls only by option count.
- Collapsing independent semantic axes into one ambiguous smart control.
- Turning arbitrary categories into a slider because it looks modern.
- Using tabs for actions or settings rather than related content panes.
- Using segmented controls with too many heterogeneous choices.
- Hiding frequent primary actions in overflow to make a toolbar look minimal.
- Replacing standard controls with custom gestures solely for novelty.
- Treating Apple-like as glass, pills, oversized whitespace or animation.
- Removing labels/status/context until the UI becomes visually simple but operationally ambiguous.

## Acceptance

For every audited cluster with 3+ controls, or any sequential selector chain in a frequent task, explicitly record whether recomposition was considered.

A successful result:

- expresses the user intent with fewer unnecessary decisions;
- removes derived/redundant controls where safe;
- keeps independent semantics independent;
- reduces click/popup/context-switch cost for frequent tasks;
- preserves exact state, keyboard operation and domain truth;
- gives the primary work surface at least as much usable attention/space as before.
