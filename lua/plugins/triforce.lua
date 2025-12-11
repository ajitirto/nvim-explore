return {
    {
        "gisketch/triforce.nvim",
        dependencies = {
            "nvzone/volt",
        },
        config = function()
            require("configs.triforce")
        end,
    },
}
