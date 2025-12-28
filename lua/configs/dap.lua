local dap = require("dap")
local dapui = require("dapui")
local dapgo = require("dap-go")

dapgo.setup({

    dap_configurations = {
        {
            type = "go",
            name = "Debug",
            request = "launch",
            program = "${file}",
        },
    },

    delve = {
        path = "dlv",
        initialize_timeout_sec = 20,
        port = "${port}",
        args = {},
        build_flags = "",
    },
})

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 10,
            position = "bottom",
        },
    },
})

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "🐞", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "🔍", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "📝", texthl = "DapLogPoint", linehl = "", numhl = "" })
sign("DapStopped", { text = "🚀", texthl = "DapStopped", linehl = "DebugHighlight", numhl = "" })
sign("DapBreakpointRejected", { text = "🚫", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })

vim.api.nvim_set_hl(0, "DebugHighlight", { bg = "#31353f", fg = "#bbe67e" })
