local lint = require("lint")

-- 1. Definisikan linter untuk setiap jenis file
lint.linters_by_ft = {
    -- Untuk Python, gunakan linter 'ruff'
    python = { "ruff" },
    -- Untuk Go, gunakan linter 'golangci-lint'
    go = { "golangci-lint" },
    -- Tambahkan jenis file dan linter lainnya di sini, misalnya:
    -- javascript = { "eslint" },
    -- lua = { "luacheck" },
}

-- 2. Atur Autocmd untuk menjalankan linter secara otomatis
-- Linter akan dijalankan SETELAH file disimpan (BufWritePost)
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        -- Pastikan nvim-lint mencoba menjalankan linter yang sesuai
        lint.try_lint()
    end,
})
