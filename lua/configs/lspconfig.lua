require("nvchad.configs.lspconfig").defaults()

local servers = {
    "html",
    "cssls",
    "docker_language_server",
    "docker_compose_language_service",
    "lua-language-server",
    "html-lsp",
    "prettier",
    "stylua",
    "yaml-language-server",
    "lemminx",
    "typescript-language-server",
    "clangd",
    "gopls",
    "rust-analyzer",
    "omnisharp",
    "phpactor",
    "ansible-language-server",
    "bash-language-server",
    "erlang-language-server",
    "laravel-ls",
    "prometheus-pint",
    "sqlls",
    "tofu-ls",
}
vim.lsp.enable(servers)

-- reRd :h vim.lsp.config for changing options of lsp servers
