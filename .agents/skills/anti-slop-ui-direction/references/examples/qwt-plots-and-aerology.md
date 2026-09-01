# Example ladder: Qwt plots and aerology

## SLOP

- web-dashboard chart styling copied into Qwt;
- thick gradients, floating tooltip cards and ornamental shadows;
- fixed pixel plot sizes;
- one tooltip per plot with no linked inspection;
- Skew-T/vertical diagnostics treated as ordinary XY charts;
- custom painting replaces native Qwt interaction primitives without need.

## DECENT

- clean Qwt curves and axes;
- units and legends are readable;
- zoom/pan work;
- layout resizes without clipping.

## PROFESSIONAL TEMPORAL PLOTS

Defining mechanism: **LINKED INSPECTION**.

- related `QwtPlot` instances share the selected valid time/crosshair;
- `QwtPlotPicker`/markers provide exact values rather than independent hover bubbles;
- `QwtPlotIntervalCurve` or equivalent geometry represents uncertainty/spread;
- zoom/pan semantics are consistent and do not silently change model/time;
- axes carry variable/units and missing segments remain visible;
- high-DPI/layout behavior preserves label and plot readability.

## PROFESSIONAL AEROLOGY

Defining mechanism: **ATMOSPHERIC COLUMN IS THE OBJECT**.

- pressure/height is a shared scientific coordinate, not decoration;
- temperature/dew point, wind and derived hazards align around the same atmospheric column;
- selected level can drive linked readouts/plots without losing vertical context;
- physical conventions of the chosen thermodynamic diagram are preserved;
- icing/turbulence/zero-level information attaches to the relevant levels instead of detached KPI cards.

Use Qwt as an implementation substrate for the scientific interaction model, not as a canvas for imitating a generic web chart library.
