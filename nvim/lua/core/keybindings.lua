-- Set SPACE as leader key
vim.cmd [[ nnoremap <SPACE> <Nop> ]]
vim.g.mapleader = " "

-- Window navigation
vim.cmd [[ nmap <silent> <C-A-Up> :wincmd k<CR> ]]
vim.cmd [[ nmap <silent> <C-A-Down> :wincmd j<CR> ]]
vim.cmd [[ nmap <silent> <C-A-Left> :wincmd h<CR> ]]
vim.cmd [[ nmap <silent> <C-A-Right> :wincmd l<CR> ]]

-- Bubble selection
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>", opts);
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>", opts);
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts);
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts);

-- Remap jk to ESC, because on my work keyboard ESC is hard to reach
vim.api.nvim_set_keymap("i", "jk", "<Esc>", opts);
