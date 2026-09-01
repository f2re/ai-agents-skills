# Genericity, templateability and reality tests

Use these tests on substantial product surfaces, not on every standard widget.

## 1. Genericity test

The test asks whether the **organizing logic** belongs to the domain.

A meteorological work surface is suspiciously generic if these substitutions preserve the same meaning:

| Original | Substitute |
|---|---|
| temperature | revenue |
| pressure | conversion |
| precipitation | orders |
| forecast model | region |
| station | customer |

If a screenshot becomes a plausible sales dashboard after relabeling axes and cards, reject the concept or make its domain mechanism stronger.

### Do not over-apply

These are expected to remain generic/native:

- file dialogs;
- confirmation dialogs;
- menus and toolbars;
- ordinary tables;
- searchable combo boxes;
- settings pages whose job really is configuration.

A professional application is not improved by inventing a proprietary replacement for every familiar control.

## 2. Templateability test

Ask: could a marketplace template keep the same primary structure and become an unrelated product by changing only:

- labels;
- hero imagery;
- accent color;
- icons;
- chart series?

If yes, the primary surface needs stronger task-specific organization.

Passing does not mean every screen must be visually unique. It means the **main work surface** should reveal what work is being done.

## 3. Domain-truth test

List the facts that must remain unambiguous for a correct operational interpretation. Mark any proposal that hides or weakens one as a failed concept even if it is visually attractive.

For meteorology, verify as applicable:

- variable and unit;
- location/area;
- valid time;
- forecast lead;
- model and run/cycle;
- source;
- observation vs nowcast vs forecast;
- data freshness/staleness;
- missing or quality-controlled data;
- uncertainty/spread/probability.

## 4. Implementation-reality test

Reject "Figma fiction". A concept fails if its core value depends on interactions the target stack cannot implement robustly or accessibly.

For Qt/Qwt check:

- layouts and size policies can preserve the hierarchy across resize/DPI;
- keyboard/focus path exists;
- async transitions do not require blocking the event loop;
- plots can use Qwt primitives or bounded custom items instead of a browser chart engine imitation;
- zoom/pan/pick/direct manipulation have clear semantics;
- custom painting does not become the entire application architecture;
- the design does not depend on fixed pixel coordinates or fragile QSS tricks.

## Failure interpretation

A failed test does not automatically mean "start from zero". Determine the root cause:

- **genericity failure** → change organizing mechanism;
- **templateability failure** → strengthen domain coupling;
- **domain-truth failure** → restore semantic invariants;
- **implementation failure** → adapt interaction to native primitives.

Do not solve a conceptual failure by changing colors, borders or typography.
