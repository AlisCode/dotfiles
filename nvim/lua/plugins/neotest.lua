local neotest = require("neotest");
local rustaceanvim = require("rustaceanvim");

neotest.setup({
    adapters = {
        require("rustaceanvim.neotest"),
        require("neotest-golang"),
    },
    summary = {
        enabled = true,
        mappings = {
            jumpto = "g",
        },
    },
})

function neotest_debug()
    neotest.run.run({
        suite = false,
        strategy = "dap",
    })
end

-- Key bindings
vim.keymap.set("n", "<leader>tr", neotest.run.run, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>tl", neotest.summary.toggle, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>td", neotest_debug, {noremap = true, silent = true})
