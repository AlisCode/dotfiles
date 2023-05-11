local oil = require("oil")

oil.setup({
    default_file_explorer = true,
    keymaps = {
    }
})

function local_file_browser()
    oil.toggle_float()
end

vim.keymap.set("n", "<Leader>lf", local_file_browser, { noremap = true })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
