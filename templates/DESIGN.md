# DESIGN.md — Product interaction contract

This file stores stable product-level UI/UX decisions. It is not a dump of every component style and should not duplicate individual skills.

## Users and primary jobs

- Who operates the product?
- What are the 3–5 highest-frequency jobs?
- Which actions are safety/time critical?

## Design direction

Record this section only when a substantial primary work surface has a durable accepted concept.

- Defining operational idea:
- Primary work object:
- Supporting mechanism(s), if any:
- Anti-slop/domain invariants:
- Rejected generic defaults that must not reappear:
- Non-goals:

Do not store alternative brainstorming here. If the concept changes, add the new dated decision under `Decisions`.

## Information hierarchy

- Primary work surface:
- Persistent primary controls:
- Contextual/secondary controls:
- Details hidden behind progressive disclosure:

## Interaction contracts

For every important workflow document:

`intent → trigger → immediate feedback → pending → result → recovery → next action`

## Navigation and selection

- Spatial navigation:
- Time navigation:
- Selection behavior:
- Keyboard path:
- Mouse/trackpad gestures:

## Loading and data states

- Loading:
- Partial:
- Stale:
- Empty:
- Error:
- Cancel/retry:

## Motion

Motion must communicate causality, state or spatial continuity. Record only exceptions or project-specific motion decisions here.

## Domain semantics

Record domain-specific labels, units, temporal/model semantics, uncertainty rules and operator-safety constraints.

## Decisions

Add dated decisions only when they are stable enough that future agents must preserve them.
