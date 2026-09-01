---
name: operator-accessibility-and-safety
description: Make expert operational interfaces keyboard-complete, readable, non-color-dependent and resistant to accidental mode or destructive actions, including reduced motion and focus behavior.
---

# Operator Accessibility and Safety

Accessibility is part of operational reliability.

## Keyboard-first

Primary repeated actions must have keyboard paths. Typical examples:
- Left/Right: adjacent time/frame;
- Shift+Left/Right or PageUp/PageDown: larger time step when documented;
- Space: play/pause timeline when focus context is clear;
- Home/shortcut: latest/live frame;
- Ctrl/Cmd+K: command/search palette if provided;
- Esc: cancel tool/popup/temporary mode.

Never animate selection highlight in response to arrow keys.

## Focus

Focus must be visible. Do not rely on hover. Modal/popup focus is trapped/restored correctly. A map/plot must not steal keyboard input from an editing field merely because pointer crosses it.

## Color and status

Warnings, stale data, selection and quality flags need text/icon/shape/pattern cues in addition to color. Meteorological color scales must preserve data meaning; UI chrome should not reuse hazard colors casually.

## Reduced motion

Respect platform reduced-motion preference where available. Remove nonessential movement; preserve instantaneous state feedback.

## Safety

For destructive/high-cost actions:
- identify exact object affected;
- prefer undo for reversible local changes;
- confirm only when loss is material or irreversible;
- default focus must not make accidental Enter destructive.

For mode/tool changes, active mode must remain visually obvious until exited.

## Input tolerance

Keep reasonable hit targets even in dense desktop UI. Visual control may be compact while clickable area remains larger. Avoid placing destructive actions immediately beside frequent navigation without separation.

## Anti-patterns

- Red/green as only state distinction.
- Focus ring removed.
- Gesture-only action.
- Hover-only controls required for core work.
- Tiny icon targets with no padding.
- Every warning is modal.
- Dangerous default button on a dialog opened by a common shortcut.

## Acceptance

Complete the primary workflow with keyboard only. Test high contrast/dark mode where supported, zoom/DPI scaling, reduced motion, and status comprehension in grayscale.
