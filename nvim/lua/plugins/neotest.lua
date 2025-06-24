local neotest = require("neotest");
local rustaceanvim = require("rustaceanvim");

-- Golang-specific
-- Enables test coverage generation when running tests
local neotest_golang_opts = {
    runner = "go",
    go_test_args = {
        "-v",
        "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
    },
}

neotest.setup({
    adapters = {
        require("rustaceanvim.neotest"),
        require("neotest-golang")(neotest_golang_opts),
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
