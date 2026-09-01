#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fail(){ echo "ERROR: $*" >&2; exit 1; }
count_glob(){
  local n=0 f
  for f in "$@"; do [[ -f "$f" ]] && n=$((n + 1)); done
  printf '%s\n' "$n"
}

bash -n "$ROOT/install.sh" "$ROOT/bin/ai-skills" "$ROOT/scripts/install-ui-skills.sh"
"$ROOT/scripts/validate-skills.sh"

codex_count="$(count_glob "$ROOT"/integrations/codex/agents/*.toml)"
claude_count="$(count_glob "$ROOT"/integrations/claude/agents/*.md)"
antigravity_count="$(count_glob "$ROOT"/integrations/antigravity/agents/*/agent.md)"
[[ "$codex_count" -eq 6 ]] || fail "expected 6 Codex agents, got $codex_count"
[[ "$claude_count" -eq 6 ]] || fail "expected 6 Claude agents, got $claude_count"
[[ "$antigravity_count" -eq 6 ]] || fail "expected 6 Antigravity agents, got $antigravity_count"

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

sandbox="$(mktemp -d)"
trap 'rm -rf "$sandbox"' EXIT
export HOME="$sandbox/home"
export XDG_DATA_HOME="$sandbox/data"
mkdir -p "$HOME"

"$ROOT/bin/ai-skills" global
"$ROOT/bin/ai-skills" global
[[ "$(grep -c 'ai-agents-skills:begin' "$HOME/.codex/AGENTS.md")" -eq 1 ]] || fail "global Codex block duplicated"
"$ROOT/bin/ai-skills" doctor

[[ -L "$HOME/.agents/skills/skill-agent-orchestrator" ]] || fail "Codex skill registration missing"
[[ -L "$HOME/.agents/skills/anti-slop-ui-direction" ]] || fail "Codex anti-slop skill registration missing"
[[ -L "$HOME/.claude/skills/skill-agent-orchestrator" ]] || fail "Claude skill registration missing"
[[ -L "$HOME/.claude/skills/anti-slop-ui-direction" ]] || fail "Claude anti-slop skill registration missing"
[[ -L "$HOME/.gemini/config/skills/skill-agent-orchestrator" ]] || fail "Antigravity skill registration missing"
[[ -L "$HOME/.gemini/config/skills/anti-slop-ui-direction" ]] || fail "Antigravity anti-slop skill registration missing"
[[ -L "$HOME/.codex/agents/ai-skills-orchestrator.toml" ]] || fail "Codex orchestrator missing"
[[ -L "$HOME/.codex/agents/ui-methodology-director.toml" ]] || fail "Codex methodology director missing"
[[ -L "$HOME/.claude/agents/ai-skills-orchestrator.md" ]] || fail "Claude orchestrator missing"
[[ -L "$HOME/.claude/agents/ui-methodology-director.md" ]] || fail "Claude methodology director missing"
[[ -f "$HOME/.gemini/config/agents/ai-skills-orchestrator/agent.md" ]] || fail "Antigravity orchestrator missing"
[[ -f "$HOME/.gemini/config/agents/ui-methodology-director/agent.md" ]] || fail "Antigravity methodology director missing"
grep -q 'ai-agents-skills:begin' "$HOME/.codex/AGENTS.md" || fail "Codex managed rule block missing"
grep -q 'ai-agents-skills:begin' "$HOME/.claude/CLAUDE.md" || fail "Claude managed rule block missing"
grep -q 'ai-agents-skills:begin' "$HOME/.gemini/GEMINI.md" || fail "Antigravity managed rule block missing"

project="$sandbox/project"
mkdir -p "$project"
printf '# Existing project rules\n\nKeep this.\n' > "$project/AGENTS.md"
printf '# Existing design decisions\n\nKeep this too.\n' > "$project/DESIGN.md"
"$ROOT/bin/ai-skills" project "$project"
grep -q 'Keep this.' "$project/AGENTS.md" || fail "project integration overwrote AGENTS.md"
grep -q 'ai-agents-skills:begin' "$project/AGENTS.md" || fail "project AGENTS block missing"
grep -q 'Keep this too.' "$project/DESIGN.md" || fail "project integration overwrote DESIGN.md"
grep -q 'ai-agents-skills:begin' "$project/DESIGN.md" || fail "project DESIGN block missing"
[[ -f "$project/.codex/agents/ai-skills-orchestrator.toml" ]] || fail "project Codex agent missing"
[[ -f "$project/.codex/agents/ui-methodology-director.toml" ]] || fail "project Codex methodology director missing"
[[ -f "$project/.claude/agents/ai-skills-orchestrator.md" ]] || fail "project Claude agent missing"
[[ -f "$project/.claude/agents/ui-methodology-director.md" ]] || fail "project Claude methodology director missing"
[[ -f "$project/.agents/agents/ai-skills-orchestrator/agent.md" ]] || fail "project Antigravity agent missing"
[[ -f "$project/.agents/agents/ui-methodology-director/agent.md" ]] || fail "project Antigravity methodology director missing"

"$ROOT/bin/ai-skills" project "$project" --vendor
[[ -f "$project/.agents/skills/skill-agent-orchestrator/SKILL.md" ]] || fail "vendored shared skill missing"
[[ -f "$project/.agents/skills/anti-slop-ui-direction/SKILL.md" ]] || fail "vendored anti-slop skill missing"
[[ -f "$project/.claude/skills/skill-agent-orchestrator/SKILL.md" ]] || fail "vendored Claude skill missing"
[[ -f "$project/.claude/skills/anti-slop-ui-direction/SKILL.md" ]] || fail "vendored Claude anti-slop skill missing"

"$ROOT/bin/ai-skills" project "$project"
[[ "$(grep -c 'ai-agents-skills:begin' "$project/AGENTS.md")" -eq 1 ]] || fail "AGENTS managed block duplicated"
[[ "$(grep -c 'ai-agents-skills:begin' "$project/DESIGN.md")" -eq 1 ]] || fail "DESIGN managed block duplicated"

echo "Validated universal installer package and registrations"
