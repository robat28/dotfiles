-- <leader> mapping
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- M- key mapping
vim.keymap.set("i", "<M-5>", "[", {noremap = false})
vim.keymap.set("i", "<M-6>", "]", {noremap = false})
