local Terminal = require('toggleterm.terminal').Terminal;

local gitui = Terminal:new({
    cmd = "gitui",
    direction = "float",
    float_opts = {
        border = "curved",
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

function gitui_toggle()
    gitui:toggle()
end

-- Toggle GitUI
vim.keymap.set("n", "<leader>g", gitui_toggle, {noremap = true, silent = true})
