" Plugins
call plug#begin('$HOME/.config/nvim/plugged')

" General
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'akinsho/toggleterm.nvim'

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'josa42/nvim-lightline-lsp'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" Themes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" Nvim goodies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'pest-parser/pest.vim'
Plug 'simrat39/rust-tools.nvim'

" C#
Plug 'razzmatazz/csharp-language-server'
Plug 'OmniSharp/omnisharp-vim'

" Github Actions
Plug 'yasuhiroki/github-actions-yaml.vim'

" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'tjdevries/lsp_extensions.nvim'

" Diagnostic navigation and settings for built-in LSP
Plug 'nvim-lua/diagnostic-nvim'

" Versioning
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sindrets/diffview.nvim'

" Copilot
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'

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

" Set color scheme
set background=dark
let g:catpuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
colorscheme catppuccin

" nvim window nav
nmap <silent> <C-A-Up> :wincmd k<CR>
nmap <silent> <C-A-Down> :wincmd j<CR>
nmap <silent> <C-A-Left> :wincmd h<CR>
nmap <silent> <C-A-Right> :wincmd l<CR>

" toggleterm
lua <<EOF
    require("toggleterm").setup({
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
EOF
nnoremap <silent> mt :ToggleTerm<CR>

" Telescope setup + binding for single-press escape + extensions
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
require('telescope').load_extension "dap"
require('telescope').load_extension "ui-select"
EOF

" Telescope bindings
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-s> <cmd>Telescope lsp_workspace_symbols<cr>
" TODO: When alacritty supports ctrl-m properly, switch to ctrl-m
nnoremap <CR> <cmd>lua require('telescope').extensions.file_browser.file_browser { path = "%:p:h" }<cr>

" Bubble selection (using vim-unimpaired)
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

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Configure LSP for rust-analyzer
let g:rustfmt_autosave = 1

" Avoid showing extra messages when using completion
set shortmess+=c

let g:lightline = {
    \ 'colorscheme': 'catppuccin',
    \ 'active': {
    \     'left': [
    \         ['mode', 'paste'],
    \         ['filename'],
    \     ],
    \     'right': [
    \         ['lineinfo'],
    \         ['gitbranch'],
    \         ['fileencoding', 'filetype'],
    \         ['lsp_status'],
    \     ]
    \ },
    \ 'component_function': {
    \     'gitbranch': 'LightlineGitBranch',
    \ }
    \ }

call lightline#lsp#register()

function! LightlineGitBranch()
    let l:branch_name = gitbranch#name()
    if len(l:branch_name) >= 20
        return ' ' . l:branch_name[:20]
    endif
    return ' ' . l:branch_name
endfunction

" Setup Diffview
lua<<EOF

-- https://github.com/sindrets/diffview.nvim/issues/188
vim.api.nvim_create_user_command("DiffviewToggle", function(e)
  local view = require("diffview.lib").get_current_view()

  if view then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen " .. e.args)
  end
end, { nargs = "*" })

require("diffview").setup({
    diff_binaries = false,
    git_cmd = { "git" },
    use_icons = false,
    signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
    },
})
EOF

nnoremap <C-g> <cmd>DiffviewToggle<cr>

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
EOF

" Configure LSP
" See: https://sharksforarms.dev/posts/neovim-rust/
lua <<EOF
--local extension_path = '/home/olivier/.vscode-oss/extensions/vadimcn.vscode-lldb-1.8.1-universal/'
--local codelldb_path = extension_path .. 'adapter/codelldb'
--local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local opts = {
    tools = { -- rust-tools options
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },

        -- runnables
        runnables = {
            use_telescope = true
        },

        -- debuggables
        debuggables = {
            use_telescope = true
        }
    },

    -- debugging setup
    --dap = {
        --adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
    --},

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    -- on_attach = on_attach,
    settings = {
        -- to enable rust-analyzer settings visit:
        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
        ["rust-analyzer"] = {
        },
    }
}

require('rust-tools').setup(opts)
require'lspconfig'.tsserver.setup{
    cmd = { "typescript-language-server", "--stdio" },
}
--require'lspconfig'.csharp_ls.setup{}
local pid = vim.fn.getpid()
require'lspconfig'.omnisharp.setup{
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
}

EOF

" Rust nvim lsp bindings
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gp    <cmd>lua require 'rust-tools.parent_module'.parent_module()<CR>
nnoremap <silent> <F2>    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Synchronize nvim clipboard with X clipboard
set clipboard+=unnamedplus

" Case smart-sensitive
set smartcase
set ignorecase

" Debug Rust + dapui
let g:termdebugger='lldb'
nnoremap <silent> mb    <cmd>lua require 'dap'.toggle_breakpoint()<CR>
nnoremap <silent> mr    <cmd>lua require 'rust-tools.runnables'.runnables()<CR>
nnoremap <silent> md    <cmd>lua require 'rust-tools.debuggables'.debuggables()<CR>
nnoremap <silent> mme    <cmd>lua require 'rust-tools.expand_macro'.expand_macro()<CR>
nnoremap <silent> mi    <cmd>lua require 'dap.ui.widgets'.hover()<CR>
nnoremap <silent> mj    <cmd>lua require 'dap.ui'.down()<CR>
nnoremap <silent> mk    <cmd>lua require 'dap.ui'.up()<CR>
nnoremap <silent> mv    <cmd>Telescope dap variables<CR>
nnoremap <silent> mf    <cmd>Telescope dap frames<CR>
nnoremap <silent> mw    <cmd>lua require 'dapui'.toggle()<CR>
nnoremap <silent> me    <cmd>lua require 'dapui'.eval()<CR>
nnoremap <silent> <F10>    <cmd>lua require 'dap'.step_over()<CR>
nnoremap <silent> <F11>    <cmd>lua require 'dap'.step_into()<CR>
nnoremap <silent> <S-F11>    <cmd>lua require 'dap'.step_out()<CR>
nnoremap <silent> <F5>    <cmd>lua require 'dap'.continue()<CR>
nnoremap <silent> <F4>    <cmd>lua require 'dap'.restart()<CR>

" Setup Copilot
lua <<EOF
require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = false,
    keymap = {
        accept = "<C-Tab>",
    },
  },
  panel = { enabled = false },
  server_opts_overrides = {
    settings = {
        advanced = {
            listCount = 10,
            inlineSuggestCount = 5,
        },
    },
  },
})
require("copilot_cmp").setup({
   method = "getCompletionsCycling",
})
EOF

" Setup Completion
set completeopt=menu,menuone,noselect
lua <<EOF
local cmp = require'cmp'
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-j>'] = cmp.mapping.scroll_docs(-4),
        ['<C-k>'] = cmp.mapping.scroll_docs(4),
        ['<C-space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'copilot' },
    { name = 'path' },
  },
})
EOF

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

" Syntax highlighting using treesitter
lua <<EOF
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
EOF
