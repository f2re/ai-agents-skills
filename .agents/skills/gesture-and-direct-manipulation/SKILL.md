---
name: gesture-and-direct-manipulation
description: Design mouse, trackpad, wheel, drag, scrub, swipe and slider interactions with 1:1 tracking, activation thresholds, bounds, resistance, velocity/snap and accessible alternatives; adapt mobile gesture craft to desktop Qt safely.
---

# Gesture and Direct Manipulation

Inspired by high-quality mobile interaction implementations, but adapted to desktop input semantics.

## Direct manipulation principles

1. The manipulated object follows pointer/gesture continuously and predictably.
2. The user sees state before commit.
3. Bounds are physically understandable.
4. Release has a deterministic outcome: stay, snap, cancel, commit.
5. Gesture can be interrupted/reversed.
6. A non-gesture alternative exists for core functionality.

## Preview vs commit

For expensive changes:
- pointer movement updates lightweight preview;
- network/render request is debounced/coalesced;
- release or idle commits final value.

Examples: timeline scrub, range selection, map extent, large parameter slider.

For cheap local changes, update continuously.

## Activation thresholds

Avoid accidental drag when user intended click. Use a small movement threshold before drag activates. Once active, preserve grab offset so object does not jump under pointer.

## Bounds and resistance

At hard bounds, clamp. If elastic resistance is used, it must communicate a boundary and snap back quickly. Do not add playful overscroll to critical numeric controls.

## Snap

Snap to meaningful domain points: frame timestamps, discrete pressure levels, valid slider increments, panel snap positions. Visual indicator should make target obvious before release where practical.

## Velocity/inertia

Inertia is useful for long spatial navigation but can reduce precision in scientific controls. Disable or constrain kinetic motion for timelines/parameters where exact term matters.

## Mouse wheel and trackpad

Qt may provide angle- and pixel-based deltas. Normalize input and accumulate fractional movement. Do not equate event count with notches.

Avoid wheel-changing a focused numerical value unless field focus/hover policy clearly signals it; accidental wheel edits are dangerous.

## Swipe

Desktop swipe/reveal is secondary enhancement, not primary action. Always expose equivalent button/menu/shortcut. Never hide destructive action behind gesture only.

## Feedback

Mobile haptic cues translate on desktop primarily into immediate visual state, press/focus/selection change and clear snap behavior. Do not add sounds or decorative vibration analogues unless product specifically requires them.

## Anti-patterns

- Object jumps because drag ignores initial grab offset.
- Release continues moving for seconds when precision matters.
- Gesture crosses multiple semantic modes unexpectedly.
- Trackpad emits dozens of events and triggers dozens of network calls.
- Swipe-only delete.
- Spring overshoot changes actual scientific value beyond selected bound.
- Pointer hover changes global selected time without commit.

## Acceptance

Test slow/fast drag, short accidental motion, reverse mid-gesture, release near threshold, high-resolution trackpad, classic wheel, mouse buttons, keyboard alternative and rapid repeated gesture while async work is pending.
