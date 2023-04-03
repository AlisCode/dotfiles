local vim = vim
local lualine = require("lualine")

lualine.setup({
    options = {
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
    },
    sections = {
        lualine_b = { 'branch' },
        lualine_x = {
            {
                'diagnostics',
                sources = { "nvim_lsp"},
                colored = true,
            }
        },
    },
    tabline = {},
    winbar = {},
})

vim.opt.showmode = false
