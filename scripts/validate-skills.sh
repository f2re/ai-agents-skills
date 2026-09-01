#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$ROOT_DIR/.agents/skills"

fail=0
count=0

for file in "$SKILLS_DIR"/*/SKILL.md; do
  [[ -f "$file" ]] || continue
  count=$((count + 1))
  dir_name="$(basename "$(dirname "$file")")"

  first="$(sed -n '1p' "$file")"
  name="$(sed -n 's/^name:[[:space:]]*//p' "$file" | head -n1)"
  description="$(sed -n 's/^description:[[:space:]]*//p' "$file" | head -n1)"
  closing="$(sed -n '2,8p' "$file" | grep -n '^---$' | head -n1 || true)"

  if [[ "$first" != "---" ]]; then
    echo "ERROR $file: missing opening YAML frontmatter" >&2
    fail=1
  fi
  if [[ -z "$closing" ]]; then
    echo "ERROR $file: missing closing YAML frontmatter near top" >&2
    fail=1
  fi
  if [[ -z "$name" ]]; then
    echo "ERROR $file: missing name" >&2
    fail=1
  elif [[ "$name" != "$dir_name" ]]; then
    echo "ERROR $file: name '$name' must match directory '$dir_name'" >&2
    fail=1
  fi
  if [[ -z "$description" ]]; then
    echo "ERROR $file: missing description" >&2
    fail=1
  fi
  if ! grep -Eq 'Anti-pattern|Антипаттерн|Anti-patterns' "$file"; then
    echo "WARN  $file: no explicit anti-pattern section" >&2
  fi
done

if [[ $count -eq 0 ]]; then
  echo "ERROR: no skills found" >&2
  exit 1
fi

if [[ $fail -ne 0 ]]; then
  exit 1
fi

echo "Validated $count skills"
