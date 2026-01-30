local lspconfig = require("lspconfig")

vim.lsp.config('mylang', {
    cmd = vim.lsp.rpc.connect("127.0.0.1", 3333),
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
