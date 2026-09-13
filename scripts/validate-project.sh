#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

count=$(find "$ROOT/design/stitch/screens" -mindepth 1 -maxdepth 1 -type d -name 'S*' | wc -l | tr -d ' ')
if [[ "$count" != "38" ]]; then
  echo "ERROR: expected 38 Stitch screen folders, got $count" >&2
  exit 1
fi

missing=0
for d in "$ROOT"/design/stitch/screens/S*; do
  [[ -f "$d/code.html" ]] || { echo "Missing code.html: $d"; missing=1; }
  [[ -f "$d/screen.png" ]] || { echo "Missing screen.png: $d"; missing=1; }
done
[[ "$missing" == "0" ]] || exit 1

[[ -f "$ROOT/docs/01_BUSINESS_DESIGN.md" ]] || exit 1
[[ -f "$ROOT/docs/03_IMPLEMENTATION_PLAN.md" ]] || exit 1
[[ -f "$ROOT/supabase/migrations/202609130001_initial_schema.sql" ]] || exit 1
[[ -f "$ROOT/frontend/src/app/app.routes.ts" ]] || exit 1

echo "Project validation passed: 38 Stitch screens + core project files present."
