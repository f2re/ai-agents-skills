# Platform integrations

The canonical skills live once under `.agents/skills/`. This directory contains only the thin platform-specific agent definitions and compact registration text needed to expose that catalog to different coding-agent runtimes.

- [`codex/agents`](codex/agents/) — custom Codex TOML agents.
- [`claude/agents`](claude/agents/) — Claude Code Markdown subagents; skills are discovered at runtime rather than preloaded wholesale.
- [`antigravity/agents`](antigravity/agents/) — Google Antigravity custom agents/subagents.
- [`shared`](shared/) — small managed orchestration blocks inserted into global/project instruction files.

Do not fork the skill content into each platform integration. Platform templates should route to the shared skill catalog and remain small.
