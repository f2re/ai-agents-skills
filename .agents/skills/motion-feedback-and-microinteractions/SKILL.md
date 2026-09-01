---
name: motion-feedback-and-microinteractions
description: Add or audit purposeful, fast, interruptible UI motion and micro-feedback across Qt or web stacks; use frequency-aware motion tokens and avoid animation tax on keyboard, document editing and high-frequency operator actions.
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
- occasional delight in low-frequency noncritical surfaces when the product language permits it.

Motion is not justified merely because a framework or browser can animate a property.

## Frequency rule

The more often an action occurs, the less motion it should have.

Never add noticeable transition latency to:

- arrow-key selection;
- command/search result navigation;
- text editing;
- document cell/row/field traversal;
- template selection highlight;
- repeated drag/reorder preview;
- radar frame stepping;
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

Tune by distance and surface; do not blindly use the upper bound. If the project has a stricter motion contract, it wins. Docomator's current visual contract keeps routine hover/focus transitions around 120–160 ms and rejects theatrical page/button motion.

## Easing and origin

Entering objects decelerate; exiting may accelerate slightly. Expansion should originate from its trigger or spatial source. A contextual inspector should appear from the side/trigger it belongs to, not fly from an unrelated corner.

Open and close should preserve spatial consistency.

Do not use overshoot/bounce in precise document, scientific or administrative work unless there is a very specific low-frequency reason and the product design contract permits it.

## Interruptibility

A new user action interrupts/reverses current motion from its current value. Do not force completion of an obsolete animation before responding.

Rapid toggles should converge on latest state without queueing animations. A ready result replaces pending state immediately; do not wait for a spinner loop or exit animation.

## Web mapping

For local/offline web UI:

- prefer opacity/transform for small overlay/popover continuity;
- avoid animating width/height/top/left across large document/table trees when it causes repeated layout;
- never use global `transition: all`;
- do not attach staggered entrance animation to lists/results;
- state text and focus must update independently of animation completion;
- respect `prefers-reduced-motion` with a real no-motion path.

## Qt mapping

Use `QPropertyAnimation`/`QVariantAnimation` where appropriate, but avoid expensive geometry/layout animation of complex widget trees when it causes relayout per frame. Prefer lightweight opacity/transform/custom paint where supported by architecture.

Animation must never block GUI thread or data fetch.

## Document-workstation mapping

Document interfaces benefit from very little motion. Prefer:

- instant highlight when selecting a document text/cell/row;
- short origin-consistent inspector/popover reveal for a selected binding;
- subtle transition from pending validation to confirmed/error state;
- local disclosure for a repair row/problem;
- immediate stage-state changes during generation/import;
- static/short drag target feedback during file drop or row reorder.

Avoid:

- page-flip or paper-flying metaphors during generation;
- animated document thumbnails as loading indicators;
- pulsing template fields;
- press-scale on every primary button when the product contract rejects it;
- animating document pagination or table geometry after binding;
- delaying download/result availability for a success animation.

Motion must never obscure whether a preview/preflight is current or stale.

## Loading motion

Spinner/skeleton/shimmer is not decoration; it represents pending work. Stop immediately when work is ready.

Prefer stage text for multi-step document operations when the backend has stage truth. Never invent a percentage from elapsed time.

For content replacement, retain previous valid content when safe and mark the target as pending; use a short crossfade only if it prevents a disruptive flash and does not blur stale/current state.

For radar/map changes prefer no transition or a short crossfade if it prevents a flash; never morph meteorological fields in a way that invents intermediate data.

## Reduced motion

Respect reduced-motion preference. Remove nonessential spatial motion while keeping visible state changes, focus, selection, pending/error/success meaning and direct manipulation feedback.

Do not replace a 240 ms slide with a 60 ms slide and call that reduced motion when no spatial movement is needed.

## Patterns

- Menu/popover origin-aware fast transition.
- Pending → confirmed/error state swap without delaying result.
- Short size/opacity transition for an infrequent contextual inspector when it preserves orientation.
- Skeleton → content crossfade when layout is stable and skeleton is genuinely useful.
- Instant document selection + subtle inspector continuity.
- Static drag target + deterministic drop/reorder result.

## Anti-patterns

- Animate everything because a library supports it.
- Bounce on routine operator controls.
- 300–500 ms menu/dropdown.
- Animation on keyboard highlight.
- `transition: all` / global animation policy.
- Non-interruptible panel transition.
- Motion as the only selected/error cue.
- Delaying a ready result until animation completes.
- Staggering every row in a document/result/import list.
- Page-flip/paper-flying metaphors in a professional document workflow.
- Animating chart/radar/document values between real semantic states in a way that invents meaning.

## Audit categories

Review purpose/frequency, duration/easing, origin/physicality, interruptibility, performance, accessibility, token consistency and missed continuity opportunities.

For document work also audit whether motion changes focus, selection coordinates, scroll position or stale/current interpretation.

## Acceptance

Feel-check at normal speed and slow-motion. Repeatedly trigger the action faster than animation duration; UI must remain responsive and converge to current input.

Verify reduced-motion behavior. For document surfaces, repeat selection/binding/error/retry interactions while scrolling and confirm that motion never loses selection, shifts the wrong target or delays confirmed state.
