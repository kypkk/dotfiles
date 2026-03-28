#!/usr/bin/env bash
set -euo pipefail

FLAKE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOSTNAME=$(scutil --get LocalHostName 2>/dev/null || hostname -s)

echo "==> mac-setup bootstrap"
echo "    hostname : $HOSTNAME"
echo "    flake    : $FLAKE_DIR"
echo ""

# ── 1. Nix ────────────────────────────────────────────────────────────────────
if ! command -v nix &>/dev/null; then
  echo "==> Installing Nix (Determinate Systems)..."
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
  # Re-source nix into current shell
  # shellcheck disable=SC1091
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
else
  echo "==> Nix already installed — skipping"
fi

# ── 2. Homebrew ───────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "==> Homebrew already installed — skipping"
fi

# ── 3. Verify flake target ────────────────────────────────────────────────────
FLAKE_TARGETS=$(nix flake show "$FLAKE_DIR" --json 2>/dev/null | \
  python3 -c "import json,sys; d=json.load(sys.stdin); print('\n'.join(d.get('darwinConfigurations',{}).keys()))" 2>/dev/null || true)

if echo "$FLAKE_TARGETS" | grep -qx "$HOSTNAME"; then
  TARGET="$HOSTNAME"
else
  echo ""
  echo "  Available flake targets:"
  echo "$FLAKE_TARGETS" | sed 's/^/    - /'
  echo ""
  read -rp "  Your hostname '$HOSTNAME' has no flake target. Enter target to use: " TARGET
fi

# ── 4. Apply configuration ────────────────────────────────────────────────────
echo ""
echo "==> Applying configuration: .#$TARGET"
nix run nix-darwin -- switch --flake "$FLAKE_DIR#$TARGET"

echo ""
echo "==> Done. Open a new terminal to load the new shell environment."
