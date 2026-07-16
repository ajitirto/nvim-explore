return {
    view = {
        side = "right", -- Pohon file akan muncul di sisi kanan
        width = 40, -- Lebar pohon file disetel ke 40 karakter
    },
    filters = {
        dotfiles = true,
    },
    git = {
        ignore = true,
    },

    -- view = {
    --     number = true,
    --     relativenumber = true,
    --     float = {
    --         enable = true,
    --         quit_on_focus_loss = true,
    --         open_win_config = function()
    --             local screen_w = vim.opt.columns:get()
    --             local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
    --             local window_w = math.floor(screen_w * 0.5)
    --             local window_h = math.floor(screen_h * 0.6)
    --             local center_x = math.floor((screen_w - window_w) / 2)
    --             local center_y = math.floor((screen_h - window_h) / 2)
    --
    --             return {
    --                 border = "rounded",
    --                 relative = "editor",
    --                 row = center_y,
    --                 col = center_x,
    --                 width = window_w,
    --                 height = window_h,
    --             }
    --         end,
    --     },
    -- },
    -- Tambahkan blok RENDERER ini di bawah blok view untuk menghilangkan spasi/offset atas
    -- renderer = {
    --     header = "", -- Menghilangkan teks/spasi header di dalam nvim-tree
    --     group_empty = true,
    -- },

    -- Setelan ini memberi tahu NvimTree agar tidak mengacaukan padding window/tab di atas
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
}
