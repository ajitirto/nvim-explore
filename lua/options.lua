require "nvchad.options"

local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- Enable mouse support in all modes
opt.mouse = "a"
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.config/nvim/lua/undodir"
opt.backup = false
opt.swapfile = false
opt.hlsearch = true

-- Search behavior
opt.ignorecase = true
opt.smartcase = true

-- Clipboard
opt.clipboard:append("unnamedplus")

-- User Interface
-- opt.termguicolors = true   -- Enable true color support
-- opt.cursorline = true      -- Highlight the current line
-- opt.signcolumn = "yes"     -- Always show the sign column for diagnostics
-- opt.colorcolumn = "80"     -- Show a line at 80 characters, good for code style

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("TrimTrailingWhitespace", { clear = true }),
--   pattern = "*",
--   callback = function()
--     -- Substitute command: Delete all whitespace (\s+) at the end of a line ($).
--     -- 'e' flag prevents an error if no match is found.
--     vim.cmd [[%s/\s\+$//e]]
--   end,
-- })

