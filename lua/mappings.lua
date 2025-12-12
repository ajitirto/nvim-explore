require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "ESC for insert mode" })

-- Keymaps untuk Manajemen Tab (Tab Management)
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

vim.keymap.set("n", "<C-p>", ":FloatermToggle<CR>", { silent = true })

-- Nvim-tree keymaps
map("n", "<C-b>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
    require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
-- vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
--     require("menu.utils").delete_old_menus()
--     vim.cmd.exec('"normal! \\<RightMouse>"')
--     -- clicked buf
--     local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
--     local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
--     require("menu").open(options, { mouse = true })
-- end, {})

vim.keymap.set("n", "<C-g", function()
    require("triforce").show_profile()
end, { desc = "tampilkan triforce statsnya" })
vim.keymap.set("n", "<C-a>", ":Telescope<CR>", { noremap = true, silent = true })
-- Buat keymap di mode Normal (n)
vim.keymap.set("n", "<leader>mm", ":messages<CR>", { desc = "Show Neovim Messages" })

-- custom for eazy use
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true, silent = true })

-- Membuka panel status lazy.nvim
vim.api.nvim_set_keymap("n", "<Leader>l", ":Lazy<CR>", { noremap = true, silent = true, desc = "Buka Lazy.nvim" })
vim.api.nvim_set_keymap(
    "n",
    "<Leader>ls",
    ":Lazy sync<CR>",
    { noremap = true, silent = true, desc = "Buka Lazy.nvim sync" }
)

vim.api.nvim_set_keymap("n", "<Leader>lm", ":Mason<CR>", { noremap = true, silent = true, desc = "Buka Mason.nvim" })
