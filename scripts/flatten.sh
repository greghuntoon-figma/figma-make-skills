#!/usr/bin/env bash
# Flatten all skill .md files for upload to Figma Make.
# Skills live in tier folders for repo organization, but Figma Make
# requires per-skill upload — this consolidates them.

set -e

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT/dist"

mkdir -p "$OUT"
rm -f "$OUT"/*.md

find "$ROOT/workflow" "$ROOT/design" "$ROOT/refine" "$ROOT/handoff" \
  -name "*.md" ! -name "README.md" \
  -exec cp {} "$OUT/" \;

COUNT=$(ls "$OUT"/*.md 2>/dev/null | wc -l | tr -d ' ')
echo "✓ $COUNT skills ready in ./dist/"
echo ""
echo "Upload steps:"
echo "  1. In Figma Make, click the + in the prompt box."
echo "  2. Select Skills → Create skill → Import from computer."
echo "  3. Upload each .md file from ./dist/."
