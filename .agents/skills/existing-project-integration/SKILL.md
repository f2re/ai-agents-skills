---
name: existing-project-integration
description: Integrates AI Agents Skills into an established repository without replacing existing AGENTS.md, CLAUDE.md, GEMINI.md, DESIGN.md, local skills, local agents, rules, or project conventions. Use when onboarding this catalog into an existing codebase or reconciling it with an existing agent architecture.
---

# Existing Project Integration

Use this skill when the task is to add AI Agents Skills to a repository that already has its own instructions, design decisions, skills, agents, rules, or orchestration.

The goal is **capability integration**, not framework replacement.

## Core principle

Treat the repository's existing agent/design system as the source of truth.

Generic library capabilities must adapt to the project. They do not get to rename roles, replace design documents, flatten scoped rules, or rewrite project memory merely because the library has a preferred structure.

## Integration phases

### 1. Inventory before edits

Inspect:

- root and nested `AGENTS.md` / `AGENTS.override.md`;
- `CLAUDE.md`, `.claude/CLAUDE.md`, `.claude/rules`, `.claude/skills`, `.claude/agents`;
- `GEMINI.md`, `.agents/rules`, `.agents/skills`, `.agents/agents`;
- `.codex/agents`;
- `DESIGN.md`, design-system docs, tokens/themes, UX guidelines;
- existing orchestration/delegation conventions;
- local same-name skills/agents;
- repository stack, modules and domain language.

Do not write until the inventory is complete.

### 2. Build an authority map

For every relevant artifact, classify its authority:

1. project-local explicit rule or design decision;
2. project-local skill/agent;
3. package-provided generic capability;
4. inferred preference.

Higher levels override lower levels.

When two rules conflict, preserve the higher-authority project rule and adapt the package behavior.

### 3. Prefer native discovery

Do not add root-memory text merely to announce that skills exist.

Prefer:

- `.agents/skills` for Codex/Antigravity project skills;
- `.claude/skills` for Claude project skills;
- `.codex/agents` for Codex project custom agents;
- `.claude/agents` for Claude subagents;
- `.agents/agents` for Antigravity custom agents;
- task/path-scoped rule systems where the platform provides them.

Root instruction files are for durable project conventions, not package indexes.

### 4. Minimize always-on context

Before adding anything to `AGENTS.md`, `CLAUDE.md` or `GEMINI.md`, ask:

- Is this required on every task?
- Is it already discoverable as skill/agent metadata?
- Could it be a scoped rule instead?
- Is it duplicating existing orchestration?
- Will it consume context without affecting most tasks?

If the answer indicates a lazy/scoped mechanism is sufficient, use it.

### 5. Integrate roles semantically

If the project already has roles like architect, UI designer, reviewer, domain expert, orchestrator, or QA/auditor, map library capabilities into those roles instead of creating parallel copies.

Example: if the project already has `design-reviewer`, do not automatically add a second always-invoked `ui-ux-auditor`. Preserve the existing reviewer, make the new UI audit skill available, and update the existing role only if its scope genuinely needs the capability.

### 6. Handle collisions explicitly

If a project-local skill or agent has the same name as a library item:

- never overwrite it automatically;
- classify it as `SHADOW_LIBRARY`;
- compare descriptions and responsibilities;
- keep the local artifact authoritative;
- optionally recommend a semantic merge or renamed library alias only when useful.

## Integration action vocabulary

- `KEEP` — existing project artifact already owns the behavior.
- `REFERENCE` — add a small pointer, not copied content.
- `AUGMENT` — minimally extend the existing artifact in its own style.
- `ADD_NATIVE` — add a new skill/agent/rule through native discovery.
- `SHADOW_LIBRARY` — preserve a project-local collision.
- `NO_CHANGE` — discovery already works; no edit needed.

## DESIGN.md rules

`DESIGN.md` is never a registration file.

Do not replace it with a package template, append the entire UI skill catalog, inject generic guidance already owned by skills, or create it solely because this package has design capabilities.

Only edit an existing design document when there is a durable **project-specific** missing decision, and place that decision where it fits the existing document.

## AGENTS.md / CLAUDE.md / GEMINI.md rules

Keep always-loaded project memory lean.

If a project already has an orchestration section, integrate into it rather than adding a second package-specific orchestrator section.

If no routing text is needed because native skills/agents are discoverable, make no root edit.

If a small routing pointer is justified, it should normally fit the project's existing structure, be under about 10 lines, state that project-local rules override generic skill defaults, and point to capabilities by purpose rather than enumerate full skill bodies.

## Platform-specific notes

### Codex

Codex composes instruction files from repository root toward the working directory. Preserve nested scoping and `AGENTS.override.md` behavior. Do not flatten nested instructions into a root file.

### Claude Code

Use `.claude/rules` for path-specific guidance when appropriate. `@` imports help organize files but imported content is still loaded; they are not a lazy-loading substitute.

### Antigravity

Prefer `.agents/rules` with model-decision or glob activation when routing can be scoped. Use `.agents/skills` and `.agents/agents` for reusable capabilities.

## Validation checklist

After integration verify:

- existing root instruction files still contain all previous project guidance;
- existing `DESIGN.md` remains semantically intact;
- same-name local skills/agents are untouched;
- no duplicated orchestrator role was introduced;
- no full skill body was pasted into an always-loaded project file;
- native discovery locations contain only intended additions;
- added project memory is minimal and project-specific;
- the repository remains understandable without knowing this package exists.

## Patterns

- inventory → authority map → minimal native additions → optional semantic merge;
- project-specific rules override generic skills;
- local collisions shadow library artifacts;
- role mapping instead of duplicate roles;
- task/path-scoped rules instead of always-on memory;
- generated integration prompt for agent-assisted semantic merging;
- explicit plan before invasive changes.

## Anti-patterns

- replacing `AGENTS.md`, `CLAUDE.md`, `GEMINI.md` or `DESIGN.md` with templates;
- appending a generic package block to every project file;
- copying all skill descriptions into always-loaded memory;
- overwriting local skills/agents with same-name library versions;
- creating duplicate designer/reviewer/orchestrator roles;
- using imports to pretend large always-loaded text is lazy;
- flattening nested project instruction scopes;
- creating `DESIGN.md` as a registration side effect;
- treating filesystem installation as proof of semantic integration.
