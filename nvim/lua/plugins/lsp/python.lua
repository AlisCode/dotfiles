-- Python LSP configuration

vim.lsp.config('pyright', {
    cmd = { "pyright-langserver", "--stdio" },
})
vim.lsp.enable('pyright')
