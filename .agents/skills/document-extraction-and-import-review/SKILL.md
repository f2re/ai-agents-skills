---
name: document-extraction-and-import-review
description: Design automatic-first DOCX/XLSX extraction and structured import review so users see a proposed interpretation, correct only ambiguity, repair row/cell problems in place and explicitly commit data without re-uploading files.
---

# Document Extraction and Import Review

Use this skill for document/data intake where the system analyzes DOCX/XLSX, proposes structured datasets and may later import confirmed values into application storage.

The primary interaction model is **automatic first, correction second**.

Do not begin with a blank mapping wizard if the system can safely derive a useful proposal from the document structure.

## User intent

The user wants to:

`Give the system a document, see what it understood, correct mistakes, then use or import the structured result.`

The user should not need to understand Document IR, workbook XML, source SHA, row indexes in storage or field keys to achieve this.

## Canonical flow

A strong flow is:

`file/drop → automatic analysis → proposed structure/result → focused review → corrections → explicit import/export/use`

For ordinary CSV/XLSX typed import, preserve the canonical semantic sequence when needed:

`file → columns → mapping → preview → repair → import → result`

These are compatible models: automatic analysis should prefill as much of the mapping/review as evidence allows, while still making uncertainty visible.

## File entry

Provide both:

- a visible file picker;
- drag-and-drop on a clearly labeled drop target.

The same downstream UI should handle supported CSV/XLSX import consistently; document extraction may additionally accept supported DOCX.

Rules:

- show supported formats and limits before upload;
- indicate which file is being analyzed;
- duplicate/unsupported/corrupt files receive specific state, not a generic failure;
- preserve the selected file and configuration after recoverable errors;
- do not require re-upload merely to fix mappings or cell-level problems.

## Automatic proposal

After analysis, show what the system found rather than another setup form.

Useful result states are human categories such as:

- `Готово` — interpretation is structurally clear;
- `Нужно проверить` — one or more ambiguities need a decision;
- `Не определено` — the system could not safely infer a required relationship.

Do not show raw confidence percentages unless they change what the user should do.

For each proposed dataset/field, make available:

- human name;
- inferred type;
- representative values;
- source location/context when it helps review;
- whether it is scalar, table/repeated data or another supported structure;
- problems requiring a decision.

The automatic result is immutable evidence. User corrections are a separate layer and must not rewrite what the system originally detected.

## Source-linked review

A correction is easiest when the user can see where a value came from.

When possible, visually connect the structured result with the source paragraph/cell/row using validated document coordinates or bounded source context.

Patterns:

- selecting a proposed field highlights the source region;
- selecting a source row highlights the extracted record;
- an error row exposes the raw value and exact source column/cell;
- batch navigation moves to the next unresolved problem without losing scroll/context.

Do not use browser DOM selectors as persisted source identity.

## Corrections

Support only corrections that map to a safe domain contract, for example:

- rename the proposed field label;
- change an inferred supported type;
- exclude a field/region;
- classify scalar vs repeat/table where supported;
- change a mapping to an existing property in the current space;
- correct a value in preview when policy allows it;
- explicitly create a new property through a guided mutation when required.

Corrections should be reversible until the explicit import/use commit.

Do not silently create global/user fields because a column name looks unfamiliar.

## Structured errors

Errors originate machine-readable in domain/API, then receive user-facing Russian copy.

A useful problem contract contains stable machine fields such as:

- `code`;
- scope/blocking effect;
- physical source row;
- source column/cell or target property when known;
- raw problematic value;
- severity;
- suggested action;
- repair parameters.

UI messages built on that contract answer:

1. what is wrong;
2. where it is wrong;
3. whether other data is still usable;
4. what exact action fixes it.

Never reconstruct row/field semantics by regexp parsing a Russian error sentence.

## Preview repair

Prefer repairing simple issues directly in preview:

- highlight the affected row/cell/value;
- focus the actual field that needs correction;
- preserve mappings and other corrected rows;
- validate locally where safe, then confirm against the server;
- keep successful/valid rows visible while a subset has errors;
- make explicit whether partial import is allowed by policy.

Blank values must follow the product's data policy. Do not interpret a blank imported cell as an instruction to erase an already confirmed stored value unless the user explicitly performs a clear operation.

## Mapping memory and space boundary

Automatic suggestions and remembered mappings are scoped to the current product/data boundary.

For Docomator-like spaces:

- match only property definitions from the current space;
- identical names/keys in another space must not leak into suggestions;
- preview/read never claims ownership or creates a property definition;
- explicit import mutation receives the current space;
- cross-space links are rejected before commit.

A minimal UI must not hide the current space when it changes the meaning of a mapping.

## Explicit commit boundary

Analysis, preview and correction are not the same as importing into the main database.

The user must have a clear action such as `Импортировать` or `Применить` that states what will change.

Before commit, summarize:

- source file/document;
- number of valid rows/records;
- number of unresolved blocking problems;
- target data type/context;
- whether partial import will occur;
- fields that will be created, only if explicitly approved.

After commit, show counts and next actions. Do not hide the outcome behind a generic success toast.

## Batch documents

For multiple documents, show one compact row/status per file with an aggregate summary.

The user should be able to:

- see which documents are ready, need review or failed;
- open the next unresolved document directly;
- apply safe repeated corrections/mappings in batch only when semantics are truly the same;
- keep completed documents untouched while correcting another;
- distinguish duplicate bytes from genuinely separate documents according to product policy.

Avoid a giant card per file.

## Responsive table behavior

A table may need two-dimensional scrolling; the page should not.

At narrow widths:

- contain horizontal scrolling inside the explicit table/preview surface;
- keep the current error/action reachable without scrolling the whole page sideways;
- allow critical row identity and problem status to remain understandable;
- use stacked detail for the selected row when that is clearer than compressing every column;
- preserve 44 × 44 interactive targets and visible focus.

Test 200% text zoom separately from ordinary responsive width.

## Motion and feedback

- selecting rows/source regions: instant;
- drag/drop acceptance: immediate static/short feedback, not a decorative upload animation;
- opening selected-row repair detail may use a short interruptible transition;
- error highlighting never flashes repeatedly;
- progress uses real stage/status, not fake percentages;
- large batch result updates should not animate every row one after another;
- reduced motion removes nonessential spatial transitions.

## Patterns

- Automatic proposal shown immediately after analysis.
- Source-linked result review.
- Immutable automatic result + separate correction layer.
- Structured row/cell errors with direct repair.
- Mapping preserved after a failed server request.
- Explicit import commit after preview.
- Current-space field suggestions only.
- Batch register ordered by unresolved attention.

## Anti-patterns

- Starting every import with an empty manual mapping grid despite a reliable automatic proposal.
- Showing confidence scores that do not change the action.
- Parsing Russian message text to recover row/column/error codes.
- Resetting file, mapping and corrections after one invalid row.
- Requiring re-upload after a preview correction.
- Creating a property merely because a header was unknown.
- Treating blank cells as implicit destructive clears.
- Persisting DOM selectors as document source coordinates.
- Page-level horizontal overflow caused by a wide preview table.
- One modal dialog per invalid row.
- Decorative progress animation for document analysis.

## Acceptance scenarios

Verify at minimum:

1. DOCX key/value and table extraction produces an automatic proposal without manual setup;
2. XLSX table with blank cells, mixed types, Excel dates, embedded newlines and duplicate/blank headers preserves physical coordinates;
3. a renamed/reordered/missing structure becomes an explicit problem rather than a silent column shift;
4. source selection and result selection stay visually linked where supported;
5. correction survives a server error and page state remains usable;
6. preview repair does not require re-upload;
7. explicit import uses only current-space fields and negative two-space tests pass;
8. repeat import is idempotent according to product policy and blank values do not silently erase confirmed data;
9. batch 1/10/100 files exposes individual status without card sprawl;
10. 320/768/1440, 200% zoom, keyboard/focus, light/dark, reduced motion and no page-level horizontal overflow pass.
