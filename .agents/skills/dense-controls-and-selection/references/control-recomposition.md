# Control recomposition reference cases

Use these examples as interaction patterns, not as mandatory layouts.

## 1. Forecast model / run / lead / time

### OVERCONTROLLED

- Model combo
- Run/cycle combo
- Lead combo
- Valid-time label
- Previous button
- Next button
- Apply button

The UI exposes data-model decomposition rather than the operator's question: “show the atmosphere at this valid time.”

### CORRECT

Each selector has human-readable labels, units and keyboard behavior, but the workflow still requires several independent choices.

### RECOMPOSED

- compact model selector/context;
- run shown as context with a history/override popover when needed;
- one valid-time rail/scrubber with exact timestamps and keyboard step controls;
- lead displayed as derived metadata;
- no Apply button when selection can commit coherently with local pending feedback.

Do not auto-hide a meaningful run change; domain truth remains visible.

## 2. Map layers

### OVERCONTROLLED

Permanent sidebar with 15 checkboxes, opacity fields, labels and reset buttons consumes a large share of the map.

### CORRECT

Checkboxes are grouped and styled consistently.

### RECOMPOSED

Persistent compact summary shows critical active layers. A Layers action opens one popover/inspector containing searchable/grouped layer selection and contextual opacity. The map remains dominant. Frequently toggled safety-critical layers may remain direct one-click controls.

## 3. Current / archive / date

### OVERCONTROLLED

Mode combo + date combo + calendar button + previous/next date + refresh.

### RECOMPOSED

`Current | Archive` is a direct mode switch. Date navigation exists only in Archive mode. Selecting a date immediately acknowledges the requested state; Refresh is reserved for an actual data-reload semantic, not routine selection commit.

## 4. Scientific plot modes

### OVERCONTROLLED

A toolbar contains buttons for Meteogram, Aerology, Ensemble, Statistics plus separate View and Product combos.

### RECOMPOSED

If these are mutually exclusive, self-contained related work panes, use a tab view. Keep controls that affect only one pane inside that pane. Keep shared time/location context outside the tabs. Do not use tabs merely because there are four options.

## 5. Ordered value: opacity / level / frame

### OVERCONTROLLED

Combo with 20 numeric opacity values or a dropdown of every frame time.

### RECOMPOSED

For a true ordered range, use slider/scrubber + exact readout and keyboard stepping. Snap to meaningful domain points. For radar frames, use a semantic timeline rather than a generic unlabeled slider because missing/pending/fact-nowcast state is part of the value.

## 6. Selection-driven tools

### OVERCONTROLLED

Permanent edit/delete/style controls remain visible even when no object is selected.

### RECOMPOSED

Selection reveals a compact contextual inspector/action group. The object remains the primary focus. Keyboard and menu alternatives remain available.

## Recomposition failure modes

Do not merge:

- model identity and parameter units;
- playback speed and forecast time step;
- map zoom and selected valid time;
- independent filters whose interaction needs separate visibility;
- destructive action into an ambiguous gesture without explicit alternative.

The objective is not minimum widget count. It is minimum unnecessary user decision-making while preserving domain semantics.
