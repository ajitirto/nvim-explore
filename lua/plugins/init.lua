return {

    -- import form user
    require("plugins.user.laravel"),
    require("plugins.user.nvim-treesitter"),
    require("plugins.user.json"),
    -- require("plugins.user.folke-snacks"),

    -- hardcode
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
        opts = {
            view = {
                side = "right",
                width = 40,
            },
        },
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "ansible-language-server",
                "ansible-lint",
                "bash-language-server",
                "black",
                "blade-formatter",
                "clangd",
                "codespell",
                "css-lsp",
                "debugpy",
                "delve",
                "docker-compose-language-service",
                "elixir-ls",
                "erlang-debugger",
                "erlang-ls",
                "goimports",
                "gopls",
                "html-lsp",
                "isort",
                "json-lsp",
                "kube-linter",
                "laravel-ls",
                "lemminx",
                "lua-language-server",
                "luau-lsp",
                "omnisharp",
                "php-cs-fixer",
                "phpactor",
                "phpcbf",
                "pint",
                "prettier",
                "prettierd",
                "rust-analyzer",
                "sqlls",
                "stylua",
                "tofu-ls",
                "typescript-language-server",
                "yaml-language-server",
            },

            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            log_level = vim.log.levels.DEBUG,
        },
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio", -- Required by nvim-dap
            "rcarriga/nvim-dap-ui", -- UI for nvim-dap
            "theHamsta/nvim-dap-virtual-text", -- Virtual text for breakpoints
            "nvim-telescope/telescope-dap.nvim", -- Telescope integration (optional)
        },
        event = "VeryLazy",
        config = function()
            require("dapui").setup({
                -- Configure dapui as desired, e.g., layouts, icons
                icons = { expanded = "▾", collapsed = "▸" },
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.25 },
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        size = 10, -- columns
                        position = "bottom",
                    },
                },
            })

            local dap = require("dap")
            local dapui = require("dapui")

            -- Automatically open/close dapui on attach/launch/terminate/exit
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },

    -- Language-specific DAP integrations (example for Python)
    {
        "mfussenegger/nvim-dap-python",
        ft = "python", -- Only load for Python files
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("dap-python").setup({
                -- Configure dap-python here, e.g., debugpy path
                -- debugpy_path = "/path/to/your/debugpy",
            })
        end,
    },

    { "nvzone/volt", lazy = true },
    { "nvzone/menu", lazy = true },

    {
        "nvzone/timerly",
        dependencies = "nvzone/volt",
        cmd = "TimerlyToggle",
        opts = {}, -- optional
    },

    {
        "nvzone/floaterm",
        dependencies = "nvzone/volt",
        opts = {},
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
        preview = {
            icon_provider = "internal",
        },
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
        opts = {},
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
            local cmp = require("cmp")
            cmp.setup({
                sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } }),
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                snippet = {
                    expand = function(args)
                        require("luasnip").jump(args.body)
                    end,
                },
            })
        end,
    },
    {
        "mfussenegger/nvim-lint",
        dependencies = { "mason.nvim" },
        config = function()
            require("lint").linters_by_ft = {
                python = { "ruff" },
                go = { "golangci-lint" },
            }
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
    {
        "f-person/git-blame.nvim",
    },
}
