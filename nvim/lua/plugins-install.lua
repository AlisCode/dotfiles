-- Installs all the plugins required
local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.config/nvim/plugged")

-- General
Plug "terrortylor/nvim-comment" -- Comment lines with C-l
Plug "nvim-treesitter/nvim-treesitter" -- Syntax highlighting with Treesitter
Plug "akinsho/toggleterm.nvim" -- Handy terminal
Plug "tpope/vim-unimpaired" -- Many shortcuts including bubble-up and -down
Plug "folke/flash.nvim" -- Quick navigation + Treesitter selection

-- Statusline & Tabline
Plug "nvim-lualine/lualine.nvim" -- Statusline
Plug "akinsho/bufferline.nvim" -- Tabline

-- Debugging (DAP + DapUI)
Plug "mfussenegger/nvim-dap" -- Debugger Adapter Protocol integration
Plug "nvim-neotest/nvim-nio" -- Dependency of nvim-dap-ui
Plug "rcarriga/nvim-dap-ui" -- UI for DAP

-- Themes
Plug "ryanoasis/vim-devicons" -- Various icons used by bufferline and telescope
Plug "nvim-tree/nvim-web-devicons" -- Various icons used by oil.nvim
Plug("catppuccin/nvim", { as = "catppuccin" }) -- My theme

-- Collection of common configurations for the Nvim LSP client
Plug "neovim/nvim-lspconfig" -- LSP integration

-- Completion & snippets
Plug "hrsh7th/nvim-cmp" -- Completion engine
Plug "hrsh7th/cmp-nvim-lsp" -- Completion source from LSP
Plug "L3MON4D3/LuaSnip" -- Snippet engine, required by nvim-cmp

Plug "nvim-lua/popup.nvim" -- Common dependency for plugins
Plug "nvim-lua/plenary.nvim" -- Common dependency for plugins

-- Nvim goodies
Plug "nvim-telescope/telescope.nvim" -- Basis for Telescope plugins
Plug "nvim-telescope/telescope-file-browser.nvim" -- File browser
Plug "nvim-telescope/telescope-dap.nvim" -- DAP integration with telescope
Plug "nvim-telescope/telescope-ui-select.nvim" -- TODO: unclear ?
Plug "gbrlsnchs/telescope-lsp-handlers.nvim" -- Replaces awful quickfix with Telescope

-- Rust
Plug "rust-lang/rust.vim" -- Default rust integration (formatting, file detection)
Plug "mrcjkb/rustaceanvim" -- Rust-analzyer integration

-- C#
Plug "OmniSharp/omnisharp-vim" -- C# LSP integration

-- LSP extensions
Plug "tjdevries/lsp_extensions.nvim" -- Providing type inlay hints. TODO: remove ?

-- Versioning through git
Plug "tpope/vim-fugitive" -- Multiple Git integration command
Plug "airblade/vim-gitgutter" -- Info on git diff on the left of the file (in the gutter)
Plug "sindrets/diffview.nvim" -- Diffview

-- Who likes netrw anyway ?
Plug "stevearc/oil.nvim" -- Netrw replacement to edit the filesystem like a buffer

vim.call("plug#end")
