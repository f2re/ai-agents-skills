# Kafedra Planner reference flows

These flows are interaction references, not hardcoded screen mockups. Reuse existing domain contracts in the target repository.

## 1. Document intake → working object

```text
User drops/selects files
  ↓ immediate
Each source gets its own row: name + "Сохранено" / local upload progress
  ↓
Immutable version registered; UI can leave upload surface
  ↓ async per file
Extraction/classification/materialization
  ├─ ready → created/updated object becomes navigable and selected when this upload initiated it
  ├─ needs attention → object remains usable; unresolved fields/rows appear in Review
  └─ failed → source remains saved; targeted retry/process diagnostics
```

Rules:

- one file cannot block others;
- do not ask the user to choose parser/OCR engine in the common path;
- do not require an import confirmation if deterministic materialization is safe and reversible/editable;
- retry must not upload the same saved source again;
- the result must link back to exact `document_version` and locator/evidence.

## 2. Plan document → source rows → plan items/tasks

```text
Plan source
  ↓
Preserve actual tables/rows/cells/unknown columns
  ↓
Materialize safe proposed plan items
  ├─ exact responsible match → domain-derived assignment
  ├─ ambiguous responsible → keep raw value, no guess
  └─ one source row may split into several plan items
  ↓
Calendar projection and optional assignment
```

UI shape:

- plan is the main object;
- source row context is available in its inspector;
- exceptions are sorted first but do not hide ready rows;
- splitting a row is a direct editing action, not a second import wizard;
- repeat materialize/save updates existing links idempotently.

## 3. Assignment → completion

```text
Open assignment
  ↓
See title · deadline · assignees · origin · progress/history
  ↓
Optional progress/comment/material
  ↓
Выполнено
  ↓ transaction
Assignment + linked plan item + calendar + plan/fact projection reflect completion
```

`Выполнено` is the primary action when permitted. A report file is optional. Manager approval is not inserted into the main path. `Вернуть в работу` is a separate reversible domain action.

## 4. Review by exception

```text
Review
  ↓
Filter/group unresolved facts or source rows
  ↓
Select exception
  ↓
Inspector shows source excerpt/cell + candidate + reason for ambiguity
  ↓
Choose/enter correction
  ↓
Persist correction; evidence and original extraction remain
  ↓
Advance to next exception without full-page reload
```

The queue empties because exceptions are resolved, not because a manager “accepted” every safe item.

## 5. Search → authoritative detail → back

```text
Search term / facets
  ↓
Grouped or typed result rows with date/state/origin
  ↓
Open result in normal object inspector/detail
  ↓
Follow source or linked object if needed
  ↓
Back restores query, filters, selection context and scroll
```

Search is navigation, not a second read-only object system.

## 6. Archive / restore

```text
Object inspector
  ↓
В архив
  ↓ when links make consequence non-obvious
Impact summary + optional reason / valid successor
  ↓
Archive transaction
  ↓
Working list removes item; archive remains searchable and restorable
```

Do not rewrite old evidence to point to the successor. The successor is navigation, not history mutation.

## 7. Desktop master/detail

```text
[stable nav] [scannable list/table] [inspector]
```

- list selection changes inspector without losing list context;
- source/history/rare actions live in predictable inspector sections;
- primary action remains visible without competing toolbars;
- filters stay near the list they affect.

## 8. Mobile equivalent

```text
[content]
[fixed primary navigation]
```

List → detail route/sheet carries the same facts/actions as desktop. Secondary table columns become labelled detail. Source/completion/recovery actions are never hover-only or removed.

## 9. Processing/offline capability degradation

If optional OCR/preview/LLM is unavailable:

- state the missing capability locally;
- preserve native source/download and deterministic extraction already available;
- keep manual correction and other documents usable;
- offer capability diagnostics/retry without presenting core work as failed.
