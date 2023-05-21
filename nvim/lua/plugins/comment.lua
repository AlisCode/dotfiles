local comment = require("nvim_comment")
local opts = { noremap = true, silent = true }

comment.setup({
    create_mappings = false,
})

vim.api.nvim_set_keymap("n", "<C-l>", ":CommentToggle<CR>", opts)
vim.api.nvim_set_keymap("v", "<C-l>", ":'<,'>CommentToggle<CR>", opts)
