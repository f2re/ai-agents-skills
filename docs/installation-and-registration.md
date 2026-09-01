# Installation and registration

## Bootstrap

```bash
curl -fsSL https://raw.githubusercontent.com/f2re/ai-agents-skills/main/install.sh | bash
```

The bootstrap keeps one managed source copy under `${XDG_DATA_HOME:-~/.local/share}/ai-agents-skills`, installs the `ai-skills` launcher to `~/.local/bin` by default, then runs `ai-skills global`.

No root privileges are required.

## Supported global registrations

### Codex

- skills: `~/.agents/skills/<skill>/`
- user agents: `~/.codex/agents/*.toml`
- global instructions: managed block in `~/.codex/AGENTS.md`
- project agents: `.codex/agents/*.toml`
- project/shared skills: `.agents/skills/<skill>/`

Codex discovers skill metadata first and reads the full `SKILL.md` when selected. Existing-project integration therefore relies on native project discovery and does not rewrite repository `AGENTS.md` by default.

### Claude Code

- personal skills: `~/.claude/skills/<skill>/`
- personal subagents: `~/.claude/agents/*.md`
- user instructions: managed block in `~/.claude/CLAUDE.md`
- project skills in vendor mode: `.claude/skills/<skill>/`
- project subagents: `.claude/agents/*.md`

Specialist definitions intentionally do not use the `skills:` preload field. They identify a narrow domain and let Claude discover/invoke focused skills during execution.

Project integration does not rewrite `CLAUDE.md` by default. If semantic integration is useful, the Project Integration Architect decides whether a small compatible edit or path-scoped `.claude/rules` is appropriate.

### Google Antigravity

- current global skills: `~/.gemini/config/skills/<skill>/`
- IDE compatibility: `~/.gemini/antigravity/skills/<skill>/`
- Antigravity CLI compatibility: `~/.gemini/antigravity-cli/skills/<skill>/`
- global custom agents: `~/.gemini/config/agents/<agent>/agent.md`
- global context: managed block in `~/.gemini/GEMINI.md`
- project skills: `.agents/skills/<skill>/`
- project agents: `.agents/agents/<agent>/agent.md`

Project integration does not rewrite `GEMINI.md` by default. Antigravity can use native project skills/agents and scoped `.agents/rules` when additional routing is needed.

## Safety model

### Global installation

The CLI owns only symlinks to its managed source and text inside its managed global instruction markers.

### Existing-project integration

Project-local artifacts have priority.

`ai-skills integrate`:

- never overwrites a non-managed same-name local skill;
- never overwrites a non-managed same-name local agent;
- never automatically edits `AGENTS.md`, `AGENTS.override.md`, `CLAUDE.md`, `GEMINI.md`, `DESIGN.md`, or local rule files;
- stages only the Project Integration Architect as a project role before semantic role analysis;
- refreshes only project copies explicitly marked as managed by this package;
- generates an inventory and semantic-integration prompt under `.ai-agents-skills/`.

## Existing-project workflow

### Read-only plan

```bash
ai-skills integrate /path/to/repo --plan
```

No files are written.

### Safe structural staging

```bash
ai-skills integrate /path/to/repo
```

Adds the integration architect and:

```text
.ai-agents-skills/
├── README.md
├── PROJECT_INVENTORY.md
└── INTEGRATION_PROMPT.md
```

Existing project memory/design documents stay unchanged.

### Vendored team setup

```bash
ai-skills integrate /path/to/repo --vendor
```

Copies package-managed skills into project discovery locations while preserving same-name project-local skills.

### Agent-assisted semantic merge

```bash
ai-skills prompt /path/to/repo
```

prints the prepared prompt used by the Project Integration Architect. The agent inventories the existing system, maps existing roles to reusable capabilities, and only then decides which library agents/rules should be added or which existing project roles should be minimally augmented.

`ai-skills project ...` remains a compatibility alias for `ai-skills integrate ...`.

See [`existing-project-integration.md`](existing-project-integration.md).

## Environment variables

| Variable | Meaning | Default |
|---|---|---|
| `AI_AGENTS_SKILLS_REF` | Git ref to install | `main` |
| `AI_AGENTS_SKILLS_HOME` | Managed source directory | `${XDG_DATA_HOME:-$HOME/.local/share}/ai-agents-skills` |
| `AI_AGENTS_SKILLS_BIN` | CLI destination directory | `$HOME/.local/bin` |

## Diagnostics

```bash
ai-skills status
ai-skills list skills
ai-skills list agents
ai-skills doctor
```

`doctor` validates the source corpus and main global registrations. Existing-project non-destructive behavior is covered by the package smoke tests.
