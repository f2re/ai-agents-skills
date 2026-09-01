#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_DIR="$ROOT_DIR/.agents/skills"

usage() {
  cat <<'EOF_USAGE'
Usage:
  install-ui-skills.sh TARGET [--copy|--link] [--only skill-a,skill-b] [--force]
  install-ui-skills.sh --list

Legacy low-level installer for Codex/Antigravity repo-scoped `.agents/skills` only.
For full Codex + Claude Code + Antigravity integration use:
  ai-skills project TARGET --vendor
EOF_USAGE
}

list_skills() {
  for d in "$SOURCE_DIR"/*; do
    [[ -d "$d" && -f "$d/SKILL.md" ]] && basename "$d"
  done | sort
}

if [[ ${1:-} == "--list" ]]; then list_skills; exit 0; fi
[[ $# -ge 1 ]] || { usage >&2; exit 2; }
TARGET="$(cd "$1" && pwd)"; shift
MODE="copy"; ONLY=""; FORCE=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    --copy) MODE="copy" ;;
    --link) MODE="link" ;;
    --only) shift; ONLY="${1:-}"; [[ -n "$ONLY" ]] || { echo "--only requires names" >&2; exit 2; } ;;
    --force) FORCE=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done

DEST="$TARGET/.agents/skills"; mkdir -p "$DEST"
if [[ -n "$ONLY" ]]; then
  skills="$(printf '%s' "$ONLY" | tr ',' '\n')"
else
  skills="$(list_skills)"
fi
count=0
while IFS= read -r skill; do
  [[ -n "$skill" ]] || continue
  src="$SOURCE_DIR/$skill"; dst="$DEST/$skill"
  [[ -f "$src/SKILL.md" ]] || { echo "Unknown/invalid skill: $skill" >&2; exit 3; }
  if [[ -e "$dst" || -L "$dst" ]]; then
    if [[ $FORCE -eq 0 ]]; then echo "kept    $skill (already exists)"; continue; fi
    rm -rf "$dst"
  fi
  if [[ "$MODE" == link ]]; then ln -s "$src" "$dst"; echo "linked  $skill"; else cp -R "$src" "$dst"; echo "copied  $skill"; fi
  count=$((count + 1))
done <<EOF_SKILLS
$skills
EOF_SKILLS

echo "Installed $count skill(s) into $DEST"
