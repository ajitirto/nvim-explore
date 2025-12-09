return {

  -- import form user  
  require("plugins.user.laravel"),
  require("plugins.user.nvim-treesitter"),
  require("plugins.user.json"),

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

}
