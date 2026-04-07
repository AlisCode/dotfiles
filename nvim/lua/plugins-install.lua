-- Installs all the plugins required

vim.pack.add({
    -- General
    "https://github.com/terrortylor/nvim-comment", -- Comment lines with C-L
    "https://github.com/nvim-treesitter/nvim-treesitter", -- Syntax highlighting with Treesitter
    "https://github.com/akinsho/toggleterm.nvim", -- Handy terminal
    "https://github.com/tpope/vim-unimpaired", -- Many shortcuts including bubble-up and -down
    "https://github.com/folke/flash.nvim", -- Quick navigation + Treesitter selection
    "https://github.com/folke/snacks.nvim", -- Various QoL for e.g. input
    "https://github.com/MeanderingProgrammer/render-markdown.nvim", -- Render markdown

    "https://github.com/nvim-lua/popup.nvim", -- Common dependency for plugins
    "https://github.com/nvim-lua/plenary.nvim", -- Common dependency for plugins

    "https://github.com/nvimtools/none-ls.nvim", -- Common utils like linting and formatting
    "https://github.com/nvimtools/none-ls-extras.nvim", -- Bonus utils like linting and formatting

    "https://github.com/Sang-it/fluoride", -- Symbols navigation through Treesitter

    -- Statusline & Tabline
    "https://github.com/nvim-lualine/lualine.nvim", -- Statusline
    "https://github.com/akinsho/bufferline.nvim", -- Tabline

    -- Debugging (DAP + DapUI)
    "https://github.com/mfussenegger/nvim-dap", -- Debugger Adapter Protocol integration
    "https://github.com/nvim-neotest/nvim-nio", -- Dependency of nvim-dap-ui + neotest
    "https://github.com/rcarriga/nvim-dap-ui", -- UI for DAP
    "https://github.com/leoluz/nvim-dap-go", -- Go debugging

    -- Test
    "https://github.com/nvim-neotest/neotest", -- Extensible testing framework
    "https://github.com/fredrikaverpil/neotest-golang", -- Neotest golang integration

    -- Coverage
    "https://github.com/andythigpen/nvim-coverage", -- Test coverage

    -- Themes
    "https://github.com/ryanoasis/vim-devicons", -- Various icons used by bufferline and telescope
    "https://github.com/nvim-tree/nvim-web-devicons", -- Various icons used by e.g oil.nvim
    "https://github.com/catppuccin/nvim", -- My theme

    -- Collection of common configurations for the Nvim LSP client
    "https://github.com/neovim/nvim-lspconfig", -- LSP integration

    -- Completion & snippets
    "https://github.com/hrsh7th/nvim-cmp", -- Completion engine
    "https://github.com/hrsh7th/cmp-nvim-lsp", -- Completion source from LSP
    "https://github.com/L3MON4D3/LuaSnip", -- Snippet engine, required by nvim-cmp

    -- Nvim goodies
    "https://github.com/nvim-telescope/telescope.nvim", -- Basis for Telescope plugins
    "https://github.com/nvim-telescope/telescope-file-browser.nvim", -- File browser
    "https://github.com/nvim-telescope/telescope-dap.nvim", -- DAP integration with telescope
    "https://github.com/nvim-telescope/telescope-ui-select.nvim", -- TODO: unclear ?

    -- Rust
    "https://github.com/mrcjkb/rustaceanvim", -- Rust-analyzer integration

    -- Gleam
    "https://github.com/gleam-lang/gleam.vim", -- Default Gleam integration (formatting, file detection)

    -- Versioning through git
    "https://github.com/tpope/vim-fugitive", -- Multiple Git integration command
    "https://github.com/airblade/vim-gitgutter", -- Info on git diff on the left of the file (in the gutter)
    "https://github.com/sindrets/diffview.nvim", -- Diffview
    "https://github.com/NeogitOrg/neogit", -- A Git interface

    -- Who likes netrw anyway ?
    "https://github.com/stevearc/oil.nvim", -- Netrw replacement to edit the filesystem like a buffer
})
