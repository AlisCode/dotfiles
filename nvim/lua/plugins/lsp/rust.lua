-- Defaults for Rust integration
-- Rust-tools takes care of lspconfig
local vim = vim
local rust_tools = require("rust-tools")
local executors = require("rust-tools.executors")
local rust_runnables = require("rust-tools.runnables")
local rust_debuggables = require("rust-tools.debuggables")
local expand_macro = require("rust-tools.expand_macro")
local parent_module = require("rust-tools.parent_module")

rust_tools.setup({
    tools = {
        executor = executors.termopen,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
        runnables = {
            use_telescope = true
        },
        debuggables = {
            use_telescope = true
        },
    }
})

-- Vim global
vim.g.rustfmt_autosave = 1

-- Rust-analyzer keybindings
vim.keymap.set("n", "<Leader>mr", rust_runnables.runnables, { noremap = true })
vim.keymap.set("n", "<Leader>md", rust_debuggables.debuggables, { noremap = true })
vim.keymap.set("n", "<Leader>mme", expand_macro.expand_macro, { noremap = true })
vim.keymap.set("n", "gp", parent_module.parent_module, { noremap = true })
