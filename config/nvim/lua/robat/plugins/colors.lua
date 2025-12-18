return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
        -- Set colorscheme
		vim.cmd("colorscheme rose-pine")
    
        -- Make background transparent
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	end
}
