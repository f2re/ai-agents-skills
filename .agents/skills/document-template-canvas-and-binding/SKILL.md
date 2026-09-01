---
name: document-template-canvas-and-binding
description: Design a visual DOCX/XLSX template workbench where users select real document regions, bind human-readable fields and repeats, preview safely and preserve Office structure without making browser DOM the source of truth.
---

# Document Template Canvas and Binding

Use this skill for a visual template studio: DOCX/XLSX preview, field selection, binding, repeat-row setup, trial rendering and activation.

The primary job is simple to state:

`The user points at a place in the document and tells the system what data belongs there.`

Everything else should support that job without exposing OOXML implementation details.

## Source-of-truth boundary

The visual canvas is a **bounded read-only projection** of an immutable source document.

Hard rules:

- browser DOM, CSS selectors, rendered pixel coordinates and client HTML are never the authoritative binding contract;
- selection commits only server-validated document coordinates such as stable element IDs + offsets, cell/range addresses or another project-approved Document IR coordinate;
- the renderer patches only allowed deterministic bindings;
- untouched Office structure, styles, tables, headers/footers, formulas and declared supported constructions remain preserved;
- a visual approximation must disclose unsupported or uncertain layout instead of pretending fidelity;
- LLM suggestions may propose bounded candidate IDs but never author arbitrary OOXML, paths, code or executable expressions.

## Work surface

The document itself should dominate the editor.

A strong wide-screen structure is:

1. compact document/context header;
2. large scrollable document/template canvas;
3. contextual inspector for the current selection;
4. compact local progress/readiness state.

The inspector is selection-driven. It should not permanently consume a large part of the canvas when nothing is selected.

On narrow screens, preserve the same conceptual order rather than shrinking a two-column desktop layout until it becomes unusable. The inspector can become a below-canvas section, sheet or disclosure surface. Page-level horizontal overflow is not acceptable; horizontal scrolling is contained only inside a document/table surface where two-dimensional content genuinely requires it.

## Selection model

Support only selection kinds that the backend can validate and render safely, for example:

- text/span;
- paragraph/block;
- DOCX table cell or row;
- XLSX cell/range;
- explicit repeatable row/block;
- supported header/footer element when the document model exposes it safely.

For each selection show:

- what exactly is selected in human terms;
- a visible non-color-only highlight;
- current binding, if any;
- whether the selection is scalar or repeatable;
- limitations that affect the final document.

Avoid tiny handles or ambiguous hover-only affordances. Click selects; drag extends selection only where the semantics are obvious. Provide a keyboard path for moving among selectable elements and opening the inspector.

## Binding flow

Prefer this sequence:

`select document region → choose data field/action → preview meaning → commit binding`

The field chooser should:

- show Russian/human labels first;
- search labels and aliases;
- group fields by useful user context rather than storage tables;
- show type or scope only as secondary metadata when it helps disambiguation;
- never require machine keys, UUIDs or OOXML coordinates;
- preserve the current document selection while the chooser is open.

After commit, the canvas and inspector update from confirmed server state. If commit fails, preserve selection and the pending choice so the user can repair or retry.

## Existing text and replacement meaning

A selection may already contain visible example text. The UI must make the replacement contract explicit:

- what source text/cell is used as the binding target;
- whether formatting around the replacement will be preserved;
- whether the selected content is an example, fixed text or actual generated value;
- whether a trial render is required before activation.

Do not make the user reason about runs, XML tags or content-control internals.

## Repeat rows and collections

For a repeatable table row/block, present a domain action such as:

`Повторять эту строку по списку`

Then guide the user through:

1. choose the repeated data source/collection by human name;
2. map each cell/place to a field in that collection;
3. optionally assign a supported virtual value such as automatic row numbering;
4. show an example with N rows or a bounded preview dataset;
5. state the empty-list behavior;
6. run trial/reverse-read validation before activation.

Visually distinguish the repeat zone from scalar bindings without relying on color alone. Do not leave a sample row with fake values when the empty-list contract says there should be zero rows.

Nested repeat behavior must follow the renderer contract. Do not invent nested UI capability ahead of backend support.

## Selection-driven inspector

Keep the inspector concise. A useful order is:

1. selected place/row/range;
2. current binding or `Не назначено`;
3. primary action: assign/change field or configure repeat;
4. validation/problem message;
5. trial value or preview;
6. secondary formatting/advanced options when the renderer actually supports them;
7. technical details in explicit disclosure.

Do not display every template field, coordinate and diagnostic property permanently beside the document.

## Asynchronous layout and stale state

Visual layout, preview and trial rendering may be asynchronous.

- version requests by source/template revision;
- cancel or ignore stale completions;
- keep the current usable canvas visible while a replacement is pending when safe;
- preserve the selected logical element if it still exists in the new revision;
- if the selection no longer exists, explain that the document changed and require a new selection;
- never silently bind a stale coordinate to a changed document.

## Direct manipulation

Direct manipulation is useful only when it maps to document semantics:

- drag to extend a text/range selection;
- select a whole table row with a clear row affordance;
- reorder repeated data rows in the data editor, not by visually rearranging immutable template structure unless the product explicitly supports structure editing.

Pointer interaction is preview; binding commit is explicit. A drag gesture must have a small activation threshold so ordinary clicks do not become accidental selections.

## Motion and feedback

- selection highlight: instant;
- keyboard traversal: instant;
- inspector open/close: short and interruptible only if motion improves orientation;
- binding success: immediate confirmed state, optionally a subtle short state transition;
- errors appear at the selected object/inspector; no screen shake or bouncing;
- do not animate document pagination, table geometry or text reflow merely for polish;
- reduced-motion mode keeps all state changes understandable without spatial animation.

## Patterns

- Document canvas + contextual inspector.
- Human field search instead of machine-key picker.
- Explicit scalar vs repeat semantics.
- Selection retained through validation errors.
- Trial render before activation.
- Limitation disclosure near the affected document construction.
- Server-confirmed binding shown back on the exact logical document region.

## Anti-patterns

- Treating browser DOM selector or pixel rectangle as the final binding identity.
- Re-serializing visual HTML/CSS back into DOCX/XLSX.
- Permanent three-column inspector walls that shrink the document to a thumbnail.
- Making users enter OOXML paths, cell XML, UUIDs or field keys.
- Hover-only field assignment.
- Drag-only repeat setup with no keyboard/button alternative.
- Pretending unsupported Word/Excel layout is faithfully rendered.
- Allowing stale visual layout to commit a binding after the source changed.
- Adding formatting controls that the deterministic renderer cannot preserve or validate.
- Decorative WYSIWYG animations that cause layout movement or selection loss.

## Acceptance scenarios

Verify at least:

1. select and bind a formatted DOCX text span without losing surrounding formatting;
2. bind an XLSX cell/range with empty neighboring cells and no coordinate shift;
3. configure a supported repeat row and automatic numbering;
4. change a field after a failed server commit without reselecting the document region;
5. refresh visual layout while preserving valid selection and rejecting stale completion;
6. use the main binding path with keyboard only;
7. inspect headers/footers/tables/styles/images to the degree claimed by the product, with honest limitations;
8. run trial + structural/reverse-read validation before activation;
9. verify 320/768/1440, 200% zoom, dark/light, reduced motion and no page-level horizontal overflow.
