# Concept mechanism library

These are prompts for reasoning, not components to combine wholesale. Select only mechanisms justified by the user's task.

## General professional UI mechanisms

### FOCUS + CONTEXT
One work object gets most visual weight while related context remains visible but subordinate. Useful when operators need depth without losing orientation.

### SELECTION DRIVES ALL VIEWS
One explicit selection becomes the shared state for map, plot, table and inspector. Avoid duplicate hidden selections per panel.

### COMPARISON BEFORE CONFIGURATION
If the user's job is to compare alternatives, show the meaningful comparison first and move setup/detail controls out of the primary visual hierarchy.

### DIRECT MANIPULATION BEFORE FORM FILLING
When a spatial/temporal object can be manipulated directly, prefer drag/pick/range selection with keyboard alternatives over a configuration form that indirectly changes the same object.

### STATE IS PART OF THE OBJECT
Loading, stale, partial, invalid or unavailable state is shown where the affected data lives instead of in a disconnected global status card.

### CONTEXT SURVIVES DATA CHANGE
Changing time/model/LOD keeps the prior valid view until the new state is ready and preserves spatial/temporal orientation.

## Meteorological mechanisms

### TIME IS THE SPINE
A shared valid-time state physically and interactively links plots, map layers, observations and forecast products. One cursor/selection inspects the atmosphere at one moment.

### ATMOSPHERIC COLUMN IS THE OBJECT
Pressure/height is the organizing coordinate across thermodynamic, humidity, wind, icing and turbulence information. Useful for aerology and vertical diagnostics.

### MAP ↔ PLOT COUPLING
Spatial selection on the map and the analytical plot describe the same selected location/feature. Navigation remains synchronized without surprising independent state.

### FACT → NOW → FORECAST
Observation, current boundary, nowcast and forecast form a continuous but explicitly segmented time structure. Their provenance is never visually conflated.

### MODEL DISAGREEMENT IS DATA
The primary object is not a model selector but the agreement/spread between models or ensemble members. Consensus and divergence become inspectable geometry.

### UNCERTAINTY HAS GEOMETRY
Uncertainty is represented as interval, envelope, probability field, spread or another explicit visual object rather than hidden in text or implied by line thickness.

### HAZARD EMERGES FROM DATA
Warnings attach to the affected place/time/level/curve region. Avoid detached red KPI cards that lose the evidence behind the hazard.

### DATA FRESHNESS IS VISIBLE
Age, update state and stale/partial status live near the data source or selected product. Freshness is operational context, not a settings detail.

### LINKED INSPECTION
One crosshair/picker reveals exact values across related plots and optionally the map. Avoid independent tooltips that force repeated hunting.

## Selection rule

Choose one defining mechanism and at most one or two supports.

A concept described as "TIME IS THE SPINE + MAP/PLOT + FOCUS + CONTEXT + DIRECT MANIPULATION + UNCERTAINTY + ..." has probably stopped being a concept and become a list of aspirations.
