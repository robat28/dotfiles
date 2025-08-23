-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer - Package Manager
    use 'wbthomason/packer.nvim'

    -- Colorscheme - (rose-pine)
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Telescope - Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Treesitter - Parser
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Mason
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }

    -- LSP - Language Server Protocol
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

    -- blink.cmp - Autocompletion
    use ({
        'saghen/blink.cmp',
        requires = { 'rafamadriz/friendly-snippets' },
        tag = 'v1.6.0',
    })

    -- conform - Formater
    use{"stevearc/conform.nvim"}

    -- lualine - Custom neovim statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons'}
    }

    -- indent-blankline - Indentation lines
    use {"lukas-reineke/indent-blankline.nvim"}

    -- todo-comments - Highlighting TODOS
    use {
        "folke/todo-comments.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- iron - Jupyter Notebook feature
    use {'Vigemus/iron.nvim'}

  end)
