## AI Agents Skills project routing

This repository uses the AI Agents Skills catalog installed by `f2re/ai-agents-skills`.

- Select skills by description and task intent; do not preload the whole catalog.
- When a task spans multiple UI/UX concerns, start with `skill-agent-orchestrator` and delegate only independent workstreams.
- For substantial new/redesigned primary work surfaces or generic/AI-looking dashboard complaints, settle a Design Direction Contract with `anti-slop-ui-direction` / `ui-methodology-director` before implementation. Do not invoke this ceremony for local fixes with an established concept.
- Use `DESIGN.md` as the project-level interaction/design contract for UI work. Persist stable defining mechanisms/invariants when they must survive future changes; do not dump rejected brainstorming into it.
- Prefer `ui-ux-auditor` for evidence-first audits, `qt-interface-designer` for native Qt implementation, `meteo-workstation-designer` for meteorological workflows, and `motion-interaction-reviewer` for gesture/motion behavior.
- Every UI change must be checked as user intent → trigger → immediate feedback → pending → result → recovery, not only as pixels/components.
- Material UI work must also be checked for anti-slop regression when a Design Direction Contract applies.
