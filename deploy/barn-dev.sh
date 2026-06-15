#!/usr/bin/env bash
# =============================================================================
#  Salty Dawg II — Barn Server Dev Build Script
#  Run this on the barn server after pulling new code from GitHub.
#
#  Usage:
#    cd /home/billyb/workspaces/saltydawg
#    bash deploy/barn-dev.sh
#
#  The built site is served by nginx from:
#    /home/billyb/workspaces/saltydawg/dist
#
#  nginx config: deploy/barn-nginx.conf
#  nginx site:   saltydawg.barn.workshop.home
# =============================================================================

set -euo pipefail

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
ok()   { echo -e "${GREEN}[OK]${NC}    $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC}  $*"; }
fail() { echo -e "${RED}[FAIL]${NC}  $*"; exit 1; }

echo "============================================"
echo "  Salty Dawg II — Barn Dev Build"
echo "  $(date '+%Y-%m-%d %H:%M:%S')"
echo "============================================"

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"
ok "Project root: $PROJECT_ROOT"

# Confirm we are in the right place
[ -f "package.json" ] || fail "package.json not found in $PROJECT_ROOT"

# Pull latest (only if this is a git repo with a remote)
if git remote get-url origin &>/dev/null; then
  ok "Pulling latest from origin/main..."
  git pull origin main
else
  warn "No git remote — skipping pull. Run manually if needed."
fi

# Install
if [ -f "package-lock.json" ]; then
  ok "Running npm ci..."
  npm ci --prefer-offline
else
  warn "No package-lock.json — running npm install"
  npm install
fi

# Build
ok "Building..."
npm run build

# Verify
[ -f "dist/index.html" ] || fail "dist/index.html missing after build"
DIST_SIZE=$(du -sh dist/ 2>/dev/null | cut -f1 || echo "?")
ok "Build complete — dist/ is ${DIST_SIZE}"

echo ""
echo "============================================"
echo "  Barn dev build SUCCESSFUL"
echo "  Serving from: $PROJECT_ROOT/dist"
echo "  Dev URL: http://saltydawg.barn.workshop.home"
echo "============================================"
