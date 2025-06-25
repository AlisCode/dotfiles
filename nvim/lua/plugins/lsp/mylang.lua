local lspconfig = require("lspconfig")

vim.lsp.config('mylang', {
    cmd = { "/home/olivier/Workspace/Rust/mylang/target/debug/lsp" },
    root_dir = vim.fn.getcwd(),
    filetypes = { "mylang" },
})
vim.lsp.enable("mylang")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.mylang",
    callback = function()
        vim.bo.filetype = "mylang"
    end,
})
