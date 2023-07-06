-- Integrates gitui inside a toggleterm

local Terminal = require('toggleterm.terminal').Terminal;
local toggleterm_ui = require('toggleterm.ui');

-- When we're closing gitui, it could be that changes have been done to the file
-- that we're currently editing. Neovim won't pick that up automatically,
-- so let's refresh the current buffer.
-- Restarting the LSP also helps having a fresh buffer to work with
function on_gitui_close()
    local origin_window = toggleterm_ui.get_origin_window();
    local buf = vim.api.nvim_win_get_buf(origin_window)
    vim.api.nvim_buf_call(buf, function()
        vim.api.nvim_command("edit!")
        vim.api.nvim_command("LspRestart")
    end)
end

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
    on_close = on_gitui_close,
})

function gitui_toggle()
    gitui:toggle()
end

-- Toggle GitUI
vim.keymap.set("n", "<leader>g", gitui_toggle, {noremap = true, silent = true})
