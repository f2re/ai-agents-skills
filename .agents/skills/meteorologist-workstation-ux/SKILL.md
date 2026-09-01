---
name: meteorologist-workstation-ux
description: Design an operational meteorologist workstation around fast interpretation of observations, forecasts, freshness, model/cycle/source, hazards and spatial-temporal comparison without dashboard clutter.
---

# Meteorologist Workstation UX

A meteorological workstation is an operational instrument, not a marketing dashboard.

## Primary questions

The default surface should help answer quickly:
- What is happening now?
- What changed recently?
- What is expected next?
- Where is the significant/hazardous area?
- What data/model/source/cycle am I looking at?
- How fresh and complete is it?
- How confident/uncertain is the forecast?

## Screen hierarchy

Typical priority:
1. map/plot/product canvas;
2. selected valid time and compact time navigation;
3. critical status/freshness/warnings;
4. model/source/layer controls;
5. legend and secondary metadata;
6. diagnostics/configuration on demand.

Do not surround the map with many equal-weight cards.

## Data identity

At minimum, make available where relevant:
- product/parameter in human terms;
- valid time;
- observed/nowcast/forecast status;
- forecast cycle/run and lead time;
- model/source/provider;
- resolution if it affects interpretation;
- update/freshness age;
- quality/completeness/uncertainty warning.

Internal `identity`, UUID, dataset key, center code or file name must not replace human labels. Put technical metadata in details/copy diagnostics.

## Observed vs forecast

Never blur the boundary between measured and predicted data. Use a consistent non-color-only distinction: section/timeline boundary, line style, badge/label or background treatment. Nowcast can be a third explicit semantic class.

## Context preservation

When switching time/model/layer:
- keep map extent and selected point where scientifically valid;
- retain old valid content until replacement is ready;
- mark target selection as pending;
- update linked plots/crosshair coherently;
- avoid resetting panels/filters.

## Dense controls

Frequent changes such as `Факт/Прогноз`, product mode or archive/current must be one-click when space allows. Large model lists are searchable combos with concise primary names and optional secondary metadata.

## Alerts/hazards

Hazard colors belong to meteorological meaning. Avoid using the same red/yellow palette for routine UI decoration. A warning must identify phenomenon, area/time and data basis; not just show a generic red banner.

## Anti-patterns

- Huge permanent model metadata panel.
- Generic dashboard KPIs unrelated to current forecast decision.
- Map shrunk to make room for filters used once per session.
- Model names replaced with internal IDs.
- Forecast displayed without cycle/valid time.
- Stale data visually indistinguishable from fresh.
- All layers enabled by default because they are available.
- Frequent actions hidden under nested menus.

## Acceptance scenarios

A trained user should be able to:
1. identify current selected time/source/model in <5 seconds;
2. move to adjacent frame without opening a menu;
3. return to latest/current data directly;
4. see whether selected data is still loading or stale;
5. compare adjacent times without losing map context;
6. work primarily by keyboard for repeated time navigation.
