local M = {}

M.ui = {
    theme = "tokyonight",
    transparency = false,
    tabline = {
        offsetType = "none",
        modules = {}, -- Mengosongkan modul untuk mereset behavior offset bawaan NvChad
    },
    statusline = {
        theme = "vscode_colored",
    },
}

M.mason = {
  pkgs = {
    "gopls",
    "golangci-lint",
    "gofumpt",

    "dockerfile-language-server",
    "docker-compose-language-service",
    "yaml-language-server",

    "prettier",
    "stylua",
  },
}

return M
