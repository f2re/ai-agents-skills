---
name: anti-slop-ui-direction
description: Use before substantial new or redesigned UI surfaces to derive a domain-specific interaction concept, reject generic AI/dashboard defaults, and emit a Design Direction Contract before implementation; supports document workstations, meteorology and other professional domains.
---

# Anti-Slop UI Direction

This skill is a **concept gate**, not a visual style guide and not a replacement for domain, platform, interaction or audit skills.

Its job is to stop a substantial interface from reaching implementation with only a generic layout, fashionable styling or component inventory as its design idea.

## Activate when

Use this skill before implementation if the task materially changes any of the following:

- a primary work surface or main screen;
- information architecture or navigation model;
- scientific/data/document visualization architecture;
- a high-frequency operator workflow;
- the relationship between a primary work object and its inspector/comparison/history views;
- a UI described as generic, AI-looking, dashboard-like, "make it modern", "make it professional", or "not neural slop".

Do **not** invoke it for a local label rename, padding fix, one-control bug, isolated state fix or other change whose interaction concept is already settled.

## Inputs

Before concept work, establish only the evidence needed for the decision:

- primary user and top operational job;
- frequency/criticality of that job;
- primary work object and required context;
- existing `DESIGN.md`/product decisions when present;
- actual stack and implementation constraints;
- domain semantics that cannot be compromised.

Use `design-evidence-and-intent` when evidence or user intent is unclear. Do not preload the entire UI catalog.

For an established repository, project-local requirements, architecture and implementation files outrank reusable examples in this skill.

## The concept ritual

### 1. State the operational question

Complete internally:

`The user opens this surface in order to answer/do ______.`

Then identify the **primary work object**: the document, template, generation composition, extracted dataset, map field, atmospheric state, time interval, selected entity, comparison, image, etc.

Controls are not the primary object unless controlling the system is itself the user's job.

### 2. Generate three genuinely different concepts

Generate three alternatives that differ in **interaction or information architecture**, not in styling.

Invalid alternatives:

- sidebar left / sidebar right / tabs;
- dark / light / high-contrast theme;
- cards / fewer cards / rounded cards;
- the same dashboard with different spacing.

Valid alternatives change what the interface treats as the organizing object or mechanism, for example:

- document route/readiness is the spine;
- the document itself is the interaction surface;
- results/history organize repeat operational work;
- time is the spine;
- disagreement is the data;
- map selection drives all views;
- focus + context around one primary object;
- direct manipulation instead of configuration-first controls.

Load `references/concept-mechanisms.md` only if ideation is weak or the domain matches an example there.

For a Docomator/document-automation task, `references/examples/docomator-document-workbench.md` contains three worked **mechanisms** — route-led workbench, document canvas + contextual inspector, and result-first register. Use it as a comparison aid, not as a mandatory screen template.

### 3. Run four rejection tests

#### Genericity test

Mentally substitute the domain data with an unrelated domain. If the **primary work surface and interaction model** remain equally natural, the concept is probably generic and must be reconsidered.

Examples:

- meteorology: temperature → revenue, forecast models → sales regions;
- document automation: template → campaign, audience → leads, generated files → generic KPI cards.

If a Docomator proposal still works unchanged as a CRM/dashboard after changing labels, it likely lacks document-specific organizing logic such as document-region binding, exact generation composition, revision-bound preflight or source-linked extraction.

Do not apply this test to standard platform primitives such as dialogs, menus, toolbars, combo boxes or tables. Standard controls should remain standard unless the workflow requires otherwise.

#### Templateability test

Ask whether the same layout could become a different product by changing only labels, imagery, accent color and data series. If yes, the concept is too template-driven for a primary domain surface.

#### Domain-truth test

Ask what information would make the interface materially misleading or unsafe if omitted, conflated or visually weakened. Domain truth outranks novelty.

For document automation this commonly includes:

- current data/space context;
- template/source/version identity;
- validated document coordinates rather than browser DOM as binding truth;
- stale/current preview/preflight revision;
- exact expected output count/mode;
- explicit preview/import or check/launch boundary;
- immutable launched/result identity;
- structured errors and partial/retry state;
- untrusted document/LLM constraints.

For meteorology this commonly includes valid time, observation/forecast distinction, model/run/cycle, units, source, freshness, missing data and uncertainty.

#### Implementation-reality test

Reject or adapt a concept that depends on fake interactions, brittle absolute positioning, inaccessible pointer-only behavior, unreasonable custom painting, or an implementation strategy that fights the target stack.

For current Docomator, map the concept to its local offline HTML/CSS/JavaScript architecture, semantic controls, canonical brand tokens, CSP/offline constraints and browser acceptance tests. Do not route it to Qt merely because this library also contains Qt skills.

For Qt/Qwt, prefer concepts that map cleanly to layouts, model/view, signals/slots, native focus/keyboard behavior, QStyle/palette/tokens and Qwt interaction primitives.

See `references/genericity-tests.md` for scope and failure examples.

### 4. Select one defining mechanism

Choose one primary mechanism and at most one or two supporting mechanisms. More mechanisms are not automatically better.

Write:

`The defining operational idea of this interface is ______.`

A layout, palette, visual effect or component name is not a defining operational idea.

A product may legitimately use different supporting mechanisms on different surfaces. For example, Docomator may use a route-led global workbench, document-canvas interaction in the template studio and an operation register in Results. Do not force all mechanisms onto every screen.

### 5. Classify constraints

Use three levels rather than turning anti-slop into another rigid style:

- **FORBIDDEN** — violates correctness, safety, accessibility or explicit product/domain contract;
- **REJECT BY DEFAULT** — common generic/decorative default with poor task justification;
- **ALLOW WITH JUSTIFICATION** — potentially useful pattern whose purpose must be stated.

Load `references/professional-desktop-antipatterns.md` only when visual/layout decisions are material.

## Design Direction Contract

Before implementation, emit a compact internal handoff with this structure:

```text
PRIMARY JOB
...

PRIMARY WORK OBJECT
...

DEFINING MECHANISM
...

CONCEPTS CONSIDERED
A. ...
B. ...
C. ...

SELECTED / WHY
...

ANTI-SLOP TESTS
Genericity: PASS/FAIL + reason
Templateability: PASS/FAIL + reason
Domain truth: PASS/FAIL + invariants
Implementation reality: PASS/FAIL + constraints

INVARIANTS
- ...

NON-GOALS
- ...

PRIMARY SKILLS
- ...

SUPPORTING SKILLS
- ...

NOT NEEDED
- ...
```

Keep it concise. It is a decision contract, not hidden chain-of-thought and not a transcript of brainstorming.

## Routing and handoff

After the concept gate:

1. choose the smallest relevant domain/interaction/implementation skill set;
2. delegate only independent specialist workstreams;
3. give specialists the selected mechanism, invariants and non-goals;
4. domain/platform/motion specialists may refine implementation but must not silently replace the defining mechanism;
5. if implementation evidence invalidates the concept, explicitly return to this gate and revise the contract.

For Docomator/document work, typical downstream routes are `document-workstation-ux` plus only the needed `document-template-canvas-and-binding`, `document-generation-flow`, `document-extraction-and-import-review`, `offline-web-interface-engineering`, state/recovery, workflow, recomposition and motion skills.

For meteorological Qt work, typical downstream routes are `meteorologist-workstation-ux`, `meteorological-visualization`, `time-data-navigation`, `viewport-map-interactions`, `qt-cpp-design-system`, `information-hierarchy-and-density` and only the additional skills actually needed.

## Post-implementation regression gate

After a material implementation, ask before final acceptance:

- Is the defining operational idea still visible in the real UI?
- Did implementation collapse back into cards + toolbar + combo + generic content?
- Does the primary work object still dominate secondary chrome?
- Were domain invariants preserved?
- Was any decoration added without informational, state or interaction purpose?
- Does the implemented interaction still pass the genericity and implementation-reality tests?
- Did the implementation stay native to the actual project stack?

For document work additionally ask whether browser representation, stale preview/preflight or visually simplified import/retry accidentally weakened source/data truth.

Then run `ui-audit-and-acceptance`. Anti-slop regression does not replace behavioral acceptance.

## Patterns

- Concept before component inventory.
- Domain structure drives the work surface.
- One defining mechanism, few supporting mechanisms.
- Standard controls remain standard; uniqueness is concentrated in domain work.
- Document workbench organized by route/canvas/composition/result rather than generic cards.
- Progressive disclosure of skills and references.
- Durable concept invariants go to project design memory; rejected brainstorming does not.

## Anti-patterns

- One giant design prompt loaded for every UI task.
- Treating "anti-slop" as a fixed palette, theme or aesthetic.
- Generating three cosmetically different versions of the same layout.
- Forcing novelty into standard desktop controls.
- Replacing domain truth with visual drama.
- Declaring cards, animation or gradients universally forbidden without considering purpose.
- Copying a meteorological map/time concept into a document product just because it was successful elsewhere.
- Calling a generic dashboard “document-specific” because it uses paper colors/icons.
- Letting a downstream implementation specialist silently redefine the product concept.
- Saving all brainstorming and transient alternatives into project design memory.
