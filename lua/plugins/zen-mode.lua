return {
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                width = 0.9,
                height = 0.8,
                backdrop = 0.95,
            },
            plugins = {
                twilight = { enabled = true },
                options = {
                    enabled = true,
                    ruler = false, -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    -- you may turn on/off statusline in zen mode by setting 'laststatus'
                    -- statusline will be shown only if 'laststatus' == 3
                    laststatus = 0, -- turn off the statusline in zen mode
                },
                gitsigns = { enabled = false }, -- disables git signs
                tmux = { enabled = false }, -- disables the tmux statusline
                todo = { enabled = false }, -- if set to "true", todo-comments.nvim highlights will be disabled
                kitty = {
                    enabled = false,
                    font = "+4", -- font size increment
                },
            },
        },
        keys = {
            { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
        },
    },
}
