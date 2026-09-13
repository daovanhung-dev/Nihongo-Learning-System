#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[1/3] Installing frontend dependencies..."
cd "$ROOT/frontend"
npm install

echo "[2/3] Checking Angular build..."
npm run build

echo "[3/3] Done."
echo "Next: configure Supabase public values and run npm start."
