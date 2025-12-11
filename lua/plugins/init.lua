return {

    -- import form user
    require("plugins.user.laravel"),
    require("plugins.user.nvim-treesitter"),
    require("plugins.user.json"),
    -- require("plugins.user.folke-snacks"),
    -- hardcode
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            indent = { enable = true },
            auto_install = true,
            highlight = {
                enable = true,
            },
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "dockerfile",
                "php",
                "blade",
                "javascript",
                "typescript",
                "python",
                "c",
                "cpp",
                "rust",
                "go",
                "gosum",
                "gomod",
                "gowork",
                "json",
                "yaml",
                "markdown",
                "markdown_inline",
                "erlang",
                "elixir",
                "bash",
                "toml",
                "python",
            },
        },
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
        ft = { "css", "blade", "html", "javascript" },
    },
    {
        "gennaro-tedesco/nvim-jqx",
        event = { "BufReadPost" },
        ft = { "json", "yaml" },
    },
    {
        "stevearc/conform.nvim",
        opts = require("configs.conform"),
        dependencies = { "mason.nvim" },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    },
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.hlchunk")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = require("configs.nvim-tree"),
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    },
    {
        "mason-org/mason.nvim",
        opts = require("configs.mason"),
        cmd = { "Mmason", "MasonInstall", "MasonUpdate" },
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("configs.dap")
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("dap-python").setup({})
        end,
    },
    {
        "mfussenegger/nvim-lint",
        dependencies = { "mason.nvim" },
        config = function()
            require("configs.lint")
        end,
        event = "VeryLazy",
    },
    { "nvzone/volt", lazy = true },
    { "nvzone/menu", lazy = true },
    {
        "nvzone/timerly",
        dependencies = "nvzone/volt",
        cmd = "TimerlyToggle",
        opts = require("configs.timerly"),
    },
    {
        "nvzone/floaterm",
        dependencies = "nvzone/volt",
        opts = require("configs.floaterm"),
        cmd = "FloatermToggle",
    },
    {
        "gisketch/triforce.nvim",
        dependencies = {
            "nvzone/volt",
        },
        config = function()
            require("configs.triforce")
        end,
    },
    {
        "wakatime/vim-wakatime",
        lazy = false,
    },
    -- markdown preview
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        opts = require("configs.markview"),
    },
    -- todo nvim
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        config = function()
            require("configs.todo")
        end,
    },
    -- trouble nvim
    {
        "folke/trouble.nvim",
        opts = require("configs.trouble"),
        lazy = false,
        cmd = "Trouble",
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
    {
        "f-person/git-blame.nvim",
    },
}
