return {
    {
        "tpope/vim-surround",
        priority = 1000,
        lazy = false,
        config = function()
            -- Kita panggil which-key di sini untuk mendaftarkan labelnya
            local status_ok, wk = pcall(require, "which-key")
            if status_ok then
                wk.add({
                    { "ds", group = "Delete Surround" },
                    { "cs", group = "Change Surround" },
                    { "ys", group = "You Surround" },
                })
            end
        end,
    },
}
