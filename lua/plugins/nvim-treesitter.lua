return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" }, -- Optimasi startup
        build = ":TSUpdate", -- Perintah build untuk memastikan parser terinstall
        config = function()
            require("configs.nvim-treesitter")
        end,
    },
}
