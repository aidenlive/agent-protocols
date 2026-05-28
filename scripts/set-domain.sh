#!/usr/bin/env bash
#
# set-domain.sh — point the registry at your deployment URL.
#
# The HTML uses relative links and needs no changes. But manifests and command
# frontmatter contain ABSOLUTE URLs (agents fetch one manifest and need the full
# URL of every command), so the domain must be baked in. This script rewrites
# every absolute URL to the base you provide.
#
# Usage:
#   ./scripts/set-domain.sh https://protocols.yourdomain.com
#   ./scripts/set-domain.sh https://yourdomain.com/agent-protocols   # sub-path
#
# Re-run any time your URL changes. It reads the current base from manifest.json,
# so it is safe to run repeatedly (idempotent).

set -euo pipefail

# ---- args ----
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <new-base-url>"
  echo "Example: $0 https://protocols.yourdomain.com"
  exit 1
fi

NEW_BASE="${1%/}"   # strip any trailing slash

if [[ ! "$NEW_BASE" =~ ^https?:// ]]; then
  echo "Error: base URL must start with http:// or https://"
  echo "Got: $NEW_BASE"
  exit 1
fi

# ---- locate repo root (parent of this script's dir) ----
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT"

# ---- read the current base from manifest.json ----
CURRENT_BASE="$(grep -o '"base_url": *"[^"]*"' manifest.json | head -1 | sed 's/.*"base_url": *"\([^"]*\)".*/\1/')"

if [[ -z "$CURRENT_BASE" ]]; then
  echo "Error: could not read base_url from manifest.json"
  exit 1
fi

if [[ "$CURRENT_BASE" == "$NEW_BASE" ]]; then
  echo "Already set to $NEW_BASE — nothing to do."
  exit 0
fi

echo "Rewriting absolute URLs:"
echo "  from: $CURRENT_BASE"
echo "  to:   $NEW_BASE"
echo ""

# ---- rewrite every text file that can contain the base URL ----
# Includes the bare host in og:url and the visible terminal demo line.
COUNT=0
while IFS= read -r -d '' f; do
  if grep -q "$CURRENT_BASE" "$f" 2>/dev/null; then
    # portable in-place sed (GNU + BSD/macOS)
    if sed --version >/dev/null 2>&1; then
      sed -i "s|$CURRENT_BASE|$NEW_BASE|g" "$f"
    else
      sed -i '' "s|$CURRENT_BASE|$NEW_BASE|g" "$f"
    fi
    echo "  updated $f"
    COUNT=$((COUNT + 1))
  fi
done < <(find . \
            -type f \
            \( -name '*.md' -o -name '*.json' -o -name '*.xml' -o -name '*.html' -o -name '*.toml' \) \
            -not -path './.git/*' \
            -print0)

echo ""
echo "Done. $COUNT files updated."
echo "Verify: curl ${NEW_BASE}/manifest.json"
