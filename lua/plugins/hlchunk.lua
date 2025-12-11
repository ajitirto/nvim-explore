return {
    {
        "shellRaining/hlchunk.nvim",
        event = { "ufReadPre", "BufNewFile" },
        config = function()
            require("configs.hlchunk")
        end,
    },
}
