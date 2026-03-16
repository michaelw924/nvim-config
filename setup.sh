#!/usr/bin/env bash

set -e

echo "Setting up Neovim configuration..."

### Install config

CONFIG_DIR="$HOME/.config/nvim"

if [ -d "$CONFIG_DIR" ]; then
    echo "Existing nvim config found, backing up..."
    mv "$CONFIG_DIR" "$CONFIG_DIR.bak"
fi

git clone https://github.com/michaelw924/nvim-config.git "$CONFIG_DIR"

### Remove old plugin cache
rm -rf ~/.local/share/nvim

echo ""
echo "Setup complete!"
echo "Starting Neovim..."

nvim
