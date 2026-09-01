# Kafedra document-workspace patterns and anti-patterns

## Pattern: work-object first

Lead with the authoritative object and its current state. Show the next meaningful action near it. Put technical metadata, IDs and history in predictable disclosure.

**Good:** assignment title, deadline, owner, origin, status, `Выполнено`.

**Bad:** six equal cards for status, owner, source, files, comments and settings before the user can act.

## Pattern: master list + inspector

Scanning and editing should share context. On desktop, selecting a row keeps the list visible and opens a stable inspector/detail layer. On mobile, selection opens the same semantic detail as a route/sheet while preserving a reliable Back path and scroll/filter state.

## Pattern: immutable source, editable interpretation

The source file/version and machine extraction remain intact. Manual correction creates the current working fact and records who changed it; evidence remains navigable.

Never implement “editing the OCR result” by overwriting the only stored extraction.

## Pattern: immediate materialization

After upload, persist the source first, then create/materialize the safe working object as soon as deterministic data allows. Open the object actually created from that upload. Ambiguities remain editable exceptions.

Do not add a mandatory “Confirm import” page merely because parsing was asynchronous.

## Pattern: review by exception

Show unresolved rows/fields first and include enough source context to fix them. Safe rows continue through the pipeline. Review is a correction surface, not approval theater.

## Pattern: provenance chip/breadcrumb

Use compact origin text that is both readable and navigable, for example:

`Из плана кафедры · стр. 4 · строка 12`

or

`Основание: распоряжение № 18 от 03.09.2026`

The compact view may shorten evidence, but the inspector must expose the exact version/locator.

## Pattern: one primary domain action

The dominant button describes the lifecycle transition: `Выполнено`, `Принять задачу`, `В архив`, `Восстановить`, `Создать план`.

Avoid `Сохранить` as the only meaningful label when the operation has a clearer business verb.

## Pattern: contextual secondary actions

Rename, change kind, attach material, open source, history and archive belong near the object/inspector, often in a stable secondary action group or menu. Do not duplicate the same toolbar across list and detail without a distinct workflow reason.

## Pattern: local pending state

When a file is processing, only that file/row shows processing. The rest of the workspace remains usable. When an action is saving, the clicked action gives immediate feedback but persisted truth controls final state.

## Pattern: partial success with retained input

For batch upload/import, report `7 готово · 1 требует внимания · 1 ошибка` and keep successful objects usable. Retain the failed item's input and provide a targeted retry.

## Pattern: stable adaptive UX

Classify changed controls:

- `safe-default` — default may learn for a new object;
- `rank-only` — reorder options, never silently replace current/saved value;
- `domain-derived` — derive from authoritative context; stronger than learned statistics;
- `never-learn` — security, ACL, destructive/lifecycle decisions, completion, free business text.

Priority: saved domain fact → explicit current choice → domain-derived value → safe personal default → static fallback.

## Pattern: calm motion

Use motion to preserve orientation when an inspector opens, a row becomes a created object, or direct manipulation changes ordering. Routine save/filter/check actions should respond immediately and finish quietly. Reduced-motion remains semantically complete.

## Pattern: source-connected search

Search results identify object type, date/state and origin. Opening a result lands in the authoritative object's normal detail surface, not a read-only search clone.

## Pattern: reversible lifecycle

Archive/restore keeps history and source relationships. Show impact before consequential archive when linked objects matter, then return to a valid list/detail state.

---

# Anti-patterns

## Generic dashboard first

A grid of metric cards becomes the primary surface even though users actually need a calendar/list/detail workflow.

**Reject when:** the user must click through a dashboard to reach every real object.

## Card nesting

Cards inside cards are used to simulate hierarchy that typography, spacing, sections or an inspector could express more clearly.

## Backend-form UI

Every database field becomes a persistent selector. Derived values, source metadata and rare overrides consume the main surface.

## Confirmation conveyor

`Upload → Process → Review → Confirm → Apply → Approve` is mandatory even when the source is already saved and deterministic facts are safe to apply.

## Approval queue disguised as review

Every extracted fact or completed task requires a manager “accept” step. This contradicts Kafedra's exception-based and direct-completion model unless a new explicit domain requirement proves otherwise.

## Evidence hidden for minimalism

The UI looks clean by removing source/version/locator access. Visual simplicity may shorten evidence presentation, never delete its navigation path.

## Global spinner

One slow OCR/document blocks the whole Documents page or app.

## Silent failure

A failed row disappears, or a generic toast says “Something went wrong” while input/progress is lost.

## Destructive refresh

Retrying parsing/upload creates duplicate objects, reuploads a saved file, or overwrites manual corrections.

## Projection editing

Calendar/search/report rows become independent editable copies whose changes can diverge from plan item/assignment/document truth.

## Adaptive geometry

Frequently used buttons move to new positions, tabs reorder, or the default overrides a saved/current value.

## Decorative motion tax

Every navigation/filter/save uses noticeable page fades, bounce, blur or scale. Motion delays high-frequency work or makes the interface feel unstable.

## Mobile semantic downgrade

The mobile version hides source, completion or recovery actions that exist on desktop, or requires horizontal table scanning for the common task.

## Icon-only consequential action

Archive, complete, restore, delete-like, permission or approval actions are represented only by ambiguous icons.

## Fake smartness

LLM confidence or guesses are shown as confirmed facts; network/LLM failure blocks deterministic core work.
