---
name: workflow-and-progressive-disclosure
description: Design adaptive multi-step workflows, imports and configuration so the system automates what it can, reveals uncertainty when needed and keeps rare complexity out of the primary interface.
---

# Workflow and Progressive Disclosure

Use for wizards, imports, document/data recognition, setup, training and multi-stage tasks.

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
9. End with result + next actions, not a dead-end “Done”.

## Progressive disclosure

Primary view shows only fields needed to make the current decision. Advanced options open in expandable sections/inspector and remember user preference where appropriate.

Do not put “Advanced” options in the primary visual hierarchy just because they exist in the backend.

## Review UI

For auto-parsed content show:
- extracted value;
- source/context when useful;
- confidence only when it informs review;
- warning on conflicts;
- clear accept/edit/ignore action;
- batch actions for repeated high-confidence rows.

## Navigation

Always provide a clear Back/Cancel path. Preserve entered data when moving backward unless reset is explicit. Prevent accidental close only if meaningful work would be lost.

## Anti-patterns

- Fixed 8-step wizard when many cases need only 2 steps.
- Asking document type before analyzing an uploaded document.
- Showing confidence percentages everywhere without actionable meaning.
- Requiring review of hundreds of high-confidence rows individually.
- Resetting the entire flow after one validation error.
- Hiding the actual imported changes behind a generic success toast.

## Acceptance

Test a simple happy path, ambiguous path, partial failure, retry, cancel/back and resume. Measure how many decisions the user must make that the system could have inferred safely.
