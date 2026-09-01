---
name: design-evidence-and-intent
description: Reconstruct the real design and interaction contract of an existing product before changing UI; separate evidence, user intent, product rules and subjective preference.
---

# Design Evidence and Intent

Use before auditing or changing an existing product surface.

## Evidence order

Inspect in this order:
1. explicit `DESIGN.md`, product requirements and UI guidance;
2. design tokens, palettes, fonts, spacing constants and style helpers;
3. shared controls and their variants/states;
4. representative screens that actually consume them;
5. local one-off implementations;
6. screenshots/runtime behavior when available.

Do not promote a one-off value into a design-system rule just because it repeats twice.

## Intent ledger

For every primary surface, record:

| Field | Question |
|---|---|
| User | Who performs the task? |
| Goal | What decision/result are they trying to reach? |
| Frequency | Once, daily, dozens/hundreds per shift? |
| Criticality | What happens if they misread/misclick? |
| Entry | How do they arrive here? |
| Primary object | Map, plot, document, row, task, forecast term? |
| Primary action | What should be easiest? |
| Context | What must remain visible while acting? |
| Exit | What signals completion? |

## Proof rule

A finding is strong only when you can connect:
`evidence → violated contract → observable consequence → one correction`.

Visual impressions such as “too busy”, “too empty”, “not Apple-like” are hypotheses until tied to hierarchy, spacing rhythm, task frequency, state visibility or another explicit principle.

## Patterns

- Reuse established spacing/token/primitive when it already expresses the intended contract.
- Preserve deliberate domain density when simplifying.
- Treat rendered behavior as evidence for interaction, not just source structure.
- Record explicit exceptions instead of normalizing them away.

## Anti-patterns

- Inventing a product intent from a screenshot.
- Replacing a working dense expert UI with large consumer cards because it looks modern.
- Calling every repeated literal a token.
- Treating backend field names as acceptable user labels.
- Mixing functional bugs and visual findings without identifying their different root causes.

## Acceptance

Before proposing a redesign, be able to state the top 1–3 user jobs and why each proposed change reduces ambiguity, interaction cost or visual competition for those jobs.
