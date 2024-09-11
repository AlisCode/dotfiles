-- Typescript LSP configuration
local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
    cmd = { "typescript-language-server", "--stdio" },
})
