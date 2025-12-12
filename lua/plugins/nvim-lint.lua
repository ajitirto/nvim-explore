return {
    {
        "mfussenegger/nvim-lint",
        dependencies = { "mason.nvim" },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },
}
