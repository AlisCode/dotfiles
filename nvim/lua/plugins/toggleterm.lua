-- Handy terminal inside nvim
local vim = vim
local toggleterm = require("toggleterm")

toggleterm.setup({
    direction = "float",
    float_opts = {
        border = "curved",
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
    open_mapping = "<C-t>",
})

-- Enables visual-selection possibility in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
