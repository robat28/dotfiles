return{
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
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
    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls", -- lua
                "pyright", -- pyhton
            },
            automatic_installation = true,
            automatic_enable = false,
        }

        local capabilities = require('blink.cmp').get_lsp_capabilities()

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
        })

        vim.lsp.config("pyright", {
          capabilities = capabilities,
        })

        -- Enable servers
        vim.lsp.enable({
          "lua_ls",
          "pyright",
        })
    end
}
