require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", -- lua
        "pyright", -- pyhton
    },
    automatic_installation = true,
    automatic_enable = false,
}

local lspconfig = require('lspconfig')
local capabilities = require('blink.cmp').get_lsp_capabilities()

lspconfig.lua_ls.setup { capabilities = capabilities }
lspconfig.pyright.setup { capabilities = capabilities }
