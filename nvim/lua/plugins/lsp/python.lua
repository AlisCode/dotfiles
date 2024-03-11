-- Python LSP configuration
local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
    cmd = { "pyright-langserver", "--stdio" },
})
