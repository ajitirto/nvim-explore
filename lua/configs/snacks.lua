-- Konfigurasi ini berisi pengaturan (opts) dan pemetaan kunci (keys)
-- untuk plugin folke/snacks.nvim, sesuai dengan lazy.nvim spec Anda.

local M = {}

function M.setup()
    local Snacks = require("snacks")

    -- Bagian ini mereplikasi opsi (opts) yang Anda definisikan
    Snacks.setup({
        -- Mengaktifkan semua modul yang tercantum
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000, -- Notifikasi akan hilang setelah 3 detik
        },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
            notification = {
                -- wo = { wrap = true } -- (Tidak diaktifkan dalam spec Anda, tetap sebagai komentar)
            },
        },
        -- ... Anda bisa menambahkan konfigurasi snack kustom di sini jika tidak menggunakan snippets.
        -- Jika Anda ingin menambahkan snack yang berupa snippet:
        -- my_snippet = { snippet = "...", description = "..." }
    })

    -- Bagian ini mereplikasi semua pemetaan kunci (keys) yang Anda definisikan.
    -- Catatan: Dalam konfigurasi tunggal ini, kita biasanya menggunakan vim.keymap.set
    -- atau Snacks.keymap untuk mengatur keymaps, tetapi karena Anda menggunakan lazy.nvim spec
    -- dan semua keymaps memanggil fungsi Snacks, kita hanya perlu memastikan
    -- plugin dimuat dan fungsinya tersedia.

    -- --- Fungsi Keys biasanya diurus oleh lazy.nvim,
    -- --- tetapi kita bisa mendefinisikannya di sini sebagai fallback/referensi.
    -- --- Namun, lebih bersih jika keymaps tetap diurus oleh lazy.nvim 'keys = {}'
    -- --- untuk memastikan keymaps hanya dibuat setelah plugin dimuat.
    -- --- Jika Anda ingin menguji keymaps secara manual:

    -- Contoh Keymap (Anda dapat memilih untuk memindahkannya ke sini atau membiarkannya di spec lazy.nvim):
    -- vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
    -- vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })

    -- --- Karena konfigurasi yang Anda berikan adalah keymap yang SANGAT LENGKAP,
    -- --- saya *sangat menyarankan* untuk mempertahankan bagian 'keys = {}' di dalam lazy.nvim spec
    -- --- agar pemuatannya ditangani dengan benar oleh `lazy.nvim`.
end

-- Bagian `init` dalam lazy.nvim spec Anda berisi Autocmds dan global functions.
-- Kita harus mendefinisikannya di sini di luar fungsi setup() jika kita ingin
-- mereka tersedia segera (tidak lazily-loaded).

-- Setup some globals for debugging (dari init function Anda)
_G.dd = function(...)
    require("snacks").debug.inspect(...)
end
_G.bt = function()
    require("snacks").debug.backtrace()
end

-- Override print to use snacks for `:=` command (dari init function Anda)
if vim.fn.has("nvim-0.11") == 1 then
    vim._print = function(_, ...)
        _G.dd(...)
    end
else
    vim.print = _G.dd
end

-- Membuat Autocmd untuk Snacks.toggle (dari init function Anda)
-- Ini harus dijalankan saat plugin sudah dimuat, yang ditandai oleh VeryLazy.
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        local Snacks = require("snacks")
        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
    end,
})

M.setup()

return M
