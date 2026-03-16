-- Python LSP Configuration with Pyright
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

      require('lspconfig').pyright.setup({})
    end,
  },
}
