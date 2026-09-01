## AI Agents Skills routing

A shared skill/agent catalog is installed on this machine. Use it by progressive disclosure, not by loading every skill body.

- Start from task intent and available skill descriptions. Activate the smallest useful set of skills.
- For multi-area UI/UX work, use `skill-agent-orchestrator`; for a single UI area, route directly to the matching skill.
- For substantial new/redesigned primary work surfaces, information/navigation/visualization architecture changes, or complaints that UI is generic/AI-looking/dashboard-like, run the `anti-slop-ui-direction` concept gate or `ui-methodology-director` before implementation. Skip it for trivial/local fixes.
- Use specialized agents only for independent, non-trivial workstreams. Prefer direct work for a small edit, one-file fix, or task requiring one continuous context.
- Available specialists: `ui-methodology-director`, `ui-ux-auditor`, `qt-interface-designer`, `meteo-workstation-designer`, `motion-interaction-reviewer`.
- For UI/design tasks, read a repository `DESIGN.md` if present. Do not load it for unrelated backend or infrastructure tasks.
- Keep the parent agent focused on requirements and decisions. Delegated agents return concise evidence, Design Direction Contracts/decisions, and file references rather than raw exploration logs.
- Preserve an accepted defining mechanism and its invariants through downstream implementation unless new evidence explicitly reopens the concept gate.
- Never apply a visual pattern merely because a library demonstrates it. First establish user intent, interaction concept/contract, information hierarchy, states, and recovery behavior.
