-- General Settings

local vim = vim
local set = vim.opt

-- Indent settings
set.shiftwidth = 4
set.softtabstop = 4

-- Split directives
set.splitright = true
set.splitbelow = true

-- Colors
set.termguicolors = true

-- Load ft plugins and indent files
vim.cmd [[ filetype plugin indent on ]]

-- Remove trailing spaces on save
vim.cmd [[ autocmd BufWritePre * :%s/\s\+$//e ]]

-- Clipboard
set.clipboard:append("unnamedplus")

-- Misc
set.number = true
set.backspace = "indent,eol,start"
set.expandtab = true
set.smartcase = true
set.ignorecase = true

-- Hide the useless cmdline by default, and display it
-- when we're typing a command
set.cmdheight = 0
vim.cmd[[
  augroup hidecmdline
    autocmd!
    autocmd CmdlineLeave * set cmdheight=0
    autocmd CmdlineEnter * set cmdheight=1
  augroup END
]]
