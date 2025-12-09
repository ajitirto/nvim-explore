return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
    ft = { "css", "blade", "html", "javascript" },
  },
}
