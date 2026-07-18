local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Masukkan semua config kustom ke dalam sebuah tabel terlebih dahulu
local server_configs = {
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                diagnostics = {
                    enable = false,
                },
            },
        },
    },
    dockerls = {
        settings = {
            docker = {
                languageserver = {
                    formatter = {
                        ignoreMultilineInstructions = true,
                    },
                },
            },
        },
        filetypes = { "dockerfile" },
    },
    markdown_oxide = {
        root_dir = function(bufnr, on_dir)
            local root = vim.fs.root(bufnr, {
                ".git",
                ".obsidian",
                "index.md",
            })
            if root then
                on_dir(root)
            end
        end,
        filetypes = { "markdown", "markdown.mdx" },
    },
    terraformls = {
        filetypes = { "terraform", "terraformvars", "hcl" }, -- Diperbaiki dari terraform-vars
    },
    helm_ls = {
        settings = {
            ["helm-ls"] = {
                yamlls = {
                    enabled = true,
                },
            },
        },
        filetypes = { "helm" },
    },
    jsonls = {
        settings = {
            json = {
                validate = {
                    enable = true,
                },
            },
        },
    },
    basedpyright = {
        settings = {
            basedpyright = {
                analysis = {
                    typeCheckingMode = "recommended",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                },
            },
        },
    },
    taplo = {},
    docker_compose_language_service = {
        filetypes = { "yaml" },
    },
    nginx_language_server = {},
    yamlls = {
        settings = {
            yaml = {
                validate = true,
                completion = true,
                hover = true,
                schemas = {
                    kubernetes = {
                        "k8s/**/*.yaml",
                        "manifests/**/*.yaml",
                    },
                },
            },
        },
    },
    bashls = {
        filetypes = { "sh", "bash", "zsh" },
    },
}

-- Daftar seluruh server yang ingin diaktifkan
local servers = {
    -- Web
    "html",
    "cssls",
    "ts_ls",
    "astro",
    -- Programming
    "lua_ls",
    "gopls",
    "rust_analyzer",
    "clangd",
    "phpactor",
    "basedpyright",
    "elixirls",
    -- Shell & Automation
    "bashls",
    "ansiblels",
    -- Database
    "sqlls",
    -- Containers
    "dockerls",
    "docker_compose_language_service",
    -- Infrastructure
    "terraformls",
    "helm_ls",
    "yamlls",
    -- Config Files
    "jsonls",
    "taplo",
    -- Documentation
    "markdown_oxide",
    -- Web Server
    "nginx_language_server",
}

-- Loop untuk mendaftarkan config (termasuk capabilities nvim-cmp) dan mengaktifkannya
for _, server in ipairs(servers) do
    -- Ambil config kustom jika ada, kalau tidak ada buat tabel kosong
    local config = server_configs[server] or {}
    
    -- Suntikkan lsp_capabilities ke setiap server (Ganti cara vim.lsp.config("*"))
    config.capabilities = vim.tbl_deep_extend("force", lsp_capabilities, config.capabilities or {})

    -- Daftarkan konfigurasi ke Neovim
    vim.lsp.config(server, config)
    
    -- Aktifkan server secara otomatis
    vim.lsp.enable(server)
end
