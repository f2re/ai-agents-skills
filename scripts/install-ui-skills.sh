#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_DIR="$ROOT_DIR/.agents/skills"

usage() {
  cat <<'EOF'
Usage:
  install-ui-skills.sh TARGET [--copy|--link] [--only skill-a,skill-b]
  install-ui-skills.sh --list

Installs Codex repo-scoped skills into TARGET/.agents/skills.
Default mode: --copy.
EOF
}

list_skills() {
  find "$SOURCE_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' 2>/dev/null | sort
}

if [[ ${1:-} == "--list" ]]; then
  list_skills
  exit 0
fi

if [[ $# -lt 1 ]]; then
  usage >&2
  exit 2
fi

TARGET="$(cd "$1" && pwd)"
shift
MODE="copy"
ONLY=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --copy) MODE="copy" ;;
    --link) MODE="link" ;;
    --only)
      shift
      ONLY="${1:-}"
      [[ -n "$ONLY" ]] || { echo "--only requires comma-separated skill names" >&2; exit 2; }
      ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done

DEST="$TARGET/.agents/skills"
mkdir -p "$DEST"

if [[ -n "$ONLY" ]]; then
  IFS=',' read -r -a SKILLS <<< "$ONLY"
else
  mapfile -t SKILLS < <(list_skills)
fi

for skill in "${SKILLS[@]}"; do
  src="$SOURCE_DIR/$skill"
  dst="$DEST/$skill"
  if [[ ! -f "$src/SKILL.md" ]]; then
    echo "Unknown/invalid skill: $skill" >&2
    exit 3
  fi

  rm -rf "$dst"
  if [[ "$MODE" == "link" ]]; then
    ln -s "$src" "$dst"
    echo "linked  $skill"
  else
    cp -a "$src" "$dst"
    echo "copied  $skill"
  fi
done

echo "Installed ${#SKILLS[@]} skill(s) into $DEST"
