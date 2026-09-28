return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- This 'pcall' prevents the "module not found" error from crashing Nvim
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then return end

      configs.setup({
        ensure_installed = { "python", "cpp", "c", "lua", "vim" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
}
