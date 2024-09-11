-- Gleam LSP configuration
local lspconfig = require("lspconfig")

lspconfig.gleam.setup({
    cmd = { "gleam", "lsp" },
})
