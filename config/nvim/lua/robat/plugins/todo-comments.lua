return {
    "folke/todo-comments.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function ()
        local todo = require("todo-comments")

        todo.setup({
            signs = true, -- show icons in the sign column TODO
            keywords = {
                FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            },
            highlight = {
                before = "", -- don't highlight before keyword
                keyword = "wide", -- highlight the keyword
                after = "fg", -- highlight the rest of the line
            },
        })
    end
}
