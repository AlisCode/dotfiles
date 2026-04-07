local fluoride = require("fluoride")

fluoride.setup({
    window = {
        type = "float",
        title = "Symbols",
        border = "rounded",
        footer = false,
    },
})

vim.api.nvim_set_keymap("n", "<Leader>ls", ":Fluoride<CR>", {})
