local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        python = { "ruff", "black" },
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
    },
})

-- Format keymap: Whole file in normal mode, section in visual mode.
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    })
end)
