# Platform integrations

The canonical skills live once under `.agents/skills/`. This directory contains thin platform-specific agent definitions and compact global registration text used to expose that catalog to different coding-agent runtimes.

- [`codex/agents`](codex/agents/) — custom Codex TOML agents.
- [`claude/agents`](claude/agents/) — Claude Code Markdown subagents; skills are discovered at runtime rather than preloaded wholesale.
- [`antigravity/agents`](antigravity/agents/) — Google Antigravity custom agents/subagents.
- [`shared`](shared/) — compact shared routing text. Global installation may use a managed block; smart project integration does **not** inject a generic shared block into project root instructions.

Existing-project onboarding is handled by `existing-project-integration` + `project-integration-architect`. The deterministic CLI stages only that integration role and adapter metadata, then lets repository-aware semantic analysis decide whether any other role/rule should be added or mapped into an existing project role.

Do not fork the skill content into each platform integration. Platform templates should route to the shared skill catalog and remain small. Do not use platform templates as a reason to replace project-local roles with library roles.
