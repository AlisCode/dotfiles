local neogit = require("neogit");

function neogit_open()
    neogit.open({
        kind = "floating",
    })
end

vim.keymap.set("n", "<leader>g", neogit_open, {noremap = true, silent = true})
