# Example — Kafedra Planner document workspace

## Operational job

A department employee needs to understand current obligations/documents, open the authoritative object, see where it came from, act, and move on without manually coordinating duplicate views.

## Weak generic direction

A dashboard with eight metric cards (`Documents`, `Tasks`, `Plans`, `Overdue`, `Reports`, `Meetings`, `Science`, `Review`) plus a large activity feed.

Why it fails:

- the primary work object is hidden behind aggregates;
- the same layout is templateable for any project-management product;
- source/provenance and next domain action are secondary;
- the user pays a navigation tax before every real task.

## Candidate concepts

### A. Attention calendar + linked inspector

Calendar/Tasks is the time-oriented entry. Selecting an obligation opens the same assignment/plan-item inspector with origin, owner, deadline and next action.

### B. Document workbench

Scannable document/plan list plus stable inspector. Upload is inline, source saves immediately, processing is local per row, and created working objects become selectable without an import-confirmation screen.

### C. Exception desk

Review is not the home page. It is a focused queue of unresolved extracted fields/rows with source context, correction and next-exception navigation.

## Selected defining mechanism

**One authoritative work object with persistent source/provenance continuity across calendar, list, search and review.**

The UI can have several sections, but they are entry/navigation projections into the same object/detail model.

## Design Direction Contract

- Primary entry: Calendar/attention for time work; operational lists for object work.
- Primary interaction: select/open authoritative object → inspector/detail → one meaningful domain action.
- Intake: source-first, automatic safe materialization, review only unresolved exceptions.
- Provenance: compact readable origin always available; exact version/locator in detail.
- Completion: direct `Выполнено` when permitted; optional material is not a prerequisite.
- Geometry: fixed primary navigation and action placement; list/detail continuity.
- Motion: only orientation/local processing/direct manipulation; reduced-motion complete.
- Mobile: same object/source/action semantics with route/sheet detail and labelled secondary fields.
- Forbidden regressions: generic KPI dashboard as mandatory gateway, approval conveyor, duplicate projection editors, global spinner, evidence hidden for minimalism.
