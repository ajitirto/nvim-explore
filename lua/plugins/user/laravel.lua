return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Pastikan 'blade' ada di daftar bahasa yang diinstal
      vim.list_extend(opts.ensure_installed, { "blade" })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
    ft = { "css", "blade", "html", "javascript" },
  },
}
