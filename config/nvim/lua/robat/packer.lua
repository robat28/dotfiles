-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer 
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Colorscheme - (rose-pine)
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Mason
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }

    -- LSP
    use({
        'neovim/nvim-lspconfig',
        requires = {
            {
                "folke/lazydev.nvim",
                -- only load for Lua files
                ft = "lua",
                config = function()
                    require("lazydev").setup({
                        library = {
                            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                        },
                    })
                end,
            },
        }
    })

    -- blink.cmp
    use ({
        'saghen/blink.cmp',
        requires = { 'rafamadriz/friendly-snippets' },
        tag = 'v1.6.0',
    })
end)
