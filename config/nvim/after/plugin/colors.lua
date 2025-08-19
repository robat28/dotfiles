require("rose-pine").setup({
    styles = {
        bold = false
    }
})

function ColorMyPencils(color)
    -- Set colorscheme
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

    -- Make background transparent
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
end

ColorMyPencils()

