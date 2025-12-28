return {
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("configs.cmp")
        end,
        event = "InsertEnter",
    },
}
