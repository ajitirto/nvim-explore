return {

  -- import form user  
  require("plugins.user.laravel"),
  require("plugins.user.nvim-treesitter"),
  require("plugins.user.json"),
  -- require("plugins.user.folke-snacks"),

  -- hardcode
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.hlchunk")
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side  = 'right',
        width = 40,
      }
    }
  },
--   {
--   "mason-org/mason.nvim",
--   opts = {
--     ensure_installed = {
--       "lua-language-server",
--       "html-lsp",
--       "prettier",
--       "stylua",
--       "yaml-language-server",
--       "lemminx",
--       "typescript-language-server",
--       "clangd",
--       "gopls",
--       "rust-analyzer",
--       "svelte-language-server",
--       "omnisharp",
--       "ansible-language-server",
--       "bash-language-server",
--       "erlang-language-server",
--       "laravel-ls",
--       "prometheus-pint",
--       "sqlls",
--       "tofu-ls",
--       },
--
--     ui = {
--           icons = {
--               package_installed = "✓",
--               package_pending = "➜",
--               package_uninstalled = "✗"
--           }
--       },
--     log_level = vim.log.levels.DEBUG
--
--   },
-- },
--
}
