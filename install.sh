#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────
#  Neovim + LazyVim setup script for macOS
#  Run: bash install.sh
# ─────────────────────────────────────────────────────────────────
set -e

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
info()    { echo -e "${GREEN}[INFO]${NC} $1"; }
warning() { echo -e "${YELLOW}[WARN]${NC} $1"; }

# ── 1. Homebrew ──────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ── 2. Core dependencies ─────────────────────────────────────────
info "Installing core dependencies via Homebrew..."
brew install neovim git fd ripgrep fzf node python make gcc wget curl

# NerdFonts (for icons)
brew install --cask font-jetbrains-mono-nerd-font 2>/dev/null || \
  warning "JetBrainsMono Nerd Font already installed or skipped."

# ── 3. Language runtimes ─────────────────────────────────────────
info "Installing language runtimes..."

# Java (via temurin — OpenJDK)
brew install --cask temurin 2>/dev/null || warning "Java already installed."
brew install maven gradle 2>/dev/null || true

# Python
brew install python 2>/dev/null || true
pip3 install pynvim --quiet

# Node / npm (for TypeScript LSP)
npm install -g neovim typescript ts-node 2>/dev/null || true

# .NET / C# (Mono is NOT enough — install full .NET SDK)
if ! command -v dotnet &>/dev/null; then
  info "Installing .NET SDK..."
  brew install --cask dotnet-sdk 2>/dev/null || true
fi

# ── 4. Copy config ───────────────────────────────────────────────
NVIM_CONFIG="$HOME/.config/nvim"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info "Backing up existing config (if any)..."
if [ -d "$NVIM_CONFIG" ]; then
  mv "$NVIM_CONFIG" "${NVIM_CONFIG}.bak.$(date +%Y%m%d_%H%M%S)"
  warning "Old config moved to ${NVIM_CONFIG}.bak.*"
fi

info "Installing new config to $NVIM_CONFIG..."
cp -r "$SCRIPT_DIR" "$NVIM_CONFIG"

# ── 5. First launch ──────────────────────────────────────────────
info "Launching Neovim to install plugins (this may take a minute)..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null || true

echo ""
echo -e "${GREEN}✓ Done!${NC} Open Neovim with: nvim"
echo ""
echo "  First steps inside Neovim:"
echo "  :Mason          — verify LSP servers are installed"
echo "  :LazyHealth     — check plugin status"
echo "  :checkhealth    — general health check"
echo ""
echo "  Key bindings quick reference:"
echo "  <Space>e   → Toggle Neo-tree file explorer"
echo "  <Space>ff  → Find files (Telescope)"
echo "  <Space>fg  → Live grep"
echo "  <Space>tf  → Float terminal"
echo "  <Space>?   → All keymaps (which-key)"
