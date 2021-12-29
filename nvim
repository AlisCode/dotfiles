" Plugins
call plug#begin('$HOME/.config/nvim/plugged')

" General
" Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'greyblake/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/lightline.vim'
Plug 'vimlab/split-term.vim'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'mustache/vim-mustache-handlebars'
Plug 'gyim/vim-boxdraw'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" Theme
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'joshdick/onedark.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode'

" Autocomplete (requires python3)
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-abolish'

" Snipmate and snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

"HTML
Plug 'mattn/emmet-vim'

"Javscript
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi' " Autocomplete for TS

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" Nvim goodies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'pest-parser/pest.vim'
Plug 'simrat39/rust-tools.nvim'

" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'tjdevries/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
" Plug 'nvim-lua/completion-nvim'

" Diagnostic navigation and settings for built-in LSP
Plug 'nvim-lua/diagnostic-nvim'

" PlantUML
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'

" Esperanto keyboard
Plug 'greyblake/vim-esperanto'
let g:EoMap = "x"

" Plug 'neovim/termdebug'

call plug#end()

filetype plugin indent on

" Custom settings
syntax on
set number
set backspace=indent,eol,start  "To make backspace work in normal way
set nospell
set expandtab
set splitright
set splitbelow
set termguicolors

" Indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set nowrap

" Load ftplugins and indent files
filetype plugin on
filetype indent on

" SWAP files
set dir=$HOME/.nvim/tmp

" Set Gruvbox color scheme
set background=dark
colorscheme gruvbox8

" Search files by name
nnoremap <C-p> <cmd>Telescope git_files<cr>

" Search with grep
nnoremap <C-f> <cmd>Telescope live_grep<cr>

" Search symbols in workspace
nnoremap <C-s> <cmd>Telescope lsp_workspace_symbols<cr>

" Telescope binding for single-press escape
lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
}
require('telescope').load_extension "file_browser"
EOF

nnoremap <C-m> <cmd>lua require('telescope').extensions.file_browser.file_browser { path = "%:p:h" }<cr>

" Toggle tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=60
" Special mapping for .tsx
let g:tagbar_type_typescriptreact = {
\ 'ctagstype': 'typescript',
\ 'kinds': [
  \ 'c:class',
  \ 'n:namespace',
  \ 'f:function',
  \ 'G:generator',
  \ 'v:variable',
  \ 'm:method',
  \ 'p:property',
  \ 'i:interface',
  \ 'g:enum',
  \ 't:type',
  \ 'a:alias',
\ ],
\'sro': '.',
  \ 'kind2scope' : {
  \ 'c' : 'class',
  \ 'n' : 'namespace',
  \ 'i' : 'interface',
  \ 'f' : 'function',
  \ 'G' : 'generator',
  \ 'm' : 'method',
  \ 'p' : 'property',
  \},
\ }

" Bubble selection (it depends on unimpaired plugin)
nmap <A-k> [e
nmap <A-Up> [e
nmap <A-j> ]e
nmap <A-Down> ]e
vmap <A-k> [egv
vmap <A-Up> [egv
vmap <A-j> ]egv
vmap <A-Down> ]egv

" NERDCommenter
nmap <C-l> <plug>NERDCommenterToggle
vmap <C-l> <plug>NERDCommenterToggle

" Also need to process "|"
let chars = [' ', '!', '"', '#', '$', '%', '&', "'", '(', ')', '*', '+', ',', '-', '.', '/', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ':', ';', '<', '=', '>', '?', '@', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '[', '\', ']', '^', '_', '`', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '}', '~']
for c in chars
   if c == ' '
       let key = '<Space>'
   else
       let key = c
   endif
   exe 'imap <C-]>' . key . ' <Esc>f' . c . 'i'
   exe 'imap <C-A-]>' . key . ' <Esc>F' . c . 'i'
endfor

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Configure ALE lints
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'rust': ['cargo', 'rustfmt']
\}


" For vim-markdown-preview plugin
let vim_markdown_preview_github=1


" Use the old verison of snipmate parser
let g:snipMate = { 'snippet_version' : 0 }


" Configure LSP for rust-analyzer
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
let g:rustfmt_autosave = 1

" Avoid showing extra messages when using completion
set shortmess+=c

" Setup DAPUI (Debugger)
lua<<EOF
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
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
EOF

" Configure LSP
" See: https://sharksforarms.dev/posts/neovim-rust/
lua <<EOF
local opts = {
    tools = { -- rust-tools options
        --autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- debugging setup
    dap = {
        adapter = {
            type = 'executable',
            command = 'lldb-vscode',
            name = "rt_lldb"
        }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    -- on_attach = on_attach,
    settings = {
        -- to enable rust-analyzer settings visit:
        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
        ["rust-analyzer"] = {
          -- enable clippy on save
            checkOnSave = {
                command = "clippy"
            },
        },
    }
}

require('rust-tools').setup(opts)
require'lspconfig'.tsserver.setup{
    cmd = { "typescript-language-server", "--stdio" },
}

vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
vim.lsp.handlers["textDocument/symbols"] = require("telescope.builtin").lsp_document_symbol
EOF

" Rust nvim lsp
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>Telescope lsp_implementations<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>Telescope lsp_references<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <F2>    <cmd>lua vim.lsp.buf.rename()<CR>

" Quick-fix
nnoremap <silent> ga    <cmd>Telescope lsp_code_actions<CR>

" Synchronize nvim clipboard with X clipboard
set clipboard+=unnamedplus

" Case smart-sensitive

set smartcase
set ignorecase

" Debug Rust
let g:termdebugger='lldb-vscode'

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    --{ name = 'vsnip' },
    --{ name = 'path' },
    { name = 'buffer' },
  },
})
EOF

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" source ~/.config/nvim/coc_defaults.vim
" source ~/.config/nvim/coc_mappings.vim
