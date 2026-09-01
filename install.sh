#!/usr/bin/env bash
set -euo pipefail

REPO="f2re/ai-agents-skills"
REF="${AI_AGENTS_SKILLS_REF:-main}"
INSTALL_DIR="${AI_AGENTS_SKILLS_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/ai-agents-skills}"
BIN_DIR="${AI_AGENTS_SKILLS_BIN:-$HOME/.local/bin}"
PROJECT=""
RUN_GLOBAL=1

usage() {
  cat <<USAGE
AI Agents Skills bootstrap

Usage:
  curl -fsSL https://raw.githubusercontent.com/$REPO/main/install.sh | bash
  curl -fsSL https://raw.githubusercontent.com/$REPO/main/install.sh | bash -s -- --project .

Options:
  --project PATH   Also integrate the current/project repository.
  --no-global      Download CLI only; do not register global skills/agents.
  -h, --help       Show help.

Environment:
  AI_AGENTS_SKILLS_REF   Git ref to install (default: main)
  AI_AGENTS_SKILLS_HOME  Managed install directory
  AI_AGENTS_SKILLS_BIN   Directory for the ai-skills command
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) PROJECT="${2:-}"; shift 2 ;;
    --no-global) RUN_GLOBAL=0; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
done

command -v curl >/dev/null 2>&1 || { echo "curl is required" >&2; exit 1; }
command -v tar >/dev/null 2>&1 || { echo "tar is required" >&2; exit 1; }

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
archive="$tmp/repo.tar.gz"
url="https://codeload.github.com/$REPO/tar.gz/$REF"

echo "→ Downloading $REPO@$REF"
curl -fsSL --retry 3 --connect-timeout 15 "$url" -o "$archive"
tar -xzf "$archive" -C "$tmp"
source_dir="$(find "$tmp" -mindepth 1 -maxdepth 1 -type d -name 'ai-agents-skills-*' | head -n1)"
[[ -n "$source_dir" ]] || { echo "Cannot find extracted repository" >&2; exit 1; }

mkdir -p "$(dirname "$INSTALL_DIR")" "$BIN_DIR"
if [[ -e "$INSTALL_DIR" && ! -f "$INSTALL_DIR/.ai-agents-skills-managed" ]]; then
  echo "Refusing to replace unmanaged directory: $INSTALL_DIR" >&2
  echo "Set AI_AGENTS_SKILLS_HOME to another path or move that directory first." >&2
  exit 1
fi
new_dir="${INSTALL_DIR}.new.$$"
rm -rf "$new_dir"
cp -R "$source_dir" "$new_dir"
touch "$new_dir/.ai-agents-skills-managed"
rm -rf "$INSTALL_DIR"
mv "$new_dir" "$INSTALL_DIR"
chmod +x "$INSTALL_DIR/bin/ai-skills" "$INSTALL_DIR/scripts/"*.sh "$INSTALL_DIR/install.sh" 2>/dev/null || true
ln -sfn "$INSTALL_DIR/bin/ai-skills" "$BIN_DIR/ai-skills"

if [[ $RUN_GLOBAL -eq 1 ]]; then
  "$INSTALL_DIR/bin/ai-skills" global
fi
if [[ -n "$PROJECT" ]]; then
  "$INSTALL_DIR/bin/ai-skills" project "$PROJECT"
fi

echo
echo "✓ AI Agents Skills installed"
echo "  Home: $INSTALL_DIR"
echo "  CLI:  $BIN_DIR/ai-skills"
case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *) echo "  Add to PATH: export PATH=\"$BIN_DIR:\$PATH\"" ;;
esac
echo "  Check: $BIN_DIR/ai-skills doctor"
