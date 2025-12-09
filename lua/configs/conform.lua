local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    php = { "phpcbf", "php_cs_fixer" },
    blade = { "blade-formatter" },
    -- css = { "prettier" },=
    -- html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
