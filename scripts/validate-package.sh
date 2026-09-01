#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fail(){ echo "ERROR: $*" >&2; exit 1; }

bash -n "$ROOT/install.sh" "$ROOT/bin/ai-skills" "$ROOT/scripts/install-ui-skills.sh"
"$ROOT/scripts/validate-skills.sh"

# Canonical agent set: compare names, not a magic numeric count.
EXPECTED_AGENTS="$(cat <<'EOF'
ai-skills-orchestrator
meteo-workstation-designer
motion-interaction-reviewer
project-integration-architect
qt-interface-designer
ui-methodology-director
ui-ux-auditor
EOF
)"

list_codex_agents(){
  local f
  for f in "$ROOT"/integrations/codex/agents/*.toml; do
    [[ -f "$f" ]] && basename "$f" .toml
  done | sort
}
list_claude_agents(){
  local f
  for f in "$ROOT"/integrations/claude/agents/*.md; do
    [[ -f "$f" ]] && basename "$f" .md
  done | sort
}
list_antigravity_agents(){
  local d
  for d in "$ROOT"/integrations/antigravity/agents/*; do
    [[ -f "$d/agent.md" ]] && basename "$d"
  done | sort
}
assert_agent_set(){
  local label="$1" actual="$2"
  if [[ "$actual" != "$EXPECTED_AGENTS" ]]; then
    echo "ERROR: $label agent set differs from canonical set" >&2
    echo "Expected:" >&2; printf '%s\n' "$EXPECTED_AGENTS" >&2
    echo "Actual:" >&2; printf '%s\n' "$actual" >&2
    return 1
  fi
}

assert_agent_set "Codex" "$(list_codex_agents)"
assert_agent_set "Claude" "$(list_claude_agents)"
assert_agent_set "Antigravity" "$(list_antigravity_agents)"

for f in "$ROOT"/integrations/codex/agents/*.toml; do
  [[ -f "$f" ]] || continue
  grep -q '^name[[:space:]]*=' "$f" || fail "$f missing name"
  grep -q '^description[[:space:]]*=' "$f" || fail "$f missing description"
  grep -q '^developer_instructions[[:space:]]*=' "$f" || fail "$f missing developer_instructions"
done
for f in "$ROOT"/integrations/claude/agents/*.md; do
  [[ -f "$f" ]] || continue
  [[ "$(head -n1 "$f")" == '---' ]] || fail "$f missing YAML frontmatter"
  grep -q '^name:' "$f" || fail "$f missing name"
  grep -q '^description:' "$f" || fail "$f missing description"
  if grep -q '^skills:' "$f"; then fail "$f preloads skills; use progressive discovery instead"; fi
done
for f in "$ROOT"/integrations/antigravity/agents/*/agent.md; do
  [[ -f "$f" ]] || continue
  [[ "$(head -n1 "$f")" == '---' ]] || fail "$f missing YAML frontmatter"
  grep -q '^name:' "$f" || fail "$f missing name"
  grep -q '^description:' "$f" || fail "$f missing description"
  grep -q '^subagent:[[:space:]]*true' "$f" || fail "$f must be callable as subagent"
done

# Interaction-recomposition wiring must remain discoverable and cross-platform.
[[ -f "$ROOT/.agents/skills/dense-controls-and-selection/references/control-recomposition.md" ]] || fail "control recomposition reference missing"
grep -q 'Interaction Recomposition Pass' "$ROOT/.agents/skills/dense-controls-and-selection/SKILL.md" || fail "dense-controls skill lacks recomposition pass"
grep -q 'Control fragmentation and recomposition' "$ROOT/.agents/skills/ui-audit-and-acceptance/SKILL.md" || fail "acceptance lacks control fragmentation audit"
grep -q 'Control-cluster simplification' "$ROOT/.agents/skills/ui-skill-router/SKILL.md" || fail "UI router lacks local recomposition route"
for f in \
  "$ROOT/integrations/codex/agents/ui-ux-auditor.toml" \
  "$ROOT/integrations/claude/agents/ui-ux-auditor.md" \
  "$ROOT/integrations/antigravity/agents/ui-ux-auditor/agent.md"; do
  grep -q 'Recomposition' "$f" || fail "$f lacks recomposition contract"
done

sandbox="$(mktemp -d)"
trap 'rm -rf "$sandbox"' EXIT
export HOME="$sandbox/home"
export XDG_DATA_HOME="$sandbox/data"
mkdir -p "$HOME"

"$ROOT/bin/ai-skills" global
"$ROOT/bin/ai-skills" global
[[ "$(grep -c 'ai-agents-skills:begin' "$HOME/.codex/AGENTS.md")" -eq 1 ]] || fail "global Codex block duplicated"
"$ROOT/bin/ai-skills" doctor

for skill in skill-agent-orchestrator anti-slop-ui-direction dense-controls-and-selection existing-project-integration; do
  [[ -L "$HOME/.agents/skills/$skill" ]] || fail "Codex global skill missing: $skill"
  [[ -L "$HOME/.claude/skills/$skill" ]] || fail "Claude global skill missing: $skill"
  [[ -L "$HOME/.gemini/config/skills/$skill" ]] || fail "Antigravity global skill missing: $skill"
done
for agent in ai-skills-orchestrator ui-methodology-director ui-ux-auditor project-integration-architect; do
  [[ -L "$HOME/.codex/agents/$agent.toml" ]] || fail "Codex global agent missing: $agent"
  [[ -L "$HOME/.claude/agents/$agent.md" ]] || fail "Claude global agent missing: $agent"
  [[ -f "$HOME/.gemini/config/agents/$agent/agent.md" ]] || fail "Antigravity global agent missing: $agent"
done

grep -q 'ai-agents-skills:begin' "$HOME/.codex/AGENTS.md" || fail "Codex managed global block missing"
grep -q 'ai-agents-skills:begin' "$HOME/.claude/CLAUDE.md" || fail "Claude managed global block missing"
grep -q 'ai-agents-skills:begin' "$HOME/.gemini/GEMINI.md" || fail "Antigravity managed global block missing"

# --plan is genuinely read-only.
plan_project="$sandbox/plan-project"
mkdir -p "$plan_project/nested"
printf '# Plan-only rules\n' > "$plan_project/AGENTS.md"
printf '# Nested rules\n' > "$plan_project/nested/AGENTS.override.md"
"$ROOT/bin/ai-skills" integrate "$plan_project" --plan > "$sandbox/plan.txt"
[[ ! -e "$plan_project/.ai-agents-skills" ]] || fail "--plan created adapter files"
[[ ! -e "$plan_project/.codex" ]] || fail "--plan staged agents"
grep -q 'Will NOT modify automatically' "$sandbox/plan.txt" || fail "plan lacks non-invasive contract"
grep -q 'Plan-only rules' "$plan_project/AGENTS.md" || fail "plan changed AGENTS.md"

# Existing project-owned artifacts remain byte-for-byte unchanged.
project="$sandbox/project"
mkdir -p "$project/.agents/skills/existing-project-integration" "$project/.codex/agents" "$project/nested"
printf '# Existing project rules\n\nKeep AGENTS exactly.\n' > "$project/AGENTS.md"
printf '# Nested local scope\n' > "$project/nested/AGENTS.md"
printf '# Existing Claude rules\n\nKeep CLAUDE exactly.\n' > "$project/CLAUDE.md"
printf '# Existing Gemini rules\n\nKeep GEMINI exactly.\n' > "$project/GEMINI.md"
printf '# Existing design decisions\n\nKeep DESIGN exactly.\n' > "$project/DESIGN.md"
printf '%s\n' '---' 'name: existing-project-integration' 'description: Local project integration policy.' '---' '' 'LOCAL-SKILL-MUST-WIN' > "$project/.agents/skills/existing-project-integration/SKILL.md"
printf 'name = "Local Integration Architect"\n# LOCAL-AGENT-MUST-WIN\n' > "$project/.codex/agents/project-integration-architect.toml"

cp "$project/AGENTS.md" "$sandbox/AGENTS.before"
cp "$project/CLAUDE.md" "$sandbox/CLAUDE.before"
cp "$project/GEMINI.md" "$sandbox/GEMINI.before"
cp "$project/DESIGN.md" "$sandbox/DESIGN.before"
cp "$project/.agents/skills/existing-project-integration/SKILL.md" "$sandbox/local-skill.before"
cp "$project/.codex/agents/project-integration-architect.toml" "$sandbox/local-agent.before"

"$ROOT/bin/ai-skills" integrate "$project" --vendor

cmp "$sandbox/AGENTS.before" "$project/AGENTS.md" || fail "integrate modified AGENTS.md"
cmp "$sandbox/CLAUDE.before" "$project/CLAUDE.md" || fail "integrate modified CLAUDE.md"
cmp "$sandbox/GEMINI.before" "$project/GEMINI.md" || fail "integrate modified GEMINI.md"
cmp "$sandbox/DESIGN.before" "$project/DESIGN.md" || fail "integrate modified DESIGN.md"
cmp "$sandbox/local-skill.before" "$project/.agents/skills/existing-project-integration/SKILL.md" || fail "vendoring overwrote local same-name skill"
cmp "$sandbox/local-agent.before" "$project/.codex/agents/project-integration-architect.toml" || fail "integration overwrote local same-name agent"

[[ -f "$project/.ai-agents-skills/PROJECT_INVENTORY.md" ]] || fail "project inventory missing"
[[ -f "$project/.ai-agents-skills/INTEGRATION_PROMPT.md" ]] || fail "integration prompt missing"
grep -q 'Project-local rules win' "$project/.ai-agents-skills/INTEGRATION_PROMPT.md" || fail "integration prompt lacks authority rule"
grep -q 'nested/AGENTS.md' "$project/.ai-agents-skills/PROJECT_INVENTORY.md" || fail "inventory missed nested AGENTS.md"
grep -q 'anti-slop-ui-direction' "$project/.ai-agents-skills/INTEGRATION_PROMPT.md" || fail "integration prompt lacks live library catalog"
grep -q 'dense-controls-and-selection' "$project/.ai-agents-skills/INTEGRATION_PROMPT.md" || fail "integration prompt lacks recomposition skill metadata"

# Only integration architect is staged automatically; semantic roles are selected later.
[[ -f "$project/.claude/agents/project-integration-architect.md" ]] || fail "Claude integration architect missing"
[[ -f "$project/.agents/agents/project-integration-architect/agent.md" ]] || fail "Antigravity integration architect missing"
[[ ! -e "$project/.codex/agents/ui-methodology-director.toml" ]] || fail "integrate staged unrelated library agents before role analysis"
[[ ! -e "$project/.claude/agents/ui-ux-auditor.md" ]] || fail "integrate staged unrelated library agents before role analysis"

# Vendor mode adds only non-conflicting package-managed skills.
[[ -f "$project/.agents/skills/skill-agent-orchestrator/SKILL.md" ]] || fail "vendored shared skill missing"
[[ -f "$project/.agents/skills/anti-slop-ui-direction/SKILL.md" ]] || fail "vendored anti-slop skill missing"
[[ -f "$project/.agents/skills/dense-controls-and-selection/SKILL.md" ]] || fail "vendored recomposition skill missing"
[[ -f "$project/.claude/skills/skill-agent-orchestrator/SKILL.md" ]] || fail "vendored Claude skill missing"
[[ -f "$project/.agents/skills/skill-agent-orchestrator/.ai-agents-skills-managed" ]] || fail "vendored skill missing managed marker"

"$ROOT/bin/ai-skills" prompt "$project" > "$sandbox/prompt.txt"
grep -q 'Existing Project Integration Prompt' "$sandbox/prompt.txt" || fail "prompt command missing template"
grep -q 'Existing instruction/design files' "$sandbox/prompt.txt" || fail "prompt command missing live inventory"
grep -q 'Project Integration Architect' "$sandbox/prompt.txt" || fail "prompt missing semantic role"

# Repeated integration remains non-destructive and idempotent.
"$ROOT/bin/ai-skills" integrate "$project" --vendor
cmp "$sandbox/AGENTS.before" "$project/AGENTS.md" || fail "repeat integrate changed AGENTS.md"
cmp "$sandbox/DESIGN.before" "$project/DESIGN.md" || fail "repeat integrate changed DESIGN.md"
cmp "$sandbox/local-skill.before" "$project/.agents/skills/existing-project-integration/SKILL.md" || fail "repeat integrate overwrote local skill"
cmp "$sandbox/local-agent.before" "$project/.codex/agents/project-integration-architect.toml" || fail "repeat integrate overwrote local agent"

echo "Validated canonical agent parity, interaction recomposition, project-first integration and platform registrations"
