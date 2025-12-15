return {
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                width = 1,
                height = 1,
                backdrop = 0.95,
            },
            plugins = {
                twilight = { enabled = true },
            },
        },
        keys = {
            { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
        },
    },
}
