return {
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

  require("plugins.user.laravel"),
  -- require("plugins.user.cobacoba"),
  require("plugins.user.json"),

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
      highlight = {
        enable = true, 
      },

  		ensure_installed = {
  			"vim", 
        "lua", 
        "vimdoc",
        "html", 
        "css", 
        "dockerfile", 
        "php",
        "blade",
        "javascript",
        "typescript",
        "python",
        "c",
        "cpp",
        "rust",
        "go",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "erlang",
        "elixir",
  		},
  	},
  },
}
