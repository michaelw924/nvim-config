# Neovim Configuration

Personal Neovim configuration for michaelw924.

## Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/michaelw924/nvim-config.git ~/.config/nvim
   ```

2. Open Neovim and let lazy.nvim install plugins

## Features

- **lazy.nvim** - Plugin manager
- **tokyonight** - Colorscheme
- **nvim-treesitter** - Syntax highlighting and indentation
- **nvim-dap** - Debug Adapter Protocol support (Python, C/C++)

## Keybindings

| Keybinding | Action |
|------------|--------|
| `jj` (insert) | Escape |
| `<leader>l` | Clear search highlights |
| `<C-h/j/k/l>` | Window navigation |
| `<F5>` | Continue debug |
| `<F6>` | Step over |
| `<F7>` | Step into |
| `<F8>` | Step out |
| `<leader>b` | Toggle breakpoint |

## Files

- `init.lua` - Main configuration
- `lua/core/options.lua` - Neovim options
- `lua/core/keymaps.lua` - Key mappings
- `lua/plugins/` - Plugin configurations
