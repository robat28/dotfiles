-- Configure diagnostics display
vim.diagnostic.config({
  virtual_text = {
    spacing = 2,       -- space between text and EOL
    source = "if_many" -- show source if multiple LSPs
  },
  signs = true,         -- keep the left gutter icons
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
