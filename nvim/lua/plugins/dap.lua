-- Debugger Adapter Protocol integration
-- TODO: Refactor this into language-specific files
local vim = vim
local dapui = require("dapui")
local dap = require("dap")
local dapgo = require("dap-go")
local telescope_dap = require("telescope").extensions.dap

-- Launches a Firefox adapter - useful to debug Web applications
-- No AUR package, needs to be installed from https://github.com/firefox-devtools/vscode-firefox-debug
dap.adapters.firefox = {
    type = "executable",
    command = "node",
    args = { "/usr/local/bin/vscode-firefox-debug/dist/adapter.bundle.js" },
}

-- Launches a vscode-js-debug adapter - for debugging node.js applications locally
-- Requires vscode-js-debug from the AUR
dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        args = {"/usr/lib/node_modules/vscode-js-debug/src/dapDebugServer.js", "${port}"},
    }
}

-- Configuration for Typescript + TSX files
debug_with_firefox = {
    name = "Debug with Firefox",
    type = "firefox",
    request = "launch",
    reAttach = true,
    url = "http://localhost:3000",
    webRoot = "${workspaceFolder}",
    firefoxExecutable = '/usr/bin/firefox',
}

-- Configuration for JS files
debug_file_with_node = {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
}

dap.configurations.typescriptreact = {
    debug_with_firefox,
}

dap.configurations.typescript = {
    debug_with_firefox,
}

dap.configurations.javascript = {
    debug_file_with_node,
}

dapui.setup({
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

-- Go-specific
dapgo.setup()

-- Rust-specific
vim.g.termdebugger = "lldb"

local telescope_dap_curr_lang_configs = function()
    telescope_dap.configurations({
        language_filter = function(lang)
            return lang == vim.bo.filetype
        end
    })
end

-- DAP keybindings
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { noremap = true })
vim.keymap.set("n", "<Leader>dw", dapui.toggle, { noremap = true })
vim.keymap.set("n", "<Leader>de", dapui.eval, { noremap = true })
vim.keymap.set("n", "<Leader>dc", dap.continue, { noremap = true })
vim.keymap.set("n", "<Leader>dg", dap.run_to_cursor, { noremap = true })
vim.keymap.set("n", "<Leader>dr", telescope_dap_curr_lang_configs, { noremap = true })
vim.keymap.set("n", "<Leader>dq", dap.terminate, { noremap = true })
vim.keymap.set("n", "<Leader>dv", telescope_dap.variables, { noremap = true })
vim.keymap.set("n", "<Leader>dn", dap.step_over, { noremap = true })
vim.keymap.set("n", "<Leader>dN", dap.step_back, { noremap = true })
vim.keymap.set("n", "<Leader>di", dap.step_into, { noremap = true })
vim.keymap.set("n", "<Leader>do", dap.step_out, { noremap = true })
