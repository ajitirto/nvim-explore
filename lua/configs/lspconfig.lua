local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("html", {
    capabilities = lsp_capabilities,
})

vim.lsp.config("cssls", {
    capabilities = lsp_capabilities,
})
vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = false,
            },
        },
    },
})

vim.lsp.config("lua_ls", {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath("config")
                and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
                version = "LuaJIT",
                path = {
                    "lua/?.lua",
                    "lua/?/init.lua",
                },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        })
    end,
    settings = {
        Lua = {},
    },
})

vim.lsp.config("elixirls", {
    cmd = { "/home/ajitirto/Downloads/elixirls/language_server.sh" },
})

vim.lsp.config("dockerls", {
    settings = {
        docker = {
            languageserver = {
                formatter = {
                    ignoreMultilineInstructions = true,
                },
            },
        },
    },
})

local lsp = vim.lsp.enable

lsp("astro")
lsp("gopls")
lsp("ts_ls")
lsp("html")
lsp("lua_ls")
lsp("elixirls")
lsp("bashls")
lsp("clangd")
lsp("phpactor")
lsp("phpactor")
lsp("ansiblels")
lsp("sqlls")
lsp("dockerls")
