#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  bash install.sh codex
  bash install.sh claude
  bash install.sh openclaw
  bash install.sh workbuddy
  bash install.sh trae
  bash install.sh agents

Targets:
  codex      Install to ~/.codex/skills/goal-unpacking
  claude     Install to ~/.claude/skills/goal-unpacking
  openclaw   Install to ~/.openclaw/skills/goal-unpacking
  workbuddy  Install to ~/.workbuddy/skills/goal-unpacking
  trae       Install to ~/.trae/skills/goal-unpacking
  agents     Install to ~/.agents/skills/goal-unpacking
EOF
}

if [ "${1:-}" = "" ]; then
  usage
  exit 1
fi

case "$1" in
  codex)
    target="$HOME/.codex/skills/goal-unpacking"
    ;;
  claude|claudecode|claude-code)
    target="$HOME/.claude/skills/goal-unpacking"
    ;;
  openclaw)
    target="$HOME/.openclaw/skills/goal-unpacking"
    ;;
  workbuddy)
    target="$HOME/.workbuddy/skills/goal-unpacking"
    ;;
  trae)
    target="$HOME/.trae/skills/goal-unpacking"
    ;;
  agents)
    target="$HOME/.agents/skills/goal-unpacking"
    ;;
  *)
    usage
    exit 1
    ;;
esac

source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/goal-unpacking"

if [ ! -f "$source_dir/SKILL.md" ]; then
  echo "Cannot find skill source at $source_dir" >&2
  exit 1
fi

mkdir -p "$(dirname "$target")"
rm -rf "$target"
cp -R "$source_dir" "$target"

echo "Installed goal-unpacking to $target"

