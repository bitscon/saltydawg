#!/bin/sh
# =============================================================================
#  Salty Dawg II — Plesk Deployment Script
#  Runs after Plesk pulls the latest code from GitHub.
#
#  Usage (set this as the Additional Deployment Action in Plesk):
#    sh deploy/plesk-deploy.sh
#
#  Requirements:
#    - Node.js and npm must be available (see TROUBLESHOOTING below).
#    - Document root in Plesk must be set to: httpdocs/dist
#
#  TROUBLESHOOTING:
#    If npm is not found, enable Node.js in the Plesk domain settings first,
#    then re-run or let Plesk deploy again. The script will locate npm from
#    common Plesk Node paths automatically.
# =============================================================================

set -eu

# Plesk may invoke additional actions from a surprising working directory.
# Normalize to the repository root and persist logs for File Manager inspection.
SCRIPT_DIR=${0%/*}
if [ "$SCRIPT_DIR" = "$0" ]; then
  SCRIPT_DIR="."
fi
cd "$SCRIPT_DIR/.." || exit 1

LOG_FILE="plesk-deploy.log"
: > "$LOG_FILE" || exit 1
exec > "$LOG_FILE" 2>&1

# ── Log helpers ───────────────────────────────────────────────────────────────
ok()   { printf '[OK]    %s\n' "$*"; }
warn() { printf '[WARN]  %s\n' "$*"; }
fail() { printf '[FAIL]  %s\n' "$*"; exit 1; }

echo "============================================"
echo "  Salty Dawg II — Deployment starting"
echo "  Deployment task started"
echo "============================================"

# ── Locate npm ────────────────────────────────────────────────────────────────
# Plesk sometimes installs Node under versioned, non-standard paths.
NPM_CANDIDATES="/opt/plesk/node/*/bin/npm /opt/plesk/nodejs/*/bin/npm /usr/share/plesk-nodejs/bin/npm /usr/local/bin/npm /usr/bin/npm"

NPM_BIN=""
for candidate in $NPM_CANDIDATES; do
  for npm_path in $candidate; do
    if [ -x "$npm_path" ]; then
      NPM_BIN="$npm_path"
      break
    fi
  done
  if [ -n "$NPM_BIN" ]; then
    break
  fi
done

# Fall back to whatever is on PATH
if [ -z "$NPM_BIN" ] && command -v npm >/dev/null 2>&1; then
  NPM_BIN="$(command -v npm)"
fi

if [ -z "$NPM_BIN" ]; then
  warn "npm not found. Checked candidates:"
  for candidate in $NPM_CANDIDATES; do
    for npm_path in $candidate; do
      warn "  $npm_path"
    done
  done
  fail "npm not found. Enable Node.js in Plesk domain settings, then re-deploy."
fi

NPM_DIR=${NPM_BIN%/*}
case "$NPM_DIR" in
  /opt/plesk/*|/usr/share/plesk-nodejs/*)
    PATH="$NPM_DIR:${PATH:-}"
    export PATH
    ;;
esac

NPM_VERSION=$("$NPM_BIN" --version 2>/dev/null || echo "unknown")
ok "Using npm: $NPM_BIN (${NPM_VERSION})"

# ── Confirm we are in the project root ───────────────────────────────────────
if [ ! -f "package.json" ]; then
  fail "package.json not found. Make sure the working directory is the project root."
fi

if [ ! -f "astro.config.mjs" ]; then
  fail "astro.config.mjs not found. This does not look like the Salty Dawg II Astro project."
fi

# ── Install dependencies ──────────────────────────────────────────────────────
if [ -f "package-lock.json" ]; then
  ok "package-lock.json found — running npm ci (clean, reproducible install)"
  "$NPM_BIN" ci --prefer-offline 2>&1 || "$NPM_BIN" ci
else
  warn "package-lock.json not found — falling back to npm install"
  "$NPM_BIN" install
fi

ok "Dependencies installed"

# ── Build ─────────────────────────────────────────────────────────────────────
ok "Running build (npm run build)..."
"$NPM_BIN" run build

# ── Verify output ─────────────────────────────────────────────────────────────
if [ ! -f "dist/index.html" ]; then
  fail "Build finished but dist/index.html is missing. Check build output above."
fi

DIST_SIZE=$(du -sh dist/ 2>/dev/null | cut -f1 || echo "unknown")
ok "Build complete — dist/ is ${DIST_SIZE}"

echo ""
echo "============================================"
echo "  Deployment SUCCESSFUL"
echo "  Static files are in: dist/"
echo "  Plesk document root must point to: httpdocs/dist"
echo "============================================"
