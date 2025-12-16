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

            on_open = function(win)
                -- Perintah untuk menyembunyikan bilah tab di Kitty
                vim.fn.system("kitty @ set-tab-bar-visible no")
            end,
            -- ** Bagian Penting: on_close **
            on_close = function()
                -- Perintah untuk menampilkan kembali bilah tab di Kitty saat keluar dari Zen Mode
                vim.fn.system("kitty @ set-tab-bar-visible yes")
            end,
        },
        keys = {
            { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
        },
    },
}
