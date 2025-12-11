return {
    {
        "mfussenegger/nvim-lint",
        dependencies = { "mason.nvim" },
        config = function()
            require("configs.lint")
        end,
        event = "VeryLazy",
    },
}
