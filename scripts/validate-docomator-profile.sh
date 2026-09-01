#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fail(){ echo "ERROR: $*" >&2; exit 1; }

skills=(
  document-extraction-and-import-review
  document-generation-flow
  document-template-canvas-and-binding
  document-workstation-ux
  offline-web-interface-engineering
)

for skill in "${skills[@]}"; do
  file="$ROOT/.agents/skills/$skill/SKILL.md"
  [[ -f "$file" ]] || fail "missing Docomator skill: $skill"
  grep -q "^name: $skill$" "$file" || fail "$skill frontmatter name mismatch"
  grep -Eq '^## (Patterns|Паттерны)$' "$file" || fail "$skill lacks Patterns section"
  grep -Eq '^## (Anti-patterns|Антипаттерны)$' "$file" || fail "$skill lacks Anti-patterns section"
done

router="$ROOT/.agents/skills/ui-skill-router/SKILL.md"
orchestrator="$ROOT/.agents/skills/skill-agent-orchestrator/SKILL.md"
audit="$ROOT/.agents/skills/ui-audit-and-acceptance/SKILL.md"
motion="$ROOT/.agents/skills/motion-feedback-and-microinteractions/SKILL.md"
profile="$ROOT/docs/docomator-ui-profile.md"
checklist="$ROOT/docs/docomator-ui-review-checklist.md"
concept="$ROOT/.agents/skills/anti-slop-ui-direction/references/examples/docomator-document-workbench.md"
catalog="$ROOT/.agents/skills/README.md"

for file in "$router" "$orchestrator" "$audit" "$motion" "$profile" "$checklist" "$concept" "$catalog"; do
  [[ -f "$file" ]] || fail "missing Docomator profile file: ${file#"$ROOT"/}"
done

# Canonical document routing and project/stack boundary.
grep -q 'Document automation / Docomator routes' "$router" || fail "UI router lacks Docomator routes"
grep -q 'document-template-canvas-and-binding' "$router" || fail "UI router lacks template-canvas route"
grep -q 'document-generation-flow' "$router" || fail "UI router lacks generation route"
grep -q 'document-extraction-and-import-review' "$router" || fail "UI router lacks extraction/import route"
grep -q 'offline-web-interface-engineering' "$router" || fail "UI router lacks offline-web route"
grep -Fq 'Do **not** route Docomator to `qt-cpp-design-system`' "$router" || fail "UI router lacks Docomator non-Qt guard"

# Durable domain invariants must stay discoverable.
grep -q 'Данные → Шаблон → Выпуск → Результат' "$ROOT/.agents/skills/document-workstation-ux/SKILL.md" || fail "document route invariant missing"
grep -q 'browser DOM' "$ROOT/.agents/skills/document-template-canvas-and-binding/SKILL.md" || fail "template skill lacks DOM/source-of-truth boundary"
grep -q 'mark the old preflight stale' "$ROOT/.agents/skills/document-generation-flow/SKILL.md" || fail "generation skill lacks stale preflight invalidation"
grep -q 'Structured errors' "$ROOT/.agents/skills/document-extraction-and-import-review/SKILL.md" || fail "extraction skill lacks structured-error contract"
grep -q 'brand-tokens.css' "$ROOT/.agents/skills/offline-web-interface-engineering/SKILL.md" || fail "offline-web skill lacks canonical Docomator token source"
grep -q 'page-level horizontal overflow' "$ROOT/.agents/skills/offline-web-interface-engineering/SKILL.md" || fail "offline-web skill lacks reflow guard"
grep -q 'prefers-reduced-motion' "$motion" || fail "motion skill lacks reduced-motion contract"

# The document skills are stack-adapted and must not drift into Qt implementation cargo cult.
for skill in "${skills[@]}"; do
  file="$ROOT/.agents/skills/$skill/SKILL.md"
  if grep -Eq '\bQWidget\b|\bQML\b|\bQProxyStyle\b|\bQPropertyAnimation\b' "$file"; then
    fail "$skill contains Qt implementation primitives"
  fi
done

# Profile evidence and anti-slop adaptation remain explicit.
grep -q 'Docomator UI: локальный offline web UI на HTML/CSS/JavaScript, не Qt' "$profile" || fail "profile lacks actual Docomator stack evidence"
grep -q 'Map/plot is primary work surface' "$profile" || fail "profile lacks meteo-to-document pattern mapping"
grep -q 'Result-first operation register' "$concept" || fail "anti-slop Docomator example incomplete"
grep -q 'Docomator UI review checklist' "$checklist" || fail "Docomator checklist title missing"
grep -q 'Document automation / Docomator' "$catalog" || fail "skill catalog lacks Docomator group"
grep -q 'Document-workstation composition' "$orchestrator" || fail "orchestrator lacks document composition"
grep -q 'Document automation' "$audit" || fail "acceptance skill lacks document domain audit"

echo "Validated Docomator document-workstation profile, routing, stack boundary and acceptance invariants"
