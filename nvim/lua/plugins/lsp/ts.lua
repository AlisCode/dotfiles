-- Typescript LSP configuration
local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
    cmd = { "typescript-language-server", "--stdio" },
})
