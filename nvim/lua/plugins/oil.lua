local oil = require("oil")

oil.setup({
    default_file_explorer = true,
    columns = {
        "icon",
    },
    keymaps = {
        ["gp"] = "actions.preview",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-j>"] = "actions.select_tab",
        ["-"] = "actions.parent",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
    },
    use_default_keymaps = false,
})

function local_file_browser()
    oil.toggle_float()
end

vim.keymap.set("n", "<Leader>lf", local_file_browser, { noremap = true })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
