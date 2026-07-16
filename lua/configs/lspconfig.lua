local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
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
    filetypes = {
        "dockerfile",
    },
})

vim.lsp.config("markdown_oxide", {
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

    filetypes = {
        "markdown",
        "markdown.mdx",
    },
})

vim.lsp.config("terraformls", {
    filetypes = {
        "terraform",
        "terraform-vars",
        "hcl",
    },
})

vim.lsp.config("helm_ls", {
    settings = {
        ["helm-ls"] = {
            yamlls = {
                enabled = true,
            },
        },
    },
    filetypes = {
        "helm",
    },
})

vim.lsp.config("jsonls", {
    settings = {
        json = {
            validate = {
                enable = true,
            },
        },
    },
})

vim.lsp.config("basedpyright", {
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "recommended",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})

vim.lsp.config("taplo", {})
vim.lsp.config("docker_compose_language_service", {
    filetypes = {
        "yaml",
    },
})
vim.lsp.config("nginx_language_server", {})

vim.lsp.config("yamlls", {
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
})

vim.lsp.config("bashls", {
    filetypes = {
        "sh",
        "bash",
        "zsh",
    },
})

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

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end
