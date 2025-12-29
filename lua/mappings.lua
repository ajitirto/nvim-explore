require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { silent = true, desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { silent = true, desc = "ESC for insert mode" })
map("n", "<leader>bn", "<cmd> enew <CR>", { silent = true, desc = "buffer new" })
map("n", "<leader>to", "<cmd>tabnew<CR>", { silent = true, desc = "Open new tab" })
map("n", "<leader>tq", "<cmd>tabclose<CR>", { silent = true, desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { silent = true, desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { silent = true, desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { silent = true, desc = "Open current buffer in new tab" })
map("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle NvimTree" })
map("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
map("n", "<C-a>", ":Telescope<CR>", { noremap = true, silent = true })
map("n", "<leader>mm", ":messages<CR>", { desc = "Show Neovim Messages" })
map("n", "<Leader>qq", ":q<CR>", { noremap = true, silent = true, desc = "exit" })
map("n", "<Leader>qa", ":qa<CR>", { noremap = true, silent = true, desc = "exit for all" })
map("n", "<Leader>ll", ":Lazy<CR>", { noremap = true, silent = true, desc = "Buka Lazy.nvim" })
map("n", "<Leader>ls", ":Lazy sync<CR>", { noremap = true, silent = true, desc = "Buka Lazy.nvim sync" })
map("n", "<Leader>lm", ":Mason<CR>", { noremap = true, silent = true, desc = "Buka Mason.nvim" })
map("n", "<leader>d/", ":%s/\\s*\\/\\/.*$//e<CR>", { desc = "Hapus komentar // sampai akhir" })
map("n", "<leader>d#", ":%s/\\s*##.*$//e<CR>", { desc = "Hapus komentar ## sampai akhir" })
map("n", "<leader>d-", ":%s/\\s*--.*$//e<CR>", { desc = "Hapus komentar -- sampai akhir" })
map("n", "<leader>ca", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "keluar dari mode terminal" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Pindahkan baris ke bawah" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Pindahkan baris ke atas" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Pindahkan seleksi ke bawah" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Pindahkan seleksi ke atas" })
map("n", "gh", "0", { desc = "Jump: Start of line" })
map("n", "gl", "$", { desc = "Jump: End of line" })
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "DAP Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "DAP Start or continue debugger" })

-- function
map("n", "<leader>dus", function()
    local widgets = require("dap.ui.widgets")
    local sidebar = widgets.sidebar(widgets.scopes)
    sidebar.open()
end, { desc = "DAP Open variable sidebar" })

map("n", "<leader>dgt", function()
    require("dap-go").debug_test()
end, { desc = "DAP Debug go test" })

map("n", "<leader>dgl", function()
    require("dap-go").debug_last_test()
end, { desc = "DAP Debug last go test" })

map("n", "<C-t>", function()
    require("menu").open("default")
end, {})

local del = vim.keymap.del

del("n", "<leader>b")
del("n", "gr")
del("n", "gc")

local dap = require("dap")

map("n", "<leader>d1", dap.continue, { desc = "Debug: Start/Continue" })
map("n", "<leader>d2", dap.step_over, { desc = "Debug: Step Over" })
map("n", "<leader>d3", dap.step_into, { desc = "Debug: Step Into" })
map("n", "<leader>d4", dap.step_out, { desc = "Debug: Step Out" })

map("t", "<C-h>", [[<C-\><C-n><C-w>h]], { silent = true })
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], { silent = true })
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], { silent = true })
map("t", "<C-l>", [[<C-\><C-n><C-w>l]], { silent = true })
