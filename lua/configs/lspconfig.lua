require("nvchad.configs.lspconfig").defaults()

local servers = {
                  "html",
                  "cssls",
                  "docker_language_server",
                  "docker_compose_language_service"
                }

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
