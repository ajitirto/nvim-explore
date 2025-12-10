local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        php = { "phpcbf", "php_cs_fixer", "pint" },
        blade = { "blade-formatter" },
        python = { "black", "isort" },
        javascript = { "prettier", "prettierd" },
        typescript = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        rust = { "rustfmt", lsp_format = "fallback" },
        go = { "goimports", "gofmt" },
        ["*"] = { "codespell" },
        ["_"] = { "trim_whitespace" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },

    log_level = vim.log.levels.ERROR,
    notify_on_error = true,
    notify_no_formatters = true,

    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options
