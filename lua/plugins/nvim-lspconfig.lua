return {
    {
        "saghen/blink.cmp",
        Lazy = false,
        dependencies = { "rafamadriz/friendly-snippets" },

        version = "1.*",
        build = "cargo build --release",
        opts = {

            keymap = { preset = "default" },

            appearance = {

                nerd_font_variant = "mono",
            },

            completion = { documentation = { auto_show = true, auto_show_delay_ms = 500 } },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            fuzzy = { implementation = "lua" },
            cmdline = {
                keymap = {
                    ["<Tab>"] = { "show", "accept" },
                },
                completion = {
                    menu = { auto_show = true },
                    ghost_text = { enabled = true },
                },
            },
        },
        opts_extend = { "sources.default" },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        config = function()
            require("configs.lspconfig")
        end,
    },
}
