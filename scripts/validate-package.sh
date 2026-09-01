#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fail(){ echo "ERROR: $*" >&2; exit 1; }

bash -n "$ROOT/install.sh" "$ROOT/bin/ai-skills" "$ROOT/scripts/install-ui-skills.sh"
"$ROOT/scripts/validate-skills.sh"

# Canonical agent set: compare names, not a magic numeric count.
EXPECTED_AGENTS="$(cat <<'EOF'
ai-skills-orchestrator
document-workspace-designer
kafedra-workspace-orchestrator
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

# Kafedra/document-workspace profile must remain complete and discoverable.
for f in \
  "$ROOT/profiles/kafedra-planner/README.md" \
  "$ROOT/profiles/kafedra-planner/ROUTING.md" \
  "$ROOT/profiles/kafedra-planner/REFERENCE_FLOWS.md" \
  "$ROOT/profiles/kafedra-planner/PATTERNS_AND_ANTIPATTERNS.md" \
  "$ROOT/profiles/kafedra-planner/ANTI_PATTERN_FLOW.md"; do
  [[ -f "$f" ]] || fail "Kafedra profile file missing: $f"
done
for skill in \
  kafedra-workspace-orchestrator \
  kafedra-document-workspace \
  kafedra-document-intake \
  kafedra-provenance-and-inspector \
  kafedra-action-recomposition \
  kafedra-review-by-exception \
  kafedra-search-and-navigation \
  kafedra-responsive-inspector \
  kafedra-motion-continuity \
  kafedra-states-and-recovery \
  kafedra-adaptive-controls \
  kafedra-plan-calendar-continuity \
  kafedra-template-and-structured-document-flow \
  kafedra-ux-acceptance; do
  [[ -f "$ROOT/.agents/skills/$skill/SKILL.md" ]] || fail "Kafedra skill missing: $skill"
  grep -Eq 'Anti-pattern|Антипаттерн|Anti-patterns' "$ROOT/.agents/skills/$skill/SKILL.md" || fail "$skill lacks anti-pattern contract"
done
grep -q 'Kafedra Planner / document workspace' "$ROOT/.agents/skills/ui-skill-router/SKILL.md" || fail "UI router lacks Kafedra route"
grep -q 'kafedra-workspace-orchestrator' "$ROOT/.agents/skills/skill-agent-orchestrator/SKILL.md" || fail "global orchestrator lacks Kafedra domain route"
grep -q 'kafedra-workspace-orchestrator' "$ROOT/integrations/shared/global-orchestration.md" || fail "global routing block lacks Kafedra domain route"
grep -qi 'review by exception' "$ROOT/.agents/skills/kafedra-document-intake/SKILL.md" || fail "Kafedra intake lacks exception-only review contract"
grep -q 'never-learn' "$ROOT/.agents/skills/kafedra-adaptive-controls/SKILL.md" || fail "Kafedra adaptive skill lacks safety classes"
grep -q 'prefers-reduced-motion' "$ROOT/.agents/skills/kafedra-motion-continuity/SKILL.md" || fail "Kafedra motion lacks reduced-motion contract"
grep -q 'kafedra-plan-calendar-continuity' "$ROOT/profiles/kafedra-planner/ROUTING.md" || fail "Kafedra routing lacks plan/calendar continuity route"
grep -q 'kafedra-template-and-structured-document-flow' "$ROOT/profiles/kafedra-planner/ROUTING.md" || fail "Kafedra routing lacks template flow route"
grep -qi 'partial' "$ROOT/.agents/skills/kafedra-ux-acceptance/SKILL.md" || fail "Kafedra acceptance lacks partial-success evidence"

sandbox="$(mktemp -d)"
trap 'rm -rf "$sandbox"' EXIT
export HOME="$sandbox/home"
export XDG_DATA_HOME="$sandbox/data"
mkdir -p "$HOME"

"$ROOT/bin/ai-skills" global
"$ROOT/bin/ai-skills" global
[[ "$(grep -c 'ai-agents-skills:begin' "$HOME/.codex/AGENTS.md")" -eq 1 ]] || fail "global Codex block duplicated"
"$ROOT/bin/ai-skills" doctor

for skill in skill-agent-orchestrator anti-slop-ui-direction dense-controls-and-selection existing-project-integration kafedra-workspace-orchestrator kafedra-document-intake kafedra-ux-acceptance; do
  [[ -L "$HOME/.agents/skills/$skill" ]] || fail "Codex global skill missing: $skill"
  [[ -L "$HOME/.claude/skills/$skill" ]] || fail "Claude global skill missing: $skill"
  [[ -L "$HOME/.gemini/config/skills/$skill" ]] || fail "Antigravity global skill missing: $skill"
done
for agent in ai-skills-orchestrator document-workspace-designer kafedra-workspace-orchestrator ui-methodology-director ui-ux-auditor project-integration-architect; do
  [[ -L "$HOME/.codex/agents/$agent.toml" ]] || fail "Codex global agent missing: $agent"
  [[ -L "$HOME/.claude/agents/$agent.md" ]] || fail "Claude global agent missing: $agent"
  [[ -f "$HOME/.gemini/config/agents/$agent/agent.md" ]] || fail "Antigravity global agent missing: $agent"
done

grep -q 'ai-agents-skills:begin' "$HOME/.codex/AGENTS.md" || fail "Codex managed global block missing"
grep -q 'ai-agents-skills:begin' "$HOME/.claude/CLAUDE.md" || fail "Claude managed global block missing"
grep -q 'ai-agents-skills:begin' "$HOME/.gemini/GEMINI.md" || fail "Antigravity managed global block missing"
grep -q 'kafedra-workspace-orchestrator' "$HOME/.codex/AGENTS.md" || fail "Codex global block lacks Kafedra route"
grep -q 'document-workspace-designer' "$HOME/.claude/CLAUDE.md" || fail "Claude global block lacks document specialist route"

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
grep -q 'kafedra-workspace-orchestrator' "$project/.ai-agents-skills/INTEGRATION_PROMPT.md" || fail "integration prompt lacks Kafedra profile metadata"

# Only integration architect is staged automatically; semantic roles are selected later.
[[ -f "$project/.claude/agents/project-integration-architect.md" ]] || fail "Claude integration architect missing"
[[ -f "$project/.agents/agents/project-integration-architect/agent.md" ]] || fail "Antigravity integration architect missing"
[[ ! -e "$project/.codex/agents/ui-methodology-director.toml" ]] || fail "integrate staged unrelated library agents before role analysis"
[[ ! -e "$project/.claude/agents/ui-ux-auditor.md" ]] || fail "integrate staged unrelated library agents before role analysis"
[[ ! -e "$project/.codex/agents/kafedra-workspace-orchestrator.toml" ]] || fail "integrate staged Kafedra agent before role analysis"
[[ ! -e "$project/.claude/agents/document-workspace-designer.md" ]] || fail "integrate staged document agent before role analysis"

# Vendor mode adds only non-conflicting package-managed skills.
[[ -f "$project/.agents/skills/skill-agent-orchestrator/SKILL.md" ]] || fail "vendored shared skill missing"
[[ -f "$project/.agents/skills/anti-slop-ui-direction/SKILL.md" ]] || fail "vendored anti-slop skill missing"
[[ -f "$project/.agents/skills/dense-controls-and-selection/SKILL.md" ]] || fail "vendored recomposition skill missing"
[[ -f "$project/.agents/skills/kafedra-workspace-orchestrator/SKILL.md" ]] || fail "vendored Kafedra orchestrator skill missing"
[[ -f "$project/.agents/skills/kafedra-document-workspace/SKILL.md" ]] || fail "vendored Kafedra document workspace skill missing"
[[ -f "$project/.claude/skills/skill-agent-orchestrator/SKILL.md" ]] || fail "vendored Claude skill missing"
[[ -f "$project/.agents/skills/skill-agent-orchestrator/.ai-agents-skills-managed" ]] || fail "vendored skill missing managed marker"

"$ROOT/bin/ai-skills" prompt "$project" > "$sandbox/prompt.txt"
grep -q 'Existing Project Integration Prompt' "$sandbox/prompt.txt" || fail "prompt command missing template"
grep -q 'Existing instruction/design files' "$sandbox/prompt.txt" || fail "prompt command missing live inventory"
grep -q 'Project Integration Architect' "$sandbox/prompt.txt" || fail "prompt missing semantic role"
grep -q 'kafedra-document-intake' "$sandbox/prompt.txt" || fail "prompt lacks Kafedra document skill metadata"

# Repeated integration remains non-destructive and idempotent.
"$ROOT/bin/ai-skills" integrate "$project" --vendor
cmp "$sandbox/AGENTS.before" "$project/AGENTS.md" || fail "repeat integrate changed AGENTS.md"
cmp "$sandbox/DESIGN.before" "$project/DESIGN.md" || fail "repeat integrate changed DESIGN.md"
cmp "$sandbox/local-skill.before" "$project/.agents/skills/existing-project-integration/SKILL.md" || fail "repeat integrate overwrote local skill"
cmp "$sandbox/local-agent.before" "$project/.codex/agents/project-integration-architect.toml" || fail "repeat integrate overwrote local agent"

echo "Validated canonical agent parity, Interaction Recomposition, Kafedra document profile, project-first integration and platform registrations"
