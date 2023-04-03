" Plugins
call plug#begin('$HOME/.config/nvim/plugged')

" General
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'akinsho/toggleterm.nvim'

" Lualine
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'

" Debugging (DAP + DapUI)
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" Themes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'

" Completion & snippets
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

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

call plug#end()

" Custom settings
syntax on
set number
set backspace=indent,eol,start  "To make backspace work in normal way
set nospell
set expandtab
set splitright
set splitbelow
set termguicolors

" Set SPACE as leader key
nnoremap <SPACE> <Nop>
let mapleader = " "

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

" Window navigation
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
        open_mapping = "<C-t>",
    })
EOF

" Enables visual-selection possibility in the terminal
tnoremap <Esc> <C-\><C-n>

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
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files { path = "%", respect_gitignore = true }<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <Leader>ws <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <Leader>ds <cmd>Telescope lsp_document_symbols<cr>
nnoremap <Leader>ml <cmd>lua require('telescope').extensions.file_browser.file_browser { path = "%:p:h" }<cr>

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

" Lualine
lua<<EOF
require('lualine').setup({
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
        lualine_y = { "require'lsp-status'.status()" },
    },
    tabline = {},
    winbar = {},
})
EOF
set noshowmode " Removes useless info from the default nvim bar

lua<<EOF
local colors = require("catppuccin.palettes").get_palette "macchiato";
require('bufferline').setup({
    options = {
        mode = 'tabs',
        seperator_style = 'slope',
        indicator = {
                icon = '▎',
                style = 'icon',
        },
        themeable = true,
        modified_icon = '●',
        buffer_close_icon = '',
        left_trunc_marker = '..',
        right_trunc_marker = '..',
        color_icons = true,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        name_formatter = function(buf)
            if buf.name == 'DiffviewFilePanel' then
                return 'Diff'
            end
            if string.match(buf.name,'#toggleterm#') then
                return 'Terminal'
            end
        end,
    },
    highlights = {
        indicator_selected = {
            fg = colors.blue,
        },
        buffer_selected = {
            italic = false,
        },
    },
})
EOF

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
}

require('rust-tools').setup(opts)
require'lspconfig'.tsserver.setup{
    cmd = { "typescript-language-server", "--stdio" },
}
local pid = vim.fn.getpid()
require'lspconfig'.omnisharp.setup{
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
}

EOF

" Rust nvim lsp bindings
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gs    <cmd>lua vim.lsp.buf.document_symbol()<CR>
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
nnoremap <Leader> mb    <cmd>lua require 'dap'.toggle_breakpoint()<CR>
nnoremap <Leader> mr    <cmd>lua require 'rust-tools.runnables'.runnables()<CR>
nnoremap <Leader> md    <cmd>lua require 'rust-tools.debuggables'.debuggables()<CR>
nnoremap <Leader> mme    <cmd>lua require 'rust-tools.expand_macro'.expand_macro()<CR>
nnoremap <Leader> mi    <cmd>lua require 'dap.ui.widgets'.hover()<CR>
nnoremap <Leader> mj    <cmd>lua require 'dap.ui'.down()<CR>
nnoremap <Leader> mk    <cmd>lua require 'dap.ui'.up()<CR>
nnoremap <Leader> mv    <cmd>Telescope dap variables<CR>
nnoremap <Leader> mf    <cmd>Telescope dap frames<CR>
nnoremap <Leader> mw    <cmd>lua require 'dapui'.toggle()<CR>
nnoremap <Leader> me    <cmd>lua require 'dapui'.eval()<CR>
nnoremap <silent> <F10>    <cmd>lua require 'dap'.step_over()<CR>
nnoremap <silent> <F11>    <cmd>lua require 'dap'.step_into()<CR>
nnoremap <silent> <S-F11>    <cmd>lua require 'dap'.step_out()<CR>
nnoremap <silent> <F5>    <cmd>lua require 'dap'.continue()<CR>
nnoremap <silent> <F4>    <cmd>lua require 'dap'.restart()<CR>

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
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
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
