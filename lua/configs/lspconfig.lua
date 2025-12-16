local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig") -- Tambahkan ini untuk memanggil .setup()

require("nvchad.configs.lspconfig").defaults() -- Ini tetap dipertahankan

-- Hapus semua kode tsserver/bashls/yamls/rust_analyzer yang di-comment out/konfigurasi manual.

-- Daftar server yang tidak memerlukan konfigurasi khusus.
-- Kita akan menggunakan fungsi .setup() dari lspconfig untuk server ini.
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
    "ansiblels",
    "erlang_ls",
    "sqlls",
    "dockerls",
    "jsonls",
    "bashls", -- Pindahkan bashls ke sini
    "yamlls", -- Tambahkan yamlls jika diperlukan
    "rust_analyzer", -- Tambahkan rust_analyzer jika diperlukan
}

-- 1. Setup Server Sederhana
-- Ini akan memastikan server-server ini dikonfigurasi dengan capabilities default.
for _, server_name in ipairs(simple_servers) do
    lspconfig[server_name].setup({
        capabilities = lsp_capabilities,
    })
end

-- 2. Setup Server TypeScript (Wajib menggunakan 'tsserver' di lspconfig)
-- Ini adalah solusi untuk error 'cmd: expected nil' yang Anda lihat sebelumnya.
lspconfig.tsserver.setup({
    capabilities = lsp_capabilities,
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    init_options = {
        hostInfo = "neovim",
    },
})

-- Hapus semua pemanggilan vim.lsp.config("typescript-language-server", ...)
-- Hapus semua pemanggilan vim.lsp.enable(...) yang menyebabkan error
