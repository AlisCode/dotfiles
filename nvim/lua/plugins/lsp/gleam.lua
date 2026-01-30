-- Gleam LSP configuration

vim.lsp.config("gleam", {
    cmd = { "gleam", "lsp" },
})
vim.lsp.enable("gleam")
