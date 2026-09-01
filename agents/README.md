# Specialist agent compositions

These are platform-neutral descriptions of the roles registered by `ai-skills`. Native definitions live under `integrations/codex/agents`, `integrations/claude/agents` and `integrations/antigravity/agents`.

| Agent | Purpose |
|---|---|
| [`ai-skills-orchestrator`](ai-skills-orchestrator.md) | Routes complex work, chooses minimal skills/specialists, integrates results. |
| [`ui-methodology-director`](ui-methodology-director.md) | Concept gate for substantial redesigns; rejects generic/template solutions and returns a Design Direction Contract. |
| [`ui-ux-auditor`](ui-ux-auditor.md) | Evidence-based interface and interaction audit. |
| [`qt-interface-designer`](qt-interface-designer.md) | Native Qt/C++ UI architecture and implementation. |
| [`meteo-workstation-designer`](meteo-workstation-designer.md) | Meteorological workstation, radar/time/map/scientific UX. |
| [`motion-interaction-reviewer`](motion-interaction-reviewer.md) | Motion, gestures, direct manipulation and interaction feedback. |

Specialists are intentionally narrow. They should not all be invoked for every UI task. The methodology director is normally used sequentially before implementation specialists, not in parallel with competing concept work.
