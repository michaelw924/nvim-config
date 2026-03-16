-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    -- Python language server
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      -- Setup pyright via Mason
      require('mason-lspconfig').setup({
        ensure_installed = { 'pyright' },
      })

      vim.lsp.config.pyright.setup({})
    end,
  },
}
