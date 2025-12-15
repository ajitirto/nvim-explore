return {
    {
        "folke/zen-mode.nvim",
        opts = {
            -- Configuration options go here
            -- Example options:
            window = {
                width = 0.85, -- 85% of the editor width
                height = 1, -- Full height
                backdrop = 0.95, -- backdrop transparency
            },
            -- Integrations with other plugins can be configured here
            -- e.g., if you use folke/twilight.nvim to dim inactive code:
            plugins = {
                twilight = { enabled = true },
            },
            -- ... more options
        },
        -- Optional: Define a keymap to easily toggle Zen Mode
        keys = {
            { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
        },
    },
}
