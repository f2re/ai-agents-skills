# Integrating into an existing agent system

`ai-agents-skills` is an additive capability library. Existing repositories often already have project memory, design documents, local skills, local agents, path-scoped rules, reviewer roles and orchestration conventions. Those artifacts must not be replaced just because this package has equivalents.

## Design rule

Separate two concerns:

1. **Structural registration** — make reusable skills/agents discoverable through native platform directories.
2. **Semantic integration** — decide how new capabilities fit the repository's existing roles, rules, design decisions and vocabulary.

Structural registration can be deterministic. Semantic integration requires repository context and is handled by the `Project Integration Architect` using a prepared prompt.

## Safe workflow

### 1. Inspect without writing

```bash
ai-skills integrate . --plan
```

This reports detected instruction/design files, nested `AGENTS.md` scopes, existing skills/agents/rules and basic stack/domain signals. It does not create files.

### 2. Stage safe integration

```bash
ai-skills integrate .
```

This:

- stages only the `Project Integration Architect` in native project agent locations;
- preserves a same-name project-local integration role;
- creates `.ai-agents-skills/PROJECT_INVENTORY.md`;
- creates `.ai-agents-skills/INTEGRATION_PROMPT.md`;
- does **not** modify `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `DESIGN.md` or local rule files;
- does **not** copy all library agents into the project before role analysis.

### 3. Optional team/vendored skills

```bash
ai-skills integrate . --vendor
```

Vendoring copies package skills into project discovery locations. Collision policy is project-first:

- package-managed vendored skill → refresh it;
- existing non-managed same-name skill → preserve it and report `SHADOW_LIBRARY`.

### 4. Perform semantic integration only when useful

The generated file:

```text
.ai-agents-skills/INTEGRATION_PROMPT.md
```

is intended for a coding agent / `Project Integration Architect`.

You can also print it without writing anything:

```bash
ai-skills prompt .
```

It tells the agent to inspect the repository, read existing role definitions, build an authority map, and choose among:

- `KEEP`
- `REFERENCE`
- `AUGMENT`
- `ADD_NATIVE`
- `SHADOW_LIBRARY`
- `NO_CHANGE`

The agent is explicitly forbidden from replacing whole project instruction or design documents merely to register the package.

## Why root instruction files are not modified by default

### Codex

Codex builds an instruction chain from repository `AGENTS.md` files, including nested scopes and `AGENTS.override.md`. Root instructions are always-on context. Task-specific reusable guidance belongs in skills; project custom agents belong in `.codex/agents`.

Therefore this package does not flatten existing scoped instructions or append a package index to root `AGENTS.md`.

### Claude Code

Claude Code recommends concise `CLAUDE.md` and supports project skills/subagents plus path-scoped `.claude/rules`. `@file` imports organize content but imported content still enters context, so imports are not used as fake lazy loading.

Therefore a repository with an existing `CLAUDE.md` keeps it unchanged until semantic analysis proves a small edit is beneficial.

### Antigravity

Antigravity natively discovers `.agents/skills` and `.agents/agents`; workspace rules can be scoped by model-decision or glob activation.

Therefore task/path-specific routing should prefer `.agents/rules` instead of expanding always-on `GEMINI.md` when possible.

## Authority model

Integration follows this order:

1. explicit project-local rule/design decision;
2. project-local skill/agent/rule;
3. package-provided generic skill/agent;
4. inferred preference.

A lower-authority package rule must adapt to a higher-authority project rule.

## Same-name collision policy

A collision is not an installation error.

```text
project/.agents/skills/ui-audit-and-acceptance/
package/.agents/skills/ui-audit-and-acceptance/
```

The project-local skill wins. The integrator records `SHADOW_LIBRARY` and leaves it untouched. An agent may later compare both definitions and propose a semantic merge, but it must not perform one silently.

The same rule applies to custom agents.

## Existing role mapping

If the repository already has:

```text
design-reviewer
```

and the package provides:

```text
ui-ux-auditor
```

the integration agent first determines whether these are actually different responsibilities.

If not, preferred integration is:

```text
existing design-reviewer
        + selected UI audit skills
```

not:

```text
design-reviewer
ui-ux-auditor
second-ui-reviewer
another-orchestrator
```

The aim is fewer, clearer semantic owners.

## DESIGN.md policy

`DESIGN.md` is a product/project document, not a registration mechanism.

The deterministic installer never creates or edits it during project integration.

The Project Integration Architect may augment an existing design document only when:

- a real durable project-specific design decision is missing;
- the edit belongs naturally in the existing structure;
- the content is not generic guidance already contained in a skill;
- the change is small and traceable.

The same principle applies to anti-slop Design Direction Contracts: persist only accepted project-specific invariants when the project already has an appropriate design-memory location.

## Generated adapter directory

After safe integration:

```text
.ai-agents-skills/
├── README.md
├── PROJECT_INVENTORY.md
└── INTEGRATION_PROMPT.md
```

This directory is intentionally **not** an always-loaded instruction surface. It is a transparent adapter/audit artifact for maintainers and the integration agent.

## CI guarantees

Package validation creates a sandbox repository containing existing:

- `AGENTS.md`;
- `CLAUDE.md`;
- `GEMINI.md`;
- `DESIGN.md`;
- same-name local skill;
- same-name local custom agent.

It then runs `ai-skills integrate --vendor` and verifies those project-owned artifacts remain unchanged while the integration architect, non-conflicting skills and adapter metadata are added.

## Best-practice basis

The model follows current platform patterns:

- focused skills with progressive disclosure rather than monolithic prompts;
- lean always-on project memory;
- native project-scoped skills and subagents;
- scoped rules for task/path-specific behavior;
- explicit control of subagent overuse;
- inspection and success criteria before long-horizon agentic changes;
- project-specific instructions taking precedence over reusable generic guidance.

The prepared prompt lives at [`templates/EXISTING_PROJECT_INTEGRATION_PROMPT.md`](../templates/EXISTING_PROJECT_INTEGRATION_PROMPT.md).
