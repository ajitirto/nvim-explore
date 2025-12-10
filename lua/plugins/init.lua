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
}
