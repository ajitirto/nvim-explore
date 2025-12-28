return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim",
            "leoluz/nvim-dap-go",
        },
        event = "VeryLazy",
        config = function()
            require("configs.dap")
        end,
    },
}
