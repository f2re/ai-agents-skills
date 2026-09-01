---
name: dense-controls-and-selection
description: Choose and implement compact selection controls for expert desktop UI: segmented controls, searchable combos, autocomplete, multi-select, toolbars, command palettes and inline editors.
---

# Dense Controls and Selection

Choose a control by frequency, option count and semantic cost.

## Control selection matrix

| Need | Preferred pattern |
|---|---|
| 2 states, setting | Switch/toggle with clear label |
| 2–4 frequent mutually exclusive modes | Segmented control |
| 2–7 infrequent options | Combo/select |
| 8+ options or known by name | Searchable combo/autocomplete |
| Multiple values from long list | Searchable multi-select with removable tokens/summary |
| Global action search | Command palette |
| Numeric bounded continuous value | Slider + precise numeric field when precision matters |
| Numeric discrete expert value | Spin/number field, wheel only when focused/intentional |
| Rare item actions | Context menu / overflow menu |

## Segmented controls

Use for mode/view changes that users switch repeatedly. Keep labels short. Selected state must be visible without relying only on color.

Do not hide `Текущие / Архив`, `Факт / Прогноз`, `Карта / График` in dropdowns when both states fit compactly.

## Searchable combo

Show primary human label first. Secondary metadata may appear in muted text: model resolution, center, cycle, station code. Internal IDs are not primary labels.

Keyboard:
- typing filters;
- Up/Down moves instantly;
- Enter commits;
- Esc closes/restores;
- selection remains visible.

Do not animate keyboard highlight movement.

## Multi-select

If many selections can accumulate, collapse tokens after a small threshold to `3 выбрано` with access to full list. Avoid horizontal token overflow that pushes layout.

## Inline editing

For compact edit/view controls, separate preview/change from commit when save cost is meaningful. Example: click edit → focus field → validate/clamp → confirm/cancel. Do not make every keystroke trigger a network request.

## Toolbars

Group by task. Keep frequent commands visible; secondary actions go to overflow. Icons must have consistent geometry and tooltips. Active tool/mode must be unambiguous.

## Anti-patterns

- Dropdown for a frequent binary view change.
- 20 radio buttons in a permanent sidebar.
- Combo that shows opaque technical IDs as main content.
- Wheel changing a numeric field merely because pointer happened to hover it.
- Disabled option without explanation when the reason matters.
- Search field that filters only after an explicit extra button click without need.
- Selection disappearing when popup closes.

## Acceptance

Count interactions for top tasks. A frequent mode switch should normally be one direct action. Large option sets must be searchable and fully keyboard-operable.
