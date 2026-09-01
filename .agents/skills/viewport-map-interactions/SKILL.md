---
name: viewport-map-interactions
description: Design map/radar viewport zoom, pan, probe, layer and semantic data-level interactions for mouse and trackpad, including cursor-anchored zoom, request debounce, LOD thresholds and expert wheel acceleration without surprise context changes.
---

# Viewport and Map Interactions

## Core invariants

- Zoom is anchored at the pointer/cursor location unless there is a strong domain reason otherwise.
- Pan preserves scale/time/selection.
- One gesture has one primary semantic axis.
- A map must acknowledge interaction immediately even when new tiles/products are loading.
- Changing data LOD/source is a consequence of an understandable scale boundary, not a random side effect.

## Input handling

Support both classic mouse wheel (`angleDelta`) and high-resolution trackpad (`pixelDelta`) where Qt exposes them. Normalize deltas; do not assume one event equals one notch.

Typical semantics:
- wheel/pinch: spatial zoom;
- drag: pan;
- click: probe/select;
- double click: optional zoom-in if it does not conflict with probe;
- context menu/secondary click: local actions;
- modifier+wheel only when convention is documented and useful.

## Semantic zoom / data LOD

Use viewport-scale thresholds to choose appropriate data resolution/product:
`local detail → regional mosaic → synoptic overview`.

At a threshold:
1. keep current visual content;
2. show a short unobtrusive level preview/name;
3. request next LOD;
4. replace when ready;
5. preserve center, selected location and valid time;
6. use hysteresis so small wheel reversals do not flap between levels.

### Fast wheel burst accelerator

For expert workflows, an optional acceleration can extend the user's example of rapid repeated wheel input.

Safe pattern:
- detect normalized same-direction burst, for example ~3 intentional notches within roughly 350–500 ms;
- only permit semantic-level advance when near/crossing a defined LOD boundary, not anywhere on the scale;
- advance at most one semantic data level per burst;
- show a brief level label such as `Региональная мозаика` before/while loading;
- add hysteresis/cooldown so one gesture cannot cascade through all sources;
- regular slow wheel remains ordinary continuous zoom.

Do not implement raw `third wheel event = change dataset` because trackpads generate variable event counts.

## Request behavior

During continuous zoom/pan:
- render viewport transform locally first;
- debounce/coalesce expensive data queries;
- cancel/ignore obsolete requests;
- request resolution appropriate to final/near-final scale;
- cache adjacent LOD if feasible;
- never let late old LOD overwrite current map.

## Probe behavior

A selected station/cell/point remains selected during harmless pan/zoom. If current layer cannot provide value, show `нет значения для выбранного слоя` rather than silently deselecting.

Probe popup/inspector should not cover the exact feature being inspected if it can be offset.

## Layers

Layer control is compact. Frequent 2–4 base modes can be segmented/toggles; larger overlay lists go to popover/inspector with search/grouping where needed. Do not permanently show every layer option.

## Anti-patterns

- Zoom around viewport center while pointer targets a local cell.
- Full data reload on every wheel event.
- Semantic source changes without indication.
- Three wheel events counted literally on a trackpad.
- Pan clears selection/time.
- Different zoom levels use unrelated color scales without warning.
- Loading overlay blocks pan/zoom.
- Hidden layer state only visible inside a closed menu.

## Acceptance

Test mouse wheel, high-resolution trackpad, slow zoom, burst zoom, reversal near LOD boundary, rapid pan+zoom, slow network, late request completion and selected probe persistence.
