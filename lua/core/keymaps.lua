vim.g.mapleader = ' '

local keymap = vim.keymap

-- Quick escape
keymap.set('i', 'jj', '<Esc>')

-- Clear highlights
keymap.set('n', '<leader>l', ':nohlsearch<CR>')

-- Better window navigation
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')
