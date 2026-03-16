#!/usr/bin/env bash

set -e

echo "Installing Neovim environment..."

### Detect package manager

# 1. Detect package manager
if command -v apt >/dev/null; then
    PKG_INSTALL="sudo apt install -y"
    sudo apt update
    $PKG_INSTALL git curl build-essential unzip ripgrep fd-find xclip
elif command -v dnf >/dev/null; then
    PKG_INSTALL="sudo dnf install -y"
    $PKG_INSTALL git curl gcc make unzip ripgrep fd-find xclip
elif command -v pacman >/dev/null; then
    PKG_INSTALL="sudo pacman -S --noconfirm"
    $PKG_INSTALL git curl gcc make unzip ripgrep fd xclip
else
    echo "Unsupported package manager"
    exit 1
fi

# 2. Install Node.js via NodeSource (Debian/Ubuntu only)
if command -v apt >/dev/null; then
    echo "Installing Node.js via NodeSource..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs
fi

### Install latest Neovim

echo "Installing Neovim..."

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

echo "...Removing existing /opt/nvim..."
sudo rm -rf /opt/nvim
echo "...Unpacking tar..."
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
echo "...Moving unpacked files to /opt/nvim..."
sudo mv /opt/nvim-linux-x86_64 /opt/nvim

sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

### Install tree-sitter CLI (correct version)

echo "Installing tree-sitter CLI..."
sudo npm install -g tree-sitter-cli --unsafe-perm=true

### Install pyright for Python support
# Try to install via npm if available, fallback to pip3 if not
echo "Installing pyright for Python language server support..."

if command -v npm >/dev/null; then
    echo "Installing pyright via npm..."
    sudo npm install -g pyright --unsafe-perm=true
elif command -v pip3 >/dev/null; then
    echo "Installing pyright via pip3..."
    sudo pip3 install pyright
else
    echo "Warning: Neither npm nor pip3 found. Please install pyright manually for Python support."
fi

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
echo "Install complete!"
echo "Starting Neovim..."

nvim
