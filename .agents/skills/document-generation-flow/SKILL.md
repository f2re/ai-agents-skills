---
name: document-generation-flow
description: Design the document-generation journey from template and audience through preflight, correction, immutable launch, progress, partial failure, retry and results without losing prepared context or exposing backend choreography.
---

# Document Generation Flow

Use this skill for the primary `Создать документы` / release flow in document-automation products.

The user intent is not “configure a generation job”. It is:

`Create the right documents for the right data set, verify that they can be created, then get the results.`

## Canonical flow

A complete flow normally contains these semantic decisions:

`template → audience/data scope → output mode → preflight → correction if needed → confirm/launch → progress → result`

Do not force every semantic decision into a separate screen. If context is already known, preserve it and skip redundant questions.

Examples:

- entering from a template preselects that template;
- entering from a named group preselects that audience;
- repeating a previous release may prefill safe values but still revalidates current data/template state;
- space remains visible context and is not another repeated wizard question.

## Generation summary

Before the costly/immutable launch, present one compact human-readable summary:

- template;
- audience: all/group/explicit selection;
- exact number of selected entities;
- output mode in user language;
- exact expected file/result count when deterministic;
- important optional delivery choice if part of the same operation;
- current preflight status;
- blocking problems, if any.

Prefer a sentence users can verify, for example:

`27 сотрудников → 27 личных карточек`

Do not make the user mentally multiply audience size by a backend enum.

## One primary action by state

Each state has one dominant next action.

Examples:

- incomplete selection → `Продолжить` / choose the missing item;
- ready for check → `Проверить и сформировать` when check and launch are intentionally coupled by the product contract;
- blocking data problems → `Исправить данные`;
- valid preflight requiring confirmation → `Сформировать`;
- running → no duplicate launch button; show progress and safe navigation;
- completed → `Открыть результаты` or `Скачать` depending on context;
- partial/error → `Повторить ошибки` when failed-only retry is supported.

Secondary actions must not compete visually with the next safe step.

## Preflight contract

Preflight is a real validation artifact, not a decorative checklist.

It should answer:

- are all required values available?
- is the selected template/version usable?
- is the audience non-empty and still valid?
- what output will be created?
- what warnings are non-blocking?
- what exact corrections are needed before launch?

Tie preflight to a revision/fingerprint of all inputs that affect it. If template, audience, mode, relevant data or other preflight inputs change:

1. mark the old preflight stale immediately;
2. do not silently keep its success state;
3. preserve user choices that remain valid;
4. rerun/require rerun according to product policy;
5. prevent launch against an obsolete preflight.

## Correction without context loss

When required values are missing or invalid, correction is part of the same user journey.

- show the entity/row/field that needs attention;
- show the problematic or missing value;
- explain the required repair;
- allow safe inline correction when the domain supports it;
- preserve template, audience and mode while correction happens;
- after correction, revalidate only the dependent state;
- do not send the user to a generic database/settings page unless the correction truly requires structural configuration.

A server error during correction must preserve entered values and the prepared generation composition.

## Immutable launch boundary

The UI should make the commit point understandable without exposing storage terms.

Before launch, the backend may create an immutable audience snapshot and job identity. The user needs to know only that:

- the shown composition is what will be created;
- later edits to groups/data do not silently change an already launched release where the domain contract freezes them;
- starting twice should not create accidental duplicates;
- leaving the page does not cancel persisted background work.

Use explicit confirmation only when it resolves material ambiguity or cost. Do not add modal confirmation to every routine release if the summary and primary action already make the consequence clear.

## Running operation

Show persisted stage truth, for example:

- data prepared;
- documents are being filled;
- structure is being checked;
- preview/delivery is being prepared, if applicable.

Never invent a percentage when the backend cannot measure it.

Communicate:

- current stage;
- completed stages;
- start/last-update time where useful;
- whether the user can leave the page;
- where the operation can be found later;
- safe cancel semantics if cancellation is supported.

A user should be able to navigate away and find the same operation in `Результаты` when the operation is persisted.

## Partial success and retry

Do not turn one failed unit into “the whole generation failed” if valid results exist.

For partial success:

- state how many succeeded and how many require attention;
- keep successful immutable results available;
- group failures by actionable cause when useful;
- provide direct correction for failed units;
- retry only failed/retryable units when the domain supports it;
- preserve idempotency so retry does not create a second successful result for already-completed units.

The user should never need to reconstruct the original audience merely to retry a few failures.

## Results handoff

Completion is not a dead-end `Готово` toast.

Show:

- what was created;
- exact result count;
- primary result action: open/download/ZIP as appropriate;
- partial or delivery status separately from generation status;
- where the result remains available later;
- next useful actions, such as another release or schedule, as secondary choices.

Do not remove downloaded results from history merely because the local download occurred.

## Interaction recomposition

Generation screens often accumulate separate selectors for template, group, mode, output, action, check and refresh.

Before preserving that cluster, ask:

- which values are already known from entry context?
- which are real independent choices?
- which are derived metadata such as expected count?
- is `Apply` or `Refresh` needed only because selectors commit incoherently?
- can preflight happen automatically after a coherent change rather than via another technical button?

The goal is fewer unnecessary decisions, not fewer semantics.

## Motion and feedback

- selection changes and keyboard navigation: instant;
- local validation acknowledgement: immediate;
- short tokenized transitions may clarify a preflight state swap or inline correction reveal;
- running stages update without theatrical progress animation;
- success/error state appears as soon as confirmed;
- never animate the primary button away without explaining the new state;
- reduced motion removes optional movement while preserving state text and focus.

## Patterns

- Prefilled generation entry from template/group context.
- Compact “N objects → M files” summary.
- Stale-preflight invalidation on every dependent input change.
- Inline correction with preserved composition.
- Persisted background operation with safe navigation away.
- Failed-only retry after partial generation.
- Result handoff that stays in history.

## Anti-patterns

- A fixed seven-step wizard for every release.
- Asking for space/template/group again when entry context already determined it.
- `Generate`, `Validate`, `Refresh`, `Apply` and `Retry` all shown as equal primary actions.
- Launching with an obsolete preflight after audience/data/template changes.
- Resetting the form after one server validation error.
- Hiding the expected output count.
- Blank page while generation runs.
- Reporting “failed” when 98 of 100 documents succeeded.
- Retrying all units when only failed ones need work.
- Success toast with no path to the generated files.
- Fake percentage or decorative progress animation.

## Acceptance scenarios

Verify:

1. template entry pre-fills template and does not ask for it again;
2. all/group/explicit audience produces the exact human-readable expected count;
3. changing any dependent input invalidates stale preflight;
4. missing data can be corrected without losing template/audience/mode;
5. server correction failure preserves entered values;
6. double-submit/idempotency does not duplicate a launch;
7. navigation away and reload finds the persisted running operation;
8. partial success keeps valid results and retries only failed units when supported;
9. restart/retry does not duplicate completed output;
10. the full flow works at 320/768/1440, 200% zoom, keyboard-only, light/dark and reduced motion.
