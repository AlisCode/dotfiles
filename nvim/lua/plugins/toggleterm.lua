-- Handy terminal inside nvim
local vim = vim
local toggleterm = require("toggleterm")
local opts = { noremap = true, silent = true }

-- Enables visual-selection possibility in the terminal
function on_terminal_opens(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>", opts)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "jk", "<C-\\><C-n>", opts)
end

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
    on_open = on_terminal_opens,
})
