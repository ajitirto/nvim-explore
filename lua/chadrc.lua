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

return M
