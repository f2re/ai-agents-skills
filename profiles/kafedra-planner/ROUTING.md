# Kafedra Planner routing

Use the smallest route that preserves domain truth. Do not turn every UI change into a full redesign ceremony.

## Route 0 — project authority

If work is being done inside an established repository, run project-first inventory before design. In `kafedra-planner`, local `AGENTS.md`, design/UX docs, GRACE contracts and local `kafedra-*` skills outrank this profile.

## Route 1 — new or materially changed workflow

Examples: new document intake purpose, a new plan-to-task flow, a new object inspector, new review semantics.

1. `kafedra-workspace-orchestrator`
2. local/project flow intake when available
3. `design-evidence-and-intent`
4. relevant Kafedra domain skills
5. `anti-slop-ui-direction` only when the primary work surface/IA itself changes
6. `kafedra-motion-continuity` decision (`no-motion` is valid)
7. implementation
8. `kafedra-ux-acceptance`

## Route 2 — cluttered existing document controls

Examples: several dropdowns plus Apply, repeated metadata actions, toolbar with upload/import/process/review controls.

1. `interaction-contracts-and-flow`
2. `dense-controls-and-selection` Interaction Recomposition
3. `kafedra-action-recomposition`
4. affected domain skill (`kafedra-document-intake`, `kafedra-provenance-and-inspector`, etc.)
5. `kafedra-ux-acceptance`

Do not invoke macro Anti-Slop if the organizing concept is already correct.

## Route 3 — document upload/import/processing

Use:

- `kafedra-document-intake`
- `kafedra-states-and-recovery`
- `kafedra-review-by-exception`
- `kafedra-provenance-and-inspector`

Add `workflow-and-progressive-disclosure` only if there is a genuinely staged setup that cannot be safely inferred. Ordinary intake should not become a wizard.

## Route 4 — list/search/navigation/inspector

Use:

- `kafedra-document-workspace`
- `kafedra-search-and-navigation`
- `kafedra-provenance-and-inspector`
- `kafedra-responsive-inspector`
- `information-hierarchy-and-density`

Add motion only for orientation/continuity, not for routine decoration.

## Route 5 — assignments, plan items and completion

Use:

- `kafedra-action-recomposition`
- `kafedra-plan-calendar-continuity` when the object originates from a plan or calendar projection
- `kafedra-provenance-and-inspector`
- `kafedra-adaptive-controls`
- `kafedra-states-and-recovery`

The primary action must remain the domain action (`Выполнено`, `Вернуть в работу`, `Принять задачу`) rather than a generic Save/Submit choreography.

## Route 6 — ambiguous extraction / review queue

Use:

- `kafedra-review-by-exception`
- `kafedra-provenance-and-inspector`
- `kafedra-search-and-navigation`
- `operator-accessibility-and-safety`

The queue contains exceptions only. It must not become a second approval lifecycle for already-safe data.

## Route 7 — responsive/mobile change

Use `kafedra-responsive-inspector` plus the affected domain skill. Desktop/mobile preserve the same authoritative object, action semantics, ACL, evidence and completion state.

## Route 8 — animation/feel

Use `kafedra-motion-continuity` plus `motion-feedback-and-microinteractions`. Add gesture skill only for true direct manipulation. Motion must have trigger, purpose, interruption, reduced-motion and measurable acceptance.

## Route 9 — plan ↔ task ↔ calendar ↔ Plan/Fact

Use:

- `kafedra-plan-calendar-continuity`
- `kafedra-provenance-and-inspector`
- `kafedra-action-recomposition`
- `kafedra-review-by-exception` when source rows or assignees are ambiguous
- `kafedra-states-and-recovery` for materialization/synchronization

Preserve the source chain. Calendar and Plan/Fact remain projections; completion updates them from the authoritative domain operation rather than asking the user to reconcile copies manually.

## Route 10 — templates / structured documents / generation

Use:

- `kafedra-template-and-structured-document-flow`
- `kafedra-provenance-and-inspector`
- `kafedra-document-intake` for generated output registration
- `kafedra-states-and-recovery`
- `kafedra-responsive-inspector` when mapping/preview must work on multiple widths

Do not turn Kafedra into a universal office editor. Keep source/preview adjacent to structured field/anchor mapping, version templates, pin historical generations to exact versions, and treat preview engines as optional capabilities.

## Agent composition

- `kafedra-workspace-orchestrator` — multi-surface Kafedra routing and synthesis.
- `document-workspace-designer` — bounded design of list/inspector/intake/search/document workflows.
- existing `ui-ux-auditor` — independent evidence/audit; combine with `kafedra-ux-acceptance`.
- existing `motion-interaction-reviewer` — only when motion/gesture work is material.
- existing `ui-methodology-director` — only for macro concept/IA changes.

## Stop conditions

Do not add another specialist when:

- the problem is local and interaction semantics are already settled;
- the same answer is already enforced by project-local authority;
- the proposed specialist would only restate another role's output;
- the next step is implementation or testing rather than more design discussion.
