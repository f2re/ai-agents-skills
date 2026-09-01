# Professional desktop anti-pattern policy

Anti-slop is not a ban list. Classify patterns by risk and require evidence proportional to the risk.

## FORBIDDEN unless an explicit product requirement overrides safely

- ambiguous observation/forecast or source/model/run semantics where the distinction matters;
- missing units on scientific values that require units for interpretation;
- color as the only channel for critical state;
- inaccessible pointer-only core actions without keyboard alternative;
- fixed absolute positioning as the main responsive strategy;
- clearing valid operational data merely because a replacement request is pending;
- silently changing multiple semantic axes from one ambiguous gesture;
- presenting fabricated continuity across missing timestamps/data.

## REJECT BY DEFAULT

These are common AI-generated defaults. They are allowed only when they solve a real task better than simpler alternatives:

- card grid for every parameter;
- large KPI/hero numbers on analytical workstations;
- glassmorphism and translucent floating panels;
- blue/purple decorative gradients;
- neon/cyan glow as "technical" styling;
- huge rounded containers around ordinary controls;
- dashboard gauges/speedometers for values better read on plots/scales;
- donut/pie charts without a data-specific reason;
- rainbow palettes without physical/semantic justification;
- excessive borders and nested group boxes;
- permanent panels for rare settings;
- marketing-scale whitespace that reduces operational density;
- decorative motion on repeated keyboard/time actions;
- QSS-heavy imitation of a web component library.

## ALLOW WITH JUSTIFICATION

State the purpose when using:

- cards for genuinely independent summary objects;
- animation for origin, continuity, state change or spatial relationship;
- strong color fields for hazard/state/selection where redundant cues exist;
- unusual custom controls when a standard control cannot express the task efficiently;
- custom Qwt items when native plot items cannot encode the scientific object.

## Qt/Qwt translation

Prefer:

- layout managers, stretch and `QSizePolicy` over absolute geometry;
- `QSplitter`/`QDockWidget` for operator-resizable regions when appropriate;
- QStyle/QProxyStyle/palette/tokens over per-widget ad-hoc QSS;
- model/view for data-heavy controls/tables;
- native focus, shortcut and accessibility behavior;
- Qwt plot items, pickers, zoomers and panners for scientific inspection.

The goal is not "make Qt look like the web". The goal is a coherent native professional workstation whose visual hierarchy is driven by work and data.
