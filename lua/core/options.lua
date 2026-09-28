local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = 'a'
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.clipboard = 'unnamedplus'
opt.termguicolors = true
opt.wrap = false

-- Python/C++ Specific Indentation Logic
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"c", "cpp"},
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})
