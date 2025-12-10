local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    php = { "phpcbf", "php_cs_fixer" },
    blade = { "blade-formatter" },
    python = { "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
  },

 }

return options
