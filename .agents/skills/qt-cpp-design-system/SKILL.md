---
name: qt-cpp-design-system
description: Build and maintain a coherent native Qt/C++ design system with tokens, shared controls, density, states and platform-appropriate implementation rather than web-style cargo culting.
---

# Qt/C++ Design System

Target native Qt Widgets or QML as specified by the project. Do not imitate React/Tailwind component architecture literally.

## Foundations

Define shared semantic tokens for:
- surface/background/elevated/overlay;
- text primary/secondary/disabled;
- accent/selection/focus;
- success/warning/error/info/stale;
- border/divider;
- spacing scale;
- radii where used;
- typography roles;
- icon sizes/stroke family;
- motion durations/easing;
- density presets if the application supports compact/comfortable modes.

Prefer semantic names over raw palette names.

## Spacing

Start from a 4 px base rhythm. Common desktop increments: 4, 8, 12, 16, 24, 32. Do not force every gap to the same number.

Rules:
- inside tightly related control group: 4–8 px;
- between field label/control or inline siblings: 4–8 px depending on density;
- between related groups: 12–16 px;
- major sections: 16–24 px;
- avoid large marketing-style whitespace in data-dense workstations.

Use alignment and proximity before adding boxes/borders.

## Qt implementation

For Widgets prefer:
- `QPalette`/semantic color layer for global roles;
- `QProxyStyle`/custom style helpers for reusable geometry/metrics;
- targeted QSS, not a huge selector maze;
- model/view for large lists/tables;
- delegates for rich item rendering;
- `QAction` as shared command state for menu/toolbar/shortcut where appropriate;
- signals/slots for explicit state transitions;
- asynchronous data work outside the GUI thread.

Do not create a new subclass for every cosmetic variation. Prefer properties/variants when behavior is shared.

## Component contract

Every reusable interactive control documents:
- purpose and when not to use;
- variants;
- normal/hover/focus/pressed/selected/disabled/loading/error states as applicable;
- keyboard interaction;
- sizing/density;
- signal emitted on preview/change/commit;
- async ownership if it triggers data work.

## Visual hierarchy

Use typography, spacing, alignment and contrast before elevation. Shadows communicate depth, not grouping. Borders communicate structure, not decoration.

## Icons

Use one coherent icon family per surface. Icon meaning is functional: play, pause, layers, refresh, archive. Do not make critical actions icon-only unless the icon is universally understood and has tooltip/accessibility text.

## Anti-patterns

- Hardcoded colors and margins scattered across widgets.
- Nested cards for every group.
- Giant stylesheet with fragile object-name selectors.
- Different combo/button heights on the same toolbar without purpose.
- Dark mode implemented as simple color inversion.
- Disabled state that looks like normal state.
- Focus indicator removed because it is aesthetically inconvenient.

## Acceptance

Check at minimum: normal, hover, focus, pressed, selected, disabled, loading, empty, error; light/dark if supported; 100/125/150/200% scaling; keyboard traversal; narrow and wide window sizes.
