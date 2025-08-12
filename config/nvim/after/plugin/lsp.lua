local lsp = require('lsp-zero')
local lspconfig = require "lspconfig"

-- Setup Mason first
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',       -- Lua
        'pyright',      -- Python
        'jdtls',        -- Java
        'ts_ls',        -- JS / TS
        'marksman',     -- Markdown
        'texlab',       -- LaTeX
        'ltex',         -- Spell checker
        'bashls',       -- Bash
        'clangd',       -- C/C++
        'rust_analyzer',-- Rust
        'html',         -- HTML
    },
    handlers = {
        -- C/C++
        clangd = function()
            lspconfig.clangd.setup({
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--log=verbose",
                    "--limit-results=0",
                    "--suggest-missing-includes",
                    "--function-arg-placeholders",
                    "--all-scopes-completion",
                    "--completion-style=bundled",
                },
                init_options = {
                    fallbackFlags = { "-std=c++20" },
                    clangdFileStatus = true,
                },
                root_dir = lspconfig.util.root_pattern(
                    "compile_commands.json",
                    ".clangd",
                    ".clang-format",
                    ".git"
                ),
                on_attach = function(client, bufnr)
                    -- optional navic if you use it
                    local ok, navic = pcall(require, "nvim-navic")
                    if ok then
                        navic.attach(client, bufnr)
                    end
                end,
            })
        end,
    }
})


-- CMP setup
local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'luasnip' },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

lsp.setup()

