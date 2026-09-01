## AI Agents Skills project routing

This repository uses the AI Agents Skills catalog installed by `f2re/ai-agents-skills`.

- Select skills by description and task intent; do not preload the whole catalog.
- When a task spans multiple UI/UX concerns, start with `skill-agent-orchestrator` and delegate only independent workstreams.
- Use `DESIGN.md` as the project-level interaction/design contract for UI work. Update it when a stable product interaction decision changes.
- Prefer `ui-ux-auditor` for evidence-first audits, `qt-interface-designer` for native Qt implementation, `meteo-workstation-designer` for meteorological workflows, and `motion-interaction-reviewer` for gesture/motion behavior.
- Every UI change must be checked as user intent → trigger → immediate feedback → pending → result → recovery, not only as pixels/components.
