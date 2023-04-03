-- Diffview for git changes
local vim = vim
local diffview = require("diffview")

-- https://github.com/sindrets/diffview.nvim/issues/188
vim.api.nvim_create_user_command("DiffviewToggle", function(e)
  local view = require("diffview.lib").get_current_view()

  if view then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen " .. e.args)
  end
end, { nargs = "*" })

diffview.setup({
    diff_binaries = false,
    git_cmd = { "git" },
    use_icons = false,
    signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
    },
})

vim.keymap.set("n", "<C-g>", "<cmd>DiffviewToggle<cr>", { noremap = true })
vim.keymap.set("v", "<C-g>", "<cmd>DiffviewToggle<cr>", { noremap = true })
