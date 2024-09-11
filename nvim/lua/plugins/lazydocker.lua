-- Integrates lazydocker inside the terminal

local Terminal = require('toggleterm.terminal').Terminal;
local toggleterm_ui = require('toggleterm.ui');

local lazydocker = Terminal:new({
    cmd = "lazydocker",
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

function lazydocker_toggle()
    lazydocker:toggle()
end

-- Toggle lazydocker
vim.keymap.set("n", "<leader>c", lazydocker_toggle, {noremap = true, silent = true})
