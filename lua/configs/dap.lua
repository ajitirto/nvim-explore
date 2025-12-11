-- File: lua/configs/dap.lua

local dap = require("dap")
local dapui = require("dapui")

-- 1. Setup nvim-dap-ui
dapui.setup({
    -- Konfigurasi tampilan ikon
    icons = { expanded = "▾", collapsed = "▸" },
    -- Konfigurasi tata letak (layout) jendela DAP UI
    layouts = {
        {
            -- Daftar element yang akan ditampilkan di panel ini
            elements = {
                { id = "scopes", size = 0.25 }, -- Variable saat ini
                "breakpoints", -- Daftar breakpoint
                "stacks", -- Call stack
                "watches", -- Watch expressions
            },
            size = 10, -- Tinggi panel (dalam baris/kolom, tergantung posisi)
            position = "bottom", -- Panel diletakkan di bagian bawah
        },
        -- Anda bisa menambahkan layout lain di sini (misalnya, untuk sisi kanan)
    },
    -- ... opsi dapui lainnya
})

-- 2. Setup Listeners (Memastikan DAP UI terbuka/tertutup secara otomatis)
-- Buka DAP UI saat debugging dimulai (attach atau launch)
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

-- Tutup DAP UI saat sesi debugging berakhir (terminated atau exited)
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- Catatan: Jika Anda juga menggunakan nvim-dap-virtual-text,
-- Anda bisa memanggil require("nvim-dap-virtual-text").setup() di sini.

-- Catatan Penting: Anda masih perlu mengkonfigurasi adapter DAP spesifik bahasa
-- (misalnya, Python dengan debugpy, Go dengan delve) di sini atau di file lain.
