#!/usr/bin/env bash
set -euo pipefail

echo "=== VM Service Map — Setup ==="
echo ""

# Check Node.js
if ! command -v node &>/dev/null; then
  echo "Error: Node.js is required. Install it from https://nodejs.org"
  exit 1
fi

echo "Node.js $(node -v) found"

# Detect package manager
if command -v pnpm &>/dev/null; then
  PM="pnpm"
elif command -v npm &>/dev/null; then
  PM="npm"
else
  echo "Error: pnpm or npm is required."
  exit 1
fi

echo "Using $PM"
echo ""

# Install dependencies
echo "Installing dependencies..."
$PM install react @react-pdf/renderer
$PM install -D tsx @types/react

echo ""
echo "Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Open Claude Code"
echo "  2. Paste the contents of vm-service-map-prompt.md"
echo "  3. Follow the interactive prompts"
