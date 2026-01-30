-- Go LSP configuration through gopls

vim.lsp.config('gopls', {
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
vim.lsp.enable("gopls")
