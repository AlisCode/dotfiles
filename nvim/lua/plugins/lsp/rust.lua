-- Defaults for Rust integration
-- Rust-tools takes care of lspconfig
local vim = vim
local executors = require('rustaceanvim.executors')

function runnables()
    vim.cmd.RustLsp("runnables")
end

function debuggables()
    vim.cmd.RustLsp("debuggables")
end

function expand_macro()
    vim.cmd.RustLsp("expandMacro")
end

function parent_module()
    vim.cmd.RustLsp("parentModule")
end

vim.g.rustaceanvim = {
    tools = {
        executor = executors.toggleterm,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
        reload_workspace_from_cargo_toml = true,
        runnables = {
            use_telescope = true
        },
        debuggables = {
            use_telescope = true
        },
    },
    -- LSP configuration
    server = {
        on_attach = function(client, bufnr)
            -- rust-analyzer keybindings
            vim.keymap.set("n", "<Leader>mr", runnables, { noremap = true });
            vim.keymap.set("n", "<Leader>md", debuggables, { noremap = true });
            vim.keymap.set("n", "<Leader>mme", expand_macro, { noremap = true });
            vim.keymap.set("n", "gp", parent_module, { noremap = true });
        end,
        default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
            },
        },
    },
}

-- ft-rust (default neovim plugin) config
vim.g.rustfmt_autosave = 1
