-- Configure diagnostics display
vim.diagnostic.config({
	signs = true, -- keep the left gutter icons
	underline = true,
	update_in_insert = false,
	severity_sort = true,
    virtual_text = {
        spacing = 2,
        prefix = "●",
        source = "if_many",
    },
	float = {
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
		focusable = false,

		max_width = 80,
		max_height = 20,
		wrap = true,
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

