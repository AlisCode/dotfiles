local vim = vim

-- Set SPACE as leader key
vim.cmd [[ nnoremap <SPACE> <Nop> ]]
vim.g.mapleader = " "

-- Window navigation
vim.cmd [[ nmap <silent> <C-A-Up> :wincmd k<CR> ]]
vim.cmd [[ nmap <silent> <C-A-Down> :wincmd j<CR> ]]
vim.cmd [[ nmap <silent> <C-A-Left> :wincmd h<CR> ]]
vim.cmd [[ nmap <silent> <C-A-Right> :wincmd l<CR> ]]

-- Bubble selection
vim.cmd [[ nmap <A-k> [e ]]
vim.cmd [[ nmap <A-Up> [e ]]
vim.cmd [[ nmap <A-j> ]e ]]
vim.cmd [[ nmap <A-Down> ]e ]]
vim.cmd [[ vmap <A-k> [egv ]]
vim.cmd [[ vmap <A-Up> [egv ]]
vim.cmd [[ vmap <A-j> ]egv ]]
vim.cmd [[ vmap <A-Down> ]egv ]]

-- NERDCommenter
vim.cmd [[ nmap <C-l> <plug>NerdCommenterToggle ]]
vim.cmd [[ vmap <C-l> <plug>NerdCommenterToggle ]]

vim.cmd [[ inoremap jk <Esc> ]]
