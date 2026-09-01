# Installation and registration

## Bootstrap

```bash
curl -fsSL https://raw.githubusercontent.com/f2re/ai-agents-skills/main/install.sh | bash
```

The bootstrap keeps one managed source copy under `${XDG_DATA_HOME:-~/.local/share}/ai-agents-skills`, installs the `ai-skills` launcher to `~/.local/bin` by default, then runs `ai-skills global`.

No root privileges are required.

## Supported registrations

### Codex

- skills: `~/.agents/skills/<skill>/`
- user agents: `~/.codex/agents/*.toml`
- global instructions: managed block in `~/.codex/AGENTS.md`
- project agents: `.codex/agents/*.toml`
- project/shared skills: `.agents/skills/<skill>/`

Codex discovers skill metadata first and reads the full `SKILL.md` when it selects the skill. The repository therefore keeps descriptions specific enough for routing and avoids one monolithic design skill.

### Claude Code

- personal skills: `~/.claude/skills/<skill>/`
- personal subagents: `~/.claude/agents/*.md`
- user instructions: managed block in `~/.claude/CLAUDE.md`
- project skills in vendor mode: `.claude/skills/<skill>/`
- project subagents: `.claude/agents/*.md`

Specialist definitions intentionally do not use the `skills:` preload field. They identify a narrow domain and let Claude discover/invoke the focused skill during execution, which avoids injecting several full skill bodies at subagent startup.

### Google Antigravity

- current global skills: `~/.gemini/config/skills/<skill>/`
- IDE compatibility: `~/.gemini/antigravity/skills/<skill>/`
- Antigravity CLI compatibility: `~/.gemini/antigravity-cli/skills/<skill>/`
- global custom agents: `~/.gemini/config/agents/<agent>/agent.md`
- global context: managed block in `~/.gemini/GEMINI.md`
- project skills: `.agents/skills/<skill>/`
- project agents: `.agents/agents/<agent>/agent.md`

Google documentation currently exposes more than one global skill path across Antigravity surfaces. Registration covers the documented variants; project-scoped installation uses `.agents/skills`.

## Safety and idempotence

The CLI owns only:

- symlinks that resolve to its managed source directory;
- managed specialist-agent copies marked by this package;
- text between `<!-- ai-agents-skills:begin -->` and `<!-- ai-agents-skills:end -->` markers.

An existing unrelated normal file, directory or external symlink with the same skill/agent name is not overwritten. This is intentional: user/company configuration wins over a convenience installer.

## Project modes

### Global catalog + project routing

```bash
ai-skills project /path/to/repo
```

Best default for a single developer. Skills remain global, while the repository gets platform agent profiles, compact routing rules and `DESIGN.md` integration.

### Vendored team setup

```bash
ai-skills project /path/to/repo --vendor
```

Copies skills into the project discovery locations so teammates and CI environments receive the same catalog from Git.

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

`doctor` validates the source corpus and verifies the main registrations for the three supported agent environments.
