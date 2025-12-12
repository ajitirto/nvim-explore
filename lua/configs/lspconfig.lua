-- File: lua/configs/lspconfig.lua (atau file kustom NvChad Anda)

-- Dapatkan default capabilities untuk integrasi completion (nvim-cmp)
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Panggil default NvChad (untuk handler dan keymap)
require("nvchad.configs.lspconfig").defaults()

-- ********** 1. KONFIGURASI SPESIFIK & PEMBENAHAN NAMA SERVER **********

-- Konfigurasi Tsserver (Mengganti 'typescript-language-server')
-- Tsserver seringkali memerlukan konfigurasi init_options
vim.lsp.config('tsserver', {
  capabilities = lsp_capabilities,
  init_options = {
    hostInfo = 'neovim',
  },
})

-- Konfigurasi Bash (Mengganti 'bash-language-server')
vim.lsp.config('bashls', {
  capabilities = lsp_capabilities,
})

-- Konfigurasi YAML (Mengganti 'yaml-language-server')
vim.lsp.config('yamlls', {
  capabilities = lsp_capabilities,
})

-- Konfigurasi Rust (Mengganti 'rust-analyzer')
vim.lsp.config('rust_analyzer', {
  capabilities = lsp_capabilities,
})

-- ********** 2. SERVER YANG TIDAK MEMILIKI KONFIGURASI KHUSUS **********

-- Definisi server yang akan diaktifkan secara default.
-- Nama server yang digunakan harus sesuai dengan nvim-lspconfig/Mason.
local simple_servers = {
  -- Core Web
  "html",
  "cssls",
  -- Umum
  "lua_ls",         -- Mengganti 'lua-language-server'
  "lemminx",
  "clangd",
  "gopls",
  "omnisharp",
  "phpactor",
  "ansiblels",      -- Mengganti 'ansible-language-server'
  "erlang_ls",      -- Mengganti 'erlang-language-server'
  "sqlls",
  "dockerls",       -- Server umum untuk Dockerfile
  "jsonls",         -- Seringkali dibutuhkan untuk config
}

-- Catatan:
-- - 'docker_compose_language_service' & 'docker_language_server' tidak ada di lspconfig standar. Gunakan 'dockerls' jika hanya perlu Dockerfile.
-- - 'prettier', 'stylua' BUKAN LSP Server, mereka adalah Formatter (dikelola oleh conform.nvim).
-- - 'html-lsp', 'laravel-ls', 'prometheus-pint', 'tofu-ls' mungkin memerlukan instalasi/konfigurasi kustom di Mason.

-- ********** 3. AKTIVASI **********

-- Aktifkan server yang sudah dikonfigurasi secara eksplisit:

vim.lsp.enable('tsserver', {
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
})

vim.lsp.enable('bashls', {
  filetypes = { 'sh', 'zsh' },
})


-- Loop untuk mengaktifkan server-server tanpa konfigurasi khusus:
for _, server_name in ipairs(simple_servers) do
  -- Gunakan vim.lsp.enable untuk mengaktifkan server
  -- filetypes akan dicari secara otomatis oleh nvim-lspconfig
  vim.lsp.enable(server_name, {
    capabilities = lsp_capabilities,
  })
end
