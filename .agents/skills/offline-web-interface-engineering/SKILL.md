---
name: offline-web-interface-engineering
description: Implement document-workstation UI in an offline local web stack with semantic HTML, shared CSS tokens, small JavaScript modules, truthful server state, CSP-safe assets, responsive reflow, keyboard access and restrained motion.
---

# Offline Web Interface Engineering

Use this skill when the target product is a local/offline browser interface such as Docomator.

Do **not** route Docomator UI implementation to `qt-cpp-design-system`: the interaction principles may be shared, but the implementation substrate is local HTML/CSS/JavaScript served by the application.

This skill is project-first. If the repository already defines framework, tokens, module boundaries, CSP and test commands, those contracts override generic implementation preferences here.

## Implementation stance

Prefer the smallest native web mechanism that satisfies the interaction contract:

- semantic HTML elements before custom widget emulation;
- existing project CSS variables/tokens before new hardcoded values;
- existing JavaScript modules before introducing a framework;
- server/domain truth before duplicated browser state machines;
- local bundled SVG/assets before network resources;
- progressive enhancement where a native control already provides reliable keyboard/focus semantics.

A polished offline interface does not require a new frontend framework.

## Offline and CSP boundary

Runtime UI must remain fully functional without Internet access.

Do not add:

- CDN JavaScript/CSS;
- remote fonts;
- remote icons/images;
- analytics or telemetry calls to external domains;
- runtime dependencies on design APIs;
- inline executable patterns forbidden by the project's CSP.

Treat all document-derived text as untrusted content. Render it as text/data, not executable HTML. Never use document content to create scripts, CSS expressions, arbitrary URLs, paths or code.

## Semantic controls

Use native semantics wherever possible:

- `button` for actions, not clickable `div`;
- `input`, `select`, `textarea` for ordinary forms;
- `details/summary` for simple disclosure when appropriate;
- real links for navigation;
- dialog semantics only for decisions that truly block continuation.

When a custom control is justified — for example searchable selection, document canvas selection or a complex table editor — define its keyboard, focus, selected, disabled, loading and error contract explicitly and test it.

Do not recreate a native control only to obtain rounded styling or animation.

## Shared design tokens

The project token source owns:

- background/surface/elevated roles;
- primary/secondary/hint text;
- accent/focus/selection;
- success/warning/error/info;
- border/divider;
- spacing scale;
- control/panel/dialog radii;
- typography;
- motion durations/easing.

Use semantic variables rather than scattering literal colors, margins and radii across feature stylesheets.

For Docomator, `brand-tokens.css` is authoritative. Do not create a parallel visual theme inside a feature module.

## Layout and reflow

Build for content reflow, not fixed mockup dimensions.

Rules:

- use Grid/Flex with explicit `min-width: 0` on children that may shrink;
- avoid global `white-space: nowrap` on buttons, labels or action rows;
- avoid fixed pixel widths for long Russian labels unless the component has a bounded overflow contract;
- do not use absolute positioning for primary page layout;
- let action groups wrap/recompose at narrow widths;
- keep page-level horizontal overflow at zero at 320 px and at 200% text zoom;
- contain horizontal scroll inside truly two-dimensional surfaces such as document/table previews;
- account for fixed bottom navigation with safe content padding;
- long values wrap, truncate only when full value is still discoverable, and never overlap controls.

A narrow layout is not merely the desktop columns stacked blindly. Reconsider which secondary panels should become disclosures or selected-item detail.

## Touch targets and desktop density

Keep interactive target size at least 44 × 44 CSS px where the product contract requires it, while allowing the visible chrome to remain visually compact.

Use spacing/alignment rather than large cards to create separation. Dense registers and document tools should feel efficient on desktop without becoming tiny or inaccessible.

## State ownership

Browser state mirrors application state; it does not invent it.

For asynchronous operations:

- render the last confirmed server state;
- mark optimistic/local pending state explicitly when used;
- version requests or selections so stale responses cannot overwrite newer intent;
- disable duplicate destructive submits without hiding why;
- preserve form values after server errors;
- keep correlation/diagnostic IDs in secondary disclosure;
- do not manufacture progress percentages from timers.

If a persisted operation continues after navigation/reload, restore it from the backend rather than from an in-memory timer.

## Forms and error placement

Validation should be local to the affected field/row whenever possible.

An error message states:

1. what happened;
2. whether the user's data/input is preserved;
3. what to do next.

Keep raw stack traces, SQL/OOXML errors and English library messages out of the ordinary UI. Preserve technical detail in controlled diagnostics when the project contract allows it.

Focus the first actionable invalid field after a failed submit only when that does not unexpectedly steal focus from ongoing work. Announce important dynamic state through the project's accessibility mechanism.

## Motion implementation

Motion is subordinate to responsiveness.

For Docomator-like UI:

- use project motion tokens; routine hover/focus/state transitions are typically short (about 120–160 ms in the current product contract);
- never use `transition: all` globally;
- never animate layout properties across large document/table trees if it causes frame-by-frame reflow;
- keyboard selection and repeated row navigation are instantaneous;
- opening a contextual inspector/popover may use a short origin-consistent opacity/transform transition;
- do not scale routine buttons on press if the product visual contract forbids it;
- do not stage page elements into view one after another;
- stop spinners/pending animation immediately when the result is available;
- `prefers-reduced-motion: reduce` removes optional transitions rather than merely shortening them.

Animations must be interruptible in behavior: a new state wins immediately; queued transitions must not delay the latest user intent.

## Document canvas safety

A visual document representation is a projection, not an editable HTML document model unless the product explicitly defines one.

- render document text with safe text nodes/escaping;
- keep persisted selection identity in validated document coordinates;
- do not serialize arbitrary DOM/CSS back to Office;
- preserve scroll/selection across local inspector actions;
- avoid overlay geometry that becomes invalid after zoom/reflow without recalculation tied to the document projection revision.

## JavaScript module boundaries

Prefer feature modules with explicit responsibilities:

- fetching/domain adapter;
- state/render helpers;
- feature interaction controller;
- reusable shared primitives only when genuinely shared.

Do not monkey-patch global `fetch` or browser prototypes for feature-specific behavior when the project has a central session/network adapter. Avoid one giant `app.js` absorbing every workflow.

## Accessibility implementation

Verify:

- logical DOM/tab order follows visual/task order;
- focus is always visible;
- dialogs/popovers restore focus to their trigger;
- custom listbox/table/canvas controls have documented keyboard paths;
- status is not color-only;
- icon-only actions have accessible names and visible tooltips where appropriate;
- 200% text zoom reflows without clipping essential controls;
- dark/light/system and forced/high-contrast modes preserve structural boundaries where supported.

## Patterns

- Semantic HTML + tokenized CSS + small feature modules.
- Server-confirmed state with local pending overlays.
- Selection-driven inspector instead of permanent side-panel walls.
- Contained horizontal scrolling for explicit document/table surfaces only.
- Wrapped/recomposed actions on narrow screens.
- Local inline error + preserved input.
- Local bundled icons and assets.
- Playwright/axe acceptance for real user flows.

## Anti-patterns

- Introducing React/Vue/Tailwind merely to modernize a small established vanilla UI.
- Remote fonts/CDN assets in an offline product.
- Clickable `div` with hand-built keyboard behavior when a button would work.
- Global `nowrap`, fixed widths or `flex-shrink: 0` causing 200% reflow failures.
- Page-level horizontal scroll because a table is wide.
- `transition: all` or 300–500 ms routine animation.
- Animated button scale, bouncing success icons or staggered page entrances in a professional document workstation.
- DOM selectors or HTML serialization used as Office binding truth.
- Fake progress timers.
- Raw document text inserted as trusted HTML.
- Duplicate browser state that diverges from persisted operation state.

## Acceptance

For a material UI change, run the repository's native checks and exercise the real flow.

For Docomator-like repositories, acceptance should include as applicable:

1. JavaScript syntax/static checks and canonical UI/CSP checks;
2. user-facing language checks;
3. browser flow at 320, 768 and 1440 px;
4. 200% text zoom with no page-level horizontal overflow;
5. keyboard-only path and focus return after dialogs/popovers;
6. light/dark/system and reduced motion;
7. slow/failing API behavior with preserved input/context;
8. stale-response race after rapid selection change;
9. Playwright/axe and real-stack coverage for primary document flow;
10. runtime network inspection confirming no external asset dependency.
