---
name: information-hierarchy-and-density
description: Design clear information hierarchy, grouping, spacing and professional desktop density so important work stays visible without clutter or oversized consumer-style cards.
---

# Information Hierarchy and Density

The goal is not minimum information. The goal is minimum competing information for the current task.

## Start from decisions

For each screen ask:
1. What must the user decide or understand in the next 5 seconds?
2. What data supports that decision?
3. What controls are used every few minutes?
4. What is secondary but occasionally needed?
5. What is diagnostic/admin-only?

Place items by these levels, not by backend grouping.

## Density layers

### Persistent primary layer
Map/plot/table, selected time, critical status, primary controls.

### Compact secondary layer
Small toolbar, segmented modes, model/source selector, essential legend.

### On-demand layer
Inspector/popover/drawer for filters, diagnostics, metadata and advanced options.

### Deep configuration
Dedicated settings/page when changes are rare and structural.

## Grouping

Prefer:
- proximity;
- shared baseline/alignment;
- concise group heading;
- whitespace;
- subtle divider only where needed.

Avoid framing every 2–3 fields in its own card.

## Text hierarchy

Use few typography roles. A typical expert desktop surface needs body, secondary/metadata, section title and perhaps a primary value. Avoid multiple display-size headings inside operational panels.

Numbers in tables/timelines should use tabular numerals when available. Units belong in column/axis/header context rather than repeated noisily in every value.

## Space budget

Before adding a permanent panel, estimate its cost in pixels and its use frequency. If a panel occupies >15–20% of the main working dimension but is used rarely, default to collapsible/on-demand unless the task requires simultaneous comparison.

## Patterns

- Segmented mode switch embedded in compact toolbar.
- Inspector opens next to selected object and preserves main surface.
- Filter summary displayed as compact chips/count, full filter UI on demand.
- Secondary metadata shown on hover/selection/details, not always expanded.

## Anti-patterns

- “Premium” whitespace that forces scrolling on desktop.
- Dashboard of unrelated cards around a map that should dominate the task.
- Permanent large legend for a simple scale.
- Repeated labels that restate obvious units/context.
- Five equal-weight buttons when one is primary and four are secondary.
- Empty space filled with decorative content while critical status is hidden.

## Acceptance

At default window size, a user should identify the primary object, selected state/time and next available action without scanning every panel. Rare controls must not visually outrank frequent controls.
