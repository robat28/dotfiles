return {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
        require("ibl").setup({
            enabled = true,
            indent = {
                char = "│",
                highlight = nil,
            },
            scope = {
                enabled = false,
                show_start = false,
                show_end = false,
            },
        })
    end
}
