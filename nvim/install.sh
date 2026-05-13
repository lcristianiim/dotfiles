#!/bin/bash
# Neovim config installer
# Usage: ./install.sh

set -e

CONFIG_DIR="$HOME/.config/nvim"
DOTFILES_DIR="$HOME/projects/dotfiles/nvim"

echo "Installing Neovim configuration..."

# Backup existing config
if [ -d "$CONFIG_DIR" ]; then
    echo "Backing up existing config to $CONFIG_DIR.backup"
    mv "$CONFIG_DIR" "$CONFIG_DIR.backup"
fi

# Create config directory
mkdir -p "$CONFIG_DIR/lua/plugins"

# Copy files
cp "$DOTFILES_DIR/init.lua" "$CONFIG_DIR/"
cp "$DOTFILES_DIR/lua/plugins/init.lua" "$CONFIG_DIR/lua/plugins/"

echo "✓ Config installed to $CONFIG_DIR"
echo ""
echo "Next steps:"
echo "1. Run 'nvim' to install plugins"
echo "2. Run ':TSInstall lua vim javascript typescript html css json markdown'"
echo "3. Run ':Lazy' to check plugin status"