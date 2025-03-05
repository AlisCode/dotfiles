local neotest = require("neotest");
local rustaceanvim = require("rustaceanvim");

neotest.setup({
    adapters = {
        require("rustaceanvim.neotest"),
        require("neotest-go"),
    },
    summary = {
        enabled = true,
        mappings = {
            jumpto = "g",
        },
    },
})

-- Key bindings
vim.keymap.set("n", "<leader>tr", neotest.run.run, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>tl", neotest.summary.toggle, {noremap = true, silent = true})
