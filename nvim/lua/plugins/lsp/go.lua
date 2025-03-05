-- Go LSP configuration through gopls
local lspconfig = require("lspconfig")

lspconfig.gopls.setup({
    cmd = { "gopls", },
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    }
})
