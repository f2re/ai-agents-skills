---
name: time-data-navigation
description: Design predictable navigation across valid time, observation history, forecast cycles/runs and lead times with adaptive stepping and request coalescing while keeping cycle, valid time and playback speed conceptually separate.
---

# Time and Data Navigation

Meteorological time has multiple axes. Never collapse them into one ambiguous selector.

## Distinguish

- observation/valid time;
- model initialization/cycle/run time;
- forecast lead (`+03 h`);
- data interval/resolution;
- UI playback speed;
- archive range.

A user should be able to tell which one a control changes.

## Recommended structure

Use a compact hierarchy:
1. selected valid time as primary readable value;
2. timeline/step controls for adjacent valid times;
3. model cycle/run selector only when multiple runs matter;
4. lead shown as secondary derived metadata when forecasting;
5. archive range/calendar on demand.

## Adaptive stepping

Single wheel/arrow/step should be predictable. Rapid repeated stepping may accelerate, but the effective step must be visible.

Example acceleration ladder for forecast products:
`1 h → 3 h → 6 h → 12 h` based on rapid repeated input and product resolution.

For radar, prefer frame-by-frame stepping; use `radar-timeline-and-playback`.

Rules:
- acceleration resets shortly after input stops;
- no more than one step class change at a time;
- selected time remains exact;
- do not cross unavailable model cycle silently;
- show effective step transiently if it changes (`шаг 3 ч`).

## Cycle changes

When navigating beyond the coverage of one model run, do not silently jump runs unless product explicitly implements “best available forecast”. If auto-run selection exists, show run change near time/model identity.

## Preview vs commit

For drag/scrub over large archives:
- preview timestamp instantly;
- optionally preview cached/low-res product;
- debounce expensive fetch;
- commit/high-resolution request on release/idle.

## Anti-patterns

- Label `Time` without distinguishing run vs valid time.
- Playback speed `2x` interpreted as 2-hour forecast step.
- Timeline resets when model changes although same valid time exists.
- Archive date hidden in a modal while daily navigation is frequent.
- Fast wheel queues 50 independent data loads.

## Acceptance

Given any displayed forecast, user can state valid time, model run/cycle and lead. Rapid navigation never allows an older response to overwrite the current selected time.
