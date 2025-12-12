local lint = require("lint")

lint.linters_by_ft = {
    python = { "ruff" },
    go = { "golangcilint" },
    javascript = { "eslint" },
    lua = { "luacheck" },
    markdown = { "vale" },
}
local lint_group = vim.api.nvim_create_augroup("AutoLintingGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
    group = lint_group,
    callback = function()
        lint.try_lint()
    end,
})
