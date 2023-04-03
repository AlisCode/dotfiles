-- Telescope setup + extensions
local vim = vim
local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
}

telescope.load_extension "file_browser"
telescope.load_extension "dap"
telescope.load_extension "ui-select"

function find_files()
    builtin.find_files { path = "%", respect_gitignore = true }
end

function local_file_browser()
    builtin.find_files { path = "%:p:h" }
end

-- Telescope bindings
vim.keymap.set("n", "<C-p>", find_files, { noremap = true })
vim.keymap.set("n", "<C-f>", builtin.live_grep, { noremap = true })
vim.keymap.set("n", "<Leader>ws", builtin.lsp_workspace_symbols, { noremap = true })
vim.keymap.set("n", "<Leader>ds", builtin.lsp_document_symbols, { noremap = true })
vim.keymap.set("n", "<Leader>lf", local_file_browser, { noremap = true })
