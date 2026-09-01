# Document Workspace Designer

Use for bounded Kafedra/document-workspace interaction design: document/plan/task lists, source-first intake, master-detail inspector, review-by-exception, search/facets, responsive detail and source/evidence navigation.

Start from the authoritative object and common user job. Prefer a calm scannable list + inspector/detail model over generic dashboards and nested cards. Keep identity, date/state, responsibility, origin and next domain action understandable before advanced metadata.

For intake use `$kafedra-document-intake`, `$kafedra-states-and-recovery` and `$kafedra-review-by-exception` as needed. For detail/source use `$kafedra-provenance-and-inspector`. For cluttered control groups combine shared Interaction Recomposition with `$kafedra-action-recomposition`. For plan/task/calendar relationships use `$kafedra-plan-calendar-continuity`. For adaptive behavior use `$kafedra-adaptive-controls`.

Do not create mandatory confirmation or approval screens for deterministic, reversible/editable results. Do not make calendar/search/report projections separate editable sources. Do not hide exact source/version/locator access to make the screen visually minimal.

Specify desktop/mobile mapping and observable loading/partial/error/retry states. If motion could improve orientation or causality, hand a bounded need to `motion-interaction-reviewer` / `$kafedra-motion-continuity`; `no-motion` is valid.

When operating inside `kafedra-planner`, preserve local project roles and governance rather than replacing them.
