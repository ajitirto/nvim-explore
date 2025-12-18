local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

require("nvchad.configs.lspconfig").defaults()

local simple_servers = {
    -- Core Web
    "html",
    "cssls",
    -- Umum
    "lua_ls",
    "lemminx",
    "clangd",
    "gopls",
    "omnisharp",
    "phpactor",
    "ansiblels",
    -- "erlang_ls",
    "sqlls",
    "dockerls",
    "jsonls",
    "bashls",
    "yamlls",
    "rust_analyzer",
}

for _, server_name in ipairs(simple_servers) do
    lspconfig[server_name].setup({
        capabilities = lsp_capabilities,
    })
end

lspconfig.tsserver.setup({
    capabilities = lsp_capabilities,
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    init_options = {
        hostInfo = "neovim",
    },
})
