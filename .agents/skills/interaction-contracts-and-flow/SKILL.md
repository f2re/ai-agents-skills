---
name: interaction-contracts-and-flow
description: Analyze and design complete user interaction contracts from intent through immediate feedback, asynchronous work, success, failure, cancellation and recovery; find click tax and expectation mismatches.
---

# Interaction Contracts and Flow

Audit the interface as behavior, not a screenshot.

## Contract template

For every important action write:

`intent → trigger → precondition → immediate acknowledgement → pending behavior → result → recovery → next likely action`

Also record:
- keyboard path;
- pointer/gesture path;
- whether action is reversible;
- frequency;
- latency class;
- context that must remain stable.

## Immediate acknowledgement

The UI must react within the next frame or effectively immediately after input even if data will take seconds. Examples:
- selected timeline slot changes visual state to pending;
- button becomes busy while preserving label/context;
- map shows local layer loading badge;
- optimistic state only when rollback is safe.

No silent clicks.

## Async transitions

Prefer preserving the last valid content while new content loads. Mark it as old/stale if necessary. Replace only when new result is ready.

Cancel/coalesce stale requests after rapid input. A response for an older time/zoom/model must not overwrite the newest selection.

## Click tax audit

For each top task count:
- clicks/keystrokes;
- pointer travel;
- popup open/close cycles;
- context switches;
- waits.

Flag an interaction when a frequent action needs an avoidable intermediate popup/menu/page.

## Expectation mismatch audit

Ask:
- Does clicking this label do what its wording suggests?
- Does wheel/drag affect the object under the pointer?
- Does Back/Cancel restore prior state?
- Does selection persist while data refreshes?
- Can the user distinguish requested state from loaded state?
- If a mode switch changes data source/resolution, is that visible?

## Patterns

- Direct mode switch for frequent view changes.
- Local pending marker near the object being loaded.
- Preview while dragging, commit on release for expensive operations.
- Retry at the failed layer/task, not only global retry.
- Undo for cheap reversible destructive changes instead of modal confirmation.

## Anti-patterns

- Click produces no visible reaction until server response.
- Whole window blocks because one optional layer reloads.
- User chooses time T2 but old request T1 later overwrites it.
- One wheel gesture unexpectedly changes zoom, time and model.
- Modal opens for trivial choices that could be inline.
- Repeated confirm dialogs for routine safe actions.
- Hidden hover-only action with no keyboard/discoverable alternative.

## Audit output

For each root problem report:
- user expectation;
- actual behavior;
- cost/risk;
- proposed interaction contract;
- affected controls/states;
- acceptance scenario.
