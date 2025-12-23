return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    lazy = false,
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        local set = vim.keymap.set

        set({ "n", "x" }, "<A-up>", function()
            mc.lineAddCursor(-1)
        end, { desc = "Add cursor above" })

        set({ "n", "x" }, "<A-down>", function()
            mc.lineAddCursor(1)
        end, { desc = "Add cursor below" })

        set({ "n", "x" }, "<A-S-up>", function()
            mc.lineSkipCursor(-1)
        end, { desc = "Skip adding cursor above" })

        set({ "n", "x" }, "<A-S-down>", function()
            mc.lineSkipCursor(1)
        end, { desc = "Skip adding cursor below" })
        set({ "n", "x" }, "<leader>mn", function()
            mc.matchAddCursor(1)
        end, { desc = "Add cursor to next match" })

        set({ "n", "x" }, "<leader>ms", function()
            mc.matchSkipCursor(1)
        end, { desc = "Skip next match" })

        set({ "n", "x" }, "<leader>mN", function()
            mc.matchAddCursor(-1)
        end, { desc = "Add cursor to previous match" })

        set({ "n", "x" }, "<leader>mS", function()
            mc.matchSkipCursor(-1)
        end, { desc = "Skip previous match" })

        set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add cursor with mouse click" })
        set("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "Add cursors by mouse drag" })
        set("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "Finish mouse cursor action" })

        set({ "n", "x" }, "<c-q>", mc.toggleCursor, { desc = "Toggle (enable/disable) current cursor" })

        mc.addKeymapLayer(function(layerSet)
            layerSet({ "n", "x" }, "<left>", mc.prevCursor, { desc = "Focus previous cursor" })
            layerSet({ "n", "x" }, "<right>", mc.nextCursor, { desc = "Focus next cursor" })

            layerSet({ "n", "x" }, "<leader>dx", mc.deleteCursor, { desc = "Delete current cursor" })

            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end, { desc = "Clear or enable cursors" })
        end)

        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { reverse = true })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn" })
        hl(0, "MultiCursorMatchPreview", { link = "Search" })
        hl(0, "MultiCursorDisabledCursor", { reverse = true })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
}
