---
name: workflow-and-progressive-disclosure
description: Design adaptive multi-step workflows, imports and configuration so the system automates what it can, reveals uncertainty when needed and keeps rare staged complexity out of the primary interface.
---

# Workflow and Progressive Disclosure

Use this skill for **staged processes**: wizards, imports, document/data recognition, setup, training and multi-step review/commit flows.

Do not use it merely because ordinary secondary controls should move into a popover, inspector or contextual group. That spatial/control simplification belongs to `information-hierarchy-and-density` and `dense-controls-and-selection`.

## Principle

Do not make the user answer questions the system can infer reliably. Do not hide uncertainty when inference is weak.

## Adaptive flow

1. Accept the user's object/action.
2. Detect type/context automatically.
3. Show a concise interpretation summary.
4. If confidence is high and consequence low, continue with reversible defaults.
5. If confidence is medium, highlight only uncertain fields.
6. If confidence is low or consequence high, ask a focused question.
7. Show preview/diff before costly irreversible import.
8. Execute with per-stage status.
9. End with result + next actions, not a dead-end `Done`.

## Progressive disclosure inside a staged flow

The current stage shows only fields needed for its decision. Advanced/rare options open on demand and can remember user preference where appropriate.

Do not put backend options into the primary hierarchy simply because they exist.

## Review UI

For auto-parsed content show:
- extracted value;
- source/context when useful;
- confidence only when actionable;
- warning on conflicts;
- clear accept/edit/ignore action;
- batch actions for repeated high-confidence rows.

## Navigation

Always provide clear Back/Cancel. Preserve entered data when moving backward unless reset is explicit. Prevent accidental close only if meaningful work would be lost.

## Anti-patterns

- Using this skill for a simple toolbar/control-panel cleanup.
- Fixed 8-step wizard when many cases need only 2 steps.
- Asking document type before analyzing an uploaded document.
- Showing confidence percentages everywhere without actionable meaning.
- Requiring review of hundreds of high-confidence rows individually.
- Resetting the whole flow after one validation error.
- Hiding actual imported changes behind a generic success toast.

## Acceptance

Test simple happy path, ambiguous path, partial failure, retry, cancel/back and resume. Measure decisions the user must make that the system could safely infer.
