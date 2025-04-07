-- LSP Keybindings
local vim = vim
local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")

function lsp_hover()
    vim.lsp.buf.hover({
        border = "rounded"
    })
end

vim.keymap.set("n", "K", lsp_hover, { noremap = true })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { noremap = true })
vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, { noremap = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { noremap = true })
vim.keymap.set("n", "gr", telescope_builtin.lsp_references, { noremap = true })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { noremap = true })
