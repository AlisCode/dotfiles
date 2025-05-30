-- Set SPACE as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap("n", " ", "<Nop>", { noremap = true, silent = true, })

-- Window navigation
vim.cmd [[ nmap <silent> <C-A-Up> :wincmd k<CR> ]]
vim.cmd [[ nmap <silent> <C-A-Down> :wincmd j<CR> ]]
vim.cmd [[ nmap <silent> <C-A-Left> :wincmd h<CR> ]]
vim.cmd [[ nmap <silent> <C-A-Right> :wincmd l<CR> ]]

-- Bubble selection
vim.api.nvim_set_keymap("n", "<A-j>", "]e", {});
vim.api.nvim_set_keymap("n", "<A-k>", "[e", {});
vim.api.nvim_set_keymap("v", "<A-j>", "]egv", {});
vim.api.nvim_set_keymap("v", "<A-k>", "[egv", {});

-- Bubble selection, MacOS compat
vim.api.nvim_set_keymap("n", "∆", "]e", {});
vim.api.nvim_set_keymap("n", "˚", "[e", {});
vim.api.nvim_set_keymap("v", "∆", "]egv", {});
vim.api.nvim_set_keymap("v", "˚", "[egv", {});

-- Remap jk to ESC, because on my work keyboard ESC is hard to reach
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true });
