-- Set colorscheme
local vim = vim
local set = vim.opt

set.background = "dark"
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd [[ colorscheme catppuccin ]]
