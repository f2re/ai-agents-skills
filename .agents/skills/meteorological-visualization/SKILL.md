---
name: meteorological-visualization
description: Design scientifically honest, compact and linked meteorological plots, meteograms, aerological diagrams and ensemble/model comparisons with clear units, crosshair, uncertainty and performant Qt rendering.
---

# Meteorological Visualization

Scientific correctness and quick interpretation outrank decoration.

## Data identity

Every plot makes clear:
- parameter name;
- unit;
- valid time/time zone where relevant;
- source/model/cycle when comparison matters;
- observed vs forecast distinction;
- uncertainty/ensemble meaning when shown.

Use locale-aware numeric formatting consistently. Do not mix decimal conventions within one product.

## Axes and units

- Put units in axis/header/legend context, not repeated on every point.
- Use physically meaningful ranges when fixed ranges aid comparison; otherwise autoscale with sensible padding.
- Never truncate an axis in a way that exaggerates small variation without clear indication.
- Time axis must show date transitions and timezone policy.

## Crosshair and linked views

Use one synchronized crosshair/selected valid time across related plots when that improves comparison.

Crosshair should:
- snap to actual data time for discrete forecasts unless interpolation is scientifically intended;
- show compact tooltip/table of values;
- remain readable at plot edges;
- avoid covering key curves;
- update at pointer speed without triggering expensive data fetch per pixel.

If crosshair changes global selected time, distinguish preview from committed selection. Hover should not unexpectedly reload the map.

## Multiple models / ensembles

Avoid a permanent wall of model metadata. Use concise legend names and an on-demand details view.

For ensembles prefer distribution/spread/percentiles or appropriately transparent members rather than dozens of equally dominant lines when readability collapses.

Uncertainty must have clear semantics: ensemble spread, confidence interval, probability, min/max are not interchangeable.

## Color

Use domain-appropriate scales. Ensure UI selection/focus colors do not conflict with hazard/product colors. For categorical phenomena use redundant encoding where feasible.

## Performance in Qt

- decimate only for display, never mutate source data;
- preserve extrema when downsampling operational signals;
- avoid rebuilding all plot items on simple crosshair movement;
- cache transforms/paths where appropriate;
- move IO/calculation off GUI thread;
- benchmark large time series and multiple layers at target DPI.

Qwt/custom QPainter/OpenGL choices depend on existing project constraints; do not introduce a new plotting stack just for stylistic polish.

## Density

Keep legends compact, preferably inline/top/overlay when they do not hide data. Secondary statistics can appear in hover/selection inspector.

## Anti-patterns

- `Model identity` and technical center codes consuming more space than parameter values.
- No fact/forecast distinction.
- Units missing or repeated noisily.
- Crosshair tooltip that triggers global re-layout.
- Animated curves that imply interpolation through forecast steps.
- Rainbow scale chosen only because it looks vivid.
- Re-render entire plot for every mouse move.

## Acceptance

Verify scientific meaning with real edge cases: missing values, irregular time steps, zero/negative values where valid, multiple units, daylight/timezone boundaries, ensemble outliers and very large datasets.
