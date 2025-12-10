local M = {}

M.base46 = {
    theme = "tokyonight",
    transparency = true,

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

M.ui = {
    theme = "tokyonight",

    statusline = {
        separator_style = "round",
    },
    tabufline = {
        enabled = false,
    },
    cmp = {
        style = "atom",
    },
}

M.nvdash = {
    load_on_startup = true,
}

return M
