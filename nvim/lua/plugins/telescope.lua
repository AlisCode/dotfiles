-- Telescope setup + extensions
local vim = vim
local telescope = require("telescope")
local t_actions = require("telescope.actions")
local t_builtin = require("telescope.builtin")

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = t_actions.close
      },
    },
  },
}

telescope.load_extension "file_browser"
telescope.load_extension "dap"
telescope.load_extension "ui-select"

function find_files()
    t_builtin.find_files { path = "%", respect_gitignore = true }
end

-- Telescope bindings
vim.keymap.set("n", "<C-p>", find_files, { noremap = true })
vim.keymap.set("n", "<C-f>", t_builtin.live_grep, { noremap = true })
vim.keymap.set("n", "<Leader>ws", t_builtin.lsp_workspace_symbols, { noremap = true })
vim.keymap.set("n", "<Leader>ds", t_builtin.lsp_document_symbols, { noremap = true })
vim.keymap.set("n", "<Leader>dd", t_builtin.diagnostics, { noremap = true, silent = true })
