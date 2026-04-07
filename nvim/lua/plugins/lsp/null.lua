local null_ls = require("null-ls")

local formatcmd = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        -- Go
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.diagnostics.golangci_lint,
        -- TS/JS
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint"),
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = formatcmd,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
