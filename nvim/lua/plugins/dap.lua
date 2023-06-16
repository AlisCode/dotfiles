-- Debugger Adapter Protocol integration
local vim = vim
local dapui = require("dapui")
local dap = require("dap")

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
    -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
          },
          size = 40, -- 40 columns
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.25, -- 25% of total lines
          position = "bottom",
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        mappings = {
        close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
})

vim.g.termdebugger = "lldb"

-- DAP keybindings
vim.keymap.set("n", "<Leader>mb", dap.toggle_breakpoint, { noremap = true })
vim.keymap.set("n", "<Leader>mw", dapui.toggle, { noremap = true })
vim.keymap.set("n", "<Leader>me", dapui.eval, { noremap = true })
vim.keymap.set("n", "<F10>", dap.step_over, { noremap = true })
vim.keymap.set("n", "<F11>", dap.step_into, { noremap = true })
vim.keymap.set("n", "<S-F11>", dap.step_out, { noremap = true })
vim.keymap.set("n", "<F5>", dap.continue, { noremap = true })
vim.keymap.set("n", "<F4>", dap.restart, { noremap = true })

--TODO when relevant
--[[
nnoremap <Leader> mi    <cmd>lua require 'dap.ui.widgets'.hover()<CR>
nnoremap <Leader> mj    <cmd>lua require 'dap.ui'.down()<CR>
nnoremap <Leader> mk    <cmd>lua require 'dap.ui'.up()<CR>
nnoremap <Leader> mv    <cmd>Telescope dap variables<CR>
nnoremap <Leader> mf    <cmd>Telescope dap frames<CR>
--]]
