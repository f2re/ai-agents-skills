# Docomator document-workbench concept example

Use this example only when `anti-slop-ui-direction` needs help generating genuinely different document-automation concepts. It is not a template that every Docomator screen must copy.

## Operational question

`The user opens the product in order to prepare reliable documents from known data/templates, resolve only the blocking ambiguity and retrieve the result.`

Primary work object depends on surface:

- template setup → the document itself;
- release → the exact generation composition;
- extraction → the interpreted source/result pair;
- results → the operation/result register.

## Concept A — Route-led document workbench

Defining mechanism: `Данные → Шаблон → Выпуск → Результат` is a persistent readiness/navigation spine. The current unfinished or attention-requiring stage becomes the primary task.

Strengths:

- teaches the product without a fixed tutorial;
- preserves location and next action;
- maps directly to Docomator's durable workflow;
- allows entry from any stage with prefilled context.

Risks:

- can degrade into a decorative stepper if stages are not driven by factual backend readiness;
- must not force every task through all four screens.

Best for: home/navigation and overall workflow orientation.

## Concept B — Document canvas + contextual inspector

Defining mechanism: the document is the interface. Selecting a text/cell/row/range reveals only the actions valid for that region.

Strengths:

- direct relationship between user intent and binding target;
- maximizes document fidelity/space;
- eliminates permanent backend-oriented field/binding panels;
- naturally supports source-linked extraction review.

Risks:

- requires explicit server-validated selection identity;
- keyboard/focus and narrow-screen inspector behavior must be designed carefully;
- cannot pretend browser DOM is Office truth.

Best for: Visual Template Studio and source-linked extraction review.

## Concept C — Result-first operation register

Defining mechanism: the user navigates by concrete operations/results; each row carries preparation/progress/problem/result state and can be opened into its composition/history.

Strengths:

- strong for repeated operational use;
- foregrounds persisted/recoverable background work;
- natural partial failure/retry/history model.

Risks:

- weak as the first-run teaching model;
- can feel like a job queue/admin console if composition and human labels are secondary.

Best for: Results/history and advanced repeat users, not as the sole product IA.

## Selected combination for current Docomator

Use **A as the global organizing mechanism** and **B/C as surface-specific mechanisms**:

- global: route-led document workbench;
- template/extraction: document canvas + contextual inspector;
- results/background work: attention-ordered operation register.

This is not “three concepts combined everywhere”. Each mechanism owns the surface where it expresses the primary job most directly.

## Anti-slop tests

### Genericity

PASS only if replacing document data with generic sales metrics would make the organizing logic unnatural. The route, source/binding semantics, exact generation composition and immutable results should remain specifically document-oriented.

A generic left-nav + KPI cards + filters fails even if styled like paper.

### Templateability

PASS when the primary surface cannot become a CRM/BI dashboard merely by changing labels/colors. Document region selection, binding/repeat, preflight/output count and source-linked extraction are domain mechanisms, not decoration.

### Domain truth

Must preserve:

- current space when it changes data meaning;
- source/template/version identity;
- validated Document IR binding coordinates;
- immutable source/result boundaries;
- revision-bound preview/preflight;
- exact expected output count;
- explicit import/mutation boundary;
- partial/retry truth;
- structured error location/value/action;
- offline/untrusted-document constraints.

### Implementation reality

For current Docomator:

- local offline HTML/CSS/JavaScript, not Qt;
- semantic web controls where possible;
- `brand-tokens.css` is canonical;
- no CDN/remote fonts/framework migration without project decision;
- Playwright/a11y/reflow tests;
- document canvas is a projection, not an HTML editor serialized to Office.

## Invariants

- One primary next action per state.
- Primary work object dominates secondary chrome.
- Known context is carried forward rather than re-requested.
- Rare settings are disclosed contextually.
- Async state cannot silently become stale/current ambiguous.
- Errors preserve input and state what happened, what was saved and what to do next.
- Motion never delays frequent work or changes domain meaning.

## Non-goals

- Literal macOS clone.
- Paper/page-flip animation theme.
- AI-themed visual effects.
- New frontend framework.
- Browser-based OOXML authoring.
- Hiding provenance or diagnostics completely.
- Reducing every flow to the fewest possible widgets regardless of semantic clarity.
