local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    php = { "phpcbf", "php_cs_fixer" },
    blade = { "blade-formatter" },
  },

 }

return options
