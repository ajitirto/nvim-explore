return {
  {
    'dmmulroy/ts-error-translator.nvim',
    lazy = false,
     config = function()
      require("ts-error-translator").setup({
      auto_attach = true,

          servers = {
            "astro",
            "svelte",
            "ts_ls",
            "tsserver",           -- deprecated, use ts_ls
            "typescript-tools",
            "volar",
            "vtsls",
          },
        })
      end,
  },
  {
  "rafamadriz/friendly-snippets",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
},
}
