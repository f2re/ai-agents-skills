---
name: motion-feedback-and-microinteractions
description: Add or audit purposeful, fast, interruptible UI motion and micro-feedback in Qt or other stacks; use frequency-aware motion tokens and avoid animation tax on keyboard and high-frequency operator actions.
---

# Motion, Feedback and Microinteractions

Before animating ask: what information does movement communicate that a static state change would not?

## Purpose categories

Motion is justified when it improves:
- feedback: action was accepted;
- orientation: where panel/item came from or goes;
- continuity: same object changes size/position/state;
- focus: rare important change;
- perceived progress during a real wait;
- occasional delight in low-frequency noncritical surfaces.

## Frequency rule

The more often an action occurs, the less motion it should have.

Never add noticeable transition latency to:
- arrow-key selection;
- radar frame stepping;
- command-palette row navigation;
- text editing;
- repeated zoom/pan;
- scrubber movement.

These should update instantly or use only imperceptible color/opacity feedback.

## Duration tokens

Use product tokens rather than arbitrary values. Sensible starting family for operational desktop UI:
- `instant`: 0–60 ms, selection/keyboard/high-frequency;
- `micro`: ~80–120 ms, press/hover/focus feedback;
- `fast`: ~120–180 ms, menu/popover/icon/state swap;
- `standard`: ~160–240 ms, small panel/dialog transitions;
- avoid >300 ms for routine UI unless motion has a specific explanatory purpose.

Tune by distance and surface; do not blindly use the upper bound.

## Easing/origin

Entering object decelerates; exiting may accelerate slightly. Expansion should originate from its trigger or spatial source. A panel opened from the right should not visually fly in from an unrelated corner.

Open and close should preserve spatial consistency.

## Interruptibility

A new user action interrupts/reverses current motion from its current value. Do not force completion of an obsolete animation before responding.

Rapid toggles should converge on latest state without queueing animations.

## Qt mapping

Use `QPropertyAnimation`/`QVariantAnimation` where appropriate, but avoid expensive geometry/layout animation of complex widget trees when it causes relayout per frame. Prefer lightweight opacity/transform/custom paint where supported by architecture.

Animation must never block GUI thread or data fetch.

## Loading motion

Spinner/skeleton/shimmer is not decoration; it represents pending work. Stop immediately when work is ready. Do not hold result until an animation cycle finishes.

For radar/map changes prefer no transition or a short crossfade if it prevents a flash; never morph meteorological fields in a way that invents intermediate data.

## Reduced motion

Respect reduced-motion preference. Remove nonessential spatial motion while keeping visible state changes.

## Patterns

- subtle press scale/offset for infrequent pointer buttons if platform feel supports it;
- menu/popover origin-aware fast transition;
- spinner→check for a rare completed operation;
- short size transition for expandable inspector preserving context;
- skeleton→content crossfade when layout is stable.

## Anti-patterns

- animate everything because library supports it;
- bounce on routine operator controls;
- 300–500 ms menu/dropdown;
- animation on keyboard highlight;
- `transition all` / global animation policy;
- non-interruptible panel transition;
- motion as only selected/error cue;
- animating chart/radar values between real timestamps.

## Audit categories

Review purpose/frequency, duration/easing, origin/physicality, interruptibility, performance, accessibility, token consistency and missed continuity opportunities.

## Acceptance

Feel-check at normal speed and slow-motion. Repeatedly trigger the action faster than animation duration; UI must remain responsive and converge to current input.
