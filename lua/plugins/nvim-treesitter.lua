return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("configs.nvim-treesitter")
        end,
    },
}
