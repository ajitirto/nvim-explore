local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
require("nvchad.configs.lspconfig").defaults()
vim.lsp.config("tsserver", {
    capabilities = lsp_capabilities,
    init_options = {
        hostInfo = "neovim",
    },
})

vim.lsp.config("bashls", {
    capabilities = lsp_capabilities,
})

vim.lsp.config("yamlls", {
    capabilities = lsp_capabilities,
})

vim.lsp.config("rust_analyzer", {
    capabilities = lsp_capabilities,
})

local simple_servers = {
    -- Core Web
    "html",
    "cssls",
    -- Umum
    "lua_ls", -- Mengganti 'lua-language-server'
    "lemminx",
    "clangd",
    "gopls",
    "omnisharp",
    "phpactor",
    "ansiblels", -- Mengganti 'ansible-language-server'
    "erlang_ls", -- Mengganti 'erlang-language-server'
    "sqlls",
    "dockerls", -- Server umum untuk Dockerfile
    "jsonls", -- Seringkali dibutuhkan untuk config
    "typescript-language-server",
}

vim.lsp.enable("tsserver", {
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
})

vim.lsp.enable("bashls", {
    filetypes = { "sh", "zsh" },
})

for _, server_name in ipairs(simple_servers) do
    vim.lsp.enable(server_name, {
        capabilities = lsp_capabilities,
    })
end
