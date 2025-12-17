-- File: lua/configs/dap.lua

local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.25 }, -- Variable saat ini
                "breakpoints", -- Daftar breakpoint
                "stacks", -- Call stack
                "watches", -- Watch expressions
            },
            size = 10, -- Tinggi panel (dalam baris/kolom, tergantung posisi)
            position = "bottom", -- Panel diletakkan di bagian bawah
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
